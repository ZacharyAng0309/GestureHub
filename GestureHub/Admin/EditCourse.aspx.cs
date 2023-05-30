﻿using System;
using System.Collections.Generic;
using System.Data;
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
            if (!IsPostBack) {
                //get course_id from query string
                string course_id = Request.QueryString["course_id"] ?? "1";
                //get course id list
                List<String> courseIdList = CourseC.GetCourseIdList();
                //insert the course id list into the dropdownlist
                foreach (string courseIds in courseIdList)
                {
                    idField.Items.Add(courseIds);
                }
                updateInputFields(course_id);
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            //get the values from the input fields
            string course_id = idField.Text;
            string title = titleField.Text;
            string description = descriptionField.Text;
            string difficulty = difficultyField.SelectedValue;
            //update course in database
            CourseC.UpdateCourse(course_id, title, description, difficulty);
            //display the message panel with success message
            MsgPanel.Visible = true;
            //add boostrap class to the message panel
            MsgPanel.CssClass = "alert alert-success";
            //set the message panel text
            MsgLabel.Text = "Course updated successfully.";
            return;
        }

        protected void idField_SelectedIndexChanged(object sender, EventArgs e) {
            var courseId = ((DropDownList)sender).SelectedItem;
            updateInputFields(courseId.ToString());
        }
        protected void updateInputFields(String courseId)
        {
            //get course from database
            DataRow course = CourseC.GetCourseData(int.Parse(courseId));
            if (course != null)
            {
                //set course_id to the idField
                idField.Text = course["course_id"].ToString();
                titleField.Text = course["title"].ToString();
                descriptionField.Text = course["description"].ToString();
                //set the dropdownlist to the course's difficulty
                difficultyField.SelectedValue = course["difficulty"].ToString();
                createdAtField.Text = course["created_at"].ToString();
                updatedAtField.Text = course["updated_at"].ToString();
            }

        }   
    }
}