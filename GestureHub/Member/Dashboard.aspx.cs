using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Member
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get userid from session
            string userId = Session["userId"].ToString();
            //get user data from database
            DataRow user = UserC.GetUserData(userId);

            //set input fields
            MemberName.Text = user["username"].ToString();




        }

    }
}