# Introduction

In healthcare, medical images are often trapped in separate, isolated software systems. Most of these systems don't export images in the standard DICOM format (a universal language for medical images), instead using common formats like JPEG or TIFF. This creates big challenges: doctors and researchers can't easily share or reuse these images across different tools, clinics, private practices, research centers or hospitals. Ideally, all medical images would be stored in DICOM format to make them universally accessible.

Converting regular images to DICOM isn't just about changing the file type—it's about adding important details like anatomy in the image, image orientation, image type, patient info and equipment used. Without these details, the images are like photos without captions. This is where artificial intelligence (AI) can help by automatically identifying and adding these details.

Usually, this AI work happens behind closed doors with proprietary (private) tools. But what if we could share and even sell these AI capabilities? This Implementation Guide (IG) opens that door. It lets different companies and organizations build their own AI classifiers for images, use them privately, or share them with others. Similarly, any software needing image classification can follow this guide and choose the best AI tool for the job.

The Orthovision FHIR Implementation Guide creates a standard way for AI-powered image classification services to work together. It focuses on the task of turning everyday medical images into proper DICOM format using AI. The guide provides rules and workflows for automatically analyzing photos and X-rays and returning useful DICOM related information using FHIR as the standard for healthcare data exchange.

By standardizing this process, we make healthcare imaging more connected and efficient. Hospitals and clinics can easily integrate AI tools, share data securely, and improve patient care without reinventing the wheel each time.

**Important Note on Scope**: This Implementation Guide focuses solely on AI for classifying images to enable DICOM conversion—it does not cover clinical diagnosis or treatment recommendations. For AI used in medical diagnosis (e.g., detecting diseases or conditions), refer to the IHE AI Workflow for Imaging (AIW-I) profile, which handles post-archival AI analysis.

## Relationship to IHE AI Workflow Profile

The [IHE AI Workflow for Imaging (AIW-I) profile](https://profiles.ihe.net/RAD/AIW-I/) is a well-designed standard for AI analysis of medical images that are already stored in systems like PACS (Picture Archiving and Communication Systems). It works great for creating AI reports on existing images.

But there's another important need: standardizing AI for images *before* they're stored in these systems. Just as we need rules for AI to analyze stored DICOM images, we need rules for AI to classify images during the capture process. The AIW-I profile assumes images are already in a DICOM archive with full details, which isn't the case here.

This Implementation Guide works *before* the traditional IHE workflow. Once images are converted to DICOM using this guide, they can then use AIW-I for further analysis.

## Use Cases

This Implementation Guide shines in scenarios where images are captured or stored outside traditional medical imaging systems, enabling seamless integration into enterprise imaging workflows. By standardizing AI classification, it bridges the gap between everyday image formats and professional DICOM standards, promoting better data sharing and interoperability across healthcare.

- **Live Image Capture**: Imagine using a standard digital camera (not specialized medical equipment) to take photos during a patient visit. This guide enables connected software—such as an imaging app or workstation—to automatically classify the images in real-time enabling it to convert the images to DICOM format for storage in a hospital's imaging system. No manual data entry needed—just plug-and-play integration facilitating the human confirmation step that ensures images are properly labeled and ready for clinical use or research.
  
- **Legacy Archive Conversion**: Healthcare facilities and research institutions often have large collections of old images, originating from film, which has been tediously saved in basic formats like JPEG or TIFF. This guide enables batch processing: a system scans the archive, sends them to an AI service to classifies each image, and adds the necessary DICOM details automatically. This transforms disorganized files into standardized, searchable medical records that can be shared across systems, improving research access and clinical workflows.

## Purpose

This guide helps healthcare systems add AI image classification to their image-taking processes using standard FHIR resources. The Orthovision AI service automatically sorts orthodontic images by:

- **Imaging Modality**: What type of equipment took the image (camera, X-ray machine, CT scanner, etc.)
- **Imaging Protocol**: The specific view or position (front face, side profile, inside mouth, etc.)

## Key Features

- **Asynchronous Processing**: Non-blocking design using FHIR Task resources to track progress
- **Real-time Updates**: Optional live updates via Server-Sent Events for monitoring
- **Privacy-Focused**: Works on images alone—no patient data needed
- **Transparent AI**: Optional confidence scores and full rankings for understanding AI decisions
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
