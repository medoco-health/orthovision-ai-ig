Profile: OrthovisionAIDiagnosticReport
Parent: DiagnosticReport
Id: orthovision-ai-diagnostic-report  
Title: "DiagnosticReport: Classification Results"
Description: "Profile defining an AI-generated diagnostic report for orthodontic analysis. This profile extends the base FHIR DiagnosticReport resource to accommodate specialized needs for AI-powered orthodontic imaging analysis, specifically image type categorization and modality detection."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-diagnostic-report"
* status = #partial
* code.coding.system = "http://medoco.health/fhir/CodeSystem/procedures" // preferred binding is LOINC Diagnostic Report Codes, but no suitable code exists there
* code.coding.code = #orthodontic-classification
* subject 0..1 MS
* subject only Reference(Patient)
* result 2..2 MS
* result ^slicing.discriminator.type = #profile
* result ^slicing.discriminator.path = "resolve()"
* result ^slicing.rules = #closed
* result contains
    modalityResult 1..1 MS and
    protocolResult 1..1 MS
* result[modalityResult] only Reference(OrthovisionAIModalityObservation)
* result[protocolResult] only Reference(OrthovisionAIProtocolObservation)
* conclusion 0..1 MS
