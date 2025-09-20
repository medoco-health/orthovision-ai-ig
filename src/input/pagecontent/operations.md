The Orthovision AI service uses an asynchronous workflow:

1. Submit images via `$classify` operation
2. Monitor progress via Task polling or `$stream` operation  
3. Retrieve results from DiagnosticReport when complete

### $classify Operation

The primary operation for submitting orthodontic images for AI classification.

#### Usage
```
POST [base]/$classify
```

#### Parameters
- `input` (Bundle): OrthovisionAIBundle containing image and optional context
- `includeClassificationScores` (boolean): Include complete AI predictions

#### Response
Returns OrthovisionAITask for progress tracking.

### $stream Operation

Provides real-time updates for Task progress via Server-Sent Events.

#### Usage
```
GET [base]/Task/{id}/$stream
```

#### Response
```
Content-Type: text/event-stream

data: {"resourceType": "Task", "status": "in-progress", ...}
data: {"resourceType": "Task", "status": "completed", ...}
```

### Error Handling

Failed operations return OperationOutcome with specific error codes from the OrthovisionAIErrorCodes system.

### Performance Considerations

- Include ImagingStudy context to optimize processing
- Use `$stream` operation to reduce polling overhead
- Request classification scores only when needed for debugging
