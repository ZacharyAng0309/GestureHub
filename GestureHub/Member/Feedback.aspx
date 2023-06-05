<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="GestureHub.Member.Feedback" %>

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
                    <asp:TextBox ID="MemberIdFeedback"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="MemberID"
                        Required="required" CssClass="form-control"
                        Placeholder="MemberID"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>CourseID:</h5>
                    <asp:TextBox ID="CourseIdFeedback"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="CourseID"
                        Required="required" CssClass="form-control"
                        Placeholder="CourseID"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-12 col-md-12 mb-3">
                    <h5>Feedback/Comments:</h5>
                    <asp:TextBox ID="CommentsFeedback"
                        runat="server"
                        TextMode="multiLine"
                        ToolTip="Feedback"
                        Required="required" CssClass="form-control"
                        Placeholder="Feedback"></asp:TextBox>
                </div>
                <div class="row justify-content-between mb-3">
                    <asp:HyperLink ID="BtnBackToOverview" CssClass="btn btn-secondary align-items-center col-5" runat="server" NavigateUrl="~/Member/CourseOverview.aspx" Text="BACK" />
                    <asp:Button ID="BtnSubmit" CssClass="btn btn-success align-items-center col-5" runat="server" Text="SUBMIT" OnClick="BtnSubmit_Click" />
                </div>


            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>

    </div>
</asp:Content>
