Instance: Classify
InstanceOf: OperationDefinition
Usage: #definition
Title: "Classify Image Operation"
Description: "Operation to submit images for AI-powered classification"
* url = "http://medoco.health/fhir/OperationDefinition/Classify"
* name = "Classify"
* title = "Classify Image"
* status = #active
* kind = #operation
* experimental = false
* date = "2025-09-18"
* publisher = "medocoHEALTH"
* contact.name = "medocoHEALTH Support"
* contact.telecom.system = #url
* contact.telecom.value = "https://medoco.health"
* description = "Submits imaging data for AI-powered classification of modality and protocol. Returns a Task resource for asynchronous progress tracking."
* code = #classify
* system = true
* type = false
* instance = false

* parameter[0].name = #input
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].type = #bundle
* parameter[0].targetProfile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-bundle"
* parameter[0].documentation = "Bundle containing the image to be classified and optional ImagingStudy context for AI classification."

* parameter[1].name = #return
* parameter[1].use = #out
* parameter[1].min = 1
* parameter[1].max = "1"
* parameter[1].type = #Task
* parameter[1].targetProfile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-task"
* parameter[1].documentation = "Task resource for tracking the classification progress. Poll this resource or use the $stream operation for real-time updates."
