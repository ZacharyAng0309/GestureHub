using System;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class ManageQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //check if user is admin
            if (Session["userRole"] == null || Session["userRole"].ToString() != "admin")
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                string column = Request.QueryString["Column"];
                string search = Request.QueryString["Search"];

                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(column) && !string.IsNullOrEmpty(search))
                    {
                        SqlDataSource1.SelectCommand = "SELECT * FROM [question] WHERE " + column + " like '%" + search + "%'";
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
            string redirectUrl = "ManageQuizQuestion.aspx?Search=" + searchValue + "&Column=" + columnValue;
            Response.Redirect(redirectUrl);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow; // get reference to the selected row
            if (row != null) // check if a row is selected
            {
                string questionId = row.Cells[0].Text; // get the question_id from the first cell of the selected row
                QuestionC.DeleteQuestion(questionId); // delete the question with the question_id
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