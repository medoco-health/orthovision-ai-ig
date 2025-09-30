The `OrthovisionAIBundle` provides a streamlined approach for submitting medical image classification requests by bundling all required resources into a single atomic transaction.

## Purpose

This Bundle contains:
- **Binary**: The medical image data to be classified
- **Task**: The processing request specifying which DICOM tags to classify  
- **ImagingStudy** (optional): Additional DICOM metadata context for improved accuracy

## Benefits

### Atomic Operations
All resources are created together in a single transaction, ensuring referential integrity and preventing orphaned resources.

### Simplified Client Implementation  
- Single POST request instead of multiple sequential operations
- No need to manage intermediate resource states
- Built-in error handling with transaction rollback

### Server Benefits
- No orphaned Binary resources requiring cleanup
- Clear resource lifecycle management
- Reduced implementation complexity

## Usage

Submit the bundle to the `/Bundle` endpoint using a POST request. The server will:

1. Validate the bundle structure and resource references
2. Create all resources atomically  
3. Automatically transition the Task to "in-progress" status
4. Begin asynchronous AI processing
5. Return a transaction response with the created resource IDs

## Reference Handling

Resources within the bundle reference each other using temporary UUIDs (e.g., `urn:uuid:resource-id`). The server resolves these to actual resource IDs upon creation.

## Example

See the [API Workflow](api-workflow.html) page for a complete example of Bundle submission and processing.
