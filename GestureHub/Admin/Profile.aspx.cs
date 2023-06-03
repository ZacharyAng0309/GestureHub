using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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


        }

        protected void UpdateInputFields(string userId)
        {
            //get user data from database
            DataRow user = UserC.GetUserData(userId);
            //set input fields
            UserIDAdmin.Text = user["user_id"].ToString();
            UsernameAdmin.Text = user["username"].ToString();
            EmailAdmin.Text = user["email"].ToString();
            //PasswordProfile.Text = user["password"].ToString();
            AgeAdmin.Text = user["age"].ToString();
            FirstNameAdmin.Text = user["first_name"].ToString();
            LastNameAdmin.Text = user["last_name"].ToString();
            GenderAdminDropDownList.SelectedValue = user["gender"].ToString();

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            //get values from input fields

            String userId = Session["userId"].ToString();
            String username = UsernameAdmin.Text;
            String email = EmailAdmin.Text;
            String password = PasswordAdmin.Text;
            String age = AgeAdmin.Text;
            String fname = FirstNameAdmin.Text;
            String lname = LastNameAdmin.Text;
            String gender = GenderAdminDropDownList.SelectedValue;

            UserC.updateUser(userId, username, email, password, fname, lname, age, gender, "admin");
        }
    }
}