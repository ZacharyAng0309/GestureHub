using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Admin
{
    public partial class DeleteQuizQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get quizQuestionOption
            string quizQuestionOption = Request.QueryString["quizQuestionOption"];
            //delete quizQuestionOption
            QuestionC.DeleteQuestionOption(quizQuestionOption);

        }
    }
}