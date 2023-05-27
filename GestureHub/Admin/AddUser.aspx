<%@ Page Title="Add User" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="GestureHub.AdminAddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
        <li class="breadcrumb-item"><a href="/Home.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Add User</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-5 bg-white">
        <h3 class="mb-3">Add User</h3>
        <form class="row justify-content-around">
            <div class="col-md-5">
                <div class="form-group mb-2">
                    <label for="idField">ID:</label>
                    <input type="text" class="form-control" id="idField" placeholder="User ID" readonly>
                </div>
                <div class="form-group mb-2">
                    <label for="firstNameField">First Name:</label>
                    <input type="text" class="form-control" id="firstNameField" placeholder="Insert first name">
                </div>
                <div class="form-group mb-2">
                    <label for="emailField">Email:</label>
                    <input type="text" class="form-control" id="emailField" placeholder="Insert email">
                </div>
                <div class="form-group mb-2">
                    <label for="genderField">Gender:</label>
                    <select class="form-control" id="genderField">
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </div>
                <div class="form-group mb-2">
                    <label for="roleField">Role:</label>
                    <select class="form-control" id="roleField">
                        <option>Admin</option>
                        <option>Member</option>
                    </select>
                </div>

            </div>
            <div class="col-md-5">
                <div class="form-group mb-2">
                    <label for="usernameField">Username:</label>
                    <input type="text" class="form-control" id="usernameField" placeholder="Insert username">
                </div>
                <div class="form-group mb-2">
                    <label for="lastNameField">Last Name:</label>
                    <input type="text" class="form-control" id="lastNameField" placeholder="Insert last name">
                </div>

                <div class="form-group mb-2">
                    <label for="passwordField">Password:</label>
                    <input type="password" class="form-control" id="passwordField" placeholder="Insert password">
                </div>
                <div class="form-group mb-2">
                    <label for="ageField">Age:</label>
                    <input type="text" class="form-control" id="ageField" placeholder="Insert age">
                </div>
                <div class="form-group mt-4 pt-2 row justify-content-around">
                    <button type="submit" class="btn btn-primary col-md-5">Add</button>
                    <a href="#" class="btn btn-secondary col-md-5">Back</a>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
