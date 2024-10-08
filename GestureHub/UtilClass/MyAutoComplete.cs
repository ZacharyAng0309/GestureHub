﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace GestureHub
{
    public static class MyAutoComplete
    {
        public static List<string> ListCategory(string prefixText, int count)
        {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.CommandText = "SELECT name FROM category WHERE name LIKE @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    List<string> categories = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            categories.Add(sdr["name"].ToString());
                        }
                    }
                    conn.Close();
                    return categories;
                }
            }
        }
        public static List<string> ListCourseTitle(string prefixText, int count)
        {
            using (SqlConnection conn = DatabaseManager.CreateConnection())
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    conn.Open();
                    cmd.CommandText = "SELECT title FROM course WHERE title LIKE @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    cmd.Connection = conn;
                    List<string> categories = new List<string>();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            categories.Add(sdr["title"].ToString());
                        }
                    }
                    conn.Close();
                    return categories;
                }
            }
        }
    }
}