using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace GestureHub
{
    public partial class AdminEditQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            //if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            //{
            //    //redirect to login page
            //    Response.Redirect("~/Login.aspx");
            //}
            if (!IsPostBack)
            {
                //get quiz id from query string
                string quizId = Request.QueryString["quizId"] ?? "1";
                // get quiz id list from database
                List<string> quizIdList = QuizC.GetQuizIdList();
                //loop through the quiz id list and add each quiz id to the dropdownlist
                foreach (string quizIds in quizIdList)
                {
                    IdField.Items.Add(quizIds);
                }
                updateInputFields(quizId);
            }
        }

        protected void updateInputFields(string quizId)
        {
            //get quiz from database
            DataTable quizTable = QuizC.GetQuizData(quizId);
            //get quiz
            DataRow quiz = quizTable.Rows[0];
            if (quiz != null)
            {
                //set quiz id to the idField
                IdField.Text = quizId;
                courseIdField.Text = quiz["course_id"].ToString();
                titleField.Text = quiz["title"].ToString();
                descriptionField.Text = quiz["description"].ToString();
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            //get the value from the input fields
            string quizId = IdField.SelectedValue;
            string title = titleField.Text;
            string description = descriptionField.Text;
            //update quiz in database
            QuizC.UpdateQuiz(quizId, title, description);
            //set the success message
            //display the message panel with success message
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Quiz " + quizId + " updated successfully!";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }

        protected void IdField_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get sender selected value
            var quizId = ((DropDownList)sender).SelectedItem;
            //update input fields
            updateInputFields(quizId.ToString());
        }
    }
}