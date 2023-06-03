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
        <form runat="server">
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="idField" readonly="true">Course ID:</asp:Label>
                <asp:DropDownList runat="server" CssClass="form-control" ID="idField" OnSelectedIndexChanged="IdField_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="descriptionField">Description:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="descriptionField" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>

            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="titleField">Title:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="titleField" placeholder="Insert title"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="difficultyField">Difficulty:</asp:Label>
                <asp:DropDownList runat="server" CssClass="form-control" ID="difficultyField">
                    <asp:ListItem>Easy</asp:ListItem>
                    <asp:ListItem>Intermediate</asp:ListItem>
                    <asp:ListItem>Hard</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="row mb-4">
                <div class="form-group col-md-6 mb-4">
                    <asp:Label runat="server" AssociatedControlID="createdAtField">Created At:</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="createdAtField" ReadOnly="true" placeholder="YYYY-MM-DD"></asp:TextBox>
                </div>
                <div class="form-group col-md-6 mb-4">
                    <asp:Label runat="server" AssociatedControlID="updatedAtField">Updated At:</asp:Label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="updatedAtField" ReadOnly="true" placeholder="YYYY-MM-DD"></asp:TextBox>
                </div>
            </div>
            <div class="d-flex justify-content-center">
                <asp:Button runat="server" CssClass="btn btn-primary col-md-4 me-3" Text="Update" OnClick="UpdateButton_Click" />
                <a href="/Admin/ManageCourse.aspx" class="btn btn-secondary col-md-4 me-3" >Back</a>
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>
    </div>
</asp:Content>
