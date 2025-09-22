[![CC BY 4.0][cc-by-shield]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg


# Orthovision AI Implementation Guide

A FHIR R5 Implementation Guide for orthodontic image classification using AI. This IG defines the API specification for the Orthovision AI service, which classifies orthodontic photographs and radiographic images into standardized imaging modalities and protocols.

In healthcare, medical images are often trapped in separate, isolated software systems. Most of these systems don't export images in the standard DICOM format (a universal language for medical images), instead using common formats like JPEG or TIFF. This creates big challenges: doctors and researchers can't easily share or reuse these images across different tools, clinics, private practices, research centers or hospitals. Ideally, all medical images would be stored in DICOM format to make them universally accessible.

Converting regular images to DICOM isn't just about changing the file type—it's about adding important details like anatomy in the image, image orientation, image type, patient info and equipment used. Without these details, the images are like photos without captions. This is where artificial intelligence (AI) can help by automatically identifying and adding these details.

Usually, this AI work happens behind closed doors with proprietary (private) tools. But what if we could share and even sell these AI capabilities? This Implementation Guide (IG) opens that door. It lets different companies and organizations build their own AI classifiers for images, use them privately, or share them with others. Similarly, any software needing image classification can follow this guide and choose the best AI tool for the job.

The Orthovision FHIR Implementation Guide creates a standard way for AI-powered image classification services to work together. It focuses on turning everyday medical images into proper DICOM format using AI. The guide provides rules and workflows for automatically analyzing photos and X-rays and returning useful DICOM related information using FHIR as the standard for healthcare data exchange.

By standardizing this process, we make healthcare imaging more connected and efficient. Hospitals and clinics can easily integrate AI tools, share data securely, and improve patient care without reinventing the wheel each time.

**Important Note on Scope**: This Implementation Guide focuses solely on AI for classifying images to enable DICOM conversion—it does not cover clinical diagnosis or treatment recommendations. For AI used in medical diagnosis (e.g., detecting diseases or conditions), refer to the IHE AI Workflow for Imaging (AIW-I) profile, which handles post-archival AI analysis.

The [IHE AI Workflow for Imaging (AIW-I) profile](https://profiles.ihe.net/RAD/AIW-I/) is a well-designed standard for AI analysis of medical images that are already stored in systems like PACS (Picture Archiving and Communication Systems). It works great for creating AI reports on existing images.

But there's another important need: standardizing AI for images *before* they're stored in these systems. Just as we need rules for AI to analyze stored DICOM images, we need rules for AI to classify images during the capture process. The AIW-I profile assumes images are already in a DICOM archive with full details, which isn't the case here.

This Implementation Guide works *before* the traditional IHE workflow. Once images are converted to DICOM using this guide, they can then use AIW-I for further analysis.

## Use Cases

This Implementation Guide shines in scenarios where images are captured or stored outside traditional medical imaging systems, enabling seamless integration into enterprise imaging workflows. By standardizing AI classification, it bridges the gap between everyday image formats and professional DICOM standards, promoting better data sharing and interoperability across healthcare.

- **Live Image Capture**: Imagine using a standard digital camera (not specialized medical equipment) to take photos during a patient visit. This guide enables connected software—such as an imaging app or workstation—to automatically classify the images in real-time enabling it to convert the images to DICOM format for storage in a hospital's imaging system. No manual data entry needed—just plug-and-play integration facilitating the human confirmation step that ensures images are properly labeled and ready for clinical use or research.
  
- **Legacy Archive Conversion**: Healthcare facilities and research institutions often have large collections of old images, originating from film, which has been tediously saved in basic formats like JPEG or TIFF. This guide enables batch processing: a system scans the archive, sends them to an AI service to classifies each image, and adds the necessary DICOM details automatically. This transforms disorganized files into standardized, searchable medical records that can be shared across systems, improving research access and clinical workflows.

## Overview

The Orthovision AI service provides automated classification of orthodontic images, determining both the imaging modality (e.g., external photography, digital radiography) and the specific imaging protocol (e.g., frontal facial view, lateral cephalometric). This Implementation Guide defines the FHIR-compliant API for interacting with the service.

### Key Features

- **Async processing** with real-time updates via Server-Sent Events
- **Standard FHIR R5** resources and patterns
- **Optional AI confidence scores** for transparency and debugging
- **Privacy-focused** design requiring no patient data
- **Extensible** architecture supporting future AI models

## Repository Structure

```
orthovision-fhir-ig/
├── README.md              # This file
├── Makefile               # Common build commands
├── .github/workflows/     # CI/CD automation
├── src/                   # FHIR IG source files
│   ├── sushi-config.yaml  # SUSHI configuration
│   ├── _genonce.sh        # IG Publisher script
│   ├── input/fsh/         # FSH profile definitions
│   ├── input/pagecontent/ # Documentation pages
│   └── output/            # Generated IG (after build)
└── docs/                  # Published documentation (GitHub Pages)
```

## Development Workflow

### Prerequisites

- Java 17 or higher
- Node.js (for SUSHI)
- Git

### Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/medoco-health/orthovision-fhir-ig.git
   cd orthovision-fhir-ig
   ```

2. **Install dependencies:**
   ```bash
   make install
   ```
   Hit `Y` to accept the publisher jar placement in `src/input-cache`
   Hit anything other than `Y` to not install new scripts (unless you know what you are doing)

3. **Build the Implementation Guide:**
   ```bash
   make build
   ```

4. **Serve locally for development:**
   ```bash
   make serve
   ```

### Available Commands

- `make build` - Build the FHIR IG using SUSHI and IG Publisher
- `make clean` - Remove generated files
- `make install` - Install/update IG Publisher and dependencies
- `make serve` - Serve the built IG locally on port 8000
- `make publish` - Build and copy output to docs/ for GitHub Pages

### Making Changes

1. Edit FSH files in `src/input/fsh/`
2. Update documentation in `src/input/pagecontent/`
3. Run `make build` to generate the IG
4. Test locally with `make serve`
5. Commit and push changes


## Contributing

We welcome contributions to improve the Orthovision FHIR Implementation Guide. Please follow these guidelines:

### How to Contribute

1. **Fork the repository** and create a feature branch
2. **Follow FSH conventions** and maintain consistency with existing profiles
3. **Test your changes** by building the IG locally
4. **Update documentation** if you're adding new features
5. **Submit a pull request** with a clear description of changes

### Contribution Areas

- **Profile enhancements** - Improve existing FHIR profiles
- **New imaging modalities** - Add support for additional orthodontic imaging types
- **Error handling** - Enhance error codes and validation
- **Documentation** - Improve API documentation and examples
- **Testing** - Add test cases and validation scenarios

### Code Style

- Use descriptive naming following the `OrthovisionAI` prefix pattern
- Include comprehensive descriptions for all profiles and elements
- Add examples for new profiles or significant changes
- Follow FHIR best practices for profiling and terminology

## Support

For questions about the Orthovision AI service or this Implementation Guide:

- **Issues**: Use GitHub Issues for bugs and feature requests
- **Discussions**: Use GitHub Discussions for questions and community support
- **Contact**: reach out to the medocoHEALTH team

## Acknowledgments

This Implementation Guide follows HL7 FHIR R5 specifications and leverages the FHIR Shorthand (FSH) language for profile definitions.
