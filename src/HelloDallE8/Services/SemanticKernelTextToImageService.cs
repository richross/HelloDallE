using Microsoft.SemanticKernel;
using Microsoft.SemanticKernel.TextToImage;

namespace HelloDallE8.Services
{
    public class SemanticKernelTextToImageService
    {
        private Kernel kernel;

        private string Prompt { get; set; } = string.Empty;

        public SemanticKernelTextToImageService(IAzureOpenAISettings aoaiSettings)
        {
        #pragma warning disable SKEXP0012 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.
            kernel = Kernel.CreateBuilder()
                .AddAzureOpenAITextToImage(aoaiSettings.DalleServiceDeploymentName, aoaiSettings.AoaiEndPoint, aoaiSettings.ApiKey)
                .AddAzureOpenAITextGeneration(aoaiSettings.DeploymentName, aoaiSettings.AoaiEndPoint, aoaiSettings.ApiKey)
                .Build();
        #pragma warning restore SKEXP0012 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.
        }
        
        public void SK_PromptCreation(string ImagePrompt)
        {
            Prompt = @$"{ImagePrompt}";
        }

        public async Task<string> InvokePromptAsync()
        {
            string result = string.Empty;
            try
            {
            #pragma warning disable SKEXP0002 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.
                ITextToImageService dallE = kernel.GetRequiredService<ITextToImageService>();
                var image = await dallE.GenerateImageAsync(Prompt, 1024, 1024);
            #pragma warning restore SKEXP0002 // Type is for evaluation purposes only and is subject to change or removal in future updates. Suppress this diagnostic to proceed.
                
                var funcResult = await kernel.InvokePromptAsync(Prompt);

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
