<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageQuizQuestion.aspx.cs" Inherits="GestureHub.Admin.ManageQuizQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Manage Course</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Manage Quiz Question</h3>
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-3 pe-0">
                        <select class="form-select" id="columnSelect" name="columnSelect">
                        </select>
                    </div>
                    <div class="col-md-9 ps-0">
                        <div class="d-flex">
                            <input type="text" class="form-control" id="search" name="search">
                            <button type="button" class="btn btn-primary" onclick="location.href='ManageQuizQuestion.aspx?Search=' + document.getElementById('search').value + '&Column=' + document.getElementById('columnSelect').value">Search</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2 ms-auto d-flex justify-content-end">
                <button type="button" onclick="location.href='AddUser.aspx'" class="btn btn-primary mb-3">Add Question</button>
            </div>
        </div>
         <form id="contentForm" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="question_id" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="question_id" HeaderText="Question ID" ReadOnly="True" SortExpression="question_id" />
                <asp:BoundField DataField="quiz_id" HeaderText="Quiz ID" SortExpression="quiz_id" />
                <asp:BoundField DataField="question" HeaderText="Question" SortExpression="question" />
                <asp:BoundField DataField="picture" HeaderText="Picture" SortExpression="picture" />
                <asp:BoundField DataField="video" HeaderText="Video" SortExpression="video" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <%# Eval("question_id","<a href=\"" + ResolveUrl("~/Admin/EditQuizQuestion.aspx?question_id={0}") + "\" class=\"btn btn-primary\">Edit</a>") %>
                        <asp:LinkButton CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this question?')" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
             =&quot;SqlDataSource1&quot; runat=&quot;server&quot; ConnectionString=&quot;&lt;%$ ConnectionStrin<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [question]"></asp:SqlDataSource>
    </form>
    </section>
   
    <script>
        using(SqlConnection connection = new SqlConnection(connectionString))
        {
            // Open the connection
            connection.Open();

            // Get all columns from the table in the database
            SqlCommand cmd = new SqlCommand("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'QuizQuestion'", connection);
            SqlDataReader reader = cmd.ExecuteReader();

            // Populate the options with the column names
            while (reader.Read()) {
                string columnName = reader.GetString(0);
                this.columnSelect.Items.Add(new ListItem(columnName));
            }

            // Close the reader and connection
            reader.Close();
            connection.Close();
        }
    </script>
</asp:Content>
