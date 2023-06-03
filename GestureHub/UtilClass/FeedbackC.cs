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
                    cmd.CommandText = "SELECT * FROM feedback WHERE courseId=@courseid;";
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

        public static void InsertFeedback(string userId, string courseId, string feedback)
        {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "INSERT INTO feedback (user_id, course_id, feedback, created_at) VALUES (@userid, @courseid, @feedback, @createdAt);";
                    cmd.Parameters.AddWithValue("@userid", userId);
                    cmd.Parameters.AddWithValue("@courseid", courseId);
                    cmd.Parameters.AddWithValue("@feedback", feedback);
                    cmd.Parameters.AddWithValue("@createdAt", DateTime.Now.ToString("dd/MM/yy hh:mm:ss"));
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

    }
}