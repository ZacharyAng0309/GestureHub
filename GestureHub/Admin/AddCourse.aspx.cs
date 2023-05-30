﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub
{
    public partial class AdminAddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            String newCourseId = CourseC.GetNextCourseId().ToString();
            //AddNewCourse
            CourseC.AddNewCourse(title, description,difficulty);
            QuizC.addNewQuiz(newCourseId,title,description);
        }
    }
}