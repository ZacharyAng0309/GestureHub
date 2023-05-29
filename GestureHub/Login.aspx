<%@ Page Title="Login" Language="C#" MasterPageFile="~/SiteAnon.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GestureHub.Login" ValidateRequest="false" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/togglePassword.js" defer></script>
</asp:Content>

<asp:Content ID="BreadContent" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Home.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Login</li>
</asp:Content>

<asp:Content ID="LoginContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h1 class="border-bottom mb-3">Login.</h1>
        <h6>Not a member? <a href="/Register.aspx">Create Account</a>
        </h6>
        <form id="form1" runat="server">
            <div class="form-floating mt-3">
                <asp:TextBox ID="UsernameTxtBox"
                    runat="server"
                    TextMode="SingleLine"
                    ToolTip="Username"
                    Required="required" CssClass="form-control"
                    Placeholder="Username"></asp:TextBox>
                <label for="<%= UsernameTxtBox.ClientID %>" class="text-muted">Username</label>
            </div>
            <div class="input-group mt-3">
                <div class="form-floating flex-grow-1">
                    <asp:TextBox ID="PasswordTxtBox"
                        runat="server"
                        TextMode="Password"
                        ToolTip="Password"
                        Required="required"
                        CssClass="form-control"
                        Placeholder="Password"></asp:TextBox>
                    <label for="<%= PasswordTxtBox.ClientID %>" class="text-muted">Password</label>
                </div>
                <span class="input-group-text"
                    data-toggle="passwordToggler"
                    data-toggle-class="bi-eye"
                    data-toggle-target="#<%= PasswordTxtBox.ClientID %>"
                    style="cursor: pointer;">
                    <i class="bi bi-eye-slash"></i>
                </span>
            </div>
            <div class="mt-3">
               <h6 class="mb-4"><a href="#">Forget Password?</a></h6>

                <div class="d-grid gap-2 col-6 mx-auto">
                    <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click" CssClass="btn btn-md btn-block text-white" Style="background-color: #6A5ACD;" />
                    <asp:Panel ID="ErrorPanel" runat="server" class="alert alert-danger mt-3" role="alert" Visible="false">
                        <asp:Label ID="ErrorLbl" runat="server" Text="Login credential is incorrect."></asp:Label>
                    </asp:Panel>
                </div>
            </div>
        </form>
    </div>

    <input type="hidden" id="NavLocation" value="login" disabled="disabled" />
    <script>
</script>
</asp:Content>
