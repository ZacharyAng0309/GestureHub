using System;
using System.IO;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace GestureHub.Member
{
    public partial class Profile : System.Web.UI.Page
    {
        public object ProfilePictureUpload { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //get userid from session
            //string userId = Session["userId"].ToString();
            string userId = "1"; //for testing purposes
            UpdateInputFields(userId);
        }

        protected void UpdateInputFields(string userId)
        {
            //get user data from database
            DataRow user = UserC.GetUserData(userId);
            //set input fields
            MemberIdProfile.Text = user["user_id"].ToString();
            UsernameProfile.Text = user["username"].ToString();
            EmailProfile.Text = user["email"].ToString();
            PasswordProfile.Attributes["value"] = user["password"].ToString();
            AgeProfile.Text = user["age"].ToString();
            FirstNameProfile.Text = user["first_name"].ToString();
            LastNameProfile.Text = user["last_name"].ToString();
            GenderProfileDropdownList.SelectedValue = user["gender"].ToString();
            //set the src of the ProfilePicture
            ProfilePicture.ImageUrl = "~/Images/" + user["images"].ToString();
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            bool confirmDeletion = DisplayConfirmation("Are you sure you want to delete your account?");

            if (confirmDeletion)
            {
                //delete user from database
                UserC.DeleteUser(Session["userId"].ToString());
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
        }

        private bool DisplayConfirmation(string message)
        {
            return MessageBox.Show(message, "Confirmation", MessageBoxButtons.YesNo) == DialogResult.Yes;
        }

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            //String userId = Session["userId"].ToString();
            string userId = "1"; //for testing purposes
            string username = UsernameProfile.Text;
            string email = EmailProfile.Text;
            string password = PasswordProfile.Text;
            //hash password
            password = MyUtil.ComputeSHA1(password);
            string age = AgeProfile.Text;
            string fname = FirstNameProfile.Text;
            string lname = LastNameProfile.Text;
            string gender = GenderProfileDropdownList.SelectedValue;
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
                //validate file size
                if (file.ContentLength > 102400)
                {
                    DisplayAlert("File size cannot exceed 100KB!");
                    return;
                }
                //set file name to user id with extension
                imageUrl = userId + Path.GetExtension(file.FileName);
                //save file to server
                file.SaveAs(Server.MapPath("~/Images/" + imageUrl));

            }
            else
            {
                //set the imageUrl to the current image
                imageUrl = UserC.GetUserData(userId)["images"].ToString();
            }
            //update user data in database
            UserC.UpdateUser(userId, username, email, password, fname, lname, age, gender, "member", imageUrl);

        }
    }
}