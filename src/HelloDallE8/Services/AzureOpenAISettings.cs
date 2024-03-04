namespace HelloDallE8.Services
{
    public interface IAzureOpenAISettings
    {
        string ApiKey { get; set; }
        string ResourceName { get; set; }
    }

    public class AzureOpenAISettings : IAzureOpenAISettings
    {
        //AOAI resource for prompting for the DallE Images
        public string ResourceName { get; set; }
        //secure ApiKey for accessing the AOAI
        public string ApiKey { get; set; }

    }
}
