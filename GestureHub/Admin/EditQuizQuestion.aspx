﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditQuizQuestion.aspx.cs" Inherits="GestureHub.Admin.AdminEditQuizQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Home</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageQuizQuestion.aspx">Manage Quiz Question</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Quiz Question</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Edit Quiz Question</h3>
        <form runat="server">
            <div class="form-group mb-4">
                <label for="questionIDField">Question ID:</label>
                <input type="text" class="form-control" id="questionIDField" placeholder="Question ID">
            </div>
            <div class="form-group mb-4">
                <label for="quizIDSelect">Quiz ID:</label>
                <select class="form-select" id="quizIDSelect">
                    <option value="" disabled selected>Select quiz ID</option>
                </select>
            </div>
            <div class="form-group mb-4">
                <label for="questionField">Question:</label>
                <textarea class="form-control" id="questionField" rows="3"></textarea>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PagerSettings-PageButtonCount="5" PagerSettings-Mode="NumericFirstLast" CssClass="table table-striped" AllowSorting="True" AllowInserts="True" DataKeyNames="option_id">
                    <Columns>
                        <asp:BoundField DataField="option_id" HeaderText="option_id" SortExpression="option_id" ReadOnly="True" />
                        <asp:BoundField DataField="question_id" HeaderText="question_id" SortExpression="question_id" />
                        <asp:BoundField DataField="option_text" HeaderText="option_text" SortExpression="option_text" />
                        <asp:BoundField DataField="picture" HeaderText="picture" SortExpression="picture" />
                        <asp:BoundField DataField="video" HeaderText="video" SortExpression="video" />
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5"></PagerSettings>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>"
                SelectCommand="SELECT * FROM [questionoption] WHERE question_id = @questionId">
                <SelectParameters>
                    <asp:QueryStringParameter Name="questionId" QueryStringField="id" />
                </SelectParameters>
            </asp:SqlDataSource>
        </form>
    </div>
</asp:Content>
