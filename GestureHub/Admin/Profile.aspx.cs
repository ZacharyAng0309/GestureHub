using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            if (Session["userType"] == null || Session["userType"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}