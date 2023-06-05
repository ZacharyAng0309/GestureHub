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
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string username = UsernameTxtBox.Text;
            string password = PasswordTxtBox.Text;
            password = MyUtil.ComputeSHA1(password);
            //get username and password from database
            string query = "SELECT * FROM [users] WHERE username = @username";
            DataTable dt = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }

                if (dt.Rows.Count > 0)
                {
                    bool foundUser = false;
                    foreach (DataRow row in dt.Rows)
                    {
                        if (row["username"].ToString() == username && row["password"].ToString() == password)
                        {
                            foundUser = true;
                            //if username and password is correct, redirect to home page
                            Session["username"] = username;
                            Session["userId"] = dt.Rows[0]["user_id"];
                            Session["userRole"] = dt.Rows[0]["user_role"];
                            //if user role is admin then redirect to admin page
                            if (dt.Rows[0]["user_role"].ToString() == "admin")
                            {
                                Response.Redirect("/Admin/Dashboard.aspx");
                            }
                            else
                            {
                                Response.Redirect("/Member/Dashboard.aspx");
                            }
                            break;
                        }
                    }
                    if (!foundUser)
                    {
                        MsgPanel.Visible = true;
                        MsgPanel.CssClass = "alert alert-danger alert-dismissible fade show";
                        MsgLabel.Text = "Invalid username or password";
                        MsgLabel.ForeColor = System.Drawing.Color.Red;
                        return;

                    }
                }
                else
                {
                    MsgPanel.Visible = true;
                    MsgPanel.CssClass = "alert alert-danger alert-dismissible fade show";
                    MsgLabel.Text = "Invalid username or password";
                    MsgLabel.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }
        }
    }
}
