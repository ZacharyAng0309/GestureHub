<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditVocab.aspx.cs" Inherits="GestureHub.Admin.EditVocab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Edit Quiz</h3>
        <form runat="server">
            <div class="form-group mb-2">
                <label for="VocabIdField">Title:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="VocabIdField"></asp:TextBox>
            </div>
            <div class="form-group mb-2">
                <label for="CourseIdField">Title:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="CourseIdField"></asp:TextBox>
            </div>

            <div class="form-group mb-2">
                <label for="TermField">Course ID:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="TermField"
                    placeholder="Course ID" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <label for="DescriptionField">Description:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="DescriptionField" Rows="3"></asp:TextBox>
            </div>
            <asp:FileUpload ID="ImageUploadControl" runat="server" />
            <div class="form-group mb-4">
                <label for="VideoField">Description:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="VideoField" Rows="3"></asp:TextBox>
            </div>
            <div class="d-flex justify-content-center mb-3">
                <asp:Button runat="server" CssClass="btn btn-primary col-md-4 me-3"
                    Text="Update" OnClick="UpdateButton_Click"></asp:Button>
                <a href="#" class="btn btn-secondary col-md-4">Back</a>
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>
    </div>
</asp:Content>
