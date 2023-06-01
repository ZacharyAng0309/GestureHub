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
    public static class QuestionC
    {
        public static Panel DisplayQuetion(string questionId, DataRow questData, int total, int sequence, bool enable = true)
        {
            var optTable = GetQuestionOption(questionId);

            var qQuestionPanel = new Panel();
            qQuestionPanel.ID = $"pnl_{questionId}";

            RadioButtonList optList = new RadioButtonList
            {
                ID = $"optList_{questionId}",
                Enabled = enable,
            };
            optList.Attributes.Add("data-question-id", questionId.ToString());
            foreach (DataRow optData in optTable.Rows)
            {
                ListItem optListItem = new ListItem
                {
                    Text = optData["option_text"].ToString(),
                    Value = optData["option_id"].ToString(),
                };
                optList.Items.Add(optListItem);
            }
            qQuestionPanel.Controls.Add(optList);

            HiddenField correctOptId = new HiddenField
            {
                ID = $"correctOptId_{questionId}",
                Value = QuestionC.GetAnswerId(questionId).ToString(),
            };

            qQuestionPanel.Controls.Add(correctOptId);
            return qQuestionPanel;
            ////skeleton for the question panel
            //Panel qPanel = new Panel
            //{
            //    ID = $"qPanel_{questionId}",
            //};
            //qPanel.Attributes.Add("data-question-id", questionId);
            //Panel qNoPanel = new Panel
            //{
            //    ID = $"qNoPanel_{questionId}",
            //};
            //qPanel.Controls.Add(qNoPanel);
            //Literal questionNo = new Literal
            //{
            //    Text = $"<h5>Question {sequence} of {total}</h5>",
            //};
            //qNoPanel.Controls.Add(questionNo);

            ////skeleton for the question
            //Panel qQuestionPanel = new Panel
            //{
            //    ID = $"qQuestionPanel_{questionId}",
            //};
            //qPanel.Controls.Add(qQuestionPanel);
            //Literal question = new Literal
            //{
            //    Text = $"{questData["question"]}",
            //};
            //qQuestionPanel.Controls.Add(question);

            ////int numOfAnswer = QuestionC.GetAnswerId(questionId).Count;
            //DataTable optTable = QuestionC.GetQuestionOption(questionId);
            ////if (numOfAnswer > 1)
            ////{
            ////    CheckBoxList optList = new CheckBoxList
            ////    {
            ////        ID = $"optList_{questionId}",
            ////        Enabled = enable,
            ////    };
            ////    optList.Attributes.Add("data-question-id", questionId.ToString());
            ////    foreach (DataRow optData in optTable.Rows)
            ////    {
            ////        ListItem optListItem = new ListItem
            ////        {
            ////            Text = optData["option_text"].ToString(),
            ////            Value = optData["option_id"].ToString(),
            ////        };

            ////        optList.Items.Add(optListItem);
            ////    }
            ////    qQuestionPanel.Controls.Add(optList);
            ////}
            ////else
            ////{
            //    RadioButtonList optList = new RadioButtonList
            //    {
            //        ID = $"optList_{questionId}",
            //        Enabled = enable,
            //    };
            //    optList.Attributes.Add("data-question-id", questionId.ToString());
            //    foreach (DataRow optData in optTable.Rows)
            //    {
            //        ListItem optListItem = new ListItem
            //        {
            //            Text = optData["option_text"].ToString(),
            //            Value = optData["option_id"].ToString(),
            //        };
            //        optList.Items.Add(optListItem);
            //    }
            //    qQuestionPanel.Controls.Add(optList);
            ////add a hidden field of getting the correct option id with is_correct = true
            //HiddenField correctOptId = new HiddenField
            //{
            //    ID = $"correctOptId_{questionId}",
            //    Value = QuestionC.GetAnswerId(questionId).ToString(),
            //};

            ////}
            //return qPanel;
        }

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
        public static void DeleteQuestion(string questionId)
        {
            //Question.UpdateQueSequence(quiz_id, maxSeq, oldSeq);
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "DELETE questionoption WHERE questionId=@questionId;";
                    cmd.Parameters.AddWithValue("@questionId", questionId);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    cmd.CommandText = "DELETE question WHERE questionId=@questionId;";
                    cmd.Parameters.AddWithValue("@questionId", questionId);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }

        }

        public static DataTable GetQuestionData(string questionId)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM question WHERE questionId=@questionId;";
                    cmd.Parameters.AddWithValue("@questionId", questionId);
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



        public static DataTable GetQuestionOption(string questionId)
        {
            DataTable optionTable = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM questionoption WHERE questionId=@questionId;";
                    cmd.Parameters.AddWithValue("@questionId", questionId);
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

        public static List<string> GetAnswerId(string questionId)
        {
            List<string> answerIdList = new List<string>();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT option_id FROM [questionoption] WHERE questionId=@questionId AND is_correct='True';";
                    cmd.Parameters.AddWithValue("@questionId", questionId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            answerIdList.Add(reader["option_id"].ToString());
                        }
                    }
                }
                conn.Close();
            }
            return answerIdList;
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

        public static void addQuestionOption(string questionId, string optionText, string picture, string video, string is_correct) {
            //add question option into database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "INSERT INTO [option] (questionId, option_text, picture, video, is_correct) VALUES (@questionId, @optionText, @picture, @video, @is_correct);";
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
        public static void updateQuestionOption(string optionId, string questionId, string optionText, string picture, string video, string is_correct) { 
            //update question option into database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "UPDATE [option] SET questionId=@questionId, option_text=@optionText, picture=@picture, video=@video, is_correct=@is_correct WHERE option_id=@optionId;";
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