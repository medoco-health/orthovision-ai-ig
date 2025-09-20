# Introduction

The Orthovision FHIR Implementation Guide defines a standardized API for AI-powered orthodontic image classification services. This guide provides FHIR R5 profiles, operations, and workflows for automated analysis of orthodontic photographs and radiographic images.

## Purpose

This Implementation Guide enables healthcare systems to integrate AI-powered orthodontic image classification into their workflows using standard FHIR resources. The Orthovision AI service automatically classifies orthodontic images by:

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

- **GitHub Issues**: Report bugs and request features
- **Community Discussions**: Ask questions and share experiences  
- **Technical Support**: Contact medocoHEALTH for implementation assistance
