<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageQuiz.aspx.cs" Inherits="GestureHub.Admin.ManageQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item" aria-current="page">Manage Materials</li>
    <li class="breadcrumb-item active" aria-current="page">Manage Quiz</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="container shadow rounded-3 p-5 mb-5 bg-white">
            <h1 class="mb-3">Manage Quiz</h1>
            <asp:GridView ID="GridView1" class="table table-bordered table-responsive table-hover"
                runat="server" AutoGenerateColumns="False" DataKeyNames="quiz_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Width="1250px" style="overflow:scroll;">
                <Columns>
                    <asp:BoundField DataField="quiz_id" HeaderText="Quiz ID" ReadOnly="True" SortExpression="quiz_id"/>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" SortExpression="course_id" />
                    <asp:BoundField DataField="title" HeaderText="Course Title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="Created At" SortExpression="description" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="AddQuizBtn" runat="server" Text="Add" href="/Admin/AddQuiz.aspx" class="btn btn-primary"/>
               <%--             <asp:Button ID="EditQuizBtn" runat="server" Text="Edit" OnClick="EditQuizBtn_Click" class="btn btn-success" />
                            <asp:Button ID="DeleteQuizBtn" runat="server" Text="Delete" OnClick="DeleteQuizBtn_Click" class="btn btn-danger" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [quiz]"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
