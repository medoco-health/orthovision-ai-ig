# Introduction

There are too many medical images stored in various siloed medical software solutions. Then, most medical software export mechanisms, do not support exxporting of images in DICOM, but just in JPEG variants, or TIFFs or other generic imaging devices. This makes interoperability and consumption of these images extremely hard, both for clinical usage, and for research. In an ideal world, all medical images would be stored or made available in the DICOM format.

While the basic conversion from generic image formats to DICOM is generally speaking trivial, a DICOM image which only contains pixle data is of little value. The real value comes from the information stored in the DICOM attributes. Thus, a proper conversion from generic images into DICOM becomes a cumbersome endeavour as all this information needs to be either retreived or recognized before being able to add it to the proper DICOM attributes. This is where AI can come to rescue.

Traditionally this step is done internally, by using proprietary APIs and private AI models. This approach, though, could be improved by allowing vendors and organizations to share and monetize their efforts. The goal here is to allow various vendors and/or organizations, to develop their own classifier/categorizer AI and use it internally or allow other vendors to use it as well. Similarily, a vendor or product that needs categorization, can implement this IG, and pick and choose the best AI engine to do that specific categorizatio for them.

The Orthovision FHIR Implementation Guide defines a standardized API for AI-powered image classification services. The goal is to facilitate the conversion of the plentiful non-DICOM medical images into DICOM, making use of AI. This guide provides FHIR R5 profiles, operations, and workflows for automated analysis of photographs and radiographic images.

## Relationship to IHE AI Workflow Profile

The [IHE AI Workflow for Imaging (AIW-I) profile](https://profiles.ihe.net/RAD/AIW-I/) describes a comprehensive workflow for AI-powered medical imaging analysis that is well-designed and reasonable for many use cases. However, the AIW-I workflow assumes that images have already been archived in an image manager (such as a PACS) and focuses on creating AI reports after the fact.

Just like there is a need to standardize the way AI recognized and diagnoses existing, full DICOM image already store in a DICOM archive, so is there a need to standardize the way AI classifies images for DICOM conversion purposes. These are two distinct use cases: the former needs to operate in an enterprise imaging environment and has access to all DICOM resources like Worklists and IOD (hence the AIW-I is appropriate), while the latter does not yet, because it is being used before entering the enterprise imaging world. Therefore, the DICOM based AIW-I is not appropriate here.

In our specific use case, it is more valuable to perform AI classification during the **acquisition phase** - when images are being captured (or have been capture) but before they are archived into a DICOM compliant container (e.g. PACS). This enables:

- **Real-time workflow optimization**: Immediate feedback to clinicians about image quality and protocol compliance
- **Acquisition guidance**: Live assistance during photo capture sessions
- **Quality control**: Early detection of missing or suboptimal images before the patient leaves
- **Workflow efficiency**: Reduced need for retakes and follow-up appointments

This Implementation Guide therefore defines a complementary approach that operates **before** the traditional IHE AI Workflow, focusing on the critical acquisition and pre-archival phase. Once the images have been converted into DICOM using this IG, then further AI can operate on them using the AIW-I.

## Purpose

This Implementation Guide enables healthcare systems to integrate AI-powered image classification into their **acquisition workflows** using standard FHIR resources. The Orthovision AI service automatically classifies orthodontic images by:

- **Imaging Modality**: Determining the type of imaging equipment used (external photography, digital radiography, CT, etc.)
- **Imaging Protocol**: Identifying the specific view or positioning (frontal facial, profile, intraoral views, etc.)

## Key Features

- **Asynchronous Processing**: Non-blocking API design using FHIR Task resources for progress tracking
- **Real-time Updates**: Optional Server-Sent Events streaming for live progress monitoring  
- **Privacy-Focused**: No patient data required - operates on image content alone
- **Transparent AI**: Optional confidence scores and full prediction rankings for model interpretability
- **Standard FHIR**: Pure FHIR R5 implementation ensuring interoperability
- **Error Handling**: Comprehensive error codes for robust client implementation

# Getting Started

1. **Review Profiles**: Examine the resource constraints and requirements
2. **Test with Examples**: Use provided sample instances for integration testing
3. **Implement Async Pattern**: Build Task polling or SSE streaming for progress updates
4. **Handle Errors**: Implement proper error handling using OperationOutcome responses
5. **Optimize Performance**: Use ImagingStudy context when modality is known

# Support and Contact

For technical questions about this Implementation Guide or the Orthovision AI service:

- **GitHub Issues**: Report bugs and request features on [Github](https://github.com/medoco-health/orthovision-ai-ig/issues)
- **Community Discussions**: Ask questions and share experiences  
- **Technical Support**: Contact [medoco HEALTH](https://medoco.health) for implementation assistance
