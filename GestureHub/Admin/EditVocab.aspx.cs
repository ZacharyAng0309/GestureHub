using GestureHub.UtilClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Windows.Forms;

namespace GestureHub.Admin
{
    public partial class EditVocab : System.Web.UI.Page
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
                //get vocabId from query string
                string vocabId = Request.QueryString["vocabId"];
                //get vocab id list
                List<String> vocabIdList = VocabC.GetVocabIdList();
                //insert the vocab id list into the dropdownlist
                foreach (string vocabIds in vocabIdList)
                {
                    VocabularyIdField.Items.Add(vocabIds);
                }
                VocabularyIdField.SelectedValue = vocabId;
                //get all courseId from database
                List<String> courseIdList = CourseC.GetCourseIdList();
                //insert the courseIdList into the dropdownlist
                foreach (string courseId in courseIdList)
                {
                    CourseIdField.Items.Add(courseId);
                }
                updateInputFields(vocabId);
            }
        }

        private void updateInputFields(string vocabId)
        {
            //get vocab from database
            DataTable vocabTable = VocabC.GetVocabData(vocabId);
            DataRow vocab = vocabTable.Rows[0];
            if (vocabTable != null)
            {
                //set vocab_id to the idField
                VocabularyIdField.Text = vocabId;
                //set the value for courseIdField
                CourseIdField.SelectedValue = vocab["course_id"].ToString();
                //set the value for termField
                TermField.Text = vocab["term"].ToString();
                //set the value for descriptionField
                DescriptionField.Text = vocab["description"].ToString();
                //set the image url for imageField
                string imageUrl = vocab["image"].ToString();
                if (imageUrl != "")
                {
                    ImageField.ImageUrl = "/Images/" + imageUrl;
                }
                //set the value for videoField
                VideoUrlField.Text = vocab["video"].ToString();
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            //get the vocab id from the vocabIdField
            string vocabId = VocabularyIdField.SelectedValue;
            //get vocab from database
            DataTable vocabTable = VocabC.GetVocabData(vocabId);
            DataRow vocab = vocabTable.Rows[0];
            //get the courseId from the courseIdField
            string courseId = CourseIdField.SelectedValue;
            //get the term from the termField
            string term = TermField.Text;
            //get the description from the descriptionField
            string description = DescriptionField.Text;
            //check if the imageFile has been uploaded
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
                imageUrl = "vocab-" + vocabId + Path.GetExtension(file.FileName);
                //save file to server
                file.SaveAs(Server.MapPath("~/Images/" + imageUrl));
            }
            else
            {
                //set the imageUrl to the current image
                imageUrl = vocab["image"].ToString();
            }
            //get the video url from the videoField
            string videoUrl = VideoUrlField.Text;
            //update the vocab in the database
            VocabC.UpdateVocab(vocabId, courseId, term, description, imageUrl, videoUrl);
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Vocab ID:" + vocabId + " has been updated.";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
            return;
        }

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }

        protected void VocabularyIdField_SelectedIndexChanged(object sender, EventArgs e)
        {
            //get the vocab id from the idField
            string vocabId = VocabularyIdField.SelectedValue;
            //update the input fields
            updateInputFields(vocabId);
        }
    }
}