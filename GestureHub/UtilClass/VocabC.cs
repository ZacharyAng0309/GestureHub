using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Xml.Linq;
using System.Web.Services.Description;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Windows.Forms.VisualStyles;

namespace GestureHub.UtilClass
{
    public static class VocabC
    {
        public static Panel DisplayVocab(string vocabId, int count)
        {
            //get vocab data
            DataTable vocabTable = GetVocabData(vocabId);
            DataRow vocab = vocabTable.Rows[0];
            Panel row = new Panel {
                CssClass="accordion-item"
            };
            Panel header = new Panel
            {
                CssClass="accordion-header"
            };
            var button = new HtmlGenericControl("div");
            button.Attributes["class"] = "accordion-button";
            button.InnerHtml = vocab["term"].ToString();
            button.ID = "button" + count.ToString();
            button.Attributes["data-bs-toggle"] = "collapse";
            button.Attributes["data-bs-target"] = "#MainContent_MainContent_collapse" + count.ToString();
            button.Attributes["aria-expanded"] = "true";
            button.Attributes["aria-controls"] = "MainContent_MainContent_collapse" + count.ToString();
            Panel collapse = new Panel
            {
                CssClass="accordion-collapse collapse show",
                ID="collapse" + count.ToString()
            };
            Panel body = new Panel
            {
                CssClass="accordion-body"
            };
            Label label = new Label
            {
                Text= vocab["description"].ToString()
            };

            // image
            if (vocab["image"].ToString() != "")
            {
                Image image = new Image
                {
                    ImageUrl = "/Images/"+vocab["image"].ToString(),
                    CssClass = "vocab-image"
                };
                body.Controls.Add(image);
            }
            // video
            if (vocab["video"].ToString() != "")
            {
                //create an iframe element
                //HtmlGenericControl vocabVideo = new HtmlGenericControl("iframe")
                //{
                //    ID = $"video_{vocabId}",
                //    Attributes = {
                //            ["src"] = vocab["video"].ToString(),
                //            ["allowfullscreen"] = "true"
                //        }
                //};
                //body.Controls.Add(vocabVideo);
            }
            row.Controls.Add(header);
            header.Controls.Add(button);
            row.Controls.Add(collapse);
            collapse.Controls.Add(body);
            body.Controls.Add(label);
            //
            return row;
        }

        public static void addVocab(string vocabId, string courseId, string term, string description, string image, string video)
        {
            //add vocab to database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    //Create insert command to add user into database
                    cmd.CommandText = "INSERT INTO vocabulary(vocabulary_id, course_id, term, description, image, video) VALUES(@vocabId, @vocabId, @term, @description, @image, @video)";
                    cmd.Parameters.AddWithValue("@vocabId", vocabId);
                    cmd.Parameters.AddWithValue("@vocabId", courseId);
                    cmd.Parameters.AddWithValue("@term", term);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@image", image);
                    cmd.Parameters.AddWithValue("@video", video);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

        public static void UpdateVocab(string vocabId, string courseId, string term, string description, string image, string video) { 
            //update vocab in database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    //Create insert command to add user into database
                    cmd.CommandText = "UPDATE vocabulary SET course_id=@vocabId, term=@term, description=@description, image=@image, video=@video WHERE vocabulary_id=@vocabId";
                    cmd.Parameters.AddWithValue("@vocabId", vocabId);
                    cmd.Parameters.AddWithValue("@vocabId", courseId);
                    cmd.Parameters.AddWithValue("@term", term);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@image", image);
                    cmd.Parameters.AddWithValue("@video", video);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }   
        }

        public static void DeleteVocab(string vocabId) {
            //delete vocab in database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    //Create insert command to add user into database
                    cmd.CommandText = "DELETE FROM vocabulary WHERE vocabulary_id=@vocabId";
                    cmd.Parameters.AddWithValue("@vocabId", vocabId);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

        public static DataTable GetVocabData(string vocabId) {
            //get vocab data from database
            DataTable dt = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    //Create insert command to add user into database
                    cmd.CommandText = "SELECT * FROM vocabulary WHERE vocabulary_id=@vocabId";
                    cmd.Parameters.AddWithValue("@vocabId", vocabId);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                conn.Close();
            }
            return dt;
        }
    }
}