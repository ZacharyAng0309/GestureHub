﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Member
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is logged in
            if (Session["userId"] == null)
            {
                //redirect to login page
                Response.Redirect("/Login.aspx");
            }
            //get user role from session
            string userRole = Session["userRole"].ToString();
            //get panel of easy courses
            Panel easyCoursePanel = CourseC.DisplayCoursesByDifficulty("easy",userRole);
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