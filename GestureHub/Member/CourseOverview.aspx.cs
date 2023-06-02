using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Member
{
    public partial class CourseOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            //if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            //{
            //    //redirect to login page
            //    Response.Redirect("~/Login.aspx");
            //}
            //get course id
            string courseId = Request.QueryString["courseId"] ?? "1";
            //get course data
            DataTable course = CourseC.GetCourseData(courseId);
            if (course.Rows.Count > 0)
            {
                //set CourseLabel
                CourseTitleLabel.Text = course.Rows[0]["title"].ToString();
                //set CourseDescriptionLabel
                CourseDescriptionLabel.Text = course.Rows[0]["description"].ToString();
            }
            //display vocab list
            VocabularyPanel.Controls.Add(CourseC.DisplayCourseVocab(courseId));
        }

        protected void QuizButton_Click(object sender, EventArgs e)
        {
            //redirect to quiz page
            Response.Redirect("~/Member/QuizPage.aspx?courseId=" + Request.QueryString["courseId"]);
        }
    }
}