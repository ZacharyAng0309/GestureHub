using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

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

        public static DataTable GetQuizData(int quiz_id)
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
                    cmd.Parameters.AddWithValue("@quiz_id", quiz_id);
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

        public static Panel DisplayQue(int exam_id, DataRow questData, bool enable = true)
        {
            int question_id = int.Parse(questData["question_id"].ToString());
            Panel qPanel = new Panel
            {
                ID = $"qPanel_{question_id}",
            };
            qPanel.Attributes.Add("data-question-id", question_id.ToString());
            Panel qNoPanel = new Panel
            {
                ID = $"qNoPanel_{question_id}",
            };
            qPanel.Controls.Add(qNoPanel);
            Literal questionNo = new Literal
            {
                Text = $"<h5>Question {questData["sequence"]}</h5>",
            };
            qNoPanel.Controls.Add(questionNo);
            Panel qQuestionPanel = new Panel
            {
                ID = $"qQuestionPanel_{question_id}",
            };
            qPanel.Controls.Add(qQuestionPanel);
            Literal question = new Literal
            {
                Text = $"{questData["content"]}",
            };
            qQuestionPanel.Controls.Add(question);
            int numOfAnswer = QuestionC.GetAnswerID(question_id).Count;
            DataTable optTable = QuestionC.GetQuestionOption(question_id);
            if (numOfAnswer > 1)
            {
                CheckBoxList optList = new CheckBoxList
                {
                    ID = $"optList_{question_id}",
                    Enabled = enable,
                };
                optList.Attributes.Add("data-question-id", question_id.ToString());
                foreach (DataRow optData in optTable.Rows)
                {
                    ListItem optListItem = new ListItem
                    {
                        Text = optData["content"].ToString(),
                        Value = optData["option_id"].ToString(),
                    };
                    optList.Items.Add(optListItem);
                }
                qQuestionPanel.Controls.Add(optList);
            }
            else
            {
                RadioButtonList optList = new RadioButtonList
                {
                    ID = $"optList_{question_id}",
                    Enabled = enable,
                };
                optList.Attributes.Add("data-question-id", question_id.ToString());
                foreach (DataRow optData in optTable.Rows)
                {
                    ListItem optListItem = new ListItem
                    {
                        Text = optData["content"].ToString(),
                        Value = optData["option_id"].ToString(),
                    };
                    optList.Items.Add(optListItem);
                }
                qQuestionPanel.Controls.Add(optList);
            }
            return qPanel;
        }

        public static void addNewQuiz(String courseId, String title, String description)
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

        internal static DataRow GetQuizById(string quizId)
        {
            //get the quiz data from the database
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
            return dataTable.Rows[0];
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
            List<String> questionIdList = new List<String>();
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
            foreach (String questionId in questionIdList)
            {
                QuestionC.DeleteQuestion(questionId);
            }
        }       
    }
}