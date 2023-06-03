using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Threading;
using System.Web.UI;

namespace GestureHub
{
    public static class QuizC
    {
        //public static DataTable GetCourseExamData(int course_id)
        //{
        //    DataTable dataTable = new DataTable();
        //    using (SqlConnection conn = GestureHub.DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "SELECT * FROM exam WHERE course_id=@course_id;";
        //            cmd.Parameters.AddWithValue("@course_id", course_id);
        //            using (SqlDataAdapter adapter = new SqlDataAdapter())
        //            {
        //                adapter.SelectCommand = cmd;
        //                adapter.Fill(dataTable);
        //            }
        //        }
        //        conn.Close();
        //    }
        //    return dataTable;
        //}

        public static DataTable GetQuizData(string quizId)
        {
            //use the quiz_id to fetch the quiz data from the database called GestureHubDatabase
            DataTable dataTable = new DataTable();
            using (SqlConnection conn = GestureHub.DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM quiz WHERE quiz_id=@quizId;";
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = cmd;
                        adapter.Fill(dataTable);
                    }
                }
                conn.Close();
            }
            return dataTable;
        }

        public static Panel DisplayQuiz(string quizId) { 
            //get questionIdLIst from the database
            List<string> questionIdList = GetQuestionIdList(quizId);
            Panel row = new Panel();
            //add the quizId as an input into the panel
            row.Controls.Add(new LiteralControl("<input type='hidden' name='quiz_id' value='" + quizId + "' />"));
            int count = 1;
            //loop the questionId and display the question
            foreach (string questionId in questionIdList)
            {
                Panel questionPanel = QuestionC.DisplayQuestion(questionId, count);
                row.Controls.Add(questionPanel);
                count++;
            }
            row.Controls.Add(new LiteralControl("<script>\r\n        " +
                "$(document).ready(function() {\r\n            " +
                "// Your JavaScript (jQuery) code here\r\n            " +
                "$('[data-image]').each(function() {\r\n                " +
                "var imageUrl = $(this).attr('data-image');\r\n               " +
                " var imgElement = $('<img>').attr('src', imageUrl);\r\n               " +
                " $(this).append(imgElement);\r\n            });\r\n\r\n           " +
                " $('[data-video]').each(function() {\r\n                " +
                "var videoUrl = $(this).attr('data-video');\r\n                " +
                "var iframeElement = $('<iframe>').attr('src', videoUrl).attr('width', '100%').attr('height', 'auto');\r\n                " +
                "$(this).append(iframeElement);\r\n            });\r\n        });\r\n    </script>"));
            return row;
        }

        public static void addNewQuiz(string courseId, string title, string description)
        {
            //add new quiz to the database
            using (SqlConnection conn = GestureHub.DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "INSERT INTO quiz (course_id, title, description) VALUES (@course_id, @title, @description);";
                    cmd.Parameters.AddWithValue("@course_id", courseId);
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

        public static List<string> GetQuizIdList()
        {
            //get the quiz id list from the database
            List<string> quizIdList = new List<string>();
            DataTable dataTable = new DataTable();
            using (SqlConnection conn = GestureHub.DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT quiz_id FROM quiz;";
                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = cmd;
                        adapter.Fill(dataTable);
                    }
                }
                conn.Close();
            }
            foreach (DataRow row in dataTable.Rows)
            {
                quizIdList.Add(row["quiz_id"].ToString());
            }
            return quizIdList;
        }

        public static List<string> GetQuestionIdList(string quizId) {
            List<string> questionIdList = new List<string>();
            //get question id from database that is with the quiz id
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT question_id FROM question WHERE quiz_id=@quizId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            questionIdList.Add(reader["question_id"].ToString());
                        }
                    }
                }
                conn.Close();
            }
            return questionIdList;
        }

        public static void UpdateQuiz(string quizId, string title, string description)
        {
            //update the quiz data in the database
            using (SqlConnection conn = GestureHub.DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "UPDATE quiz SET title=@title, description=@description WHERE quiz_id=@quizId;";
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
        public static void DeleteQuiz(string quizId)
        {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "DELETE FROM quiz WHERE quiz_id=@quizId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }

            //get question id from database that is with the quiz id
            List<string> questionIdList = new List<string>();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT question_id FROM question WHERE quiz_id=@quizId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            questionIdList.Add(reader["questionId"].ToString());
                        }
                    }
                }
                conn.Close();
            }
            //delete all question in the question table
            foreach (string questionId in questionIdList)
            {
                QuestionC.DeleteQuestion(questionId);
            }
        }
        
        public static void addQuizResult(string userId, string quizId, string score)
        {
            //add quiz result to the database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "INSERT INTO quizresult (user_id, quiz_id, score,completed_at) VALUES (@user_id, @quizId, @score,@completed_at);";
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    cmd.Parameters.AddWithValue("@score", score);
                    cmd.Parameters.AddWithValue("@completed_at", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
        public static string GetQuizId(string courseId)
        {
            //get quiz id from database that is with the course id
            string quizId = "";
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT quiz_id FROM quiz WHERE course_id=@courseId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@courseId", courseId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            quizId = reader["quiz_id"].ToString();
                        }
                    }
                }
                conn.Close();
            }
            return quizId;
        }
    }
}