Profile: OrthovisionAIObservation
Parent: Observation
Id: orthovision-ai-observation
Title: "OrthovisionAI Observation"
Description: "This profile represents an observation capturing the AI-predicted value for a specific DICOM tag."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-observation"
* ^experimental = false

* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#imaging

// The code represents which DICOM tag this observation is about
* code.coding.system = "http://medoco.health/fhir/CodeSystem/dicom-tags"
* code.coding.code MS // e.g., "modality", "body-part", etc.

* subject 0..1 MS
* subject only Reference(Patient)

// The predicted/inferred value
* value[x] only CodeableConcept or string

// Optional: confidence score
* extension contains ConfidenceScore named confidenceScore 0..1 MS

Extension: ConfidenceScore
Id: confidence-score
Title: "AI Confidence Score"
Description: "Confidence score for AI prediction (0.0-1.0)"
* ^url = "http://medoco.health/fhir/StructureDefinition/confidence-score"
* value[x] only decimal
