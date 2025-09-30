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
