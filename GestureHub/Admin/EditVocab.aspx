<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditVocab.aspx.cs" Inherits="GestureHub.Admin.EditVocab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
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
    </form>
</asp:Content>
