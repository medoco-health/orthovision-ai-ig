Instance: ClassifyOrthodonticImage
InstanceOf: OperationDefinition
Usage: #definition
Title: "Classify Orthodontic Image Operation"
Description: "Operation to submit orthodontic images for AI-powered classification"
* url = "http://medoco.health/fhir/OperationDefinition/ClassifyOrthodonticImage"
* name = "ClassifyOrthodonticImage"
* title = "Classify Orthodontic Image"
* status = #active
* kind = #operation
* experimental = false
* date = "2025-09-18"
* publisher = "medocoHEALTH"
* contact.name = "medocoHEALTH Support"
* contact.telecom.system = #url
* contact.telecom.value = "https://medoco.health"
* description = "Submits orthodontic imaging data for AI-powered classification of modality and protocol. Returns a Task resource for asynchronous progress tracking."
* code = #classify
* system = true
* type = false
* instance = false

// Input parameter: Bundle containing image and optional context
* parameter[0].name = #input
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].type = #Bundle
* parameter[0].targetProfile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-bundle"
* parameter[0].documentation = "Bundle containing the orthodontic image (OrthovisionAIBinary) and optional ImagingStudy context for AI classification"

// Input parameter: Optional classification scores
* parameter[1].name = #includeClassificationScores
* parameter[1].use = #in
* parameter[1].min = 0
* parameter[1].max = "1"
* parameter[1].type = #boolean
* parameter[1].documentation = "If true, include complete AI prediction rankings with confidence scores in the result observations. Default is false."

// Output parameter: Task for progress tracking
* parameter[2].name = #return
* parameter[2].use = #out
* parameter[2].min = 1
* parameter[2].max = "1"
* parameter[2].type = #Task
* parameter[2].targetProfile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-task"
* parameter[2].documentation = "Task resource for tracking the classification progress. Poll this resource or use the $stream operation for real-time updates."
