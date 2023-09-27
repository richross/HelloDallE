using HelloDallE.Models;

namespace HelloDallE.Services
{
    public interface IDataService
    {
        List<QuestionViewModel> Questions { get; set; }
    }

    public class DataService : IDataService
    {
        public List<QuestionViewModel> Questions { get; set; }

        public DataService()
        {
            Questions = new List<QuestionViewModel>()
            {
                new QuestionViewModel()
                {
                    QuestionName = "Mood",
                    QuestionText = "How is your mood today?",
                    Answers = new List<Answer>()
                    {
                        new Answer() { AnswerText = "Happy", AnswerValue = "happy"},
                        new Answer() { AnswerText = "Cautious", AnswerValue = "cautious"},
                        new Answer() { AnswerText = "Optimistic", AnswerValue = "optimistic"}
                    },
                    QuestionPrompt = "The image should evoke a mood of {value}. "

                },
                new QuestionViewModel()
                {
                    QuestionName = "Color",
                    QuestionText = "Choose a color for inclusion in the image?",
                    Answers = new List<Answer>()
                    {
                        new Answer() { AnswerText = "Blue", AnswerValue = "Blue"},
                        new Answer() { AnswerText = "Red", AnswerValue = "Red"},
                        new Answer() { AnswerText = "Green", AnswerValue = "Green"}
                    },
                    QuestionPrompt = "The image should be based on the primary color of {value}. "
                }
            };
        }
    }
}
