Profile: OrthovisionAIBundle
Parent: Bundle
Id: orthovision-ai-bundle
Title: "Orthovision AI Bundle"
Description: "A FHIR Bundle that packages a patient's dental/orthodontic image (OrthovisionAIBinary) together with its associated imaging metadata (ImagingStudy)."

* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-bundle"
* ^version = "0.1.0"

// This bundle is a collection type
* type = #collection

// The bundle must contain 1-2 entries
* entry 1..2 MS

// Define how entries are distinguished (by resource type)
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open

// Define required bundle contents
* entry contains 
    imageBinary 1..1 MS and   // One image is required
    imagingStudy 0..1 MS      // Imaging metadata is optional

// Specify the resource types for each slice
* entry[imageBinary].resource only OrthovisionAIBinary
* entry[imagingStudy].resource only ImagingStudy
