﻿using System;
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
        public static string ConnectionString = "DestureHubDatabase";
        public static SqlConnection CreateConnection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["GestureHubDatabase"].ConnectionString);
        }
    }
}