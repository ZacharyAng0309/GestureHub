<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditQuizQuestion.aspx.cs" Inherits="GestureHub.Admin.AdminEditQuizQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageQuizQuestion.aspx">Manage Quiz Question</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Quiz Question</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Edit Quiz Question</h3>
        <form runat="server">
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="QuestionIdField">Question ID:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="QuestionIdField" placeholder="Question ID"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="QuizIdField">Quiz ID:</asp:Label>
                <asp:TextBox runat="server" CssClass="form-control" ID="QuizIdField" placeholder="Quiz ID"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <asp:Label runat="server" AssociatedControlID="QuestionField">Question:</asp:Label>
                <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control" ID="QuestionField" Rows="3"></asp:TextBox>
            </div>
            <div class="form-group mb-4">
                <div class="mb-3 mt-3 col-md-6">
                    <asp:Image ID="QuestionPicture" runat="server" ImageUrl="boy1.png" Style="width: 200px" CssClass="border border-4 rounded text-center" />
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
            <div class="col-sm-5 col-md-6 mb-5">
                <asp:Button runat="server" CssClass="btn btn-danger" ID="DeleteButton" Text="Delete" OnClick="DeleteButton_Click" />
            </div>
            <div class="col-sm-5 col-md-6 mb-4">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="Button1" Text="Submit" OnClick="SubmitButton_Click" />
            </div>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PagerSettings-PageButtonCount="5" PagerSettings-Mode="NumericFirstLast" CssClass="table table-striped" AllowSorting="True" DataKeyNames="option_id">
                    <Columns>
                        <asp:BoundField DataField="option_id" HeaderText="Option ID" SortExpression="option_id" ReadOnly="True" InsertVisible="False" />
                        <asp:BoundField DataField="question_id" HeaderText="Question ID" SortExpression="question_id" />
                        <asp:BoundField DataField="option_text" HeaderText="Option Text" SortExpression="option_text" />
                        <asp:BoundField DataField="image" HeaderText="Image" SortExpression="image" />
                        <asp:BoundField DataField="video" HeaderText="Video" SortExpression="video" />
                        <asp:BoundField DataField="is_correct" HeaderText="Correct Option" SortExpression="is_correct" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <%# Eval("option_id","<a href=\"" + ResolveUrl("~/Admin/EditQuestionOption.aspx?optionId={0}") + "\" class=\"btn btn-primary\">Edit</a>") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5"></PagerSettings>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>"
                SelectCommand="SELECT * FROM [questionoption]"></asp:SqlDataSource>

        </form>
    </div>
</asp:Content>
