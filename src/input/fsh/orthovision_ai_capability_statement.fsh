Instance: OrthovisionAICapabilityStatement
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Orthovision AI Service Capability Statement"
Description: "Describes the capabilities of the Orthovision AI classification service"
* url = "http://medoco.health/fhir/CapabilityStatement/OrthovisionAICapabilityStatement"
* name = "OrthovisionAICapabilityStatement"
* title = "Orthovision AI Service Capability Statement"
* date = "2025-09-20"
* status = #active
* experimental = false
* publisher = "medocoHEALTH"
* contact.name = "medocoHEALTH Support"
* contact.telecom.system = #url
* contact.telecom.value = "https://medoco.health"
* description = "This capability statement describes the requirements for FHIR R5 operations that implementations of the Orthovision AI service must support for medical image classification."
* kind = #capability
* fhirVersion = #5.0.0
* format[0] = #json

* software.name = "Orthovision AI Service"
* software.version = "0.1.0"

// REST configuration
* rest.mode = #server
* rest.documentation = "The Orthovision AI service provides asynchronous medical image classification using FHIR R5 resources and operations."

// Bundle resource support (primary submission endpoint)
* rest.resource[0].type = #Bundle
* rest.resource[0].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-bundle"
* rest.resource[0].documentation = "Bundle resources containing Binary, Task, and optional ImagingStudy for atomic submission of classification requests."
* rest.resource[0].interaction[0].code = #create
* rest.resource[0].interaction[0].documentation = "Submit Bundle with image data and classification request for processing"

// Task resource support
* rest.resource[1].type = #Task
* rest.resource[1].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-task"
* rest.resource[1].documentation = "Task resources track the progress of AI classification operations from submission through completion."
* rest.resource[1].interaction[0].code = #read
* rest.resource[1].interaction[0].documentation = "Read Task by ID to check classification progress"
* rest.resource[1].interaction[1].code = #search-type
* rest.resource[1].interaction[1].documentation = "Search Tasks by status, focus reference, or other parameters"
* rest.resource[1].searchParam[0].name = "status"
* rest.resource[1].searchParam[0].type = #token
* rest.resource[1].searchParam[0].documentation = "Search Tasks by status (in-progress, completed, failed)"
* rest.resource[1].searchParam[1].name = "focus"
* rest.resource[1].searchParam[1].type = #reference
* rest.resource[1].searchParam[1].documentation = "Search Tasks by focus (Binary reference)"
* rest.resource[1].operation[0].name = "stream"
* rest.resource[1].operation[0].definition = "http://medoco.health/fhir/OperationDefinition/StreamTaskUpdates"
* rest.resource[1].operation[0].documentation = "Stream real-time Task updates via Server-Sent Events"

// Observation resource support (both modality and protocol classifications)
* rest.resource[2].type = #Observation
* rest.resource[2].supportedProfile[0] = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-modality-observation"
* rest.resource[2].supportedProfile[1] = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-protocol-observation"
* rest.resource[2].documentation = "Observation resources containing AI-determined modality and protocol classifications"
* rest.resource[2].interaction[0].code = #read
* rest.resource[2].interaction[0].documentation = "Read Observation by ID"
* rest.resource[2].interaction[1].code = #search-type
* rest.resource[2].interaction[1].documentation = "Search Observations by category, code, or subject"

// Binary resource support (read-only for retrieving image data)
* rest.resource[3].type = #Binary
* rest.resource[3].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-binary"
* rest.resource[3].documentation = "Binary resources containing image data"
* rest.resource[3].interaction[0].code = #read
* rest.resource[3].interaction[0].documentation = "Read Binary by ID to retrieve image content"
