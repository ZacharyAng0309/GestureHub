using System;

namespace GestureHub.Admin
{
    public partial class DeleteQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            //get quizQuestion
            string quizQuestion = Request.QueryString["quizQuestion"];
            //delete quizQuestionOption
            QuestionC.DeleteQuestion(quizQuestion);
            //redirect back to manage quiz page
            Response.Redirect("~/Admin/ManageQuiz.aspx");
        }
    }
}