using System;
using System.Data;
using System.IO;
using System.Web;
using System.Windows.Forms;

namespace GestureHub.Admin
{
    public partial class Profile : System.Web.UI.Page
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

                //get user id from session
                string userId = Session["userId"].ToString();
                UpdateInputFields(userId);
            }
        }

        protected void UpdateInputFields(string userId)
        {
            //get user data from database
            DataRow user = UserC.GetUserData(userId);
            //set input fields
            UserIDAdmin.Text = user["user_id"].ToString();
            UsernameAdmin.Text = user["username"].ToString();
            EmailAdmin.Text = user["email"].ToString();
            PasswordAdmin.Attributes["value"] = user["password"].ToString();
            AgeAdmin.Text = user["age"].ToString();
            FirstNameAdmin.Text = user["first_name"].ToString();
            LastNameAdmin.Text = user["last_name"].ToString();
            GenderAdminDropDownList.SelectedValue = user["gender"].ToString();
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            //get values from input fields

            string userId = Session["userId"].ToString();
            //get user data from database
            DataRow user = UserC.GetUserData(userId);
            string username = UsernameAdmin.Text;
            string email = EmailAdmin.Text;
            string password = PasswordAdmin.Text;
            if (MyUtil.ComputeSHA1(password) == user["password"].ToString())
            {
                //if password is the same as the one in database
                //set password to the one in database
                password = user["password"].ToString();
            }
            else
            {
                //if password is different from the one in database
                //hash password
                password = MyUtil.ComputeSHA1(password);
            }
            string age = AgeAdmin.Text;
            string fname = FirstNameAdmin.Text;
            string lname = LastNameAdmin.Text;
            string gender = GenderAdminDropDownList.SelectedValue;

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
                if (file.ContentLength > 409600)
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

            UserC.UpdateUser(userId, username, email, password, fname, lname, age, gender, "admin", imageUrl);
        }

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }
    }
}