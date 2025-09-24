Profile: OrthovisionAIObservation
Parent: Observation
Id: orthovision-ai-observation
Title: "Observation: Classification"
Description: "This profile represents an observation capturing the classification of imaging data as determined by the Orthovision AI service."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-observation"
* ^experimental = false
* status = #draft
* category = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* code.coding.system = "http://medoco.health/fhir/CodeSystem/orthovision-ai-observation-types"
* code.coding.code = #modality
* subject 0..1 MS
* subject only Reference(Patient)
* value[x] only CodeableConcept
