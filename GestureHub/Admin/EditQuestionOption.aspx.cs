using GestureHub.Member;
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
            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                //get questionoption id from query string
                string questionOptionId = Request.QueryString["optionId"];

                updateInputFields(questionOptionId);
            }
        }

        protected void updateInputFields(string optionId)
        {
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
                if (option["image"].ToString() != "")
                {
                    QuestionImage.ImageUrl = "~/Images/" + option["image"].ToString();
                }
                else
                {
                    QuestionImage.Visible= false;
                }
                //set video
                videoUrlField.Text = option["video"].ToString();
                //set isCorrect
                isCorrectCheckBox.Checked = Convert.ToBoolean(option["is_correct"]);
            }

        }

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            //get the values of the input fields
            string optionId = optionIdField.Text;
            //get question data
            DataRow optionData = QuestionC.GetQuestionOptionData(optionId).Rows[0];
            //get input values
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
            bool isCorrectValue = isCorrectCheckBox.Checked;
            //if isCorrectValue is 1 then set isCorrect to true
            string isCorrect = isCorrectValue ? "True" : "False";
            //update option in database
            QuestionC.UpdateQuestionOption(optionId, text, imageUrl, videoUrl, isCorrect);
            //set MsgPanel to success
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Question Option ID: '" + optionId + "' has been updated.";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}