Profile: OrthovisionAIModel
Parent: Device
Id: orthovision-ai-model
Title: "Orthovision AI Model"
Description: "This profile represents an AI model used by the Orthovision service for DICOM image classification."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-model"
* ^experimental = false

// Core identification fields
* manufacturer 1..1 MS
* manufacturer ^short = "AI system developer/vendor"
* manufacturer ^definition = "The organization that developed or provides the AI classification system."

* displayName 1..1 MS
* displayName ^short = "AI model/system display name"
* displayName ^definition = "The display name of the AI model or classification system."

* name 1..* MS
* name ^short = "AI model/system name"
* name ^definition = "The specific name of the AI model or classification system."

* modelNumber 0..1 MS
* modelNumber ^short = "AI model identifier"
* modelNumber ^definition = "Version identifier or model number for the specific AI system variant."

// Software and version tracking
* version 0..* MS
* version ^short = "Software versions"
* version ^definition = "Software versions of the AI system, including model weights, inference engine, and related components."

// Operational status
* status 1..1 MS
* status ^short = "Operational status"
* status ^definition = "Current operational status of the AI system."
