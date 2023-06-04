<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageVocab.aspx.cs" Inherits="GestureHub.Admin.ManageVocab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <section class="container shadow rounded-3 p-4 mb-5 bg-white">
            <h3 class="mb-3">Manage Vocabulary</h3>
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-4 pe-0">
                            <asp:DropDownList runat="server" ID="ColumnSelect" CssClass="form-select" name="ColumnSelect">
                                <asp:ListItem Text="Vocab ID" Value="vocabulary_id"></asp:ListItem>
                                <asp:ListItem Text="Course ID" Value="course_id"></asp:ListItem>
                                <asp:ListItem Text="Term" Value="term"></asp:ListItem>
                                <asp:ListItem Text="Description" Value="description"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-8 ps-0">
                            <div class="d-flex">
                                <asp:TextBox runat="server" ID="SearchBox" CssClass="form-control" name="Search"></asp:TextBox>
                                <asp:Button runat="server" ID="searchButton" CssClass="btn btn-primary" OnClick="SearchButton_Click" Text="Search" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 ms-auto d-flex justify-content-end">
                    <button type="button" onclick="location.href='/Admin/AddVocab.aspx'" class="btn btn-primary mb-3">Add Vocabulary</button>
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="vocabulary_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="vocabulary_id" HeaderText="Vocabulary ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="course_id" HeaderText="Coure ID" SortExpression="Word" />
                    <asp:BoundField DataField="term" HeaderText="Term" SortExpression="Description" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="Category" />
                    <asp:BoundField DataField="image" HeaderText="Image" SortExpression="Image" />
                    <asp:BoundField DataField="video" HeaderText="Video" SortExpression="Video" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <%# Eval("vocabulary_id","<a href=\"" + ResolveUrl("~/Admin/EditVocab.aspx?vocabId={0}") + "\" class=\"btn btn-primary\">Edit</a>") %>
                            <asp:LinkButton CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this vocabulary?')" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [vocabulary]" DeleteCommand="DELETE FROM [vocabulary] WHERE [vocabulary_id] = @vocabulary_id">
                <DeleteParameters>
                    <asp:Parameter Name="vocabulary_id" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </section>
    </form>
</asp:Content>
