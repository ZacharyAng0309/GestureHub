using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class DeleteCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //delete course from table
            CourseC.DeleteCourse(Request.QueryString["courseId"]);
        }
    }
}