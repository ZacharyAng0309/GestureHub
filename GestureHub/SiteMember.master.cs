﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

namespace GestureHub
{
    public partial class SiteStudent : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var date =  DateTime.Now.ToString("dd/MM/yy");
            //int h = date.Hour;
            //string time = "";
            //if (h >= 6 && h < 12) time = "morning";
            //else if (h >= 12 && h < 18) time = "afternoon";
            //else if (h >= 18 && h < 22) time = "evening";
            //else if (h >= 22 || h < 6) time = "evening";
            //int student_id = Convert.ToInt32(Session["user_id"]);
            //DataRow studentData = UserC.GetUserData(student_id);
            //GreetingLbl.Text = $"Good {time}, {studentData["username"]}!";
        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("Home.aspx");
        }
    }
}