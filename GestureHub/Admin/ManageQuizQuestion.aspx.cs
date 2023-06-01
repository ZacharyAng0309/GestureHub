using AngleSharp.Dom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class ManageQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string column = Request.QueryString["Column"];
            string search = Request.QueryString["Search"];

            if (!IsPostBack) {
                if (!string.IsNullOrEmpty(column) && !string.IsNullOrEmpty(search))
                {
                    SqlDataSource1.SelectCommand = "SELECT * FROM [question] WHERE " + column + " like '%" + search + "%'";
                    ColumnSelect.SelectedValue = column;
                    SearchBox.Text = search;
                }
            }
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchValue = SearchBox.Text;
            string columnValue = ColumnSelect.SelectedValue;
            Response.Write("<script>alert('"+searchValue+"');</script>");
            string redirectUrl = "ManageQuizQuestion.aspx?Search=" + searchValue + "&Column=" + columnValue;
            Response.Redirect(redirectUrl);
        }
    }
}