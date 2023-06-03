using GestureHub.UtilClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestureHub.Member
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get course id from query string
            string courseId = Request.QueryString["course_id"];
            //get user id from session
            string userId = Session["userid"].ToString();
            MemberIdFeedback.Text = userId;
            CourseIdFeedback.Text = courseId;
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            //get values from input fields
            string userId = Session["userid"].ToString();
            string courseId = CourseIdFeedback.Text;
            string feedback = CommentsFeedback.Text;
            //insert feedback into database
            FeedbackC.InsertFeedback(userId, courseId, feedback);
            //set success message
            MsgLabel.Visible = true;
            MsgPanel.CssClass = "alert alert-success alert-dismissible fade show";
            MsgLabel.Text = "Feedback submitted successfully";
            MsgLabel.ForeColor = System.Drawing.Color.Green;
        }
    }
}