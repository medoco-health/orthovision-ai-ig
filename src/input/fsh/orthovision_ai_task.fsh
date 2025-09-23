Profile: OrthovisionAITask
Parent: Task
Id: orthovision-ai-task
Title: "Orthovision AI Task"
Description: "This profile represents a task for the Orthovision AI service to infer proper DICOM tags."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-task"
* ^experimental = false
* status MS
* intent = #order
* code.coding.system = "http://medoco.health/fhir/CodeSystem/orthovision-ai-task-types"
* code.coding.code = #classify
* focus 1..1 MS
* focus only Reference(OrthovisionAIBundle)
* output.type.coding.system = "http://medoco.health/fhir/CodeSystem/orthovision-ai-task-outputs"
* output.type.coding.code = #classification-result
* output.value[x] only Reference(OrthovisionAIDiagnosticReport)
