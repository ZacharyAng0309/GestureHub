using System;
using System.Collections.Generic;
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
            if (Session["userType"] == null || Session["userType"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            //get the quiz id from the query string
            string questionId = Request.QueryString["questionId"];
            if (questionId != null)
            {
                SqlDataSource1.SelectParameters["questionId"].DefaultValue = questionId;
                var quizData = QuizC.GetQuizData(Convert.ToInt32(questionId));

            }
        }

        protected void Insert_New_Quiz_Question()
        {
            // Get the controls from the GridView
            TextBox optionIdTextBox = GridView1.FooterRow.FindControl("OptionIDTextBox") as TextBox;
            TextBox optionTextTextBox = GridView1.FooterRow.FindControl("OptionTextTextBox") as TextBox;
            TextBox imageFilePathTextBox = GridView1.FooterRow.FindControl("ImageFilePathTextBox") as TextBox;
            CheckBox isCorrectCheckBox = GridView1.FooterRow.FindControl("IsCorrectCheckBox") as CheckBox;

            // Insert the new record into the SqlDataSource
            SqlDataSource1.InsertParameters["OptionID"].DefaultValue = optionIdTextBox.Text;
            SqlDataSource1.InsertParameters["OptionText"].DefaultValue = optionTextTextBox.Text;
            SqlDataSource1.InsertParameters["ImageFilePath"].DefaultValue = imageFilePathTextBox.Text;
            SqlDataSource1.InsertParameters["IsCorrect"].DefaultValue = isCorrectCheckBox.Checked.ToString();
            SqlDataSource1.Insert();
        }
    }
}