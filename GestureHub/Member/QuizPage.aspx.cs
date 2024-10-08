﻿using System;
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
            //check if user is logged in
            if (Session["userId"] == null)
            {
                //redirect to login page
                Response.Redirect("~/Login.aspx");
            }
            //get courseId from query string
            string courseId = Request.QueryString["courseId"];
            if (courseId == null)
            {
                //redirect to home page
                Response.Redirect("~/Member/Courses.aspx");
            }
            //get quizId using courseId
            string quizId = QuizC.GetQuizId(courseId);

            //get quiz data
            DataTable quizData = QuizC.GetQuizData(quizId);
            //set title
            QuizTitle.Text = quizData.Rows[0]["title"].ToString();
            //set description
            QuizDescription.Text = quizData.Rows[0]["description"].ToString();
            //Insert into the panel
            QuestionPanel.Controls.Add(QuizC.DisplayQuiz(quizId));
        }

        protected void submitQuizButton_Click(object sender, EventArgs e)
        {
            //get courseId from query string
            string courseId = Request.QueryString["courseId"];
            //get quizId using courseId
            string quizId = QuizC.GetQuizId(courseId);
            //int score
            int score = 0;
            //get questionIds from the quizId
            List<string> questionIds = QuizC.GetQuestionIdList(quizId);
            //loop through questionIds
            foreach (string questionId in questionIds)
            {
                //get answerId from submitted form
                string answerId = Request.Form["ctl00$ctl00$MainContent$MainContent$question-" + questionId];
                if(answerId == null)
                {
                    //if answerId is null, skip this question
                    continue;
                }   
                List<string> correctAnswerIds = QuestionC.GetAnswerId(questionId);
                //check if answerId is in correctAnswerIds
                if (correctAnswerIds.Contains(answerId))
                {
                    //if answerId is in correctAnswerIds, increment score
                    score++;
                }
            }
            //get userId from session
            string userId = Session["userId"].ToString();
            //string userId = "1";
            //insert score into database
            QuizC.addQuizResult(userId, quizId, score.ToString());
            //change the panel to display the score
            QuestionPanel.Visible = false;
            //set submit button invinsible
            submitQuizButton.Visible = false;
            //set score label
            MsgLabel.Text = "Your score is " + score.ToString() + " out of " + questionIds.Count.ToString();
            if((score / questionIds.Count) > (0.4*questionIds.Count))
            {
                MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
                MsgLabel.ForeColor = System.Drawing.Color.Green;
                MsgLabel.Text += "<br/>You passed the quiz!";
            }
            else
            {
                MsgPanel.CssClass = "alert alert-danger alert-dismissible fade show";
                MsgLabel.ForeColor = System.Drawing.Color.Red;
                MsgLabel.Text += "<br/>You failed the quiz!";
            }
            MsgPanel.Visible = true;
        }
    }
}