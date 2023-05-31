<%@ Page Title="Add User" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="GestureHub.AdminAddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageUser.aspx">Manage User</a></li>
    <li class="breadcrumb-item active" aria-current="page">Add User</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-5 mb-5 bg-white">
        <h3 class="mb-3">Add User</h3>
        <form runat="server">
            <div class="row justify-content-around mb-4">
                <div class="col-md-5">
                    <div class="form-group mb-2">
                        <label for="idField">ID:</label>
                        <asp:TextBox runat="server" ID="idField" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group mb-2">
                        <label for="firstNameField">First Name:</label>
                        <asp:TextBox runat="server" ID="firstNameField" CssClass="form-control" placeholder="Insert first name"></asp:TextBox>
                    </div>
                    <div class="form-group mb-2">
                        <label for="emailField">Email:</label>
                        <asp:TextBox runat="server" ID="emailField" CssClass="form-control" placeholder="Insert email"></asp:TextBox>
                    </div>
                    <div class="form-group mb-2">
                        <label for="genderField">Gender:</label>
                        <asp:DropDownList runat="server" ID="genderField" CssClass="form-control">
                            <asp:ListItem Text="Male"></asp:ListItem>
                            <asp:ListItem Text="Female"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group mb-2">
                        <label for="roleField">Role:</label>
                        <asp:DropDownList runat="server" ID="roleField" CssClass="form-control">
                            <asp:ListItem Text="Admin"></asp:ListItem>
                            <asp:ListItem Text="Member"></asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>
                <div class="col-md-5">
                    <div class="form-group mb-2">
                        <label for="usernameField">Username:</label>
                        <asp:TextBox runat="server" ID="usernameField" CssClass="form-control" placeholder="Insert username"></asp:TextBox>
                    </div>
                    <div class="form-group mb-2">
                        <label for="lastNameField">Last Name:</label>
                        <asp:TextBox runat="server" ID="lastNameField" CssClass="form-control" placeholder="Insert last name"></asp:TextBox>
                    </div>

                    <div class="form-group mb-2">
                        <label for="passwordField">Password:</label>
                        <asp:TextBox runat="server" ID="passwordField" CssClass="form-control" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="form-group mb-2">
                        <label for="ageField">Age:</label>
                        <asp:TextBox runat="server" ID="ageField" CssClass="form-control" placeholder="Insert age"></asp:TextBox>
                    </div>
                    <div class="form-group mt-4 pt-2 row justify-content-around">
                        <asp:Button runat="server" ID="addButton" Text="Add" CssClass="btn btn-primary col-md-5" OnClick="addButton_Click" />
                        <a href="#" runat="server" id="backButton" cssclass="btn btn-secondary col-md-5">Back</a>
                    </div>
                </div>
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>
    </div>
</asp:Content>
