Instance: OrthovisionAICapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Orthovision AI Service Capability Statement"
Description: "Describes the capabilities of the Orthovision AI classification service"
* url = "http://medoco.health/fhir/CapabilityStatement/orthovision-ai-service"
* name = "OrthovisionAICapabilityStatement"
* title = "Orthovision AI Service Capability Statement"
* date = "2025-09-20"
* status = #active
* experimental = false
* publisher = "medocoHEALTH"
* contact.name = "medocoHEALTH Support"
* contact.telecom.system = #url
* contact.telecom.value = "https://medoco.health"
* description = "This capability statement describes the Orthovision AI service's support for FHIR R5 operations related to orthodontic image classification."
* kind = #instance
* fhirVersion = #5.0.0
* format[0] = #json

// REST configuration
* rest.mode = #server
* rest.documentation = "The Orthovision AI service provides asynchronous orthodontic image classification using FHIR R5 resources and operations."

// Task resource support
* rest.resource[0].type = #OrthovisionAITask
* rest.resource[0].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-task"
* rest.resource[0].documentation = "Task resources track the progress of AI classification operations from submission through completion."
* rest.resource[0].interaction[0].code = #read
* rest.resource[0].interaction[0].documentation = "Read Task by ID to check classification progress"
* rest.resource[0].interaction[1].code = #search-type
* rest.resource[0].interaction[1].documentation = "Search Tasks by status, focus reference, or other parameters"
* rest.resource[0].searchParam[0].name = "status"
* rest.resource[0].searchParam[0].type = #token
* rest.resource[0].searchParam[0].documentation = "Search Tasks by status (in-progress, completed, failed)"
* rest.resource[0].searchParam[1].name = "focus"
* rest.resource[0].searchParam[1].type = #reference
* rest.resource[0].searchParam[1].documentation = "Search Tasks by focus (input Bundle reference)"
* rest.resource[0].operation[0].name = "stream"
* rest.resource[0].operation[0].definition = "http://medoco.health/fhir/OperationDefinition/stream-task-updates"
* rest.resource[0].operation[0].documentation = "Stream real-time Task updates via Server-Sent Events"

// DiagnosticReport resource support
* rest.resource[1].type = #OrthovisionAIDiagnosticReport
* rest.resource[1].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-diagnostic-report"
* rest.resource[1].documentation = "DiagnosticReport resources contain the final AI classification results"
* rest.resource[1].interaction[0].code = #read
* rest.resource[1].interaction[0].documentation = "Read DiagnosticReport by ID to retrieve classification results"
* rest.resource[1].interaction[1].code = #search-type
* rest.resource[1].interaction[1].documentation = "Search DiagnosticReports by subject, date, or other parameters"

// Modality Observation resource support
* rest.resource[2].type = #OrthovisionAIModalityObservation
* rest.resource[2].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-modality-observation"
* rest.resource[2].documentation = "Observation resources containing AI-determined modality classifications"
* rest.resource[2].interaction[0].code = #read
* rest.resource[2].interaction[0].documentation = "Read modality Observation by ID"
* rest.resource[2].interaction[1].code = #search-type
* rest.resource[2].interaction[1].documentation = "Search modality Observations by category, code, or subject"

// Protocol Observation resource support
* rest.resource[3].type = #OrthovisionAIProtocolObservation
* rest.resource[3].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-protocol-observation"
* rest.resource[3].documentation = "Observation resources containing AI-determined protocol classifications"
* rest.resource[3].interaction[0].code = #read
* rest.resource[3].interaction[0].documentation = "Read protocol Observation by ID"
* rest.resource[3].interaction[1].code = #search-type
* rest.resource[3].interaction[1].documentation = "Search protocol Observations by category, code, or subject"

// Bundle resource support (read-only for retrieving input bundles)
* rest.resource[4].type = #OrthovisionAIBundle
* rest.resource[4].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-bundle"
* rest.resource[4].documentation = "Bundle resources used as input for classification operations"
* rest.resource[4].interaction[0].code = #read
* rest.resource[4].interaction[0].documentation = "Read Bundle by ID (typically for reference from Task.focus)"

// Binary resource support (read-only for retrieving image data)
* rest.resource[5].type = #OrthovisionAIBinary
* rest.resource[5].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-binary"
* rest.resource[5].documentation = "Binary resources containing orthodontic image data"
* rest.resource[5].interaction[0].code = #read
* rest.resource[5].interaction[0].documentation = "Read Binary by ID to retrieve image content"

// System-level operations
* rest.operation[0].name = "classify"
* rest.operation[0].definition = "http://medoco.health/fhir/OperationDefinition/classify-orthodontic-image"
* rest.operation[0].documentation = "Submit orthodontic images for AI classification"
