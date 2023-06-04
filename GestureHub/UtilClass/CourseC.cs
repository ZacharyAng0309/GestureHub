using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using AngleSharp.Css.Dom;
using GestureHub.UtilClass;

namespace GestureHub
{
    public static class CourseC
    {
        public static Panel DisplayCourse(string courseId, string userRole)
        {
            DataTable courseTable = CourseC.GetCourseData(courseId);
            if (courseTable.Rows.Count == 0) return null;
            DataRow dr = courseTable.Rows[0];
            Panel colPanel = new Panel
            {
                CssClass = "col-lg-5 course-container d-flex align-items-evenly",
            };

            Panel cPanel = new Panel
            {
                CssClass = "card mb-3 course-card flex-fill",
            };
            colPanel.Controls.Add(cPanel);

            Panel rowInCard = new Panel
            {
                CssClass = "row g-0 flex-grow-1",
            };
            cPanel.Controls.Add(rowInCard);

            Panel imgCol = new Panel
            {
                CssClass = "col-md-4",
            };

            rowInCard.Controls.Add(imgCol);

            Image thumbnail = new Image
            {
                ImageUrl = "../Images/GestureHubLogo.png",
                //ImageUrl = "/Images/loading.gif",
                CssClass = "cover img-fluid rounded-start course-img",
                AlternateText = "Thumbnail Image",
            };
            thumbnail.Attributes.Add("onload", $"javascript:this.onload=null;this.src='../Images/" + dr["image"] +"'");
            //thumbnail.Attributes.Add("onload", $"javascript:this.onload=null;this.src='/upload/thumbnail/{dr["thumbnail"]}'");
            imgCol.Controls.Add(thumbnail);

            Panel detailCol = new Panel
            {
                CssClass = "col-md-8",
            };
            rowInCard.Controls.Add(detailCol);

            Panel detail = new Panel
            {
                CssClass = "course-detail-container card-body mb-3",
            };
            detailCol.Controls.Add(detail);
            HyperLink title;
            if (userRole.Equals("admin"))
            {
                title = new HyperLink
                {

                    NavigateUrl = $"/Admin/CourseOverview.aspx?courseId={courseId}",
                    Text = dr["title"].ToString(),
                    CssClass = "course-title card-title fs-4 mb-1 item-align-center ",
                };
            }
            else if (userRole.Equals("member"))
            {
                title = new HyperLink
                {

                    NavigateUrl = $"/Member/CourseOverview.aspx?courseId={courseId}",
                    Text = dr["title"].ToString(),
                    CssClass = "course-title card-title fs-4 mb-1 text-center",
                };
            }
            else
            {
                title = new HyperLink
                {

                    NavigateUrl = $"CourseOverview.aspx?courseId={courseId}",
                    Text = dr["title"].ToString(),
                    CssClass = "course-title card-title fs-4 mb-1",
                };
            }
            detail.Controls.Add(title);
            detail.Controls.Add(new Literal { Text = "<br />" });

            //double overallRating = CourseC.GetCourseOverallRating(course_id);
            //int ratingCount = CourseC.GetCourseRatingCount(course_id);
            //Label rating = new Label
            //{
            //    Text = $"Rating: {overallRating:0.00}/5.00 ({ratingCount})",
            //};
            //detail.Controls.Add(rating);
            //Panel categoryPanel = new Panel
            //{
            //    CssClass = "course-category mb-3"
            //};
            //detail.Controls.Add(categoryPanel);

            //foreach (DataRow categoryRow in courseCatTable.Rows)
            //{
            //    Label cat = new Label
            //    {
            //        Text = categoryRow["name"].ToString(),
            //        CssClass = "course-category-item badge rounded-pill bg-secondary",
            //    };
            //    categoryPanel.Controls.Add(cat);
            //}

            Panel linkBtnGroup = new Panel
            {
                CssClass = "btn-group btn-group-md"
            };
            linkBtnGroup.Attributes.Add("role", "group");
            linkBtnGroup.Attributes.Add("aria-label", "Course Button Group");

            if (userRole.Equals("admin"))
            {
               

                HyperLink editLink = new HyperLink
                {
                    Text = "Edit Course",
                    NavigateUrl = $"/Admin/EditCourse.aspx?courseId={courseId}",
                    CssClass = "btn btn-primary btn-sm mt-4",
                };
                linkBtnGroup.Controls.Add(editLink);
                HyperLink delLink = new HyperLink
                {
                    Text = "Delete Course",
                    NavigateUrl = $"~/Admin/DeleteCourse.aspx?courseId={courseId}",
                    CssClass = "btn btn-danger btn-sm mt-4 ml-2",
                };
                delLink.Attributes.Add("data-action", "warn");
                linkBtnGroup.Controls.Add(delLink);
            }
            else if (userRole.Equals("member"))
            {
                HyperLink navLink = new HyperLink
                {
                    Text = "View",
                    NavigateUrl = $"/Member/CourseOverview.aspx?courseId={courseId}",
                    CssClass = "btn btn-primary btn-sm mt-4",
                };
                linkBtnGroup.Controls.Add(navLink);


            }
            else
            {
                HyperLink viewLink = new HyperLink
                {
                    NavigateUrl = $"/CourseOverview.aspx?courseId={courseId}",
                    Text = "View Course",
                    CssClass = "btn btn-primary btn-sm mt-4",
                };
                linkBtnGroup.Controls.Add(viewLink);

              
            }

            detail.Controls.Add(linkBtnGroup);
            return colPanel;
        }

        public static Panel DisplayCourseVocab(string courseId)
        {
            //get vocab list from database
            List<string> vocabIdList = CourseC.GetVocabIdList(courseId);
            Panel vocabPanel = new Panel
            {
                CssClass = "accordion",
            };
            int count = 1;
            //loop the vocabIdList and display the vocab
            foreach (string vocabId in vocabIdList)
            {
                Panel vocab = VocabC.DisplayVocab(vocabId,count);
                vocabPanel.Controls.Add(vocab);
                count++;
            }
            return vocabPanel;

        }

        public static Panel DisplayCoursesByDifficulty(string difficulty, string usertype)
        {
            //get the courseId by difficulty
            List<string> courseIdList = CourseC.GetCourseIdByDifficulty(difficulty);

            Panel row = new Panel
            {
                CssClass = "row justify-content-evenly py-2",
            };
            //for each courseId, display the course
            foreach (string courseId in courseIdList)
            {
                Panel course = CourseC.DisplayCourse(courseId, usertype);
                if (course != null)
                {
                    row.Controls.Add(course);
                }
            }
            return row;
        }

        public static List<string> GetCourseIdByDifficulty(string difficulty)
        {
            //get the list of courseId from the database by difficulty
            List<string> courseIdList = new List<string>();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT course_id FROM course WHERE difficulty=@difficulty";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@difficulty", difficulty);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            courseIdList.Add(reader.GetInt32(0).ToString());
                        }
                    }
                }
                conn.Close();
                return courseIdList;
            }
        }

        public static DataTable GetAllCourseData()
        {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM course ORDER BY [title]";
                    cmd.Connection = conn;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        sda.SelectCommand = cmd;
                        DataTable dataTable = new DataTable();
                        sda.Fill(dataTable);
                        conn.Close();
                        return dataTable;
                    }
                }
            }
        }
        public static DataTable GetCourseData(string courseId)
        {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM course WHERE course_id=@courseId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@courseId", courseId);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        sda.SelectCommand = cmd;
                        DataTable dataTable = new DataTable();
                        sda.Fill(dataTable);
                        conn.Close();
                        return dataTable;
                    }
                }
            }
        }
        public static List<string> GetVocabIdList(string courseId)
        {
            List<string> vocabIdlist = new List<string>();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT vocabulary_id FROM vocabulary WHERE course_id=@courseId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@courseId", courseId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            vocabIdlist.Add(reader.GetInt32(0).ToString());
                        }
                    }
                }
                conn.Close();
                return vocabIdlist;
            }

        }

        //public static DataTable GetEnrolledCourseData(int student_id)
        //{
        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.CommandText = "SELECT * FROM [course] INNER JOIN [enroll] ON course.course_id = enroll.course_id WHERE enroll.student_id=@student_id";
        //            cmd.Connection = conn;
        //            cmd.Parameters.AddWithValue("@student_id", student_id);
        //            using (SqlDataAdapter sda = new SqlDataAdapter())
        //            {
        //                sda.SelectCommand = cmd;
        //                DataTable dataTable = new DataTable();
        //                sda.Fill(dataTable);
        //                conn.Close();
        //                return dataTable;
        //            }
        //        }
        //    }
        //}

        //public static DataTable GetCourseRating(int course_id)
        //{
        //    DataTable ratingTable = new DataTable();
        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "SELECT * FROM rating WHERE course_id=@course_id;";
        //            cmd.Parameters.AddWithValue("@course_id", course_id);
        //            using (SqlDataAdapter sda = new SqlDataAdapter())
        //            {
        //                sda.SelectCommand = cmd;
        //                sda.Fill(ratingTable);
        //            }
        //        }
        //        conn.Close();
        //    }
        //    return ratingTable;
        //}

        //public static double GetCourseOverallRating(int course_id)
        //{
        //    double rating = 0;
        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "SELECT ISNULL(AVG(CAST(rating as DECIMAL)), 0) FROM [rating] WHERE course_id=@course_id;";
        //            cmd.Parameters.AddWithValue("@course_id", course_id);
        //            var result = cmd.ExecuteScalar();
        //            rating = double.Parse(result.ToString());
        //        }
        //        conn.Close();
        //    }
        //    return rating;
        //}

        //public static int GetCourseRatingCount(int course_id)
        //{
        //    int count;
        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "SELECT COUNT(*) FROM [rating] WHERE course_id=@course_id;";
        //            cmd.Parameters.AddWithValue("@course_id", course_id);
        //            var result = cmd.ExecuteScalar();
        //            count = Convert.ToInt32(result);
        //        }
        //        conn.Close();
        //    }
        //    return count;
        //}

        //public static DataTable GetPopularCourseID()
        //{
        //    DataTable dataTable = new DataTable();
        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "SELECT course.courseId, ISNULL(AVG(CAST(rating AS DECIMAL)), 0) AS rate FROM course FULL JOIN [rating] ON course.courseId = rating.courseId GROUP BY course.courseId ORDER BY rate DESC;";
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

        public static int GetCourseCount()
        {
            int count;
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT COUNT(*) FROM [course];";
                    var result = cmd.ExecuteScalar();
                    count = Convert.ToInt32(result);
                }
                conn.Close();
            }
            return count;
        }

        public static void AddNewCourse(string title, string description, string difficulty)
        {
            string createdAt = DateTime.Now.ToString("dd/MM/yy hh:mm:ss");
            string updatedAt = DateTime.Now.ToString("dd/MM/yy hh:mm:ss");
            //Insert record into course table
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "INSERT INTO course (title, description, difficulty, createdAt, updatedAt) VALUES (@title, @description, @difficulty, @createdAt, @updatedAt)";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@difficulty", difficulty);
                    cmd.Parameters.AddWithValue("@createdAt", createdAt);
                    cmd.Parameters.AddWithValue("@updatedAt", updatedAt);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

        public static void UpdateCourse(string courseId, string title, string description, string difficulty)
        {
            //update course in the database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "UPDATE course SET title=@title, description=@description, difficulty=@difficulty,updated_at=@updatedAt WHERE course_id=@courseId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@courseId", courseId);
                    cmd.Parameters.AddWithValue("@title", title);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@difficulty", difficulty);
                    cmd.Parameters.AddWithValue("@updatedAt", DateTime.Now.ToString("dd/MM/yy hh:mm:ss"));
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

        public static List<string> GetCourseIdList()
        {
            //get all course id from database
            List<string> courseIdList = new List<string>();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT course_id FROM course";
                    cmd.Connection = conn;
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            courseIdList.Add(reader["course_id"].ToString());
                        }
                    }
                }
                conn.Close();
            }
            return courseIdList;
        }

        public static string GetNextCourseId()
        {
            return (CourseC.GetCourseCount() + 1).ToString();
        }

        public static void DeleteCourse(string courseId)
        {
            //delete the course from the course table in the database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "DELETE FROM course WHERE courseId=@courseId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@courseId", courseId);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
            //get quiz id from database that is with the course id
            string quizId = "";
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT quizId FROM quiz WHERE courseId=@courseId";
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@courseId", courseId);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            quizId = reader["quizId"].ToString();
                        }
                    }
                }
                conn.Close();
            }
            QuizC.DeleteQuiz(quizId);

        }


    }
}