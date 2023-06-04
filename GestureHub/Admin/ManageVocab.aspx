<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageVocab.aspx.cs" Inherits="GestureHub.Admin.ManageVocab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pagination {
            padding-left: 0;
            margin-top: 1rem;
            list-style: none;
            color: #999;
            text-align: left;
            padding: 0;
        }

            .pagination li {
                display: inline-block;
            }

                .pagination li a,
                .pagination li span {
                    color: #23b7e5;
                    border-radius: 3px;
                    padding: 6px 12px;
                    position: relative;
                    display: block;
                    text-decoration: none;
                    line-height: 1.2;
                    background-color: #fff;
                    border: 1px solid #ddd;
                    border-radius: 0;
                    margin-bottom: 5px;
                    margin-right: 5px;
                }

                .pagination li:first-child a,
                .pagination li:first-child span {
                    margin-left: 0;
                    border-bottom-left-radius: 3px;
                    border-top-left-radius: 3px;
                }

                .pagination li:last-child a,
                .pagination li:last-child span {
                    border-bottom-right-radius: 3px;
                    border-top-right-radius: 3px;
                }

                .pagination li a:hover,
                .pagination li a:focus,
                .pagination li span:hover,
                .pagination li span:focus {
                    z-index: 2;
                    color: #2579a9;
                    background-color: #eeeeee;
                    border-color: #ddd;
                }

            .pagination .active a,
            .pagination .active span {
                z-index: 3;
                color: #fff;
                cursor: default;
                background-color: #23b7e5;
                border-color: #23b7e5;
            }

            .pagination .disabled span,
            .pagination .disabled a,
            .pagination .disabled a:hover,
            .pagination .disabled a:focus {
                color: #999;
                cursor: not-allowed;
                background-color: #fff;
                border-color: #ddd;
            }

        .pagination-lg li a,
        .pagination-lg li span {
            padding: 10px 16px;
            font-size: 18px;
        }

        .pagination-lg li:first-child a,
        .pagination-lg li:first-child span {
            border-bottom-left-radius: 6px;
            border-top-left-radius: 6px;
        }
    </style>
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
                    <button type="button" onclick="location.href='/Admin/AddVocab.aspx'" class="btn btn-success mb-3">Add Vocabulary</button>
                </div>
            </div>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="vocabulary_id" 
               CssClass="table table-responsive table-hover mt-4" AllowSorting="True">
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
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </section>
    </form>
</asp:Content>
