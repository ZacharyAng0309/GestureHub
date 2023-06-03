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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            //if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            //{
            //    //redirect to login page
            //    Response.Redirect("~/Login.aspx");
            //}
            //get user id from session
            //String userId = Session["userId"].ToString();
            String userId = "1"; //for testing purposes
            UpdateInputFields(userId);
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

            //String userId = Session["userId"].ToString();
            String userId = "1"; //for testing purposes
            String username = UsernameAdmin.Text;
            String email = EmailAdmin.Text;
            String password = PasswordAdmin.Text;
            String age = AgeAdmin.Text;
            String fname = FirstNameAdmin.Text;
            String lname = LastNameAdmin.Text;
            String gender = GenderAdminDropDownList.SelectedValue;

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

            UserC.UpdateUser(userId, username, email, password, fname, lname, age, gender, "admin",imageUrl);
        } 

        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }
    }
}