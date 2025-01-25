using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.TextToImage;
using System.Net.Http;

namespace HelloDallE8.Services
{
    public class SemanticKernelTextToImageService
    {
        private Kernel kernel;

        private PromptTemplateConfig promptTemplateConfig { get; set; }
        private HttpClient httpClient;

        public SemanticKernelTextToImageService(IAzureOpenAISettings aoaiSettings)
        {
            httpClient = new HttpClient();
            httpClient.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", aoaiSettings.OcpApimSubscriptionKey);

            #pragma warning disable SKEXP0010 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.

            kernel = Kernel.CreateBuilder()
                .AddAzureOpenAITextToImage(aoaiSettings.DalleServiceDeploymentName, aoaiSettings.AoaiEndPoint,aoaiSettings.ApiKey,null,null, aoaiSettings.DalleApiVersion, httpClient)
                .Build();

            #pragma warning restore SKEXP0010 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.

            promptTemplateConfig = new PromptTemplateConfig(); // Initialize the property to avoid CS8618
        }

        public SemanticKernelTextToImageService(IAzureOpenAISettings aoaiSettings, PromptTemplateConfig _promptTemplateConfig)
            : this(aoaiSettings)
        {
            promptTemplateConfig = _promptTemplateConfig;
            kernel.CreateFunctionFromPrompt(promptTemplateConfig);
        }

        public async Task<string> InvokePromptAsync()
        {
            string result = string.Empty;
            try
            {
#pragma warning disable SKEXP0001 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.

                ITextToImageService dallE = kernel.GetRequiredService<ITextToImageService>();
                var image = await dallE.GenerateImageAsync(promptTemplateConfig.Template, 1024, 1024);

#pragma warning restore SKEXP0001 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.

                result = image;
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }

            return result;
        }
    }
}
