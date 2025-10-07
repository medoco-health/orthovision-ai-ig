### Scope and Usage

The PerformerDevice extension addresses a critical gap in FHIR R4 and R5 specifications for tracking which specific AI system performed a task. While FHIR R6 introduces native support for devices as task performers, this extension provides backward compatibility and ensures consistent AI system identification across FHIR versions.

### FHIR Version Compatibility

**FHIR R4 and R5 Limitations:**
The current FHIR Task resource specification in R4 and R5 does not provide native support for identifying device performers. While `Task.requestedPerformer` can reference practitioners or organizations, it lacks the ability to precisely identify the specific device or AI system that actually performed the task.

**FHIR R6 Evolution:**
FHIR R6 will introduce native support for device performers in Task resources, addressing this limitation directly in the specification. However, many implementations currently rely on R4 or R5 and need immediate solutions.

### Technical Implementation

The extension accepts a Reference to a Device resource, specifically an OrthovisionAIModel in this implementation guide. The referenced device should contain comprehensive information about the AI system including:

- **Manufacturer**: The organization that developed the AI system
- **Device Name**: The specific AI model or system name
- **Model Number**: Version identifier for the AI system
- **Software Version**: Specific version of the AI software
- **Configuration**: Any relevant configuration parameters that might affect results

### Usage Patterns

**During Task Creation:**
When a task is submitted for AI processing, the `performerDevice` extension is typically empty, as the specific AI system that will process the task may not yet be determined.

**During Task Execution:**
As the AI system begins processing, the server populates the `performerDevice` extension with a reference to the specific AI model being used.

**Upon Task Completion:**
The completed task maintains the `performerDevice` reference, providing a permanent record of which AI system generated the classification results.

### Migration Path to FHIR R6

When FHIR R6 becomes available and implementations upgrade, the information captured in this extension can be migrated to the native R6 device performer fields.
