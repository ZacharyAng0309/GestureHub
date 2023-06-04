using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class EditQuestionOption : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //get quizQuestionOption
                string questionOption = Request.QueryString["QuestionOption"];
                UpdateInputFields(questionOption);
            }
        }

        protected void UpdateInputFields(string questionOption)
        {
            //get QuestionOption data from database
            DataTable questionOptionTable = QuestionC.GetQuestionOptionData(questionOption);
            DataRow questionOptionData = questionOptionTable.Rows[0];
            OptionIdField.Text = questionOption;
        }
    }
}