﻿using System;

namespace GestureHub
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Home.aspx");
        }
    }
}