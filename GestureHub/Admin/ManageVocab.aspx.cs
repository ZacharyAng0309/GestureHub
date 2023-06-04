﻿using System;

namespace GestureHub.Admin
{
    public partial class ManageVocab : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string column = Request.QueryString["Column"];
                string search = Request.QueryString["Search"];
                if (!string.IsNullOrEmpty(column) && !string.IsNullOrEmpty(search))
                {
                    SqlDataSource1.SelectCommand = "SELECT * FROM [vocabulary] WHERE " + column + " like '%" + search + "%'";
                    ColumnSelect.SelectedValue = column;
                    SearchBox.Text = search;
                }
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchValue = SearchBox.Text;
            string columnValue = ColumnSelect.SelectedValue;
            Response.Write("<script>alert('" + searchValue + "');</script>");
            string redirectUrl = "ManageVocab.aspx?Search=" + searchValue + "&Column=" + columnValue;
            Response.Redirect(redirectUrl);
        }
    }
}