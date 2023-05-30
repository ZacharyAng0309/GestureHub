<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="GestureHub.Admin.Profile" ValidateRequest="false" %>


<asp:Content ID="BreadContent" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
  <li class="breadcrumb-item active" aria-current="page">Admin Profile</li>
</asp:Content>

<asp:Content ID="AdminProfContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
         
        <form id="form2" runat="server">
            <div class="row justify-content-evenly">
                 <div class="col-sm-5 col-md-6 mb-3">
                      <h5>User ID:</h5>
                    <asp:TextBox ID="UserIDProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Username"
                        Required="required" CssClass="form-control"
                        Placeholder="UserID"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Username:</h5>
                    <asp:TextBox ID="UsernameProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Username"
                        Required="required" CssClass="form-control"
                        Placeholder="Username"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Email:</h5>
                    <asp:TextBox ID="EmailProfile"
                        runat="server"
                        TextMode="Email"
                        ToolTip="Email"
                        Required="required" CssClass="form-control"
                        Placeholder="Email"
                        ReadOnly="true"></asp:TextBox>
                </div>
                 <div class="col-sm-5 col-md-6 mb-3">
                    <h5>First Name:</h5>
                    <asp:TextBox ID="FirstNameProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="First Name"
                        Required="required" CssClass="form-control"
                        Placeholder="First Name"
                        ReadOnly="true"></asp:TextBox>
                </div>
                 <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Last Name:</h5>
                    <asp:TextBox ID="LastNameProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Last Name"
                        Required="required" CssClass="form-control"
                        Placeholder="Last Name"
                        ReadOnly="true"></asp:TextBox>
                </div>
                 <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Updated Password:</h5>
                    <asp:TextBox ID="PasswordProfile"
                        runat="server"
                        TextMode="Password"
                        ToolTip="Password"
                        Required="required" CssClass="form-control"
                        Placeholder="Updated Password"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Age:</h5>
                    <asp:TextBox ID="AgeProfile"
                        runat="server"
                        TextMode="Number"
                        ToolTip="Age"
                        Required="required" CssClass="form-control"
                        Placeholder="Age"
                        ReadOnly="true"></asp:TextBox>
                </div>
                 <div class="col-sm-5 col-md-6 mb-3">
                    <h5>Gender:</h5>
                    <asp:TextBox ID="GenderProfile"
                        runat="server"
                        TextMode="SingleLine"
                        ToolTip="Gender"
                        Required="required" CssClass="form-control"
                        Placeholder="Gender"
                        ReadOnly="true"></asp:TextBox>
                </div>
                
                 <div class="d-grid gap-2 col-6 mt-5">
                      <asp:Button ID="BackBtn" runat="server" href="/Admin/Dashboard.aspx" Text="Back" CssClass="btn btn-secondary btn-md btn-block" />
                </div>
               
            </div>
           
           
        </form>
       
    </div>
</asp:Content>
