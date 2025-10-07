Extension: PerformerDevice
Id: performer-device
Title: "Performer Device Extension"
Description: "Extension to reference a Device that performed the task. This extension addresses the gap in FHIR R4 and R5 specifications for tracking which specific AI system performed a task, providing forward compatibility with FHIR R6 native device performer support."
* ^url = "http://medoco.health/fhir/StructureDefinition/performer-device"
* ^status = #active
* ^context.type = #element
* ^context.expression = "Task"
* value[x] only Reference(Device)
