<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GestureHub.Member.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Member/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item active" aria-current="page">Member Profile</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">

        <form id="form2" runat="server">
            <div class="row justify-content-evenly">
                <div class="col-md-12 mb-3">
                    <h5>Profile Picture</h5>
                    <asp:Image ID="ProfilePicture" runat="server" ImageUrl="boy1.png" Style="width: 200px" CssClass="border border-4 rounded text-center" />
                    <div class="mb-3 mt-3 col-md-6">
                        <h6>
                            <asp:Label ID="ImageLabel" AssociatedControlID="ImageUpload" runat="server" Text="Insert Image:"></asp:Label></h6>
                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="form-control" OnTextChanged="ImageUpload_TextChanged" />

                        <asp:Image ID="InsertedImage" runat="server" ImageUrl="~/Images/image.png" CssClass="mt-2" Style="max-height: 200px; max-width: 100%;" Visible="false" />
                    </div>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Member ID:</h5>
                    <asp:TextBox ID="MemberIdProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Member ID"
                        Required="required" CssClass="form-control"
                        Placeholder="MemberID"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Username:</h5>
                    <asp:TextBox ID="UsernameProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Username"
                        Required="required" CssClass="form-control"
                        Placeholder="Username"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Email:</h5>
                    <asp:TextBox ID="EmailProfile"
                        runat="server"
                        TextMode="Email"
                        ToolTip="Email"
                        Required="required" CssClass="form-control"
                        Placeholder="Email"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>First Name:</h5>
                    <asp:TextBox ID="FirstNameProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="First Name" CssClass="form-control"
                        Placeholder="First Name"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Last Name:</h5>
                    <asp:TextBox ID="LastNameProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Last Name" CssClass="form-control"
                        Placeholder="Last Name"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Password:</h5>
                    <asp:TextBox ID="PasswordProfile"
                        runat="server"
                        TextMode="Password"
                        ToolTip="Password"
                        Required="required" CssClass="form-control"
                        Placeholder="Password" Text-Mode="Password"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Age:</h5>
                    <asp:TextBox ID="AgeProfile"
                        runat="server"
                        TextMode="Number"
                        ToolTip="Age" CssClass="form-control"
                        Placeholder="Age"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Gender:</h5>

                    <asp:DropDownList ID="GenderProfileDropdownList" runat="server" Required="required" CssClass="form-select">
                        <asp:ListItem Selected="False" Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Selected="False" Text="Female" Value="Female"></asp:ListItem>

                    </asp:DropDownList>
                </div>
                <div class="col-sm-5 col-md-6 mb-5">
                    <h5>Delete Account:</h5>
                    <div class="d-grid gap-2 col-6">
                        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="btn btn-danger btn-md btn-block" OnClick="DeleteBtn_Click" />
                    </div>
                </div>
                <div class="col-sm-5 col-md-6 mb-4">
                </div>

                <div class="d-grid gap-2 col-3">
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="btn btn-success btn-md btn-block" OnClick="SaveButton_Click" />

                </div>
                <div class="d-grid gap-2 col-3">
                    <asp:Button ID="BackBtn" runat="server" href="/Member/Dashboard.aspx" Text="Back" CssClass="btn btn-secondary btn-md btn-block" />
                </div>



            </div>


        </form>

    </div>
</asp:Content>
