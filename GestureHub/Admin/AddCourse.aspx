<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="GestureHub.AdminAddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="Admin/ManageCourse.aspx">Manage Course</a></li>
    <li class="breadcrumb-item active" aria-current="page">Add Course</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-5 pt-4 bg-white">
        <h3 class="mb-4">Add Course</h3>
        <form>
            <div class="row justify-content-around mb-3">
                <div class="col-md-5">
                    <div class="form-group mb-2">
                        <label for="idField">Course ID:</label>
                        <input type="text" class="form-control" id="idField" placeholder="Course ID" readonly>
                    </div>
                    <div class="form-group mb-2">
                        <label for="descriptionField">Description:</label>
                        <input type="text" class="form-control" id="descriptionField" placeholder="Insert description">
                    </div>
                    <div class="form-group mb-2">
                        <label for="createdAtField">Created At:</label>
                        <input type="text" class="form-control" id="createdAtField" placeholder="YYYY-MM-DD" readonly>
                    </div>
                    <div class="d-flex justify-content-center mt-4">
                        <button type="submit" class="btn btn-primary col-md-4 me-3">Add</button>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group mb-2">
                        <label for="titleField">Title:</label>
                        <input type="text" class="form-control" id="titleField" placeholder="Insert title">
                    </div>
                    <div class="form-group mb-2">
                        <label for="difficultyField">Difficulty:</label>
                        <select class="form-control" id="difficultyField">
                            <option>Easy</option>
                            <option>Intermediate</option>
                            <option>Hard</option>
                        </select>
                    </div>
                    <div class="form-group mb-2">
                        <label for="updatedAtField">Updated At:</label>
                        <input type="text" class="form-control" id="updatedAtField" placeholder="YYYY-MM-DD" readonly>
                    </div>
                    <div class="d-flex justify-content-center mt-4">
                        <a href="#" class="btn btn-secondary col-md-4">Back</a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
