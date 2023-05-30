<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditQuiz.aspx.cs" Inherits="GestureHub.AdminEditQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageQuiz.aspx">Manage Quiz</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Quiz</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Edit Quiz</h3>
        <form>
            <div class="form-group mb-2">
                <label for="quizIDField">Quiz ID:</label>
                <input type="text" class="form-control" id="quizIDField" placeholder="Quiz ID" readonly>
            </div>
            <div class="form-group mb-2">
                <label for="titleField">Title:</label>
                <input type="text" class="form-control" id="titleField" placeholder="Insert title">
            </div>

            <div class="form-group mb-2">
                <label for="courseIDField">Course ID:</label>
                <input type="text" class="form-control" id="courseIDField" placeholder="Course ID" readonly>
            </div>
            <div class="form-group mb-4">
                <label for="descriptionField">Description:</label>
                <textarea class="form-control" id="descriptionField" rows="3"></textarea>
            </div>
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary col-md-4 me-3">Update</button>
                <a href="#" class="btn btn-secondary col-md-4">Back</a>
            </div>
        </form>
    </div>
</asp:Content>
