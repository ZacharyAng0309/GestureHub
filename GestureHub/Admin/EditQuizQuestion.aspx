<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="EditQuizQuestion.aspx.cs" Inherits="GestureHub.Admin.AdminEditQuizQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Home</a></li>
    <li class="breadcrumb-item"><a href="/Admin/ManageQuizQuestion.aspx">Manage Quiz Question</a></li>
    <li class="breadcrumb-item active" aria-current="page">Edit Quiz Question</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h3 class="mb-3">Edit Quiz Question</h3>
        <form>
            <div class="form-group mb-2">
                <label for="questionIDField">Question ID:</label>
                <input type="text" class="form-control" id="questionIDField" placeholder="Question ID" readonly>
            </div>
            <div class="form-group mb-2">
                <label for="quizIDSelect">Quiz ID:</label>
                <select class="form-select" id="quizIDSelect">
                    <option value="" disabled selected>Select quiz ID</option>
                </select>
            </div>
            <div class="form-group mb-2">
                <label for="questionField">Question:</label>
                <textarea class="form-control" id="questionField" rows="3"></textarea>
            </div>
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PagerSettings-PageButtonCount="5" PagerSettings-Mode="NumericFirstLast" CssClass="table table-striped" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowInserts="True">
                    <Columns>
                        <asp:BoundField DataField="OptionID" HeaderText="Option ID" SortExpression="OptionID" />
                        <asp:BoundField DataField="OptionText" HeaderText="Option Text" SortExpression="OptionText" />
                        <asp:BoundField DataField="ImageFilePath" HeaderText="Picture" SortExpression="ImageFilePath" />
                        <asp:TemplateField HeaderText="Is Correct" SortExpression="IsCorrect">
                            <ItemTemplate>
                                <asp:CheckBox ID="IsCorrectCheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsCorrect")) %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="IsCorrectCheckBoxEdit" runat="server" Checked='<%# Convert.ToBoolean(Eval("IsCorrect")) %>' />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="OptionIDTextBox" runat="server" Text='<%# Bind("OptionID") %>' />
                                <asp:TextBox ID="OptionTextTextBox" runat="server" Text='<%# Bind("OptionText") %>' />
                                <asp:TextBox ID="ImageFilePathTextBox" runat="server" Text='<%# Bind("ImageFilePath") %>' />
                                <asp:CheckBox ID="IsCorrectCheckBox" runat="server" Checked='<%# Bind("IsCorrect") %>' />
                                <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            </InsertItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5"></PagerSettings>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT OptionID, OptionText, ImageFilePath, IsCorrect FROM [Options] WHERE QuestionID = @QuestionID"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="questionIDField" Name="QuestionID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </form>
    </div>
</asp:Content>
