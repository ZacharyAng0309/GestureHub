using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace GestureHub
{
    public static class Question
    {
        public static void AddQuestion(int quizId, string question, string type, string picture,string video, string isCorrect)
        {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "INSERT INTO question (quiz_id,question, type, picture, video, is_correct) VALUES (@quizId, @question, @type, @picture, @video, @isCorrect);";
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    cmd.Parameters.AddWithValue("@question", question);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@picture", picture);
                    cmd.Parameters.AddWithValue("@video", video);
                    cmd.Parameters.AddWithValue("@isCorrect", isCorrect);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
        public static void DeleteQuestion(int question_id)
        {
            DataTable questTable = Question.GetQuestionData(question_id);
            if (questTable.Rows.Count == 0) return;
            DataRow questRow = questTable.Rows[0];
            int quiz_id = Convert.ToInt32(questRow["quizId"]);
            //int oldSeq = Convert.ToInt32(questRow["sequence"]);
            //int maxSeq = Question.GetQueMaxSeq(quiz_id);
            //Question.UpdateQueSequence(quiz_id, maxSeq, oldSeq);
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "DELETE [option] WHERE question_id=@question_id;";
                    cmd.Parameters.AddWithValue("@question_id", question_id);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    cmd.CommandText = "DELETE question WHERE question_id=@question_id;";
                    cmd.Parameters.AddWithValue("@question_id", question_id);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

        public static DataTable GetQuestionData(int question_id)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM question WHERE question_id=@question_id;";
                    cmd.Parameters.AddWithValue("@question_id", question_id);
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

        public static DataTable GetQuizQuestion(int quizId)
        {
            DataTable questTable = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM question WHERE quiz_id=@quizId ORDER BY sequence;";
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    using (SqlDataAdapter adapter = new SqlDataAdapter())
                    {
                        adapter.SelectCommand = cmd;
                        adapter.Fill(questTable);
                    }
                }
                conn.Close();
            }
            return questTable;
        }

        public static DataTable GetQuestionOption(int question_id)
        {
            DataTable optionTable = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM questionoption WHERE question_id=@question_id;";
                    cmd.Parameters.AddWithValue("@question_id", question_id);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        sda.SelectCommand = cmd;
                        sda.Fill(optionTable);
                    }
                }
                conn.Close();
            }
            return optionTable;
        }

        public static List<int> GetAnswerID(int question_id)
        {
            List<int> answerID = new List<int>();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT option_id FROM [option] WHERE question_id=@question_id AND is_correct='True';";
                    cmd.Parameters.AddWithValue("@question_id", question_id);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            answerID.Add(int.Parse(reader["option_id"].ToString()));
                        }
                    }
                }
                conn.Close();
            }
            return answerID;
        }

        //public static int GetQueMaxSeq(int quizId)
        //{
        //    int seq;
        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "SELECT MAX(sequence) AS seq FROM question WHERE quiz_id=@quizId;";
        //            cmd.Parameters.AddWithValue("@quizId", quizId);
        //            var result = cmd.ExecuteScalar();
        //            if (result == DBNull.Value)
        //                seq = 0;
        //            else
        //                seq = Convert.ToInt32(result);
        //        }
        //        conn.Close();
        //    }
        //    return seq;
        //}

        //public static void UpdateQueSequence(int exam_id, int seq, int oldSeq)
        //{
        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            if (seq == oldSeq)
        //            {
        //                conn.Close();
        //                return;
        //            }

        //            if (seq > oldSeq)
        //            {
        //                cmd.CommandText = $"UPDATE question SET sequence=sequence-1 WHERE quizId=@quizId AND sequence > {oldSeq} AND sequence <= {seq};";
        //            }
        //            else if (seq < oldSeq)
        //            {
        //                cmd.CommandText = $"UPDATE question SET sequence=sequence+1 WHERE quizId=@quizId AND sequence >= {seq} AND sequence < {oldSeq};";
        //            }
        //            cmd.Parameters.AddWithValue("@quizId", exam_id);
        //            cmd.ExecuteNonQuery();
        //            cmd.Parameters.Clear();
        //        }
        //        conn.Close();
        //    }
        //}

        public static void addQuestionOption(String questionId, String optionText, String picture, String video, String is_correct) {
            //add question option into database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "INSERT INTO [option] (question_id, option_text, picture, video, is_correct) VALUES (@questionId, @optionText, @picture, @video, @is_correct);";
                    cmd.Parameters.AddWithValue("@questionId", questionId);
                    cmd.Parameters.AddWithValue("@optionText", optionText);
                    cmd.Parameters.AddWithValue("@picture", picture);
                    cmd.Parameters.AddWithValue("@video", video);
                    cmd.Parameters.AddWithValue("@is_correct", is_correct);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
        public static void updateQuestionOption(String optionId, String questionId, String optionText, String picture, String video, String is_correct) { 
            //update question option into database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "UPDATE [option] SET question_id=@questionId, option_text=@optionText, picture=@picture, video=@video, is_correct=@is_correct WHERE option_id=@optionId;";
                    cmd.Parameters.AddWithValue("@optionId", optionId);
                    cmd.Parameters.AddWithValue("@questionId", questionId);
                    cmd.Parameters.AddWithValue("@optionText", optionText);
                    cmd.Parameters.AddWithValue("@picture", picture);
                    cmd.Parameters.AddWithValue("@video", video);
                    cmd.Parameters.AddWithValue("@is_correct", is_correct);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
    }
}