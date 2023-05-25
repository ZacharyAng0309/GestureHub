using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestureHub.UtilClass
{
    public class BaseAdminPage : UtilClass.BasePage
    {
        protected new void Page_PreInit(object sender, EventArgs e)
        {
            SetUserType();
            SetMasterPageFile();
            if (userType == "nobody")
            {
                Response.Redirect("~/Home.aspx");
                return;
            }
            if (userType == "student")
            {
                RedirectBack();
                return;
            }
        }
    }
}