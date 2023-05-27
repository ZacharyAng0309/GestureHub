<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageQuizQuestion.aspx.cs" Inherits="GestureHub.Admin.ManageQuizQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Manage Course</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Manage Quiz Question</h3>
        <div class="row">
            <div class="input-group col-md-3 me-2 mb-3">
                <span class="input-group-text" for="columnSelect">Select Column:</span>
                <select class="form-select" id="columnSelect" name="columnSelect">
                    <option value="QuestionID">Question ID</option>
                    <option value="QuizID">Quiz ID</option>
                    <option value="Question">Question</option>
                </select>
            </div>
            <div class="input-group col-md-3 mb-3">
                <span class="input-group-text" for="search">Search:</span>
                <input type="text" class="form-control" id="search" name="search">
            </div>
        </div>
        <div class="mb-3">
            <button type="button" class="btn btn-primary" onclick="location.href='ManageQuizQuestion.aspx?QuizID=@QuizID&Search=' + document.getElementById('search').value + '&Column=' + document.getElementById('columnSelect').value">Search</button>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Add" PostBackUrl="~/AddQuizQuestion.aspx" CssClass="btn btn-primary mb-3" />
        <asp:Button ID="btnAddQuestion" runat="server" Text="Add" PostBackUrl="~/AddQuizQuestion.aspx" CssClass="btn btn-primary mb-3" />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="true">
            <asp:BoundField DataField="QuestionID" HeaderText="Question ID" SortExpression="QuestionID" />
            <asp:BoundField DataField="QuizID" HeaderText="Quiz ID" SortExpression="QuizID" />
            <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
            <asp:ButtonField ButtonType="Button" Text="Edit" CommandName="Edit" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [QuestionID], [QuizID], [Question] FROM [QuizQuestion] WHERE QuizID = @QuizID and Question like '%'+@Search+'%';">
            <asp:QueryStringParameter Name="QuizID" Type="Int32" />
            <asp:QueryStringParameter Name="Search" Type="String" />
        </asp:SqlDataSource>
    </div>
</asp:Content>
