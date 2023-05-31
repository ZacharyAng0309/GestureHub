using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            //if (Session["userType"] == null || Session["userType"].ToString() != "admin")
            //{
            //    //redirect to login page
            //    Response.Redirect("~/Login.aspx");
            //}
            //get number of admins
            int adminCount = UserC.GetUserCountByRole("admin");
            //insert the value of adminCount to the hidden field
            AdminNumberField.Value = adminCount.ToString();
            //get number of member
            int memberCount = UserC.GetUserCountByRole("member");
            //insert the value of memberCount to the hidden field
            MemberNumberField.Value = memberCount.ToString();
            //get number of male user
            int maleUserCount = UserC.GetUserCountByGender("M");
            //insert the value of maleUserCount to the hidden field
            MaleNumberField.Value = maleUserCount.ToString();
            //get number of female user
            int femaleUserCount = UserC.GetUserCountByGender("F");

        }
    }
}