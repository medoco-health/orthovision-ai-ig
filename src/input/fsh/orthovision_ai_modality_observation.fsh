Profile: OrthovisionAIModalityObservation
Parent: Observation
Id: orthovision-ai-modality-observation
Title: "Observation: Modality Classification"
Description: "This profile represents an observation capturing the modality classification of orthodontic imaging data as determined by the Orthovision AI service."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-modality-observation"
* ^version = "0.1.0"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#imaging
* code.coding.system = "http://medoco.health/fhir/CodeSystem/orthovision-ai-observation-types"
* code.coding.code = #modality
* subject 0..1 MS
* subject only Reference(Patient)
* value[x] only CodeableConcept
* valueCodeableConcept from OrthovisionAIModalityVS (required)
