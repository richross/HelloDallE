using Azure;
using Azure.Data.Tables;
using Azure.Data.Tables.Models;
using HelloDallE.Models;

namespace HelloDallE.Services
{
    /// <summary>
    /// Interface for DataService.
    /// </summary>
    public interface IDataService
    {
        List<QuestionViewModel> Questions { get; set; }

        void GetQuestions();
    }

    /// <summary>
    /// Service class for storing and retrieving questions from Azure Table Storage.
    /// </summary>
    public class DataService : IDataService
    {
        private readonly IConfiguration _configuration;
        private AzureStorageAccountSettings azureStorageAccountSettings;

        /// <summary>
        /// List of questions.
        /// </summary>
        public List<QuestionViewModel> Questions { get; set; }

        /// <summary>
        /// Constructor for DataService class.
        /// </summary>
        /// <param name="configuration">The IConfiguration instance for the application.</param>
        public DataService(IConfiguration configuration)
        {
            Questions = new List<QuestionViewModel>();
            azureStorageAccountSettings = new AzureStorageAccountSettings();

            _configuration = configuration;
            _configuration.GetSection("AzureStorageAccountSettings").Bind(azureStorageAccountSettings);
        }

        public void GetQuestions()
        {
            if (azureStorageAccountSettings != null)
            {
                TableSharedKeyCredential creds = new TableSharedKeyCredential(
                    azureStorageAccountSettings.storageAccountName,
                    azureStorageAccountSettings.storageAccountKey);

                try
                {
                    TableServiceClient serviceClient = new TableServiceClient(
                        new Uri(azureStorageAccountSettings.storageAccountUri), creds);

                    Pageable<TableItem> tables = serviceClient.Query();

                    foreach (var table in tables)
                    {
                        var thistable = table.Name.ToString();
                    }

                    TableClient tableClient = new TableClient(
                        new Uri(azureStorageAccountSettings.storageAccountTableUri), "questions", creds);

                    Pageable<TableEntity> queryResults = tableClient.Query<TableEntity>();
                    queryResults.Count();

                    //iterate through the TableEntity objects and create QuestionViewModel objects
                    Questions = new List<QuestionViewModel>();
                    foreach (TableEntity entity in queryResults)
                    {
                        QuestionViewModel question = new QuestionViewModel();
                        question.QuestionName = entity.RowKey;
                        question.QuestionText = entity.GetString("questionText");
                        question.QuestionPrompt = entity.GetString("questionPrompt");
                        var AnswerTextCollection = entity.GetString("answerText").Split(";").AsEnumerable();
                        var AnswerValueCollection = entity.GetString("answerValue").Split(";").AsEnumerable();
                        question.Answers = new List<Answer>();
                        for (int i = 0; i < AnswerTextCollection.Count(); i++)
                        {
                            question.Answers.Add(new Answer()
                            {
                                AnswerText = AnswerTextCollection.ElementAt(i),
                                AnswerValue = AnswerValueCollection.ElementAt(i)
                            });

                        }

                        Questions.Add(question);
                    }

                }
                catch (Exception ex)
                { 

                }
            }
        }
    }
}
