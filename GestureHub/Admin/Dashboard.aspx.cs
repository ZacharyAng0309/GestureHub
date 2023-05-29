using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace GestureHub
{
    public partial class Dashboard : UtilClass.BaseStudentPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //List<int> enrolledCourseID = null;
            //if (userType == "admin")
            //{
            //    AdminPanel.Visible = true;
            //    CourseCount.Text = CourseC.GetCourseCount().ToString();
            //    UserCount.Text = UserC.GetUserCount().ToString();
            //    MaleCount.Text = UserC.GetUserCountByGender("m").ToString();
            //    FemaleCount.Text = UserC.GetUserCountByGender("f").ToString();
            //}
            //else
            //{
            //    StudentPanel.Visible = true;
            //    int student_id = Convert.ToInt32(Session["user_id"]);
            //    enrolledCourseID = UserC.GetEnrolledCourseID(student_id);
            //    DataTable courseTable = CourseC.GetPopularCourseID();
            //    int count = Math.Min(courseTable.Rows.Count, 5);
            //    for (int i = 0; i < count; i++)
            //    {
            //        DataRow dr = courseTable.Rows[i];
            //        int course_id = Convert.ToInt32(dr["course_id"]);
            //        Panel cPanel = CourseC.DisplayCourse(course_id, userType, enrolledCourseID);
            //        StudentGridPanel.Controls.Add(cPanel);
            //    }
            //}
        }
    }
}