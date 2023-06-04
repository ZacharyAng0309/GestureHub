using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace GestureHub.Admin
{
    public partial class EditQuestionOption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //get questionoption id from query string
                string questionOptionId = Request.QueryString["questionOptionId"];
                updateInputFields(questionOptionId);
            }
        }

        protected void updateInputFields(string optionId) { 
            //get question option data
            DataTable optionTable = QuestionC.GetQuestionOptionData(optionId);
            DataRow option = optionTable.Rows[0];
            //check if option is null
            if (option != null)
            {
                //update input fields
                optionIdField.Text = optionId;
                questionIdField.Text = option["question_id"].ToString();
                textField.Text = option["option_text"].ToString();
                //set image
                QuestionImage.ImageUrl = "~/Images/" + option["image"].ToString();
                //set video
                videoUrlField.Text = option["video"].ToString();
            }

        }
        protected void UpdateButton_Click() {
            //get the values of the input fields
            string optionId = optionIdField.Text;
            //get question data
            DataRow optionData = QuestionC.GetQuestionOptionData(optionId).Rows[0];
            //get input values
            string questionId = questionIdField.Text;
            string text = textField.Text;

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
                imageUrl = "option-" + optionId + Path.GetExtension(file.FileName);
                //save file to server
                file.SaveAs(Server.MapPath("~/Images/" + imageUrl));
            }
            else
            {
                //set the imageUrl to the current image
                imageUrl = optionData["image"].ToString();
            }
            string videoUrl = videoUrlField.Text;
            //get isCorrect value
            bool isCorrect = isCorrectCheckBox.Checked;
            //update option in database
            QuestionC.UpdateQuestionOption(optionId, questionId, text, imageUrl, videoUrl, isCorrect);
        }

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }
    }
}