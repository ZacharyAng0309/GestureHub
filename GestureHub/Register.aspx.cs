using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Collections.Specialized;


namespace GestureHub
{
    public partial class Register : UtilClass.BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            string username = MyUtil.SanitizeInput(UsernameTxtBox);
            //validate if the username is unique
            if (!UserC.IsUsernameUnique(username))
            {
                //display error message
                MsgPanel.Visible = true;
                MsgPanel.CssClass = "alert alert-danger alert-dismissible fade show";
                MsgLabel.Text = "Username is taken.";
                MsgLabel.ForeColor = System.Drawing.Color.Red;
                return;
            }
            string password = PasswordTxtBox.Text;
            password = MyUtil.ComputeSHA1(password);
            string email =  MyUtil.SanitizeInput(EmailTxtBox);
            string age = AgeTxtBox.Text;
            string gender = GenderDropDownList.Text;
            string role = "member";

            UserC.AddUser(username, email, password, "" , "" , age, gender, role);

            //prompt a success message to the user using javascript. By selecting on okay, the user will be redirected to the login page
            string script = "alert(\"You have successfully registered. Please login to continue.\");";
            script += "window.location.replace(\"/Login.aspx\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                                         "ServerControlScript", script, true);
        }

    }
}