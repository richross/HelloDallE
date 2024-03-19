
namespace HelloDallE8.Services
{
    public interface IAzureBlobStorageSettings
    {
        string BlobStorageConnectionString { get; set; }
        string ContainerName { get; set; }
    }

    public class AzureBlobStorageSettings : IAzureBlobStorageSettings
    {

        public string BlobStorageConnectionString { get; set; }
        public string ContainerName { get; set; }
        public AzureBlobStorageSettings(ConfigurationManager configuration)
        {
            BlobStorageConnectionString = configuration["AzureBlobStorageSettings:BlobStorageConnectionString"];
            ContainerName = configuration["AzureBlobStorageSettings:ContainerName"];
        }

    }
}
