using System;
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
            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack) {
                //get course_id from query string
                string course_id = Request.QueryString["courseId"] ?? "1";
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
            MsgLabel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Course '" + course_id + "' has been updated.";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
            return;
        }

        protected void IdField_SelectedIndexChanged(object sender, EventArgs e) {
            var courseId = ((DropDownList)sender).SelectedItem;
            updateInputFields(courseId.ToString());
        }
        protected void updateInputFields(String courseId)
        {
            //get course from database
            DataTable courseTable = CourseC.GetCourseData(courseId);
            DataRow course = courseTable.Rows[0];
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