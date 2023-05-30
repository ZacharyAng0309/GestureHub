<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="GestureHub.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageUser.aspx">Manage User</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit User</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-5 mb-5 bg-white">
        <h3 class="mb-3">Edit User</h3>
        <form runat="server">
            <div class="row justify-content-around mb-3">
                <div class="col-md-5">
                    <div class="form-group mb-2">
                        <label for="idField">ID:</label>
                        <asp:DropDownList runat="server" ID="idField" CssClass="form-control" OnSelectedIndexChanged="IdField_SelectedIndexChanged" AutoPostBack="true">
                        </asp:DropDownList>
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
                        <div class="input-group mb-3">
                            <asp:TextBox ID="passwordField" runat="server" CssClass="form-control input-mask" TextMode="password"></asp:TextBox>
                            <button type="button" id="passwordVisibilityToggle" class="input-group-text" onclick="togglePasswordVisibility()">
                                <i class="bi bi-eye-slash"></i>
                            </button>
                        </div>
                    </div>
                    <div class="form-group mb-2">
                        <label for="ageField">Age:</label>
                        <asp:TextBox runat="server" ID="ageField" CssClass="form-control" placeholder="Insert age"></asp:TextBox>
                    </div>
                    <div class="form-group mt-3 pt-2 d-flex justify-content-around">
                        <asp:Button runat="server" ID="updateButton" Text="Update" CssClass="btn btn-primary col-md-5" OnClick="updateButton_Click" />
                        <a href="#" runat="server" id="backButton" class="btn btn-secondary col-md-5">Back</a>
                    </div>
                </div>
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>
    </div>
    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById("MainContent_MainContent_passwordField");
            const passwordVisibilityToggle = document.getElementById("passwordVisibilityToggle");
            //check if passwordInput has class of input-mask
            if (passwordInput.classList.contains("input-mask")) {
                passwordInput.classList.remove("input-mask");
                passwordInput.type = "text";
                passwordVisibilityToggle.innerHTML = '<i class="bi bi-eye"></i>';
            } else {
                passwordInput.classList.add("input-mask");
                passwordInput.type = "password";
                passwordVisibilityToggle.innerHTML = '<i class="bi bi-eye-slash"></i>';
            }
        }
    </script>

</asp:Content>
