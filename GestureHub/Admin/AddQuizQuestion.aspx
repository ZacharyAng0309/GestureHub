<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="AddQuizQuestion.aspx.cs" Inherits="GestureHub.Admin.AddQuizQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <form runat="server">
        <h3>Add Quiz Questions</h3>
        <div class="form-group mb-4">
            <asp:Label runat="server" AssociatedControlID="QuizIdDropdownList">Quiz ID:</asp:Label>
            <asp:DropDownList runat="server" CssClass="form-control" ID="QuizIdDropdownList" placeholder="Question ID"></asp:DropDownList>
        </div>
        <div class="form-group mb-4">
            <asp:Label runat="server" AssociatedControlID="QuestionField">Question:</asp:Label>
            <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="QuestionField" Rows="3"></asp:TextBox>
        </div>
        <div class="form-group mb-4">
            <div class="mb-3 mt-3 col-md-6">
                <h6>
                    <asp:Label ID="ImageLabel" AssociatedControlID="ImageUpload" runat="server" Text="Insert Image:"></asp:Label>
                </h6>
                <asp:FileUpload ID="ImageUpload" runat="server" CssClass="form-control" OnTextChanged="ImageUpload_TextChanged" />
                <asp:Image ID="InsertedImage" runat="server" ImageUrl="~/image/image.png" CssClass="mt-2" Style="max-height: 200px; max-width: 100%;" Visible="false" />
            </div>
        </div>
        <div class="form-group mb-4">
            <asp:Label runat="server" AssociatedControlID="QuestionVideoField">Question Video:</asp:Label>
            <asp:TextBox runat="server" CssClass="form-control" ID="QuestionVideoField" placeholder="Question Video"></asp:TextBox>
        </div>
        <asp:Button runat="server" CssClass="btn btn-primary mb-4" ID="SubmitButton" Text="Add" OnClick="AddButton_Click" />
        <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
            <asp:Label ID="MsgLabel" runat="server"></asp:Label>
        </asp:Panel>
    </form>
   </div>
</asp:Content>
