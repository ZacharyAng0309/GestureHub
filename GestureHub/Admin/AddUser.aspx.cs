using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub
{
    public partial class AdminAddUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get new userid
            idField.Text = UserC.GetNewUserId().ToString();
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            //get the values from the input fields
            string username = usernameField.Text;
            //check if the username is unique
            if (UserC.isUsernameUnique(username))
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
            UserC.addUser(username, email, firstName, lastName, age, gender, role, password);
            //display the message panel with success message
            MsgLabel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "User added successfully";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}