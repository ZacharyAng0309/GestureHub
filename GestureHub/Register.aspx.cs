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
            string password = PasswordTxtBox.Text;
            password = MyUtil.ComputeSHA1(password);
            string email =  MyUtil.SanitizeInput(EmailTxtBox);
            string age = AgeTxtBox.Text;
            string gender = GenderDropDownList.Text;
            string role = "Member";
            


            //var client = new MyService();
            //if (client.IsValidUsername("users", username) != "valid")
            //{
            //    this.UsernameTxtBox.Focus();
            //    return;
            //}

            UserC.AddUser(username, email, password, null , null , age, gender, role);



            Response.Redirect("~/Login.aspx");

        }

    }
}