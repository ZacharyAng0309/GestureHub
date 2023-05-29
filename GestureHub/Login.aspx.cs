using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace GestureHub
{
    public partial class Login : GestureHub.UtilClass.BasePage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //}
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string username = UsernameTxtBox.Text;
            string password = PasswordTxtBox.Text;
            password = MyUtil.ComputeSHA1(password);
            //get username and password from database
            string query = "SELECT * FROM [users] WHERE username = @username AND password = @password";
            DataTable dt = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                if (dt.Rows.Count > 0)
                {
                    //if username and password is correct, redirect to home page
                    Session["username"] = username;
                    Session["user_id"] = dt.Rows[0]["user_ID"];
                    Session["user_role"] = dt.Rows[0]["user_role"];
                    //if user role is admin then redirect to admin page
                    if (dt.Rows[0]["user_role"].ToString() == "admin")
                    {
                        Response.Redirect("~/Admin/Dashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Member/Dashboard.aspx");
                    }
                }
                else
                {
                    //if username and password is incorrect, show error message
                    ErrorLbl.Text = "Invalid username or password";
                }
            }
        }
    }
}
