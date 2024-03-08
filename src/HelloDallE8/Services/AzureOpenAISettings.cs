namespace HelloDallE8.Services
{
    public interface IAzureOpenAISettings
    {
        string ApiKey { get; set; }
        string DeploymentName { get; set; }
        string AoaiEndPoint { get; set; }
    }

    public class AzureOpenAISettings : IAzureOpenAISettings
    {
        //AOAI resource for prompting for the DallE Images
        public string DeploymentName { get; set; }
        //secure ApiKey for accessing the AOAI
        public string ApiKey { get; set; }
        //Endpoint for the AOAI
        public string AoaiEndPoint { get; set; }

        public AzureOpenAISettings(IConfiguration config)
        {
            DeploymentName = config["AzureOpenAISettings:DeploymentName"];
            ApiKey = config["AzureOpenAISettings:ApiKey"];
            AoaiEndPoint = config["AzureOpenAISettings:AoaiEndPoint"];
        }

    }
}
