using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            if (questionId != null)
            {
                SqlDataSource1.SelectParameters["questionId"].DefaultValue = questionId;
                DataTable quizData = QuizC.GetQuizData(questionId);
                if (quizData != null)
                {
                    DataRow quiz = quizData.Rows[0];
                }
                //set question id to QuestionIdField
                QuestionIdField.Text = questionId;
                //set quizId to QuizIdField
                QuizIdField.Text = quizData.Rows[0]["quiz_id"].ToString();
                //set question to QuestionField
                QuestionField.Text = quizData.Rows[0]["question"].ToString();

            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //get the values of the input fields
            string questionId = QuestionIdField.Text;
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