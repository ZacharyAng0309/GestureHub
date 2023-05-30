<%@ Page Title="" Language="C#" MasterPageFile="~/SiteStudent.master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GestureHub.Member.Profile" %>
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
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Member ID:</h5>
                    <asp:TextBox ID="MemberIDProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Username"
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
                        ToolTip="First Name"
                        Required="required" CssClass="form-control"
                        Placeholder="First Name"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Last Name:</h5>
                    <asp:TextBox ID="LastNameProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Last Name"
                        Required="required" CssClass="form-control"
                        Placeholder="Last Name"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Updated Password:</h5>
                    <asp:TextBox ID="PasswordProfile"
                        runat="server"
                        TextMode="Password"
                        ToolTip="Password"
                        Required="required" CssClass="form-control"
                        Placeholder="Updated Password"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Age:</h5>
                    <asp:TextBox ID="AgeProfile"
                        runat="server"
                        TextMode="Number"
                        ToolTip="Age"
                        Required="required" CssClass="form-control"
                        Placeholder="Age"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Gender:</h5>
                    <asp:TextBox ID="GenderProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Gender"
                        Required="required" CssClass="form-control"
                        Placeholder="Gender"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-5">
                    <h5>Delete Account:</h5>
                    <div class="d-grid gap-2 col-6">
                        <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="btn btn-danger btn-md btn-block" />
                    </div>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                </div>
                 <div class="d-grid gap-2 col-3">
                    <asp:Button ID="BackBtn" runat="server" href="/Member/Dashboard.aspx" Text="Back" CssClass="btn btn-secondary btn-md btn-block" />
                </div>
                <div class="d-grid gap-2 col-3">
                    <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="btn btn-success btn-md btn-block" />

                </div>
               

            </div>


        </form>

    </div>
</asp:Content>
