using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.SemanticKernel;
using static System.Net.WebRequestMethods;

namespace HelloDallE8.Services
{
    public class SemanticKernelTextCompletionService
    {
        private Kernel kernel;

        private string Prompt { get; set; } = string.Empty;

        public SemanticKernelTextCompletionService(IAzureOpenAISettings aoaiSettings)
        {
            kernel = Kernel.CreateBuilder()
                .AddAzureOpenAITextGeneration(aoaiSettings.DeploymentName, aoaiSettings.AoaiEndPoint, aoaiSettings.ApiKey)
                .Build();
            
        }

        public async Task<string> InvokePromptAsync()
        {
            string result = string.Empty;
            try
            {
                var funcResult = await kernel.InvokePromptAsync(Prompt);

                result = funcResult.GetValue<string>();
                
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }

            return result;
        }

        public void SK_PromptCreation(string usersAnswersCsv)
        {
            Prompt = @$"Instructions: Generate a text prompt that will be passed to DallE to generate an image using that description. 
            The prompt should be based on these descriptors of an image {usersAnswersCsv}.
            TextPrompt:";     
        }
    }
}
