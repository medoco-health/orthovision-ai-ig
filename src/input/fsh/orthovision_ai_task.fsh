Profile: OrthovisionAITask
Parent: Task
Id: orthovision-ai-task
Title: "Orthovision AI Task"
Description: "This profile represents a task for the Orthovision AI service to infer proper DICOM tags."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-task"
* ^experimental = false

* status MS

* intent = #order

* doNotPerform = false

* code.coding.system = "http://hl7.org/fhir/CodeSystem/task-code"
* code.coding.code = #fulfill

* requestedPerformer 0..1 MS
* requestedPerformer only CodeableReference(OrthovisionAIModel)

* extension contains PerformerDevice named performerDevice 0..1 MS
* extension[performerDevice].valueReference only Reference(OrthovisionAIModel)

* focus 1..1 MS
* focus only Reference(OrthovisionAIBinary)

* input 1..* MS
* input ^slicing.discriminator.type = #type
* input ^slicing.discriminator.path = "value"
* input ^slicing.rules = #open
* input contains imagingStudy 0..1 MS and tagDICOM 1..* MS
* input[imagingStudy].value[x] only Reference(ImagingStudy)
* input[tagDICOM].value[x] only string

* output 1..* MS
* output.value[x] only Reference(OrthovisionAIObservation)

* obeys task-input-output-match


Invariant: task-input-output-match
Description: "Number of output observations must match number of input DICOM tags"
Expression: "input.where(type.coding.exists(system='http://hl7.org/fhir/task-input-type' and code='tagDICOM')).count() = output.count()"
Severity: #error


Extension: PerformerDevice
Id: performer-device
Title: "Performer Device Extension"
Description: "Extension to reference a Device that performed the task"
* ^url = "http://medoco.health/fhir/StructureDefinition/performer-device"
* ^version = "1.0.0"
* ^status = #active
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only Reference(Device)