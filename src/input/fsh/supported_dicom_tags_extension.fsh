Extension: SupportedDicomTags
Id: supported-dicom-tags
Title: "Supported DICOM Tags"
Description: "Extension to declare which DICOM tags this server can classify using AI. Supports DICOM tag numbers (e.g., '0008,0060'), DICOM keywords (e.g., 'Modality'), or custom identifiers."
* ^url = "http://medoco.health/fhir/StructureDefinition/supported-dicom-tags"
* ^context.type = #element
* ^context.expression = "CapabilityStatement"
* extension contains
    tagIdentifier 1..1 MS and
    description 0..1 MS
* extension[tagIdentifier] ^short = "DICOM tag identifier"
* extension[tagIdentifier] ^definition = "The identifier for the DICOM tag. Can be a DICOM tag number (e.g., '0008,0060'), DICOM keyword (e.g., 'Modality'), or custom identifier (e.g., 'lesion-severity')."
* extension[tagIdentifier].value[x] only string
* extension[description] ^short = "Human-readable description"
* extension[description] ^definition = "Optional human-readable description of what this tag represents or what values it can classify."
* extension[description].value[x] only string
