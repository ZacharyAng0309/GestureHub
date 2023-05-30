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
                //create error message
                string errorMessage = "Username " + username + " is already taken.";
                //display error message
                Response.Write("<script>alert('" + errorMessage + "')</script>");
                return;
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
        }
    }
}