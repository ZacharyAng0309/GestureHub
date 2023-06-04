using GestureHub.UtilClass;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Windows.Forms;

namespace GestureHub.Admin
{
    public partial class AddVocab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //getCourseIdList
                List<String> courseIdList = CourseC.GetCourseIdList();
                //insert the courseIdList into the dropdownlist
                foreach (string courseId in courseIdList)
                {
                    CourseIdField.Items.Add(courseId);
                }
            }
        }

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }

        protected void AddVocabButton_Click(object sender, EventArgs e)
        {
            string newVocabId = VocabC.GetNewVocabId();
            string courseId = CourseIdField.SelectedValue;
            string term = TermField.Text;
            string description = DescriptionField.Text;
            string imageUrl;
            //check if image is uploaded
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
                imageUrl = "vocabulary-" + newVocabId + Path.GetExtension(file.FileName);
                //save file to server
                file.SaveAs(Server.MapPath("~/Images/" + imageUrl));
            }
            else
            {
                //set the imageUrl to the current image
                imageUrl = null;
            }
            //get video Text value
            string video = VideoUrlField.Text;
            //add vocab into database
            VocabC.AddVocab(courseId, term, description, imageUrl, video);
            //display the message panel with success message
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Vocabulary added successfully";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
        protected void ImageUpload_TextChanged(object sender, EventArgs e)
        {
            InsertedImage.Visible = true;
            // You can access the file path here if you need it:
            string imagePath = ImageUpload.PostedFile.FileName;
        }
    }
}