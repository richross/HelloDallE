internal class ImageMetadataState
{
    public Dictionary<string, string> Metadata { get; set; }
    public event Action OnMetadataChanged;

    public ImageMetadataState()
    {
        Metadata = new Dictionary<string, string>();
    }

    //create or update the value of the rpovided key
    public void AddOrUpdateMetadata(string key, string value)
    {
        string urlEncodedKey = System.Net.WebUtility.UrlEncode(key);
        string urlEncodedValue = System.Net.WebUtility.UrlEncode(value);

        if (Metadata.ContainsKey(urlEncodedKey))
        {
            Metadata[urlEncodedKey] = urlEncodedValue;
        }
        else
        {
            Metadata.Add(urlEncodedKey, urlEncodedValue);
        }

        OnMetadataChanged?.Invoke();
    }
}

public static class ImageMetadataValues
{
    public static string LLMQuestions { get; set; } = "LLM_Questions";
    public static string ResponsesCsv { get; set; } = "ResponsesCsv";
    public static string ImagePrompt { get; set; } = "ImagePrompt";
}