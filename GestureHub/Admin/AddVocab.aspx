<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="AddVocab.aspx.cs" Inherits="GestureHub.Admin.AddVocab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
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
            <div class="mb-3 mt-3 col-md-6">
                <h6>
                    <asp:Label ID="ImageLabel" AssociatedControlID="ImageUpload" runat="server" Text="Insert Image:"></asp:Label>
                </h6>
                <asp:FileUpload ID="ImageUpload" runat="server" CssClass="form-control" />
                <asp:Image ID="InsertedImage" runat="server" ImageUrl="~/image/image.png" CssClass="mt-2" Style="max-height: 200px; max-width: 100%;" Visible="false" />
            </div>
        </div>
        <div class="form-group mb-2">
            <label for="VideoUrlField">Video URL:</label>
            <asp:TextBox runat="server" CssClass="form-control" ID="VideoUrlField"></asp:TextBox>
        </div>
        <div class="form-group mb-2">
            <asp:Button ID="AddButton" runat="server" Text="Add" CssClass="btn btn-primary" OnClick="AddVocabButton_Click" />
        </div>
        <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
            <asp:Label ID="MsgLabel" runat="server"></asp:Label>
        </asp:Panel>
    </form>
</asp:Content>
