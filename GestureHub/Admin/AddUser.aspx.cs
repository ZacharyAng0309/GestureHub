using System;

namespace GestureHub
{
    public partial class AdminAddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            //if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            //{
            //    //redirect to login page
            //    Response.Redirect("~/Login.aspx");
            //}
            //get new userid
            idField.Text = UserC.GetNewUserId().ToString();
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            //get the values from the input fields
            string username = usernameField.Text;
            //check if the username is unique
            if (UserC.IsUsernameUnique(username))
            {
                //display the message panel with error message
                MsgLabel.Visible = true;
                MsgPanel.CssClass = "alert alert-danger alert-dismissible fade show";
                MsgLabel.Text = "Username already exists";
                MsgLabel.ForeColor = System.Drawing.Color.Red;
            }
            string password = passwordField.Text;
            string email = emailField.Text;
            string firstName = firstNameField.Text;
            string lastName = lastNameField.Text;
            //get the value of ageField
            string age = ageField.Text;
            string gender = genderField.Text;
            string role = roleField.SelectedValue;
            //add user to database
            UserC.AddUser(username, email, password, firstName, lastName, age, gender, role);
            //display the message panel with success message
            MsgPanel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "User added successfully";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}