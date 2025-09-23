Extension: OrthovisionAIClassificationScores
Id: orthovision-ai-classification-scores
Title: "Orthovision AI - Classification Scores"
Description: "Extension to capture the complete ranked list of AI model predictions with confidence scores for transparency and debugging purposes."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-classification-scores"
* ^context.type = #element
* ^context.expression = "Observation"

* extension contains
    prediction 0..* MS
* extension[prediction] ^short = "Individual prediction result"
* extension[prediction] ^definition = "A single prediction from the AI model with its associated confidence score"
* extension[prediction].extension contains
    code 1..1 MS and
    confidence 1..1 MS
* extension[prediction].extension[code] ^short = "Predicted classification code"
* extension[prediction].extension[code] ^definition = "The classification code predicted by the AI model"
* extension[prediction].extension[code].value[x] only CodeableConcept
* extension[prediction].extension[confidence] ^short = "Confidence score"  
* extension[prediction].extension[confidence] ^definition = "AI model confidence score for this prediction (0.0-1.0)"
* extension[prediction].extension[confidence].value[x] only decimal

// =============================================================================
// UPDATED OBSERVATION PROFILES WITH EXTENSION
// =============================================================================

Profile: OrthovisionAIModalityObservationWithScores
Parent: OrthovisionAIModalityObservation
Id: orthovision-ai-modality-observation-with-scores
Title: "Observation: Modality Classification with Classification Scores"
Description: "Enhanced modality observation that can optionally include all AI model classification scores"
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-modality-observation-with-scores"
* ^experimental = false
* extension contains OrthovisionAIClassificationScores named classificationScores 0..1 MS
* extension[classificationScores] ^short = "All AI model classification scores for modality detection"
* extension[classificationScores] ^definition = "Complete ranked list of modality classifications with confidence scores from the AI model"

// Update your existing protocol observation profile  
Profile: OrthovisionAIProtocolObservationWithScores
Parent: OrthovisionAIProtocolObservation
Id: orthovision-ai-protocol-observation-with-scores
Title: "Observation: Protocol Classification with Classification Scores"
Description: "Enhanced protocol observation that can optionally include all AI model classification scores"
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-protocol-observation-with-scores"
* ^experimental = false
* extension contains OrthovisionAIClassificationScores named classificationScores 0..1 MS
* extension[classificationScores] ^short = "All AI model classification scores for protocol detection"
* extension[classificationScores] ^definition = "Complete ranked list of protocol classifications with confidence scores from the AI model"
