Profile: OrthovisionAIBinary
Parent: Binary
Id: orthovision-ai-binary
Title: "Orthovision AI Binary"
Description: "This profile enforces non empty Binaries."
* ^url = "http://medoco.health/fhir/StructureDefinition/orthovision-ai-binary"
* contentType from OrthovisionAIImageTypes (required)
* data 1..1 MS
* data ^requirements = "data is required (and must not be empty)."
