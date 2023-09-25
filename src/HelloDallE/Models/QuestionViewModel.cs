namespace HelloDallE.Models
{
    public class QuestionViewModel
    {
        public string QuestionName { get; set; }
        public string QuestionText { get; set; }
        public List<Answer> Answers { get; set; }
        public string QuestionPrompt { get; set; }
    }

    public class Answer
    {
        public string AnswerText { get; set; }
        public string AnswerValue { get; set; }

    }
}