﻿<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GestureHub.Admin.Profile" ValidateRequest="false" %>


<asp:Content ID="BreadContent" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item active" aria-current="page">Admin Profile</li>
</asp:Content>

<asp:Content ID="AdminProfContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">

        <form id="form2" runat="server">
            <div class="row justify-content-evenly">
                <div class="col-md-12 mb-3">
                    <h5>Profile Picture</h5>
                    <div class="col-md-12 mb-3">
                        <h5>Profile Picture</h5>
                        <asp:Image ID="ProfilePicture" runat="server" ImageUrl="boy1.png" Style="width: 200px" CssClass="border border-4 rounded text-center" />
                        <div class="mb-3 mt-3 col-md-6">
                            <h6>
                                <asp:Label ID="ImageLabel" AssociatedControlID="ImageUpload" runat="server" Text="Insert Image:"></asp:Label>
                            </h6>
                            <asp:FileUpload ID="ImageUpload" runat="server" CssClass="form-control" />
                            <asp:Image ID="InsertedImage" runat="server" ImageUrl="~/Images/image.png" CssClass="mt-2" Style="max-height: 200px; max-width: 100%;" />
                        </div>
                    </div>

                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>User ID:</h5>
                    <asp:TextBox ID="UserIDAdmin"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="UserID"
                        Required="required" CssClass="form-control"
                        Placeholder="UserID"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Username:</h5>
                    <asp:TextBox ID="UsernameAdmin"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Username"
                        Required="required" CssClass="form-control"
                        Placeholder="Username"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Email:</h5>
                    <asp:TextBox ID="EmailAdmin"
                        runat="server"
                        TextMode="Email"
                        ToolTip="Email"
                        Required="required" CssClass="form-control"
                        Placeholder="Email"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>First Name:</h5>
                    <asp:TextBox ID="FirstNameAdmin"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="First Name"
                        CssClass="form-control"
                        Placeholder="First Name"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Last Name:</h5>
                    <asp:TextBox ID="LastNameAdmin"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Last Name"
                        CssClass="form-control"
                        Placeholder="Last Name"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Updated Password:</h5>
                    <asp:TextBox ID="PasswordAdmin"
                        runat="server"
                        TextMode="Password"
                        ToolTip="Password"
                        Required="required" CssClass="form-control"
                        Placeholder="Updated Password"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Age:</h5>
                    <asp:TextBox ID="AgeAdmin"
                        runat="server"
                        TextMode="Number"
                        ToolTip="Age"
                        CssClass="form-control"
                        Placeholder="Age"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Gender:</h5>
                    <asp:DropDownList ID="GenderAdminDropDownList" runat="server" Required="required" CssClass="form-select">
                        <asp:ListItem Selected="False" Text="Male" Value="m"></asp:ListItem>
                        <asp:ListItem Selected="False" Text="Female" Value="f"></asp:ListItem>
                    </asp:DropDownList>

                </div>
                <div class="d-grid gap-2 col-3 mt-4">
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="btn btn-success btn-md btn-block" href="#" />

                </div>
                <div class="d-grid gap-2 col-3 mt-4">
                    <asp:Button ID="BackBtn" runat="server" href="/Member/Dashboard.aspx" Text="Back" CssClass="btn btn-secondary btn-md btn-block" />
                </div>

            </div>


        </form>

    </div>
</asp:Content>
