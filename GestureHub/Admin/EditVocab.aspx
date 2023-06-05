<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditVocab.aspx.cs" Inherits="GestureHub.Admin.EditVocab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item text-primary">Manage Materials</li>
    <li class="breadcrumb-item"><a href="/Admin/ManageVocab.aspx">Manage Vocab</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Vocab</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container shadow rounded-3 p-5 mb-5 bg-white">
        <form runat="server">
            <h3>Edit Vocabulary</h3>
            <div class="form-group mb-2">
                <label for="VocabularyIdField">Vocabulary ID:</label>
                <asp:DropDownList runat="server" CssClass="form-control" ID="VocabularyIdField" OnSelectedIndexChanged="VocabularyIdField_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div class="form-group mb-2">
                <label for="CourseIdField">Course ID:</label>
                <asp:DropDownList runat="server" CssClass="form-control" ID="CourseIdField">
                </asp:DropDownList>
            </div>
            <div class="form-group mb-2">
                <label for="TermField">Vocabulary Term:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TermField"></asp:TextBox>
            </div>
            <div class="form-group mb-2">
                <label for="DescriptionField">Vocabulary Description:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="DescriptionField"></asp:TextBox>
            </div>
            <div class="form-group mb-2">
                <asp:Image ID="ImageField" runat="server" Style="width: 200px" CssClass="border border-4 rounded text-center" />
                <div class="mb-3 mt-3 col-md-6">
                    <h6>
                        <asp:Label ID="ImageLabel" AssociatedControlID="ImageUpload" runat="server" Text="Insert Image:"></asp:Label>
                    </h6>
                    <asp:FileUpload ID="ImageUpload" runat="server" CssClass="form-control" OnTextChanged="ImageUpload_TextChanged" />
                    <asp:Image ID="InsertedImage" runat="server" ImageUrl="~/image/image.png" CssClass="mt-2" Style="max-height: 200px; max-width: 100%;" Visible="false" />
                </div>
            </div>
            <div class="form-group mb-2">
                <label for="VideoUrlField">Video URL:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="VideoUrlField"></asp:TextBox>
            </div>
            <div class="form-group mb-2">
                <asp:Button ID="UpdateButton" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="UpdateButton_Click" />
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>
    </section>
</asp:Content>
