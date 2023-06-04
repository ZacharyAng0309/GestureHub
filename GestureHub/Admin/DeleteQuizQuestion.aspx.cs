using System;

namespace GestureHub.Admin
{
    public partial class DeleteQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get quizQuestionOption
            string quizQuestion = Request.QueryString["quizQuestion"];
            //delete quizQuestionOption
            QuestionC.DeleteQuestion(quizQuestion);
        }
    }
}