// Primary supported medical imaging formats
ValueSet: OrthovisionAIImageTypes
Title: "Orthovision AI Image Types"
Description: "Common image MIME types used in medical imaging and diagnostics that Orthovision AI must support."
* ^experimental = false
* urn:ietf:bcp:13#image/jpeg "JPEG Image"
* urn:ietf:bcp:13#image/png "PNG Image" 
* urn:ietf:bcp:13#image/jp2 "JPEG 2000 Image"
* urn:ietf:bcp:13#application/dicom "DICOM Image"

// A list of potential error codes that the Orthovision AI API might return
// during image processing tasks. These codes help clients understand the nature
// of any issues encountered.
CodeSystem: OrthovisionAIErrorCodes
Id: orthovision-ai-error-codes
Title: "Orthovision AI - API Error Codes"
Description: "Error codes that the Orthovision AI API service may return during image processing tasks."
* ^url = "http://medoco.health/fhir/CodeSystem/orthovision-ai-error-codes"
* ^experimental = false
* ^caseSensitive = true
* #unsupported-image-format "Unsupported Image Format"
* #image-too-large "Image Too Large" 
* #corrupted-data "Corrupted Image Data"
* #invalid-bundle "Invalid Bundle Structure"
* #rate-limit-exceeded "Rate Limit Exceeded"
* #service-unavailable "Service Temporarily Unavailable"
