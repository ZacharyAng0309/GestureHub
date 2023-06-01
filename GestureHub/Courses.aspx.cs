﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get panel of easy courses
            Panel easyCoursePanel = CourseC.DisplayCoursesByDifficulty("easy", "");
            //insert the panel
            EasyCoursePanelHolder.Controls.Add(easyCoursePanel);
            //get panel of intermediate courses
            Panel intermediateCoursePanel = CourseC.DisplayCoursesByDifficulty("intermediate", "");
            //insert the panel
            IntermediateCoursePanelHolder.Controls.Add(intermediateCoursePanel);
            //get panel of hard courses
            Panel hardCoursePanel = CourseC.DisplayCoursesByDifficulty("difficult", "");
            //insert the panel
            HardCoursePanelHolder.Controls.Add(hardCoursePanel);
        }
    }
}