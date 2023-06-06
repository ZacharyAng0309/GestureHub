using System;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class ManageCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                Response.Redirect("/Login.aspx");
            }
            //get user role if session is not null
            string userRole = Session["userRole"] == null ? "admin" : Session["userRole"].ToString();
            //get panel of easy courses
            Panel easyCoursePanel = CourseC.DisplayCoursesByDifficulty("easy", userRole);
            //insert the panel
            EasyCoursePanelHolder.Controls.Add(easyCoursePanel);
            //get panel of intermediate courses
            Panel intermediateCoursePanel = CourseC.DisplayCoursesByDifficulty("intermediate", userRole);
            //insert the panel
            IntermediateCoursePanelHolder.Controls.Add(intermediateCoursePanel);
            //get panel of hard courses
            Panel hardCoursePanel = CourseC.DisplayCoursesByDifficulty("difficult", userRole);
            //insert the panel
            HardCoursePanelHolder.Controls.Add(hardCoursePanel);
        }
    }
}