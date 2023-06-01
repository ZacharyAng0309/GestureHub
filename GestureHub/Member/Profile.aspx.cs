using System;
using System.Collections.Generic;
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
            String userId = "1";
            //String userId = Session["userId"].ToString();
            //get user info from database
            //display user info
        }

        protected void updateInputFields(String userId)
        {
            //get user info from database

            //display user info

        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            //delete user from database
            UserC.DeleteUser(Session["userId"].ToString());

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            //get values from input fields
            String userId = Session["userId"].ToString();
            String username = UsernameProfile.Text;
            String email = EmailProfile.Text;
            String password = PasswordProfile.Text;
            String age = AgeProfile.Text;
            String fname = FirstNameProfile.Text;
            String lname = LastNameProfile.Text;
            String gender = GenderProfileDropdown.SelectedValue;
            UserC.updateUser(userId, username, email, password, fname, lname, age, gender, "Member");
            //set success message
            MsgLabel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Profile updated successfully";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}