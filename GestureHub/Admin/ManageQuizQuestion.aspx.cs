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

            if (!string.IsNullOrEmpty(column) && !string.IsNullOrEmpty(search))
            {
                SqlDataSource1.SelectCommand = "SELECT [QuestionID], [QuizID], [Question] FROM [QuizQuestion] WHERE Question like '%'+@Search+'%' and Column = @Column";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("Search", search);
                SqlDataSource1.SelectParameters.Add("Column", column);
            }
        }
    }
}