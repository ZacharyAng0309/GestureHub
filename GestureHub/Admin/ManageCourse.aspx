<%@ Page Title="Manage Course" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageCourse.aspx.cs" Inherits="GestureHub.Admin.ManageCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
     <li class="breadcrumb-item" aria-current="page">Manage Materials</li>
    <li class="breadcrumb-item active" aria-current="page">Manage Course</li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="container shadow rounded-3 p-5 mb-5 bg-white">
            <h1 class="mb-3">Manage Course</h1>
            <asp:GridView ID="GridView1" class="table table-bordered table-responsive table-hover"
                runat="server" AutoGenerateColumns="False" DataKeyNames="course_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Width="1250px">
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" ReadOnly="True" SortExpression="course_id"/>
                    <asp:BoundField DataField="title" HeaderText="Course Title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="Course Description" SortExpression="description" />
                    <asp:BoundField DataField="difficulty" HeaderText="Course Difficulty" SortExpression="difficulty" />
                    <asp:BoundField DataField="created_at" HeaderText="Created At" SortExpression="created_at" />
                    <asp:BoundField DataField="updated_at" HeaderText="Updated At" SortExpression="updated_at" />
                    <asp:BoundField DataField="images" HeaderText="Thumbnails" SortExpression="images" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="AddCourseBtn" runat="server" Text="Add" href="/Admin/AddCourse.aspx" class="btn btn-primary"/>
                            <asp:Button ID="EditCourseBtn" runat="server" Text="Edit" OnClick="EditCourseBtn_Click" class="btn btn-success"/>
                            <asp:Button ID="DeleteCourseBtn" runat="server" Text="Delete" OnClick="DeleteCourseBtn_Click" class="btn btn-danger"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [course]"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
