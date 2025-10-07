# Introduction

In healthcare, medical images are often trapped in separate, isolated software systems. Most of these systems don't export images in the standard DICOM format (a universal language for medical images), instead using common formats like JPEG or TIFF. This creates big challenges: doctors and researchers can't easily share or reuse these images across different tools, clinics, private practices, research centers or hospitals. Ideally, all medical images would be stored in DICOM format to make them universally accessible.

Converting regular images to DICOM isn't just about changing the file type—it's about adding important details like anatomy in the image, image orientation, image type, patient info and equipment used. Without these details, the images are like photos without captions. This is where artificial intelligence (AI) can help by automatically identifying and adding these details.

Usually, this AI work happens behind closed doors with proprietary (private) tools. But what if we could share and even sell these AI capabilities? This Implementation Guide (IG) opens that door. It lets different companies and organizations build their own AI classifiers for images, use them privately, or share them with others. Similarly, any software needing image classification can follow this guide and choose the best AI tool for the job.

The Orthovision FHIR Implementation Guide creates a standard way for AI-powered image classification services to work together. It focuses on the task of turning everyday medical images into proper DICOM format using AI. The guide provides rules and workflows for automatically analyzing photos and X-rays and returning useful DICOM related information using FHIR as the standard for healthcare data exchange.

By standardizing this process, we make healthcare imaging more connected and efficient. Hospitals and clinics can easily integrate AI tools, share data securely, and improve patient care without reinventing the wheel each time.

**Important Note on Scope**: This Implementation Guide focuses solely on AI for classifying images to enable DICOM conversion — it does not cover clinical diagnosis or treatment recommendations. For AI used in medical diagnosis (e.g., detecting diseases or conditions), refer to the IHE AI Workflow for Imaging (AIW-I) profile, which handles post-archival AI analysis.

### Relationship to IHE AI Workflow Profile

The [IHE AI Workflow for Imaging (AIW-I) profile](https://profiles.ihe.net/RAD/AIW-I/) is a well-designed standard for AI analysis of medical images that are already stored in systems like PACS (Picture Archiving and Communication Systems). It works great for creating AI reports on existing images.

But there's another important need: standardizing AI for images *before* they're stored in these systems. Just as we need rules for AI to analyze stored DICOM images, we need rules for AI to classify images during the capture process. The AIW-I profile assumes images are already in a DICOM archive with full details, which isn't the case here.

This Implementation Guide works *before* the traditional IHE workflow. Once images are converted to DICOM using this guide, they can then use AIW-I for further analysis.

### Purpose and Use Cases

This Implementation Guide provides a standardized API specification for AI-powered image classification services—it defines the rules and workflows for how these services communicate, but doesn't perform the classification itself. Instead, it enables different AI implementations to classify images consistently and return results like DICOM metadata, modality types, and confidence scores in a uniform way. This promotes interoperability, allowing healthcare software to easily integrate and switch between AI services without custom coding.

#### Use Case 1: Orthodontic Live Photographic Capture

A dental or orthodontic practice captures patient photographs using a consumer or prosumer digital camera (for example, a DSLR). Staff import images from removable media into an importing workstation. The importing software automatically rotates images, classifies the view (for example, frontal smiling or intraoral maxillary), and prepares images for storage to a DICOM node, minimizing manual data entry.

During import, the importing software sends images to an AI classification service (per this IG). The AI returns DICOM-ready metadata (modality, view/protocol, anatomy, orientation) and optional confidence scores. The importing software applies transformations or flags low-confidence items for review, then stores the resulting DICOM objects or associated metadata for clinical use or research.

This pattern applies to any clinical area that uses non-medical acquisition devices and wants to convert images into enterprise imaging format.

#### Use Case 2a: Live Legacy Radiographic Film Capture

A research institution needs to preserve and convert a collection of radiographic acetate films. These historic images are valuable for research because they were acquired under earlier protocols and capture patient cohorts or imaging conditions that are no longer available; acetate film also degrades over time, so timely digitization and preservation is urgent.

The films are scanned using a film acquisition workstation that captures image files and accepts basic contextual metadata (for example, subject identifier, acquisition date, subject age).

For each scanned image, the acquisition software sends the image and any available contextual metadata to an AI classification service (per this IG). The AI returns suggested metadata (modality, view, anatomy, orientation) and optional confidence scores. The software displays suggested classifications to the technician for confirmation or correction, and when confirmed generates DICOM objects with provenance and archives them to the DICOM node.

If classification confidence is low or the technician corrects values, the corrected metadata is used before final DICOM generation.

#### Use Case 2b: Legacy Radiographic Archive Conversion

A research institution holds a large collection of legacy radiographic images stored as JPEG or TIFF (digitized scans of original film). Converting this archive into a standardized enterprise format is important to preserve the dataset, enable modern AI analyses, and make the images discoverable and reusable for research or clinical secondary-use.

The batch system enumerates files, groups them for processing, and sends images to one or more AI classification services using the API defined in this IG. The AI returns classifications and optional confidence scores. The batch process maps AI outputs to DICOM metadata, queues low-confidence or ambiguous items for manual review, generates DICOM objects (or sidecar metadata), and uploads the results to the target DICOM archive.

This same batch pattern also applies to clinical sites that need to bulk-convert photographic collections into DICOM.

#### Example Classification 

The following is a list of DICOM tags that could have been used in the above use cases:

- **(0008,0060) Modality (Imaging Modality)**: What type of equipment took the image (camera, X-ray machine, CT scanner, etc.)
- **(0054,0220) View Code Sequence (Imaging View/Position)**: The specific view or position (front face, side profile, inside mouth, etc.)
- **(0020,0037) Image Orientation (Patient) / (0020,0032) Image Position (Patient) (Image Orientation and Positioning)**: Detecting rotation, flips, and anatomical alignment.
- **(0018,0015) Body Part Examined / (0008,2218) Anatomic Region Sequence (Anatomical Region Identification)**: Recognizing which body parts or structures are visible in the image.


**Key Distinction**: The Implementation Guide is just the "blueprint" for the API—it specifies how results should be structured and exchanged, but the actual AI analysis (sorting images, calculating confidence) is done by separate implementing services. This separation allows vendors to build their own AI engines while ensuring they all "speak the same language" via FHIR.


### Key Features

- **Any DICOM attribute**: While this IG may explicitly mention a limited set, any DICOM attributes are supported.
- **Capability Discovery**: Implementations declare which DICOM tags they support via CapabilityStatement extensions—check `/metadata` to see what's available before submitting requests.
- **Confidence scores**: Confidence scores for each classification, help users understand how certain the AI is about its decisions. This makes the guide suitable for various medical imaging applications.
- **AI Device**: Full identification of brand, make, model and version of the AI system which provided the answer.
- **Asynchronous Processing**: Non-blocking design using FHIR Task resources to track progress
- **Real-time Updates**: Optional live updates via Server-Sent Events for monitoring
- **Privacy-Focused**: Works on images alone—no patient data needed
- **Standard FHIR**: Pure FHIR for seamless integration
- **Error Handling**: Clear error codes for reliable implementations

# Getting Started

1. **Review Profiles**: Check the resource rules and requirements
2. **Test with Examples**: Use sample instances for integration testing
3. **Implement Async Pattern**: Build Task polling or SSE streaming for progress updates
4. **Handle Errors**: Implement proper error handling using OperationOutcome responses
5. **Optimize Performance**: Use ImagingStudy context when modality is known

# Support and Contact

For technical questions about this Implementation Guide or the Orthovision AI service:

- **GitHub Issues**: Report bugs and request features on [Github](https://github.com/medoco-health/orthovision-ai-ig/issues)
- **Community Discussions**: Ask questions and share experiences  
- **Technical Support**: Contact [medoco HEALTH](https://medoco.health) for implementation assistance
