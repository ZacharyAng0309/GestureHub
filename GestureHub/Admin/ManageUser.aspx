<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="GestureHub.Admin.ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item active" aria-current="page">Manage User</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <section class="container shadow rounded-3 p-4 mb-5 bg-white">
            <h3 class="mb-3">Manage User</h3>
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-4 pe-0">
                            <asp:DropDownList runat="server" ID="ColumnSelect" CssClass="form-select" name="ColumnSelect">
                                <asp:ListItem Text="User ID" Value="user_id"></asp:ListItem>
                                <asp:ListItem Text="Username" Value="username"></asp:ListItem>
                                <asp:ListItem Text="Email" Value="email"></asp:ListItem>
                                <asp:ListItem Text="First Name" Value="first_name"></asp:ListItem>
                                <asp:ListItem Text="Last Name" Value="last_name"></asp:ListItem>
                                <asp:ListItem Text="age" Value="age"></asp:ListItem>
                                <asp:ListItem Text="gender" Value="gender"></asp:ListItem>
                                <asp:ListItem Text="Role" Value="user_role"></asp:ListItem>
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
                    <button type="button" onclick="location.href='AddUser.aspx'" class="btn btn-primary mb-3">Add User</button>
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" DataKeyNames="user_id" CssClass="table table-responsive table-bordered " AllowSorting="True" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="user_id" HeaderText="User ID" ReadOnly="True" SortExpression="user_id" />
                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                    <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age"></asp:BoundField>
                    <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender"></asp:BoundField>
                    <asp:BoundField DataField="user_role" HeaderText="Role" SortExpression="user_role" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <%# Eval("user_id","<a href=\"" + ResolveUrl("~/Admin/EditUser.aspx?userId={0}") + "\" class=\"btn btn-primary\">Edit</a>") %>
                            <asp:LinkButton CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this user?')" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle CssClass="pagination d-flex justify-content-center" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>" SelectCommand="SELECT * FROM [users]" DeleteCommand="DELETE FROM [users] WHERE [user_id] = @user_id">
                <DeleteParameters>
                    <asp:Parameter Name="user_id"  Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="MsgPanel" runat="server" class="mt-3" role="alert" Visible="false">
                <asp:Label ID="MsgLabel" runat="server"></asp:Label>
            </asp:Panel>
        </section>
    </form>
</asp:Content>
