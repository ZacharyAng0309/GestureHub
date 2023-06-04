using System;
using System.IO;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Web.Security;

namespace GestureHub.Member
{
    public partial class Profile : System.Web.UI.Page
    {
        public object ProfilePictureUpload { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                //check if the userId is null if null then assign to 1
                string userId = Session["userId"].ToString();
                //update input fields
                UpdateInputFields(userId);
            }
        }

        protected void UpdateInputFields(string userId)
        {
            //get user data from database
            DataRow user = UserC.GetUserData(userId);
            //check if user is null
            if (user != null)
            {
                MemberIdProfile.Text = userId;
                UsernameProfile.Text = user["username"].ToString();
                EmailProfile.Text = user["email"].ToString();
                PasswordProfile.Attributes["value"] = user["password"].ToString();
                AgeProfile.Text = user["age"].ToString();
                //if first_name in user is not null assign to FirstNameProfile.Text
                if (user["first_name"] != null)
                {
                    FirstNameProfile.Text = user["first_name"].ToString();
                }
                //if last_name in user is not null assign to LastNameProfile.Text
                if (user["last_name"] != null)
                {
                    LastNameProfile.Text = user["last_name"].ToString();
                }

                GenderProfileDropdownList.SelectedValue = user["gender"].ToString();
                //set the src of the ProfilePicture
                ProfilePicture.ImageUrl = "~/Images/" + user["image"].ToString();
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            bool confirmDeletion = DisplayConfirmation("Are you sure you want to delete your account?");

            if (confirmDeletion)
            {
                //check if the userId is null if null then assign to 1
                string userId = Session["userId"].ToString();
                //delete user from database
                UserC.DeleteUser(userId);
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

        protected void SaveProfileBtn_Click(object sender, EventArgs e)
        {

            string userId = Session["userId"].ToString();
            /*string userId = "6"; *///for testing purposes

            //get user data from database
            DataRow user = UserC.GetUserData(userId);
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
                ////validate file size
                //if (file.ContentLength > 409600)
                //{
                //    DisplayAlert("File size cannot exceed 400KB!");
                //    return;
                //}
                //set file name to user id with extension
                imageUrl = "user-"+userId + Path.GetExtension(file.FileName);
                //save file to server
                file.SaveAs(Server.MapPath("~/Images/" + imageUrl));

            }
            else
            {
                //set the imageUrl to the current image
                imageUrl = user["image"].ToString();
            }
            //update profile picture
            ProfilePicture.ImageUrl = "~/Images/" + imageUrl;
            //update user data in database
            UserC.UpdateUser(userId,username,email,password,fname, lname, age,gender, "member",imageUrl);
            //use javascript to send alert on test
            //prompt an success alert
            DisplayAlert("Profile updated successfully!");
        }
    }
}