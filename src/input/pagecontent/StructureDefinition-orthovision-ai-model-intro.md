The OrthovisionAIModel profile provides a comprehensive framework for describing AI systems used in medical image classification. This guidance helps implementers properly document their AI models to ensure transparency and traceability.

## Integration with Task Processing

The AI model Device resource integrates with the Task workflow:

1. **Task Creation**: Reference in `requestedPerformer` if known
2. **Task Execution**: Reference in `performerDevice` extension when processing begins  
3. **Task Completion**: Permanent record of which AI system generated the results

This ensures full traceability from classification request through AI processing to final results.
