using System;
using System.Data;

namespace GestureHub.Admin
{
    public partial class AdminEditQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            //if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            //{
            //    //redirect to login page
            //    Response.Redirect("~/Login.aspx");
            //}
            //get the quiz id from the query string
            string questionId = Request.QueryString["questionId"];
            }
        }

        

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //get the values of the input fields
            string questionId = QuestionId.Text;
            string quizId = QuizIdField.Text;
            string question = QuestionField.Text;
            //update quiz in database
            QuizC.UpdateQuiz(questionId, quizId, question);
            //create success alert
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Question updated successfully!";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}