### Scope and Usage

The OrthovisionAIModalityObservation profile addresses a fundamental requirement in medical imaging workflows: identifying the imaging equipment or technique used to capture an image. This classification is essential for:

**Workflow Routing**: Different modalities require different processing pipelines and clinical protocols.

**Equipment Management**: Tracking imaging modality usage patterns and equipment performance.

The profile supports both automated and semi-automated workflows. When imaging context is provided through ImagingStudy resources, modality detection can be optimized or skipped entirely. The optional classification scores extension provides transparency into AI decision-making, supporting quality assurance and model validation activities.
