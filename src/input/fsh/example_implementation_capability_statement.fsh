Instance: ExampleImplementationCapabilityStatement
InstanceOf: CapabilityStatement
Usage: #example
Title: "Example: AI Service Implementation Capability Statement"
Description: "Example showing how an implementer would declare their supported DICOM tags using the supported-dicom-tags extension"
* url = "http://example.org/fhir/CapabilityStatement/ExampleOrthovisionAIImplementation"
* name = "ExampleOrthovisionAIImplementation"
* title = "Example Orthovision AI Implementation"
* date = "2025-09-30"
* status = #active
* experimental = true
* publisher = "Example Healthcare Organization"
* contact.name = "Example IT Department"
* contact.telecom.system = #email
* contact.telecom.value = "it-support@example.org"
* description = "Example capability statement showing how an implementer declares their specific DICOM tag classification capabilities using the supported-dicom-tags extension.\n\n**Important**: The list of supported DICOM tags is declared in extensions within this CapabilityStatement - check the JSON or XML representation to see the complete list of supported tags."
* kind = #instance
* fhirVersion = #5.0.0
* format[0] = #json

* software.name = "Example Orthovision AI Implementation"
* software.version = "1.2.3"

* implementation.description = "Example implementation of Orthovision AI service at Example Healthcare Organization"
* implementation.url = "https://api.example.org/fhir"

// REST configuration
* rest.mode = #server
* rest.documentation = "Example implementation of the Orthovision AI service supporting a specific set of DICOM tag classifications."

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

// Observation resource support
* rest.resource[2].type = #Observation
* rest.resource[2].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-observation"
* rest.resource[2].documentation = "Observation resources containing AI-determined classifications"
* rest.resource[2].interaction[0].code = #read
* rest.resource[2].interaction[0].documentation = "Read Observation by ID"

// Binary resource support
* rest.resource[3].type = #Binary
* rest.resource[3].profile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-binary"
* rest.resource[3].documentation = "Binary resources containing image data"
* rest.resource[3].interaction[0].code = #read
* rest.resource[3].interaction[0].documentation = "Read Binary by ID to retrieve image content"

// EXAMPLE: How implementers declare their supported DICOM tags
// This example implementation supports 2 different types of classifications:

// Example 1: Standard DICOM tag using tag number
* extension[0].url = "http://medoco.health/fhir/StructureDefinition/supported-dicom-tags"
* extension[0].extension[0].url = "tagIdentifier"
* extension[0].extension[0].valueString = "0008,0060"
* extension[0].extension[1].url = "description"
* extension[0].extension[1].valueString = "Modality - Type of imaging equipment used (CT, MR, XR, etc.)"

// Example 2: Another standard DICOM tag
* extension[1].url = "http://medoco.health/fhir/StructureDefinition/supported-dicom-tags"
* extension[1].extension[0].url = "tagIdentifier"
* extension[1].extension[0].valueString = "0018,0015"
* extension[1].extension[1].url = "description"
* extension[1].extension[1].valueString = "Body Part Examined (CHEST, HEAD, ABDOMEN, etc.)"
