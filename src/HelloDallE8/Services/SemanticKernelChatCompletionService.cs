using Microsoft.AspNetCore.Mvc;
using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.Connectors.OpenAI;
using System.Text.Json;

namespace HelloDallE8.Services
{
    public class SemanticKernelChatCompletionService
    {
        private Kernel kernel;
        private PromptTemplateConfig promptTemplateConfig { get; set; }
        private KernelFunction kernelFunction;
        private HttpClient httpClient;

        private SemanticKernelChatCompletionService(IAzureOpenAISettings aoaiSettings)
        {
            httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", aoaiSettings.OcpApimSubscriptionKey);

            kernel = Kernel.CreateBuilder()
                .AddAzureOpenAIChatCompletion(aoaiSettings.DeploymentName, aoaiSettings.AoaiEndPoint, aoaiSettings.ApiKey, null, null, httpClient, aoaiSettings.ApiVersion)
                .Build();

            promptTemplateConfig = new PromptTemplateConfig(); // Initialize the property to avoid CS8618
        }

        public SemanticKernelChatCompletionService(IAzureOpenAISettings aoaiSettings, PromptTemplateConfig _promptTemplateConfig) 
            : this(aoaiSettings)
        {
            promptTemplateConfig = _promptTemplateConfig;
            kernelFunction = kernel.CreateFunctionFromPrompt(promptTemplateConfig);
        }

        //TODO - structure for when we also want to include prompty files instead of inline code.
        //public SemanticKernelGenerateQuestionsService(IAzureOpenAISettings aoaiSettings, PrmoptyTemplateConfig _promptyTemplateConfig) 
        //    : this(aoaiSettings)
        //{
        //    promptyTemplateConfig = _promptyTemplateConfig;
        //    kernelFunction = kernel.CreateFunctionFromPromptyFile(promptyTemplateConfig);
        //}

        public async Task<string> InvokePromptAsync()
        {
            string result = string.Empty;
            try
            {
                if (kernelFunction != null)
                {
                    var funcResult = await kernelFunction.InvokeAsync(kernel);

                    result = funcResult.GetValue<string>();
                }
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }

            return result;
        }
    }
}
