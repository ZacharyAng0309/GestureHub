using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class ManageQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchValue = SearchQuizBox.Text;
            string columnValue = ColumnSelect.SelectedValue;
            Response.Write("<script>alert('" + searchValue + "');</script>");
            string redirectUrl = "ManageQuiz.aspx?Search=" + searchValue + "&Column=" + columnValue;
            Response.Redirect(redirectUrl);
        }
    }
}