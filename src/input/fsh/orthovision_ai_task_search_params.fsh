Instance: TaskFocusSearchParameter
InstanceOf: SearchParameter
Usage: #definition
Title: "Task Focus Search Parameter"
Description: "Search parameter for finding Tasks by their focus reference"
* url = "http://medoco.health/fhir/SearchParameter/TaskFocusSearchParameter"
* name = "TaskFocusSearchParameter"
* status = #active
* experimental = false
* date = "2025-09-18"
* publisher = "medocoHEALTH"
* description = "Search Tasks by the resource they are focused on (typically input Bundle)"
* code = #focus
* base = #Task
* type = #reference
* expression = "Task.focus"
* processingMode = #normal
* target = #Bundle
