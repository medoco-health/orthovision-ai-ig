### Scope and Usage

The OrthovisionAIDiagnosticReport profile serves as the primary container for AI classification results. 

**Dual Classification Results**: Always contains both modality and protocol classifications as separate Observation resources.

**Clinical Integration**: Provides human-readable conclusions suitable for clinical review while maintaining structured data for automated processing.

**Quality Assurance**: Supports clinical validation workflows by presenting AI findings in familiar diagnostic report formats.

The report structure enables both automated processing (through structured Observation references) and clinical review (through conclusion text), supporting diverse implementation scenarios from fully automated workflows to human-supervised AI assistance.
