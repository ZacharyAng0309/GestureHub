using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub
{
    public partial class AdminViewFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }

        }
    }
}