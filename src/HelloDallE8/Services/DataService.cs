using HelloDallE8.Models;

namespace HelloDallE8.Services
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
                    QuestionCategory = "Emotion",
                    QuestionText = "How are you feeling today?", 
                    Answers = new List<Answer>()
                    {
                        new Answer() { AnswerText = "Happy" },
                        new Answer() { AnswerText = "Cautious"},
                        new Answer() { AnswerText = "Optimistic"}
                    }

                },
                new QuestionViewModel()
                {
                    QuestionCategory = "Color",
                    QuestionText = "Choose a color for inclusion in the image?",
                    Answers = new List<Answer>()
                    {
                        new Answer() { AnswerText = "Blue"},
                        new Answer() { AnswerText = "Red"},
                        new Answer() { AnswerText = "Green"}
                    }
                }
            };
        }
    }
}
