<%@ Page Title="Edit Course" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditCourse.aspx.cs" Inherits="GestureHub.AdminEditCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageCourse.aspx">Manage Course</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Course</li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-4">Edit Course</h3>
        <form>
            <div class="form-group mb-4">
                <label for="idField">Course ID:</label>
                <input type="text" class="form-control" id="idField" placeholder="Course ID" readonly>
            </div>
            <div class="form-group mb-4">
                <label for="descriptionField">Description:</label>
                <textarea class="form-control" id="descriptionField" rows="3"></textarea>
            </div>

            <div class="form-group mb-5">
                <label for="titleField">Title:</label>
                <input type="text" class="form-control" id="titleField" placeholder="Insert title">
            </div>
            <div class="form-group mt-3 mb-4">
                <label for="difficultyField">Difficulty:</label>
                <select class="form-control" id="difficultyField">
                    <option>Easy</option>
                    <option>Intermediate</option>
                    <option>Hard</option>
                </select>
            </div>

            <div class="row mb-4">
                <div class="form-group col-md-6 mb-4">
                    <label for="createdAtField">Created At:</label>
                    <input type="text" class="form-control" id="createdAtField" placeholder="YYYY-MM-DD" readonly>
                </div>
                <div class="form-group col-md-6 mb-4">
                    <label for="updatedAtField">Updated At:</label>
                    <input type="text" class="form-control" id="updatedAtField" placeholder="YYYY-MM-DD" readonly>
                </div>
            </div>
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary col-md-4 me-3">Update</button>
                <a href="#" class="btn btn-secondary col-md-4">Back</a>
            </div>
        </form>
    </div>
</asp:Content>
