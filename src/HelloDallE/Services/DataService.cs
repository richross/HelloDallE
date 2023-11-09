using Azure;
using Azure.Data.Tables;
using Azure.Data.Tables.Models;
using HelloDallE.Models;

namespace HelloDallE.Services
{
    public interface IDataService
    {
        List<QuestionViewModel> Questions { get; set; }
    }

    public class DataService : IDataService
    {
        private readonly IConfiguration _configuration;
        private AzureStorageAccountSettings azureStorageAccountSettings;

        public List<QuestionViewModel> Questions { get; set; }

        public DataService(IConfiguration configuration)
        {
            #region old code waiting to be deleted

            //Questions = new List<QuestionViewModel>()
            //{
            //    new QuestionViewModel()
            //    {
            //        QuestionName = "Mood",
            //        QuestionText = "How is your mood today?",
            //        Answers = new List<Answer>()
            //        {
            //            new Answer() { AnswerText = "Happy", AnswerValue = "happy"},
            //            new Answer() { AnswerText = "Cautious", AnswerValue = "cautious"},
            //            new Answer() { AnswerText = "Optimistic", AnswerValue = "optimistic"}
            //        },
            //        QuestionPrompt = "The image should evoke a mood of {value}. "

            //    },
            //    new QuestionViewModel()
            //    {
            //        QuestionName = "Color",
            //        QuestionText = "Choose a color for inclusion in the image?",
            //        Answers = new List<Answer>()
            //        {
            //            new Answer() { AnswerText = "Blue", AnswerValue = "Blue"},
            //            new Answer() { AnswerText = "Red", AnswerValue = "Red"},
            //            new Answer() { AnswerText = "Green", AnswerValue = "Green"}
            //        },
            //        QuestionPrompt = "The image should be based on the primary color of {value}. "
            //    }
            //};
            #endregion

            Questions = new List<QuestionViewModel>();
            azureStorageAccountSettings = new AzureStorageAccountSettings();

            _configuration = configuration;
            _configuration.GetSection("AzureStorageAccountSettings").Bind(azureStorageAccountSettings);

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
                            question.Answers.Add(new Answer() { 
                                AnswerText = AnswerTextCollection.ElementAt(i), 
                                AnswerValue = AnswerValueCollection.ElementAt(i)
                            });

                        }
                        
                        Questions.Add(question);
                    }

                }
                catch (Exception ex)
                {

                    throw;
                }
            }
        }
    }
}
