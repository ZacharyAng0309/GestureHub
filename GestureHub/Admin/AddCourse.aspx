<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="GestureHub.AdminAddCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item" aria-current="page">Manage Materials</li>
    <li class="breadcrumb-item"><a href="/Admin/ManageCourse.aspx">Manage Course</a></li>
    <li class="breadcrumb-item active" aria-current="page">Add Course</li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-5 pt-4 bg-white">
        <h3 class="mb-4">Add Course</h3>
        <form runat="server">
            <div class="row justify-content-around mb-4">
                <div class="col-md-12">
                    <div class="form-group mb-2">
                        <asp:Label runat="server" AssociatedControlID="idField">Course ID:</asp:Label>
                        <asp:TextBox runat="server" ID="idField" CssClass="form-control" placeholder="Course ID" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="form-group mb-2">
                        <asp:Label runat="server" AssociatedControlID="descriptionField">Description:</asp:Label>
                        <asp:TextBox runat="server" ID="descriptionField" CssClass="form-control" placeholder="Insert description"></asp:TextBox>
                    </div>
<%--                    <div class="form-group mb-2">
                        <asp:Label runat="server" AssociatedControlID="createdAtField">Created At:</asp:Label>
                        <asp:TextBox runat="server" ID="createdAtField" CssClass="form-control" placeholder="YYYY-MM-DD" ReadOnly="true"></asp:TextBox>
                    </div>--%>
                     <div class="form-group mb-2">
                        <asp:Label runat="server" AssociatedControlID="titleField">Title:</asp:Label>
                        <asp:TextBox runat="server" ID="titleField" CssClass="form-control" placeholder="Insert title"></asp:TextBox>
                    </div>
                    <div class="form-group mb-2">
                        <asp:Label runat="server" AssociatedControlID="difficultyField">Difficulty:</asp:Label>
                        <asp:DropDownList runat="server" ID="difficultyField" CssClass="form-control">
                            <asp:ListItem Text="Easy" Value="Easy"></asp:ListItem>
                            <asp:ListItem Text="Intermediate" Value="Intermediate"></asp:ListItem>
                            <asp:ListItem Text="Hard" Value="Hard"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="d-flex justify-content-between mt-4">
                        <asp:Button runat="server" Text="Add" CssClass="btn btn-success col-md-4 col-5 me-3" OnClick="AddButton_Click" />
                        <a href="/Admin/ManageCourse.aspx" class="btn btn-secondary col-md-4 col-5 me-3" >Back</a>
                    </div>
                </div>
                   
<%--                    <div class="form-group mb-2">
                        <asp:Label runat="server" AssociatedControlID="updatedAtField">Updated At:</asp:Label>
                        <asp:TextBox runat="server" ID="updatedAtField" CssClass="form-control" placeholder="YYYY-MM-DD" ReadOnly="true"></asp:TextBox>
                    </div>--%>
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>
    </div>
</asp:Content>
