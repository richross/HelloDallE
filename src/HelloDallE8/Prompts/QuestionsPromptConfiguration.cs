using Microsoft.SemanticKernel;

namespace HelloDallE8.Prompts
{
    public class QuestionsPromptConfiguration
    {
        public PromptTemplateConfig promptTemplateConfig { get; set; }

        public QuestionsPromptConfiguration()
        {
            promptTemplateConfig = new PromptTemplateConfig()
            {
                Name = "QuestionFunction",
                Description = "Generate a JSON object that represents a collection of questions and answers that will be used to describe an image the user wants to create with the DallE service.",
                Template = @$"Generate a JSON object that represents a collection of questions and answers that will be used to describe an image the user wants to create with the DallE service. The collection should contain at least 5 questions. Each question should have 4-5 choices and each choice is 1 or 2 words. Do not include questions that ask about image size.
Do not output the questions as a numbered list. Only respond with a JSON object. All responses will be in the following JSON format:[{{""QuestionCategory"": ""Color"",""QuestionText"": ""What is your favorite color?"",""Answers"": [{{""AnswerText"":""Red""}},{{""AnswerText"":""Blue""}},{{""AnswerText"":""Green""}},{{""AnswerText"":""Yellow""}},{{""AnswerText"":""Azure""}}]}}]
Questions:",
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
