using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace GestureHub
{
    public static class UserC
    {
        //public static void Unenroll(int student_id, int course_id)
        //{
        //    DataTable courseTable = CourseC.GetCourseData(course_id);
        //    if (courseTable.Rows.Count == 0)
        //    {
        //        return;
        //    }

        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "DELETE enroll WHERE course_id=@course_id AND student_id=@student_id;";
        //            cmd.Parameters.AddWithValue("@course_id", course_id);
        //            cmd.Parameters.AddWithValue("@student_id", student_id);
        //            cmd.ExecuteNonQuery();
        //            cmd.Parameters.Clear();

        //            cmd.CommandText = "DELETE rating WHERE course_id=@course_id AND student_id=@student_id;";
        //            cmd.Parameters.AddWithValue("@course_id", course_id);
        //            cmd.Parameters.AddWithValue("@student_id", student_id);
        //            cmd.ExecuteNonQuery();
        //            cmd.Parameters.Clear();

        //            cmd.CommandText = "DELETE grade WHERE exam_id IN (SELECT exam_id FROM exam WHERE course_id=@course_id) AND student_id=@student_id;";
        //            cmd.Parameters.AddWithValue("@course_id", course_id);
        //            cmd.Parameters.AddWithValue("@student_id", student_id);
        //            cmd.ExecuteNonQuery();
        //            cmd.Parameters.Clear();
        //        }
        //        conn.Close();
        //    }
        //}

        //public static void Enroll(int student_id, int course_id)
        //{
        //    DataTable courseTable = CourseC.GetCourseData(course_id);
        //    if (courseTable.Rows.Count == 0)
        //    {
        //        return;
        //    }

        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "INSERT INTO [enroll] (student_id, course_id) VALUES (@student_id, @course_id)";
        //            cmd.Parameters.AddWithValue("@student_id", student_id);
        //            cmd.Parameters.AddWithValue("@course_id", course_id);
        //            cmd.ExecuteNonQuery();
        //        }
        //        conn.Close();
        //    }
        //}

        public static DataRow GetUserData(string userId)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection conn = GestureHub.DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM users WHERE user_id=@userId;";
                    cmd.Parameters.AddWithValue("@userId", userId);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dataTable);
                    }
                }
                conn.Close();
            }
            if (dataTable.Rows.Count > 0)
            {
                return dataTable.Rows[0];
            }
            return null;
        }

        //public static List<int> GetEnrolledCourseID(int student_id)
        //{
        //    List<int> course_id_list = new List<int>();
        //    using (SqlConnection conn = DatabaseManager.CreateConnection())
        //    {
        //        conn.Open();
        //        using (SqlCommand cmd = new SqlCommand())
        //        {
        //            cmd.Connection = conn;
        //            cmd.CommandText = "SELECT course_id FROM enroll WHERE userId=@userId;";
        //            cmd.Parameters.AddWithValue("@userId", student_id);
        //            using (SqlDataReader reader = cmd.ExecuteReader())
        //            {
        //                while (reader.Read())
        //                {
        //                    course_id_list.Add(Convert.ToInt32(reader["course_id"]));
        //                }
        //            }
        //        }
        //        conn.Close();
        //    }
        //    return course_id_list;
        //}

        //public static bool IsEnrolled(int student_id, int course_id)
        //{
        //    List<int> course_id_list = GetEnrolledCourseID(student_id);
        //    if (course_id_list.Contains(course_id))
        //    {
        //        return true;
        //    }
        //    return false;
        //}

        public static DataTable GetQuizResult(int userId)
        {
            DataTable result = new DataTable();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT * FROM quizresult WHERE userId=@userId;";
                    cmd.Parameters.AddWithValue("@userId", userId);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        sda.SelectCommand = cmd;
                        sda.Fill(result);
                    }
                }
                conn.Close();
            }
            return result;
        }

        public static int GetUserCount()
        {
            int count;
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT COUNT(*) FROM [user] WHERE role = 'member';";
                    var result = cmd.ExecuteScalar();
                    count = Convert.ToInt32(result);
                }
                conn.Close();
            }
            return count;
        }

        public static int GetUserCountByGender(string gender)
        {
            int count;
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT COUNT(*) FROM [user] WHERE gender=@gender;";
                    cmd.Parameters.AddWithValue("@gender", gender);
                    var result = cmd.ExecuteScalar();
                    count = Convert.ToInt32(result);
                }
                conn.Close();
            }
            return count;
        }

        public static int GetUserCountByRole(string role)
        {
            int count;
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT COUNT(*) FROM [user] WHERE user_role=@role;";
                    cmd.Parameters.AddWithValue("@role", role);
                    var result = cmd.ExecuteScalar();
                    count = Convert.ToInt32(result);
                }
                conn.Close();
            }
            return count;
        }

        public static List<string> GetUserIdList()
        {
            List<string> userIdList = new List<string>();
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT user_id FROM [users];";
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            userIdList.Add(reader["user_id"].ToString());
                        }
                    }
                }
                conn.Close();
            }
            return userIdList;
        }
        public static void addUser(string username, string email, string password, string fname, string lname, string age, string gender, string role) {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    //Create insert command to add user into database
                    cmd.CommandText = "INSERT INTO users(username, email, password, fname, lname, age, gender, role,created_at, updated_at) VALUES(@uname, @email, @pass, @fname, @lname, @age, @gender, @role,@created_at,@updated_at)";
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@fname", fname);
                    cmd.Parameters.AddWithValue("@lname", lname);
                    cmd.Parameters.AddWithValue("@age", age);
                    cmd.Parameters.AddWithValue("@created_at", DateTime.Now);
                    cmd.Parameters.AddWithValue("@updated_at", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }


        // a function to update user details into the database
        public static void updateUser(string userId,string username, string email, string password, string fname, string lname, string age, string gender, string role)
        {
            //update the user into the database according to the userId
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    //update the user details into the database
                    cmd.CommandText = "UPDATE [users] SET username=@username, email=@email,"
                        + "password=@password, first_name=@fname, last_name=@lname, age=@age, updated_at=@datetime WHERE user_id=@userId;";
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@fname", fname);
                    cmd.Parameters.AddWithValue("@lname", lname);
                    cmd.Parameters.AddWithValue("@age", age);
                    cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

        // a function to check if a username is unique by checking if it is already in the database
        public static bool isUsernameUnique(string username)
        {
            //create a boolean variable to store the result
            bool isUnique = false;
            //create a list to store the username from the database
            List<string> usernameList = new List<string>();
            //get the username from the database
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    //get the username from the database
                    cmd.Connection = conn;
                    cmd.CommandText = "SELECT username FROM [users];";
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            usernameList.Add(reader["username"].ToString());
                        }
                    }
                }
                conn.Close();
            }
            //check if the username is unique by looping the  usernameList
            foreach (string usernameFromList in usernameList)
            {
                //if the username is found in the database, set the isUnique to false
                if (usernameFromList.Equals(username))
                {
                    isUnique = false;
                    break;
                }
                //if the username is not found in the database, set the isUnique to true
                else
                {
                    isUnique = true;
                }
            }
            return isUnique;
        }

        public static int GetNewUserId()
        {
            //get current user count
            int count = GetUserCount();
            return count + 1;
        }

        public static void DeleteUser(string userId) {
            //delete the user from the database according to the userId
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    //delete the user from the database
                    cmd.Connection = conn;
                    cmd.CommandText = "DELETE FROM [users] WHERE user_id=@userId;";
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
            }
        }

    }
}