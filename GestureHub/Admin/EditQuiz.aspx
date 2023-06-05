<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditQuiz.aspx.cs" Inherits="GestureHub.AdminEditQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageQuiz.aspx">Manage Quiz</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Quiz</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Edit Quiz</h3>
        <form runat="server">
            <div class="form-group mb-2">
                <label for="quizIDField">Quiz ID:</label>
                <asp:DropDownList runat="server" CssClass="form-control" ID="quizIDField" OnSelectedIndexChanged="IdField_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div class="form-group mb-2">
                <label for="courseIdField">Course ID:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="courseIdField"
                    placeholder="Course ID" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group mb-2">
                <label for="titleField">Title:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="titleField" placeholder="Insert title"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <label for="descriptionField">Description:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="descriptionField" Rows="3"></asp:TextBox>
            </div>
            <div class="d-flex justify-content-center mb-3">
                <asp:Button runat="server" CssClass="btn btn-primary col-md-4 me-3"
                    Text="Update" OnClick="UpdateButton_Click"></asp:Button>
                <a href="~/Admin/ManageQuiz.aspx" class="btn btn-secondary col-md-4">Back</a>
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>
    </section>
</asp:Content>
