namespace HelloDallE8.Services
{
    public interface IAzureOpenAISettings
    {
        string ApiKey { get; set; }
        string DeploymentName { get; set; }
        string AoaiEndPoint { get; set; }
        string DalleServiceDeploymentName { get; set; }
        string OcpApimSubscriptionKey { get; set; }
        string ApiVersion { get; set; }
        string DalleApiVersion { get; set; }
    }

    public class AzureOpenAISettings : IAzureOpenAISettings
    {
        //AOAI resource for prompting for the DallE Images
        public string DeploymentName { get; set; }
        //secure ApiKey for accessing the AOAI
        public string ApiKey { get; set; }
        //ocpSubscriptionKey for accessing the AOAI
        public string OcpApimSubscriptionKey { get; set; }
        //Endpoint for the AOAI
        public string AoaiEndPoint { get; set; }
        public string DalleServiceDeploymentName { get; set; }
        public string ApiVersion { get; set; }
        public string DalleApiVersion { get; set; }

        public AzureOpenAISettings(IConfiguration config)
        {
            DeploymentName = config["AzureOpenAISettings:TextCompleteionDeploymentName"];
            ApiKey = config["AzureOpenAISettings:ApiKey"];
            OcpApimSubscriptionKey = config["AzureOpenAISettings:OcpApimSubscriptionKey"];
            AoaiEndPoint = config["AzureOpenAISettings:AoaiEndPoint"];
            DalleServiceDeploymentName = config["AzureOpenAISettings:DalleServiceDeploymentName"];
            ApiVersion = config["AzureOpenAISettings:ApiVersion"];
            DalleApiVersion = config["AzureOpenAISettings:DalleApiVersion"];
        }

    }
}
