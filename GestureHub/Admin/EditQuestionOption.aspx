<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditQuestionOption.aspx.cs" Inherits="GestureHub.Admin.EditQuestionOption" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageQuizQuestion.aspx">Manage Quiz Question</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Question Option</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Edit Question Option</h3>
        <form runat="server">
            <div class="form-group mb-2">
                <label for="optionIdField">Option ID:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="optionIdField" placeholder="Option ID"></asp:TextBox>
            </div>
            <div class="form-group mb-2">
                <label for="questionIdField">Question ID:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="questionIdField" placeholder="Question ID"></asp:TextBox>
            </div>

            <div class="form-group mb-2">
                <label for="textField">Option Text:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="textField"
                    placeholder="Text"></asp:TextBox>
            </div>
            <div class="mb-3 mt-3 col-md-6">
                <h6>
                    <asp:Label ID="ImageLabel" AssociatedControlID="ImageUpload" runat="server" Text="Insert Image:"></asp:Label>
                    <asp:Image ID="QuestionImage" runat="server" ImageUrl="~/Images/image.png" CssClass="mt-2" Style="max-height: 200px; max-width: 100%;" />
                </h6>
                <asp:FileUpload ID="ImageUpload" runat="server" CssClass="form-control" />
                <asp:Image ID="InsertedImage" runat="server" ImageUrl="~/Images/image.png" CssClass="mt-2" Style="max-height: 200px; max-width: 100%;" />
            </div>
            <div class="form-group mb-4">
                <label for="videoUrlField">Video Url:</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="videoUrlField"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <label for="isCorrectCheckBox">Is Correct:</label>
                <asp:CheckBox runat="server" CssClass="form-control" ID="isCorrectCheckBox"></asp:CheckBox>
            </div>
            <div class="d-flex justify-content-center mb-3">
                <asp:Button runat="server" CssClass="btn btn-primary col-md-4 me-3" Text="Update" OnClick="UpdateButton_Click"></asp:Button>
                <a href="Admin/ManageQuestion.aspx" class="btn btn-secondary col-md-4">Back</a>
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </form>
    </section>
</asp:Content>
