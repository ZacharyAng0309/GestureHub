using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //get userid from session
            string userId = Session["userId"].ToString();

            //get user data from database
            DataRow user = UserC.GetUserData(userId);

            //set input fields
            AdminName.Text = user["username"].ToString();



            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            //get number of admins
            int adminCount = UserC.GetUserCountByRole("admin");
            //insert the value of adminCount to the hidden field
            AdminNumberField.Value = adminCount.ToString();
            //get number of member
            int memberCount = UserC.GetUserCountByRole("member");
            //insert the value of memberCount to the hidden field
            MemberNumberField.Value = memberCount.ToString();
            //get number of male user
            int maleUserCount = UserC.GetUserCountByGender("Male");
            //insert the value of maleUserCount to the hidden field
            MaleNumberField.Value = maleUserCount.ToString();
            //get number of female user
            int femaleUserCount = UserC.GetUserCountByGender("Female");
            //insert the value of femaleUserCount to the hidden field
            FemaleNumberField.Value = femaleUserCount.ToString();
            //get the count of courses by difficulty
            int easyCourseCount = CourseC.GetCourseIdByDifficulty("easy").Count;
            //insert the value of easyCourseCount to the hidden field
            EasyCourseNumberField.Value = easyCourseCount.ToString();
            //get the count of courses by difficulty
            int intermediateCourseCount = CourseC.GetCourseIdByDifficulty("intermediate").Count;
            //insert the value of intermediateCourseCount to the hidden field
            IntermediateCourseNumberField.Value = intermediateCourseCount.ToString();
            //get the count of courses by difficulty
            int hardCourseCount = CourseC.GetCourseIdByDifficulty("difficult").Count;
            //insert the value of hardCourseCount to the hidden field
            HardCourseNumberField.Value = hardCourseCount.ToString();
        }
    }
}