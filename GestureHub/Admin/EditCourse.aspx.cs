using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub
{
    public partial class AdminEditCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get course_id from query string
            string course_id = Request.QueryString["course_id"];
            //get course data from database
            if (course_id != null)
            {
                var courseData = CourseC.GetCourseData(Convert.ToInt32(course_id));
                //set the textboxes to the course data
                titleField.Text = courseData['title'];
            }
        }
    }
}