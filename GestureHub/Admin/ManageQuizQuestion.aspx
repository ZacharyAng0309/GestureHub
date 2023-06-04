<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageQuizQuestion.aspx.cs" Inherits="GestureHub.Admin.ManageQuizQuestion" %>

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
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item" aria-current="page">Manage Materials</li>
    <li class="breadcrumb-item active" aria-current="page">Manage Quiz Question</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form id="contentForm" runat="server">
        <section class="container shadow rounded-3 p-4 mb-5 bg-white">
            <h3 class="mb-3">Manage Quiz Question</h3>
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-4 pe-0">
                            <asp:DropDownList runat="server" ID="ColumnSelect" CssClass="form-select" name="ColumnSelect">
                                <asp:ListItem Value="question_id">Question ID</asp:ListItem>
                                <asp:ListItem Value="quiz_id">Quiz ID</asp:ListItem>
                                <asp:ListItem Value="question">Question</asp:ListItem>
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
                    <a href="/Admin/EditQuizQuestion.aspx" class="btn btn-success mb-3" >Add Question</a>
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="question_id" CssClass="table table-responsive table-hover " AllowSorting="True" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="question_id" HeaderText="Question ID" ReadOnly="True" SortExpression="question_id" />
                    <asp:BoundField DataField="quiz_id" HeaderText="Quiz ID" SortExpression="quiz_id" />
                    <asp:BoundField DataField="question" HeaderText="Question" SortExpression="question" />
                    <asp:BoundField DataField="image" HeaderText="Image" SortExpression="image" />
                    <asp:BoundField DataField="video" HeaderText="Video" SortExpression="video" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <%# Eval("question_id","<a href=\"" + ResolveUrl("~/Admin/EditQuizQuestion.aspx?questionId={0}") + "\" class=\"btn btn-primary\">Edit</a>") %>
                            <asp:LinkButton CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this question?')" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pagination d-flex justify-content-center" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [question]" DeleteCommand="DELETE FROM question WHERE question_id=@question_id"></asp:SqlDataSource>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </section>
    </form>
    <script>
</script>
</asp:Content>
