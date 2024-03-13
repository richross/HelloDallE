namespace HelloDallE8.Services
{
    public class DallERequest
    {
        public DallERequest(string caption, int numberOfImages, string resolution)
        {
            this.caption = caption;
            this.resolution = resolution;
            this.numberOfImages = numberOfImages;
        }

        public string caption { get; set; } = "";

        // Supported values are “256x256”, “512x512”, “1024x1024”
        public string resolution { get; set; } = "1024x1024";

        public int numberOfImages { get; set; } = 0;
    }
}
