using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace GestureHub.Admin
{
    public partial class AddQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                //get quiz id list
                List<string> quizIdList = QuizC.GetQuizIdList();
                //add quiz id list to dropdownlist
                QuizIdDropdownList.DataSource = quizIdList;
                QuizIdDropdownList.DataBind();
            }
        }

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            string newQuestionId = QuizC.GetNewQuestionId();
            //get values of input fields
            string quizId = QuizIdDropdownList.SelectedValue;
            string question = QuestionField.Text;
            string imageUrl ="";
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
                imageUrl = "question-" + newQuestionId + Path.GetExtension(file.FileName);
                //save file to server
                file.SaveAs(Server.MapPath("~/Images/" + imageUrl));
            }
            //get video url
            string videoUrl = QuestionVideoField.Text;
            //insert quiz into database
            QuizC.AddQuizQuestion( quizId, question, imageUrl,videoUrl);
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Quiz Question added successfully";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}