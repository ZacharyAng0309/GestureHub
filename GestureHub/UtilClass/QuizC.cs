using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

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
                    cmd.CommandText = "SELECT * FROM quiz WHERE quiz_id=@quiz_id;";
                    cmd.Parameters.AddWithValue("@quiz_id", quizId);
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
            Panel row = new Panel();
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
                    cmd.CommandText = "UPDATE quiz SET title=@title, description=@description WHERE quiz_id=@quiz_id;";
                    cmd.Parameters.AddWithValue("@quiz_id", quizId);
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
                    cmd.CommandText = "DELETE FROM quiz WHERE quiz_Id=@quizId";
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
                    cmd.CommandText = "SELECT questionId FROM question WHERE quizId=@quizId";
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
        
    }
}