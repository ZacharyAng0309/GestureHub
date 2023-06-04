<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditOptionOption.aspx.cs" Inherits="GestureHub.Admin.EditOptionOption" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <section class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Edit Quiz Question Option</h3>
        <form runat="server">
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="OptionIdField">Question Option ID:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="OptionIdField" placeholder="Option ID" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="QuizIdField">Question ID:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="QuestionIdField" placeholder="Quiz ID" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="OptionTextField">Option Text:</asp:Label>
                <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="OptionTextField" Rows="3"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <div class="mb-3 mt-3 col-md-6">
                    <asp:Image ID="OptionPicture" runat="server" ImageUrl="boy1.png" Style="width: 200px" CssClass="border border-4 rounded text-center" />
                    <h6>
                        <asp:Label ID="ImageLabel" AssociatedControlID="ImageUpload" runat="server" Text="Insert Image:"></asp:Label>
                    </h6>
                    <asp:FileUpload ID="ImageUpload" runat="server" CssClass="form-control" OnTextChanged="ImageUpload_TextChanged" />
                    <asp:Image ID="InsertedImage" runat="server" ImageUrl="~/image/image.png" CssClass="mt-2" Style="max-height: 200px; max-width: 100%;" Visible="false" />
                </div>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="OptionVideoField">Option Video:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="OptionVideoField" placeholder="Option Video"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="IsCorrectCheckbox">Is Correct?</asp:Label>
                <asp:CheckBox runat="server" ID="IsCorrectCheckbox" Text="Correct?" />
            </div>
            <div class="col-sm-5 col-md-6 mb-5">
                <asp:Button runat="server" CssClass="btn btn-danger" ID="DeleteButton" Text="Delete" OnClick="DeleteButton_Click" />
            </div>
            <div class="col-sm-5 col-md-6 mb-4">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="Button1" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
        </form>
    </section>

</asp:Content>