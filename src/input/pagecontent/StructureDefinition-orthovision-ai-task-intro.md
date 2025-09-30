### Scope and Usage

The OrthovisionAITask profile implements asynchronous processing patterns essential for AI-powered image classification. AI processing can take significant time (seconds to minutes depending on model complexity and system load), making synchronous APIs impractical for healthcare workflows.

This profile provides:

**Progress Tracking**: Real-time visibility into processing stages through standard FHIR Task status values and human-readable businessStatus updates.

**Result Management**: Upon completion, the task output contains references to 1 or more Observation resources with complete classification results.

**Error Handling**: Failed tasks provide detailed error information through standard FHIR mechanisms.

**AI System Traceability**: Complete identification and tracking of the AI system that performed the classification through the [PerformerDevice extension](StructureDefinition-performer-device.html).

### Device Performer Tracking

This profile uses the PerformerDevice extension to track which specific AI system performed each classification task. This extension addresses the gap between FHIR R4/R5 capabilities and the upcoming R6 native device performer support, ensuring complete audit trails and AI system traceability essential for healthcare workflows.

See the [PerformerDevice extension documentation](StructureDefinition-performer-device.html) for detailed implementation guidance and FHIR version compatibility information.
