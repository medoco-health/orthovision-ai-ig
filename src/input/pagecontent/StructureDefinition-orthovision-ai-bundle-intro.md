### Scope and Usage

The OrthovisionAIBundle profile provides a standardized way to package imaging data for AI classification services. This profile supports two primary usage patterns:

**Simple Classification**: Contains only an OrthovisionAIBinary resource with the image to be classified. This approach is suitable for basic workflows where only image content analysis is required.

**Context-Enhanced Classification**: Includes both an OrthovisionAIBinary and an ImagingStudy resource. The ImagingStudy provides additional context that can optimize AI processing by:
* Skipping modality detection when modality is already known
* Providing study-level metadata for improved classification accuracy
* Enabling workflow-specific processing optimizations

The bundle serves as the atomic unit for classification requests, ensuring all related resources are processed together. Each bundle represents a single classification task and maintains referential integrity between the image data and its optional context.
