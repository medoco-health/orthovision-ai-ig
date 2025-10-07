Profile: OrthovisionAIBundle
Parent: Bundle
Id: orthovision-ai-bundle
Title: "Orthovision AI Bundle"
Description: "A Bundle containing all resources needed for AI image processing: Binary with image data, optional ImagingStudy for context, and Task for processing request."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-bundle"
* ^experimental = false

* type = #transaction

* entry 2..3 MS
* entry ^slicing.discriminator.type = #type  
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry contains 
    binaryEntry 1..1 MS and
    taskEntry 1..1 MS and
    imagingStudyEntry 0..1 MS

* entry[binaryEntry].resource only OrthovisionAIBinary
* entry[binaryEntry].request 1..1 MS
* entry[binaryEntry].request.method = #POST
* entry[binaryEntry].request.url = "Binary"

* entry[taskEntry].resource only OrthovisionAITask
* entry[taskEntry].request 1..1 MS
* entry[taskEntry].request.method = #POST
* entry[taskEntry].request.url = "Task"

* entry[imagingStudyEntry].resource only ImagingStudy
* entry[imagingStudyEntry].request 1..1 MS
* entry[imagingStudyEntry].request.method = #POST
* entry[imagingStudyEntry].request.url = "ImagingStudy"

* obeys bundle-task-references-binary

Invariant: bundle-task-references-binary
Description: "The Task in the bundle must reference the Binary in the same bundle"
Expression: "entry.where(resource is Task).resource.focus.reference.startsWith('urn:uuid:') and entry.where(resource is Binary).exists(fullUrl = %context.entry.where(resource is Task).resource.focus.reference)"
Severity: #error
