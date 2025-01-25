using Microsoft.SemanticKernel;

namespace HelloDallE8.Prompts
{
    public class ImagePromptConfiguration
    {
        public PromptTemplateConfig promptTemplateConfiguration { get; set; }

        public ImagePromptConfiguration(string GeneratedImagePrompt)
        {
            promptTemplateConfiguration = new PromptTemplateConfig()
            {
                Name = "ImagePrompt",
                Description = "Generate an image from the prompt provided by the user answering a collection of questions.",
                Template = $@"{GeneratedImagePrompt}",
                TemplateFormat = "semantic-kernel",
                ExecutionSettings = new Dictionary<string, PromptExecutionSettings>()
                {
                    {
                        "default",
                        new PromptExecutionSettings()
                        {
                            ExtensionData = new Dictionary<string, object>()
                            {
                                { "temperature", 0.7 }
                            }
                        }
                    }
                }
            };
        }
    }
}
