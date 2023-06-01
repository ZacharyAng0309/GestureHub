using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Member
{
    public partial class QuizPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get quizId from query string
            string quizId = Request.QueryString["quizId"];
            //get quiz data
            DataTable quizData = QuizC.GetQuizData(quizId);
            //set title
            QuizTitle.Text = quizData.Rows[0]["title"].ToString();
            //set description
            QuizDescription.Text = quizData.Rows[0]["description"].ToString();
            //get quiz from database
            QuizC.GetQuestionIdList(quizId);
            // loop the question id list and display the question
            foreach (string questionId in QuizC.GetQuestionIdList(quizId))
            {
                //display question
                Panel questionPanel = QuestionC.DisplayQuestion(questionId);
                //add question panel to the quiz panel
                QuizPanel.Controls.Add(questionPanel);
            }

        }
    }
}