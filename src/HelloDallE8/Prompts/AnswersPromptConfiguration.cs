using Microsoft.SemanticKernel;

namespace HelloDallE8.Prompts
{
    public class AnswersPromptConfiguration
    {
        public PromptTemplateConfig promptTemplateConfig { get; set; }
        public AnswersPromptConfiguration(string AnswersCollection)
        {
            promptTemplateConfig = new PromptTemplateConfig()
            {
                Name = "AnswerFunction",
                Description = "Generate a JSON object that represents a collection of answers that will be used to describe an image the user wants to create with the DallE service.",
                Template = @$"Instructions: Generate a text prompt that will be passed to DallE to generate an image using that description. The prompt should be based on these descriptors of an image {AnswersCollection}. TextPrompt:",
                TemplateFormat = "semantic-kernel",
                ExecutionSettings = new Dictionary<string, PromptExecutionSettings>()
                {
                    {
                        "default",
                        new PromptExecutionSettings()
                        {
                            ExtensionData = new Dictionary<string, object>()
                            {
                                { "max_tokens", 2000 },
                                { "temperature", 0.7 }
                            }
                        }
                    }
                }
            };
        }
    }
}