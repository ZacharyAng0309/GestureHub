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
            //string userType = UserTypeRadio.SelectedValue;
            //if (userType == "admin")
            //{
            //    string secretCode = SecretTxtBox.Text;
            //    string secretCodeHash = MyUtil.ComputeSHA1(secretCode);
            //    // Demonstration purpose: valid secret code = 31337
            //    if (secretCodeHash != "E580726D31F6E1AD216FFD87279E536D1F74E606")
            //    {
            //        SecretPanel.Visible = true;
            //        SecretTxtBox.CssClass = "form-control is-invalid";
            //        SecretTxtBox.Focus();
            //        return;
            //    }
            //    SecretPanel.Visible = false;
            //    SecretTxtBox.CssClass = "form-control";
            //}
            var client = new MyService();
            if (client.IsValidUsername("users", username) != "valid")
            {
                this.UsernameTxtBox.Focus();
                return;
            }
            string queryInsert = "INSERT INTO users";
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    if (userType == "admin")
                    {
                        queryInsert += " (username, password) VALUES (@username, @password);";
                        cmd.CommandText = queryInsert;
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);
                    }
                    else
                    {
                        //string fullName = MyUtil.SanitizeInput(FullNameTxtBox);
                        string email = MyUtil.SanitizeInput(EmailTxtBox);
                        string gender = GenderDropDownList.SelectedValue;
                        queryInsert += " (username, password, email, gender) VALUES (@username, @password, @email, @gender);";
                        cmd.CommandText = queryInsert;
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);
                        //cmd.Parameters.AddWithValue("@full_name", fullName);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        //if (gender == "m")
                        //    cmd.Parameters.AddWithValue("@profile", "man.png");
                        //else
                        //    cmd.Parameters.AddWithValue("@profile", "girl.png");
                    }

                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                Response.Redirect("~/Login.aspx");
            }
        }

    }
}