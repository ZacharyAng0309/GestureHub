using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace GestureHub.UtilClass
{
    public class FeedbackC
    {
        public static DataTable GetFeedbackData(int course_id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM feedback WHERE course_id=@courseid;";
                    cmd.Parameters.AddWithValue("@courseid", course_id);
                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = cmd;
                        adapter.Fill(dt);
                    }
                }
                conn.Close();
            }
            return dt;
        }
    }
}