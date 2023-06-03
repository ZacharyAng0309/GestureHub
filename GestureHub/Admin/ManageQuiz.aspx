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
        <section class="container shadow rounded-3 p-4 mb-5 bg-white">
            <h3 class="mb-3">Manage Quiz</h3>
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-4 pe-0">
                            <asp:DropDownList runat="server" ID="ColumnSelect" CssClass="form-select" name="ColumnSelect">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-8 ps-0">
                            <div class="d-flex">
                                <asp:TextBox runat="server" ID="SearchQuizBox" CssClass="form-control" name="Search"></asp:TextBox>
                                <asp:Button runat="server" ID="searchButton" CssClass="btn btn-primary" OnClick="SearchButton_Click" Text="Search" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="quiz_id" CssClass="table table-responsive table-bordered " AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="quiz_id" HeaderText="Quiz ID" InsertVisible="False" ReadOnly="True" SortExpression="quiz_id" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" SortExpression="course_id" />
                    <asp:BoundField DataField="title" HeaderText="Quiz Title" SortExpression="title" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <%# Eval("quiz_id","<a href=\"" + ResolveUrl("~/Admin/EditQuiz.aspx?quizId={0}") + "\" class=\"btn btn-primary\">Edit</a>") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pagination d-flex justify-content-center" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [quiz]"></asp:SqlDataSource>
        </section>
    </form>
</asp:Content>
