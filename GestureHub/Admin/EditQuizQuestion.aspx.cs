using System;
using System.Data;
using System.IO;
using System.Web;
using System.Windows.Forms;

namespace GestureHub.Admin
{
    public partial class AdminEditQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            //if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            //{
            //    //redirect to login page
            //    Response.Redirect("~/Login.aspx");
            //}
            //get the quiz id from the query string
            string questionId = Request.QueryString["questionId"];
            //get question data
            DataTable questionTable = QuestionC.GetQuestionData(questionId);
            DataRow question = questionTable.Rows[0];
            //check if question is null
            if (question != null)
            {
                //update input fields
                UpdateInputFields(questionId);
            }
            }

        protected void UpdateInputFields(string questionId)
        {
            //get question data from database
            DataRow question = QuestionC.GetQuestionData(questionId).Rows[0];
            //check if question is null
            if (question != null)
            {
                QuestionIdField.Text = questionId;
                QuizIdField.Text = question["quiz_id"].ToString();
                QuestionField.Text = question["question"].ToString();
                //set image
                QuestionPicture.ImageUrl = "~/Images/" + question["image"].ToString();
                //set video
                QuestionVideoField.Text = question["video"].ToString();

            }

        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //get the values of the input fields
            string questionId = QuestionIdField.Text;
            //get question data
            DataRow questionData = QuestionC.GetQuestionData(questionId).Rows[0];

            string quizId = QuizIdField.Text;
            string question = QuestionField.Text;
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
                imageUrl = "question-" + questionId + Path.GetExtension(file.FileName);
                //save file to server
                file.SaveAs(Server.MapPath("~/Images/" + imageUrl));
            }
            else
            {
                //set the imageUrl to the current image
                imageUrl = questionData["image"].ToString();
            }
            //get video url
            string videoUrl = QuestionVideoField.Text;
            //update quiz in database
            QuestionC.UpdateQuestion(questionId, quizId, question,imageUrl,videoUrl);
            //create success alert
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Question updated successfully!";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            //get the question id
            string questionId = QuestionIdField.Text;
            //delete question from database
            QuestionC.DeleteQuestion(questionId);
            //create success alert
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Question deleted successfully!";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }
    }
}