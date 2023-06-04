using System;

namespace GestureHub.Admin
{
    public partial class DeleteCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            //delete course from table
            CourseC.DeleteCourse(Request.QueryString["courseId"]);
        }
    }
}