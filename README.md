[![CC BY 4.0][cc-by-shield]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg


# Orthovision AI Implementation Guide

A FHIR R5 Implementation Guide for AI-powered medical image classification. This IG enables standardized integration of AI services that classify medical images to facilitate DICOM conversion and improve healthcare imaging workflows.

## Problem Statement

Many healthcare systems store medical images in basic formats (JPEG, TIFF) rather than the standardized DICOM format. This creates barriers to sharing, archiving, and integrating images across different healthcare systems. Converting images to DICOM requires adding crucial metadata like imaging modality, anatomical region, and orientation—information that AI can automatically identify.

## Solution

This Implementation Guide standardizes how AI image classification services integrate with healthcare systems using FHIR R5. It enables:

- **Automated image classification** for modality, protocol, and anatomical regions
- **DICOM conversion support** by providing necessary tags from image inference  
- **Standardized AI integration** across different healthcare platforms
- **Privacy-focused design** requiring no patient data

> 📖 **For complete introduction and background**: See the [full Implementation Guide introduction](src/input/pagecontent/index.md) for detailed context, relationship to IHE AI Workflow Profile, and comprehensive use cases.

**Scope**: This IG focuses on AI for image classification to enable DICOM conversion—not clinical diagnosis. For diagnostic AI, refer to the [IHE AI Workflow for Imaging (AIW-I) profile](https://profiles.ihe.net/RAD/AIW-I/).

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
- Node.js [installation guide](https://nodejs.org/en/download/)
- Sushi [installation guide](https://www.npmjs.com/package/fsh-sushi)
- Jekyll [installation guide](https://jekyllrb.com/docs/installation/)
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
- `make update-publisher` - Update the IG Publisher to the latest version
- `make serve` - Serve the built IG locally on port 8000
- `make publish` - Build and copy output to docs/ for GitHub Pages

### Making Changes

1. Edit FSH files in `src/input/fsh/`
2. Update documentation in `src/input/pagecontent/`
3. Run `make build` to generate the IG locally
4. Test locally with `make serve`
5. Commit and push changes (on a feature branch)

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
