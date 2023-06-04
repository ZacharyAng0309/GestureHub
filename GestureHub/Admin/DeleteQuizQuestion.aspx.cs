using System;

namespace GestureHub.Admin
{
    public partial class DeleteQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get quizQuestionOption
            string quizQuestionOption = Request.QueryString["quizQuestionOption"];
            //delete quizQuestionOption
            QuestionC.DeleteQuestionOption(quizQuestionOption);
        }
    }
}