using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace GestureHub
{
    public static class DatabaseManager
    {
        public static string ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\APP_DATA\GestureHubDatabase.mdf;Integrated Security=True";
        public static SqlConnection CreateConnection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["GestureHubDatabase"].ConnectionString);
        }
    }
}