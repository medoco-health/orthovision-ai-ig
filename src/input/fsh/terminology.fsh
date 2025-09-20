// Primary supported medical imaging formats
ValueSet: OrthovisionAIImageTypes
Title: "Orthovision AI Image Types"
Description: "Common image MIME types used in orthodontic imaging and diagnostics that Orthovision AI must support."
* ^experimental = false
* urn:ietf:bcp:13#image/jpeg "JPEG Image"
* urn:ietf:bcp:13#image/png "PNG Image" 
* urn:ietf:bcp:13#image/jp2 "JPEG 2000 Image"
* urn:ietf:bcp:13#application/dicom "DICOM Image"

// A code system defining the types of tasks that the Orthovision AI API can perform.
CodeSystem: OrthovisionAITaskTypes
Id: orthovision-ai-task-types
Title: "Orthovision AI Task Types"
Description: "Types of tasks that the Orthovision AI service can perform on orthodontic imaging data."
* ^url = "http://medoco.health/fhir/CodeSystem/orthovision-ai-task-types"
* ^experimental = false
* ^caseSensitive = true
* #classify "Classify Image"

// A code system defining the possible outputs from tasks performed by the Orthovision AI API.
CodeSystem: OrthovisionAITaskOutputs
Id: orthovision-ai-task-outputs
Title: "Orthovision AI Task Outputs"
Description: "Outputs that can be produced by Orthovision AI tasks."
* ^url = "http://medoco.health/fhir/CodeSystem/orthovision-ai-task-outputs"
* ^experimental = false
* ^caseSensitive = true
* #classification-result "Classification Result"

// A list of potential error codes that the Orthovision AI API might return
// during image processing tasks. These codes help clients understand the nature
// of any issues encountered.
CodeSystem: OrthovisionAIErrorCodes
Id: orthovision-ai-error-codes
Title: "Orthovision AI - API Error Codes"
Description: "Error codes that the Orthovision AI API service may return during image processing tasks."
* ^url = "http://medoco.health/fhir/CodeSystem/orthovision-ai-error-codes"
* ^experimental = true
* ^caseSensitive = true
* #unsupported-image-format "Unsupported Image Format"
* #image-too-large "Image Too Large" 
* #corrupted-data "Corrupted Image Data"
* #invalid-bundle "Invalid Bundle Structure"
* #rate-limit-exceeded "Rate Limit Exceeded"
* #service-unavailable "Service Temporarily Unavailable"

// A code system defining the types of observations that the Orthovision AI models are able to infer.
CodeSystem: OrthovisionAIObservationTypes
Id: orthovision-ai-observation-types
Title: "Orthovision Observation Types"
Description: "Types of observations that the Orthovision AI models can classify from orthodontic imaging data."
* ^url = "http://medoco.health/fhir/CodeSystem/orthovision-ai-observation-types"
* ^experimental = false
* ^caseSensitive = true
* #modality "Imaging Modality"
* #protocol "Imaging Protocol"

// A code system defining the imaging protocols that the Orthovision AI models can classify.
CodeSystem: OrthovisionAIProtocolCS
Id: orthovision-ai-protocol-cs
Title: "Orthovision AI Imaging Protocols"
Description: "Orthovision imaging protocols for clinical and diagnostic use."
* ^url = "http://medoco.health/fhir/CodeSystem/orthovision-ai-protocol-cs"
* ^caseSensitive = true
* ^experimental = true
* ^description = "Orthovision imaging protocols for clinical and diagnostic use."
* #frontal-facial "Frontal Facial" "Front-facing photograph"
* #profile-left "Left Profile" "Left side profile"  
* #profile-right "Right Profile" "Right side profile"
* #frontal-smile "Frontal Smile" "Front smile photograph"
* #intraoral-frontal "Intraoral Frontal" "Front teeth intraoral"
* #intraoral-upper "Upper Occlusal" "Upper arch view"
* #intraoral-lower "Lower Occlusal" "Lower arch view"
* #intraoral-left "Left Buccal" "Left side intraoral"
* #intraoral-right "Right Buccal" "Right side intraoral"

// A value set defining the imaging modalities that the Orthovision AI models can classify.
ValueSet: OrthovisionAIModalityVS
Id: orthovision-ai-modality-vs
Title: "Orthovision AI Imaging Modalities"
Description: "Imaging modalities commonly used in orthodontic diagnostics that Orthovision AI can classify."
* ^url = "http://medoco.health/fhir/ValueSet/orthovision-ai-modality-vs"
* ^experimental = true
* DCM#XC "External-camera Photography"
* DCM#DX "Digital Radiography"
* DCM#CT "Computed Tomography"
* DCM#IO "Intra-Oral Radiography"
* DCM#OT "Other"

// A value set defining the imaging protocols that the Orthovision AI models can classify.
ValueSet: OrthovisionAIProtocolVS
Id: orthovision-ai-protocol-vs
Title: "Orthovision AI Protocols"
Description: "Imaging protocols commonly used in orthodontic diagnostics that Orthovision AI can classify."
* ^url = "http://medoco.health/fhir/ValueSet/orthovision-ai-protocol-vs"
* ^experimental = true
* include codes from system http://medoco.health/fhir/CodeSystem/orthovision-ai-protocol-cs

// This code system defines the procedures that the Orthovision AI can perform (diagnostic report codes).
CodeSystem: OrthovisionAIProcedures
Id: orthovision-ai-procedures
Title: "Orthovision AI Procedures"
Description: "Procedures that can be performed by the Orthovision AI service."
* ^experimental = false
* ^caseSensitive = true
* ^url = "http://medoco.health/fhir/CodeSystem/orthovision-ai-procedures"
* #orthovision-ai-classification "Orthovision AI Classification"
