<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageCourse.aspx.cs" Inherits="GestureHub.Admin.ManageCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Manage Course</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Manage Course</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CourseID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <asp:BoundField DataField="CourseID" HeaderText="Course ID" InsertVisible="False" ReadOnly="True" SortExpression="CourseID" />
        <asp:BoundField DataField="CourseName" HeaderText="Title" SortExpression="CourseName" />
        <asp:BoundField DataField="CourseDescription" HeaderText="Description" SortExpression="CourseDescription" />
        <asp:BoundField DataField="CourseLevel" HeaderText="Difficulty" SortExpression="CourseLevel" />
        <asp:BoundField DataField="CreateDate" HeaderText="Created At" SortExpression="CreateDate" />
        <asp:BoundField DataField="UpdateDate" HeaderText="Updated At" SortExpression="UpdateDate" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CourseID], [CourseName], [CourseDescription], [CourseLevel], [CreateDate], [UpdatedDate] FROM [Course]"></asp:SqlDataSource>
</asp:Content>