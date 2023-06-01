using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Member
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get userid from session
            string userId = "1";
            //string userId = Session["userId"].ToString();
            updateInputFields(userId);
        }

        protected void updateInputFields(string userId)
        {
            //get user data from database
            DataRow user = UserC.GetUserData(userId);
            //set input fields
            UsernameProfile.Text = user["username"].ToString();
            EmailProfile.Text = user["email"].ToString();
            PasswordProfile.Text = user["password"].ToString();
            AgeProfile.Text = user["age"].ToString();
            FirstNameProfile.Text = user["first_name"].ToString();
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            //delete user from database
            UserC.DeleteUser(Session["userId"].ToString());

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            //get values from input fields
            string userId = Session["userId"].ToString();
            string username = UsernameProfile.Text;
            string email = EmailProfile.Text;
            string password = PasswordProfile.Text;
            string age = AgeProfile.Text;
            string fname = FirstNameProfile.Text;
            string lname = LastNameProfile.Text;
            string gender = GenderProfileDropdown.SelectedValue;
            UserC.updateUser(userId, username, email, password, fname, lname, age, gender, "Member");
            //set success message
            MsgLabel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Profile updated successfully";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}