<%@ Page Title="Member Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberProfile.aspx.cs" Inherits="GestureHub.MemberProfile" ValidateRequest="false" %>

<asp:Content ID="BreadContent" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Default.aspx">Home</a></li>
  <li class="breadcrumb-item active" aria-current="page">Member Profile</li>
</asp:Content>

<asp:Content ID="MemberProfContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         
        <form id="form2" runat="server">
            <div class="row justify-content-evenly">
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
                        TextMode="SingleLine"
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
                        TextMode="SingleLine"
                        ToolTip="Password"
                        Required="required" CssClass="form-control"
                        Placeholder="Updated Password"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Age:</h5>
                    <asp:TextBox ID="AgeProfile"
                        runat="server"
                        TextMode="SingleLine"
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
                <div class="col-sm-5 col-md-6 mb-3">
                </div>
                 <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Delete Account:</h5>
                     <div class="d-grid gap-2 col-6">
                         <asp:Button ID="DeleteBtn" runat="server" Text="Delete" CssClass="btn btn-danger btn-md btn-block" />
                     </div>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                </div>
                 <div class="d-grid gap-2 col-6">
                         <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="btn btn-success btn-md btn-block" />
                     </div>
            </div>
           
           
        </form>
       
    </div>
</asp:Content>

