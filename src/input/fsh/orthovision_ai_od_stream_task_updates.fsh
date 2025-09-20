Instance: StreamTaskUpdates
InstanceOf: OperationDefinition
Usage: #definition
Title: "Stream Task Updates Operation"
Description: "Provides real-time Server-Sent Events stream for Task status updates"
* url = "http://medoco.health/fhir/OperationDefinition/StreamTaskUpdates"
* name = "StreamTaskUpdates"
* title = "Stream Task Updates"
* status = #active
* kind = #operation
* experimental = false
* date = "2025-09-18"
* publisher = "medocoHEALTH"
* contact.name = "medocoHEALTH Support"
* contact.telecom.system = #url
* contact.telecom.value = "https://medoco.health"
* description = "Provides real-time Server-Sent Events stream for Task status updates. Returns text/event-stream with Task resources as processing progresses."
* code = #stream
* resource = #Task
* system = false
* type = false
* instance = true

// Output parameter: Stream of Task updates
* parameter[0].name = #return
* parameter[0].use = #out
* parameter[0].min = 1
* parameter[0].max = "*"
* parameter[0].type = #Task
* parameter[0].targetProfile = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-task"
* parameter[0].documentation = "Stream of updated Task resources via Server-Sent Events (Content-Type: text/event-stream). Connection closes when Task reaches terminal status (completed, failed, cancelled)."
