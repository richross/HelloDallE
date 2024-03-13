using HelloDallE8.Services;
using Microsoft.AspNetCore.DataProtection.KeyManagement;
using System.Diagnostics;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;

namespace HelloDallE8.Models
{
    public interface IDallEComms
    {
        string ImageUrl { get; set; }
        string PromptText { get; set; }
        string ResourceName { get; set; }
        string LastContentUrl { get; set; }
        string ApiKey { get; set; }

        Task RequestImage();
        void ResponseImage();
    }

    public class DallEComms : IDallEComms
    {
        public string PromptText { get; set; }  
        public string ImageUrl { get; set; }
        public string ResourceName { get; set; }
        public string LastContentUrl { get; set; }
        public string ApiKey { get; set; }

        private IConfiguration configs;

        public DallEComms(IConfiguration _configs)
        {
            configs = _configs;
            ResourceName = configs["AzureOpenAI:ResourceName"];
            ApiKey = configs["AzureOpenAI:ApiKey"];
        }

        public async Task RequestImage()
        {
            //TODO: modify if we want to return more than 1 image for the request (user option).
            DallERequest content = new DallERequest(PromptText, 1, "1024x1024");
            var jsonContent = JsonSerializer.Serialize(content);
            HttpContent httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");

            using (HttpClient client = new HttpClient())
            {
                var response = await CallDalleEndpoint(httpContent, client);
                response.EnsureSuccessStatusCode();
                string operationLocation = response.Headers.GetValues("Operation-Location").First();
                DallEResponse? output = JsonSerializer.Deserialize<DallEResponse>(response.Content.ReadAsStringAsync().Result);
                if (output != null)
                {
                    var id = output.id;
                    var status = output.status;
                    string contentUrl = await PollForDalleImage(operationLocation, client);

                    // Set image src to contentUrl //TODO: where to place these properties.
                    LastContentUrl = contentUrl;
                    //ViewData["imageGuess"] = contentUrl
                    return;
                } 
            }
        }

        // Call Azure OpenAI endpoint
        // Reference: https://learn.microsoft.com/en-us/azure/cognitive-services/openai/reference
        private async Task<HttpResponseMessage> CallDalleEndpoint(HttpContent content, HttpClient client)
        {
            string baseUrl = "https://" + ResourceName + ".openai.azure.com";   // TODO: error/injection checking
            string url = baseUrl + "/dalle/text-to-image?api-version=2022-08-03-preview";

            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("api-key", ApiKey);

            var response = await client.PostAsync(url, content);
            return response;
        }

        private async Task<string> PollForDalleImage(string operationLocation, HttpClient client)
        {
            var response2 = await client.GetAsync(operationLocation);
            //Debug.WriteLine(response2.ToString());
            response2.EnsureSuccessStatusCode();
            DallEImageResponse? output2 = JsonSerializer.Deserialize<DallEImageResponse>(response2.Content.ReadAsStringAsync().Result);
            while (output2 != null && output2.status != "Succeeded")
            {
                // Handle the case if the request fails (such as due to RAI reasons/content filter)
                if (output2.status == "Failed")
                {
                    Debug.WriteLine(output2.error.code);
                    Debug.WriteLine(output2.error.message);

                    string contentUrl;
                    if (output2.error.code == "ContentFilter")
                    {
                        contentUrl = "img/ContentFilter.png";
                    }
                    else
                    {
                        contentUrl = "img/Error.png";
                    }
                    return contentUrl;
                }

                // Otherwise, wait and try again as the image may not have processed yet.
                Thread.Sleep(500);  // wait for 0.5 second
                response2 = await client.GetAsync(operationLocation);
                response2.EnsureSuccessStatusCode();
                output2 = JsonSerializer.Deserialize<DallEImageResponse>(response2.Content.ReadAsStringAsync().Result);
            }

            // Unpack the output.  
            if (output2 != null && output2.result != null)
            {
                var caption = output2.result.caption;
                var contentUrl = output2.result.contentUrl;
                var contentUrlExpiresAt = output2.result.contentUrlExpiresAt;
                var createdDateTime = output2.result.createdDateTime;

                // Use clear gif instead of empty link if no image.  
                if (contentUrl == "")
                {
                    contentUrl = "img/clear.png";
                }

                return contentUrl;
            }

            // This shouldn't happen on successful path.  
            return "img/clear.png";
        }

        public void ResponseImage()
        {
            //populate the ImageUrl with the url to the created image in storage account
            //ImageUrl also needs to include the SAS token for authorization purposes.

        }
    }
}
