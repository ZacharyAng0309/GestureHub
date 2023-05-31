<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="GestureHub.AdminViewFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">View Feedback</li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1>View Feedback</h1>
        <form runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PagerSettings-PageButtonCount="5" PagerSettings-Mode="NumericFirstLast" CssClass="table table-striped" AllowSorting="True" DataKeyNames="feedback_id">
                <HeaderStyle CssClass="bg-dark"></HeaderStyle>
                <Columns>
                    <asp:BoundField DataField="feedback_id" HeaderText="Feedback ID" SortExpression="feedback_id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="user_id" HeaderText="User ID" SortExpression="user_id" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" SortExpression="course_id" />
                    <asp:BoundField DataField="feedback" HeaderText="Feedback" SortExpression="feedback" />
                    <asp:BoundField DataField="created_at" HeaderText="Created Date" SortExpression="created_at" />
                </Columns>
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5"></PagerSettings>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [feedback]"></asp:SqlDataSource>
        </form>
    </div>
</asp:Content>
