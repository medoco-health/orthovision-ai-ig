### Scope and Usage

The OrthovisionAITask profile implements asynchronous processing patterns essential for AI-powered image classification. AI processing can take significant time (seconds to minutes depending on model complexity and system load), making synchronous APIs impractical for healthcare workflows.

This profile provides:

**Progress Tracking**: Real-time visibility into processing stages through standard FHIR Task status values and human-readable businessStatus updates.

**Multiple Monitoring Options**: Supports both polling-based monitoring (`GET /Task/{id}`) and real-time updates via Server-Sent Events (`GET /Task/{id}/$stream`).

**Result Management**: Upon completion, the task output contains references to DiagnosticReport resources with complete classification results.

**Error Handling**: Failed tasks provide detailed error information through standard FHIR mechanisms.
