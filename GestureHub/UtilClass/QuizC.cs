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

        public static DataTable GetQuizData(int exam_id)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection conn = GestureHub.DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM exam WHERE exam_id=@exam_id;";
                    cmd.Parameters.AddWithValue("@exam_id", exam_id);
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
            int numOfAnswer = Question.GetAnswerID(question_id).Count;
            DataTable optTable = Question.GetQuestionOption(question_id);
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
    }
}