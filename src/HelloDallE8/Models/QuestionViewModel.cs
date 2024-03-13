namespace HelloDallE8.Models
{
    public class QuestionViewModel
    {
        public string QuestionCategory { get; set; }
        public string QuestionText { get; set; }
        public List<Answer> Answers { get; set; }
    }

    public class Answer
    {
        public string AnswerText { get; set; }

        public bool IsActive { get; set; } = false;
    }
}