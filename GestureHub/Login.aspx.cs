using System;
using System.Data;
using System.Data.SqlClient;

namespace GestureHub
{
    public partial class Login : GestureHub.UtilClass.BasePage
    {
        private string DbTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            SetDbTable();
            string username = UsernameTxtBox.Text;
            string password = PasswordTxtBox.Text;
            System.Diagnostics.Debug.WriteLine(username);
            password = MyUtil.ComputeSHA1(password);

            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                string query = $"SELECT * FROM {DbTable} WHERE username=@username AND password=@password;";
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            ErrorPanel.Visible = false;
                            string user_id = dt.Rows[0][DbTable + "_id"].ToString();
                            Session["username"] = username;
                            Session["user_id"] = Convert.ToInt32(user_id);
                            Session["isAdmin"] = DbTable == "admin";
                            Response.Redirect("Dashboard.aspx");
                            return;
                        }
                        else
                        {
                            ErrorPanel.Visible = true;
                            PasswordTxtBox.Focus();
                        }
                        conn.Close();
                    }
                }
            }
        }

        protected void SetDbTable()
        {
            string userType = this.UserTypeRadio.SelectedValue;
            DbTable = userType;
        }
    }
}