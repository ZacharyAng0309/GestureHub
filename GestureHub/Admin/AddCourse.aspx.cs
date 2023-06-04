using System;

namespace GestureHub
{
    public partial class AdminAddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            idField.Text = CourseC.GetNextCourseId().ToString();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            //get selected value for title
            string title = titleField.Text;
            //get selected value for description
            string description = descriptionField.Text;
            //get selected value for difficulty
            string difficulty = difficultyField.SelectedValue.ToString();

            string newCourseId = CourseC.GetNextCourseId().ToString();
            //AddNewCourse
            CourseC.AddNewCourse(title, description, difficulty);
            QuizC.addNewQuiz(newCourseId, title, description);
            //display the message panel with success message
            MsgLabel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Course '" + title + "' has been added.";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}