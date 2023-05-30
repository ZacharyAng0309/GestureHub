<%@ Page Title="" Language="C#" MasterPageFile="~/SiteStudent.master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="GestureHub.Member.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
     <li class="breadcrumb-item"><a href="/Member/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Member/Courses.aspx">Courses</a></li>
    <li class="breadcrumb-item"><a href="/Member/CourseOverview.aspx">CourseOverview</a></li>
  <li class="breadcrumb-item active" aria-current="page">Feedback</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <form id="form3" runat="server">
            <div class="row justify-content-evenly">
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Member ID:</h5>
                    <asp:TextBox ID="MemberIDFeedback" 
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Username"
                        Required="required" CssClass="form-control"
                        Placeholder="MemberID"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>CourseID:</h5>
                    <asp:TextBox ID="CourseIDFeedback"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Username"
                        Required="required" CssClass="form-control"
                        Placeholder="CourseID"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-12 col-md-12 mb-3">
                    <h5>Feedback/Comments:</h5>
                    <asp:TextBox ID="CommentsFeedback"
                        runat="server"
                        TextMode="multiLine"
                        ToolTip="Username"
                        Required="required" CssClass="form-control"
                        Placeholder="Feedback"></asp:TextBox>
                </div>
                  <div class="row justify-content-between">
                    <a href="/CourseOverview.aspx" class="btn btn-secondary align-items-center col-5">BACK</a>
                    <a href="#" class="btn btn-success align-items-center col-5">SUBMIT</a>
                </div>

               
            </div>
           
        </form>

    </div>
</asp:Content>
