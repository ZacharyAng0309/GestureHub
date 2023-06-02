using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            //if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            //{
            //    //redirect to login page
            //    Response.Redirect("~/Login.aspx");
            //}
            if (!IsPostBack)
            {
                string column = Request.QueryString["Column"];
                string search = Request.QueryString["Search"];

                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(column) && !string.IsNullOrEmpty(search))
                    {
                        SqlDataSource1.SelectCommand = "SELECT * FROM [users] WHERE " + column + " like '%" + search + "%'";
                        ColumnSelect.SelectedValue = column;
                        SearchBox.Text = search;
                    }
                }
            }
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchValue = SearchBox.Text;
            string columnValue = ColumnSelect.SelectedValue;
            Response.Write("<script>alert('" + searchValue + "');</script>");
            string redirectUrl = "ManageUser.aspx?Search=" + searchValue + "&Column=" + columnValue;
            Response.Redirect(redirectUrl);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //delete user with user_id from selected row
            GridViewRow row = GridView1.SelectedRow; // get reference to the selected row
            if (row != null) // check if a row is selected
            {
                UserC.DeleteUser(row.Cells[0].Text);
                //set success message
                MsgLabel.Visible = true;
                MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
                MsgLabel.Text = "User deleted successfully!";
                MsgLabel.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                // show error message
                MsgLabel.Visible = true;
                MsgPanel.CssClass = "alert alert-danger alert-dismissible fade show";
                MsgLabel.Text = "Please select a row to delete.";
                MsgLabel.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}