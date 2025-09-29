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

A dental or orthodontic practice uses a standard digital camera (like a DSLR) during a patient visit to capture images. Staff remove the SD card from the camera and insert it into a computer for importing into their DICOM archive. Importing software automatically rotates images, identifies the image type (e.g., frontal smiling view or intraoral maxillary), and prepares them for storage to a DICOM Node—without manual data entry.

To achieve this, the importing software sends the raw images to an AI service that classifies them in real-time and returns DICOM-ready metadata. The communication follows this Implementation Guide's specifications, enabling seamless integration for clinical use or research.

This use case is not specific to the orthodontic field and also applies to any medical field that is acquiring medical images with a regular, non-medical acquisition device.

#### Use Case 2a: Live Legacy Radiographic Film Capture 

A research institution has a large collections of old radiographic acetate films. These images form a complete dataset which is valuable because obtained when regulation for radiographic image acquisition was much more relaxed and would therefore be impossible today to recreate. The need to preserve and convert this collection into a standard enterprise imaging format is urgent (acetate film decays over time) and the institution thus obtains funding.

The researchers carefully scan the film radiograph making use of specific acquisition software which allows them to enter basic image specific information like subject ID, and actual acquisition date, or subject age. The software then instructs the researcher how to place the film radiograph into the scanner and initiate the scan. The software sends the image to one or more AI service for classification, rotation, etc and prompts the researcher for confirmation.

The process uses this Implementation Guide's API to communicate with the AI service, retrieving classifications and metadata efficiently. 

#### Use Case 2b: Legacy Radiographic Archive Conversion

As Use Case 2a, but the research institution now already has a large collections of old radiographic images of the original acetate film, saved as JPEG or TIFF, instead of DICOM, because when funding was obtained, the benefits of having the collection in the DICOM format was not appreciated yet. The need to convert this collection into a standard enterprise imaging format is now necessary to facilitate large data AI based research and the institution thus obtains funding.

The research institution thus develops a batch processing system that scans the archive, sends images to one or more  AI service for classification, rotation, etc and automatically generates the DICOM with the details from the AI services. This transforms disorganized files into standardized, searchable medical records, which can now be uploaded to the DICOM archive node.

The process uses this Implementation Guide's API to communicate with the AI service, retrieving classifications and metadata efficiently. 

Similar use cases exist also for the Use Case 1 scenario, where a practice may have a collection of medical photographs, which they now need to batch convert into DICOM.

#### Example Classification 

The following is a list of DICOM tags that could have been used in the above use cases:

- **Imaging Modality**: What type of equipment took the image (camera, X-ray machine, CT scanner, etc.)
- **Imaging Protocol**: The specific view or position (front face, side profile, inside mouth, etc.)
- **PA and Lateral Cephalograms**: Standard orthodontic X-rays showing front-to-back (PA) and side (Lateral) views of the skull for diagnosis and treatment planning.
- **Image Orientation and Positioning**: Detecting rotation, flips, and anatomical alignment.
- **Anatomical Region Identification**: Recognizing which body parts or structures are visible in the image.

AI services implementing this guide can also provide confidence scores for each classification, helping users understand how certain the AI is about its decisions. This makes the guide suitable for various medical imaging applications beyond orthodontics, where proper image details are crucial for clinical workflows.

**Key Distinction**: The Implementation Guide is just the "blueprint" for the API—it specifies how results should be structured and exchanged, but the actual AI analysis (sorting images, calculating confidence) is done by separate implementing services. This separation allows vendors to build their own AI engines while ensuring they all "speak the same language" via FHIR.

This shines in real-world scenarios where images are captured or stored outside traditional medical systems:

  

### Key Features

- **Asynchronous Processing**: Non-blocking design using FHIR Task resources to track progress
- **Real-time Updates**: Optional live updates via Server-Sent Events for monitoring
- **Privacy-Focused**: Works on images alone—no patient data needed
- **Standard FHIR**: Pure FHIR R5 for seamless integration
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
