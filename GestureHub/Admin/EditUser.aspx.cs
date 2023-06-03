using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace GestureHub
{
    public partial class WebForm1 : System.Web.UI.Page
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
                //get user_id from query string
                string userId = Request.QueryString["userId"] ?? "1";
                //get user id list
                List<String> userIdList = UserC.GetUserIdList();
                //insert the user id list into the dropdownlist
                foreach (string userIds in userIdList)
                {
                    idField.Items.Add(userIds);
                }
                idField.SelectedValue = userId;
                updateInputFields(userId);
            }

        }

        protected void updateInputFields(string userId)
        {
            //get user from database
            DataRow user = UserC.GetUserData(userId);
            if (user != null)
            {
                //set user_id to the idField
                usernameField.Text = user["username"].ToString();
                passwordField.Attributes["value"] = user["password"].ToString();
                emailField.Text = user["email"].ToString();
                firstNameField.Text = user["first_name"].ToString();
                lastNameField.Text = user["last_name"].ToString();
                //set the value of ageField to the user's age
                ageField.Text = user["age"].ToString();
                //set the value for genderField
                genderField.SelectedValue = user["gender"].ToString();
                //set the dropdownlist to the user's role
                roleField.SelectedValue = user["user_role"].ToString();
            }

        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            //get the values from the input fields
            string userId = idField.SelectedValue;
            string username = usernameField.Text;

            //check if the username is unique
            if (!UserC.IsUsernameUnique(username))
            {
                //display error message
                MsgPanel.Visible = true;
                //add boostrap class to the message panel
                MsgPanel.CssClass = "alert alert-danger";
                MsgLabel.Text = "Username '" + username + "' is already taken.";
                return;
            }
            string password = passwordField.Text;
            string email = emailField.Text;
            string fname = firstNameField.Text;
            string lname = lastNameField.Text;
            string age = ageField.Text;
            string gender = genderField.SelectedValue;
            string role = roleField.SelectedValue;
            //use the values to update the user
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
            UserC.UpdateUser(userId,username,email,password,fname,lname,age,gender,role,imageUrl);
            //display the message panel with success message
            MsgLabel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "User '" + username + "' has been updated.";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
            return;
        }

        protected void IdField_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected item from the dropdown list
            var userId = ((DropDownList)sender).SelectedItem;
            updateInputFields(userId.ToString());
        }
        private void DisplayAlert(string message)
        {
            MessageBox.Show(message, "Alert");
        }
    }
}