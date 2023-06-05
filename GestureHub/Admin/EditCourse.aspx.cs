using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using System.Windows.Forms;

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
            if (!IsPostBack)
            {
                //get course_id from query string
                string course_id = Request.QueryString["courseId"] ?? "1";
                //get course id list
                List<string> courseIdList = CourseC.GetCourseIdList();
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
            string courseId = idField.Text;
            //get course data from database
            DataTable courseTable = CourseC.GetCourseData(courseId);
            DataRow course = courseTable.Rows[0];
            string title = titleField.Text;
            string description = descriptionField.Text;
            string difficulty = difficultyField.SelectedValue;
            //check if image is uploaded
            string imageUrl;
            if (ImageUpload.HasFile)
            {
                // Get the uploaded file
                HttpPostedFile file = ImageUpload.PostedFile;
                //validate file type
                if (file.ContentType != "image/jpeg" && file.ContentType != "image/png")
                {
                    DisplayAlert("Only JPEG and PNG files are accepted!");
                    return;
                }
                ////validate file size
                //if (file.ContentLength > 409600)
                //{
                //    DisplayAlert("File size cannot exceed 400KB!");
                //    return;
                //}
                //set file name to user id with extension
                imageUrl = "course-" + courseId + Path.GetExtension(file.FileName);
                //save file to server
                file.SaveAs(Server.MapPath("~/Images/" + imageUrl));
            }
            else
            {
                //set the imageUrl to the current image
                imageUrl = course["image"].ToString();
            }
            //set the image url to the image field
            CoursePicture.ImageUrl = "/Images/" + imageUrl;
            //update course in database
            CourseC.UpdateCourse(courseId, title, description, difficulty, imageUrl);
            //display the message panel with success message
            MsgLabel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Course '" + courseId + "' has been updated.";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
            return;
        }
        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }

        protected void IdField_SelectedIndexChanged(object sender, EventArgs e)
        {
            var courseId = ((DropDownList)sender).SelectedItem;
            updateInputFields(courseId.ToString());
        }

        protected void updateInputFields(string courseId)
        {
            //get course from database
            DataTable courseTable = CourseC.GetCourseData(courseId);
            DataRow course = courseTable.Rows[0];
            if (course != null)
            {
                //set course_id to the idField
                idField.Text = course["course_id"].ToString();
                //set image src for CoursePicture
                CoursePicture.ImageUrl = "/Images/" + course["image"];
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