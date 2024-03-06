namespace HelloDallE8.Services
{
    public class ResponseState
    {
        public Dictionary<string, string> Responses { get; set; }
        public event Action OnResponseChanged;

        public ResponseState()
        {
            Responses = new Dictionary<string, string>();
        }

        //create a method to add or update a response
        public void AddOrUpdateResponse(string questionName, string response)
        {
            if (Responses.ContainsKey(questionName))
            {
                Responses[questionName] = response;
            }
            else
            {
                Responses.Add(questionName, response);
            }

            OnResponseChanged?.Invoke();
        }
    }
}
