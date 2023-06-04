using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace GestureHub
{
    public static class QuestionC
    {
        public static Panel DisplayQuestion(string questionId, int count)
        {
            //get question data
            DataTable questData = GetQuestionData(questionId);
            DataTable optTable = GetQuestionOption(questionId);
            Panel questionPanel = new Panel
            {
                ID = $"question_{questionId}",
            };
            Panel questionTitleCol = new Panel();
            questionPanel.Controls.Add(questionTitleCol);
            Panel questionTitleHeader = new Panel();
            Literal question = new Literal
            {
                Text = $"<h5>Question {count}. {questData.Rows[0]["question"].ToString()}</h5>",
            };
            questionTitleHeader.Controls.Add(question);
            questionTitleCol.Controls.Add(questionTitleHeader);
            Panel questionTitleBody = new Panel();
            //check if the question has image
            if (questData.Rows[0]["image"] != DBNull.Value)
            {
                Image questionImage = new Image
                {
                    ImageUrl = $"../Images/{questData.Rows[0]["image"].ToString()}",
                    CssClass = "img-fluid",
                };
                questionTitleBody.Controls.Add(questionImage);
            }
            //check if the question has video
            if (!string.IsNullOrEmpty(questData.Rows[0]["video"].ToString()))
            {
                HtmlGenericControl questionVideo = new HtmlGenericControl("iframe")
                {
                    ID = $"video_{questionId}",
                    Attributes = {
                            ["src"] = questData.Rows[0]["video"].ToString(),
                            ["width"] = "100%",
                            ["height"] = "auto",
                            ["frameborder"] = "0",
                            ["allowfullscreen"] = "true"
                        }
                };
                questionTitleBody.Controls.Add(questionVideo);
            }
            questionTitleCol.Controls.Add(questionTitleBody);
            Panel questionOptCol = new Panel();
            RadioButtonList optList = new RadioButtonList
            {
                ID = $"question-{questionId}",
                Attributes =
                {
                    ["class"] = "list-group",
                    ["Group-name"] = "question-"+questionId.ToString(),
                }
            };
            optList.Attributes.Add("data-question-id", questionId.ToString());
            foreach (DataRow optData in optTable.Rows)
            {
                ListItem optListItem = new ListItem
                {
                    Text = optData["option_text"].ToString(),
                    Attributes =
                    {
                        ["name"]= "question-"+questionId.ToString(),
                    },
                    Value = optData["option_id"].ToString(),
                };
                //check if the option has picture
                if (optData["image"] != DBNull.Value)
                {
                    Image optImage = new Image
                    {
                        ImageUrl = $"../Images/{optData["image"].ToString()}",
                        CssClass = "img-fluid",
                    };
                    optListItem.Attributes.Add("data-image", optImage.ImageUrl);
                }
                //check if the option has video
                if (!string.IsNullOrEmpty(optData["video"].ToString()))
                {
                    HtmlGenericControl optVideo = new HtmlGenericControl("iframe")
                    {
                        ID = $"video_{questionId}",
                        Attributes = {
                            ["src"] = optData["video"].ToString(),
                            ["width"] = "100%",
                            ["height"] = "auto",
                            ["frameborder"] = "0",
                            ["allowfullscreen"] = "true"
                        }
                    };
                    optListItem.Attributes.Add("data-video", optVideo.Attributes["src"]);
                }
                optList.Items.Add(optListItem);
            }
            questionOptCol.Controls.Add(optList);
            questionPanel.Controls.Add(questionOptCol);
            //add jquery into the questionPanel
            return questionPanel;
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

        public static void AddQuestion(int quizId, string question, string type, string image, string video, string isCorrect)
        {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "INSERT INTO question (quiz_id,question, type, image, video, is_correct) VALUES (@quizId, @question, @type, @image, @video, @isCorrect);";
                    cmd.Parameters.AddWithValue("@quizId", quizId);
                    cmd.Parameters.AddWithValue("@question", question);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@image", image);
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
                    cmd.CommandText = "DELETE questionoption WHERE optionId=@optionId;";
                    cmd.Parameters.AddWithValue("@optionId", questionId);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    cmd.CommandText = "DELETE question WHERE optionId=@optionId;";
                    cmd.Parameters.AddWithValue("@optionId", questionId);
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
                    cmd.CommandText = "SELECT * FROM question WHERE question_id=@optionId;";
                    cmd.Parameters.AddWithValue("@optionId", questionId);
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
                    cmd.CommandText = "SELECT * FROM questionoption WHERE question_id=@optionId;";
                    cmd.Parameters.AddWithValue("@optionId", questionId);
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

        public static string GetAnswerId(string questionId)
        {
            string answerId = "";
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT option_id FROM questionoption WHERE question_id=@optionId AND is_correct='True';";
                    cmd.Parameters.AddWithValue("@optionId", questionId);
                    var result = cmd.ExecuteScalar();
                    if (result != null)
                        answerId = result.ToString();
                }
                conn.Close();
            }
            return answerId;
        }

        public static void DeleteQuestionOption(string optionId)
        {
            //Question.UpdateQueSequence(quiz_id, maxSeq, oldSeq);
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "DELETE questionoption WHERE option_id=@optionId;";
                    cmd.Parameters.AddWithValue("@optionId", optionId);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
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

        public static void addQuestionOption(string questionId, string optionText, string image, string video, string is_correct)
        {
            //add question option into database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "INSERT INTO [option] (optionId, option_text, image, video, is_correct) VALUES (@optionId, @optionText, @image, @video, @is_correct);";
                    cmd.Parameters.AddWithValue("@optionId", questionId);
                    cmd.Parameters.AddWithValue("@optionText", optionText);
                    cmd.Parameters.AddWithValue("@image", image);
                    cmd.Parameters.AddWithValue("@video", video);
                    cmd.Parameters.AddWithValue("@is_correct", is_correct);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
        public static void updateQuestionOption(string optionId, string questionId, string optionText, string image, string video, string is_correct)
        {
            //update question option into database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "UPDATE [option] SET optionId=@optionId, option_text=@optionText, image=@image, video=@video, is_correct=@is_correct WHERE option_id=@optionId;";
                    cmd.Parameters.AddWithValue("@optionId", optionId);
                    cmd.Parameters.AddWithValue("@optionId", questionId);
                    cmd.Parameters.AddWithValue("@optionText", optionText);
                    cmd.Parameters.AddWithValue("@image", image);
                    cmd.Parameters.AddWithValue("@video", video);
                    cmd.Parameters.AddWithValue("@is_correct", is_correct);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }
    }
}