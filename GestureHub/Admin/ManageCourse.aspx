<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageCourse.aspx.cs" Inherits="GestureHub.Admin.ManageCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Manage Course</li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-5 mb-5 bg-white">
        <h1>Manage Course</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="course_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:BoundField DataField="course_id" HeaderText="course_id" ReadOnly="True" SortExpression="course_id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                <asp:BoundField DataField="difficulty" HeaderText="difficulty" SortExpression="difficulty" />
                <asp:BoundField DataField="created_at" HeaderText="created_at" SortExpression="created_at" />
                <asp:BoundField DataField="updated_at" HeaderText="updated_at" SortExpression="updated_at" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [course]"></asp:SqlDataSource>
    </div>
</asp:Content>
