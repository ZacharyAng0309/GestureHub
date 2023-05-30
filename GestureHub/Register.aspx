<%@ Page Title="Register" Language="C#" MasterPageFile="~/SiteAnon.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GestureHub.Register" ValidateRequest="false" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="head" runat="server">
  <script src="/Scripts/register.js" defer></script>
  <script src="/Scripts/togglePassword.js" defer></script>
  <script src="/Scripts/strengthMeter.js" defer></script>
</asp:Content>

<asp:Content ID="BreadContent" ContentPlaceHolderID="BreadcrumbContent" runat="server">
  <li class="breadcrumb-item"><a href="/Home.aspx">Home</a></li>
  <li class="breadcrumb-item active" aria-current="page">Register</li>
</asp:Content>

<asp:Content ID="RegisterContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <h1 class="border-bottom mb-3">Create an Account.</h1>
         <h6>Already a member?<a href="/Login.aspx"> Log in here</a></h6>
        <form id="form1" runat="server">
              <%--      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
            <div class="progress mt-3 mb-3">
                <div class="progress-bar" role="progressbar"
                    style="width: 0%;"
                    aria-valuenow="0" aria-valuemin="0"
                    aria-valuemax="100"
                    data-password-meter="true"
                    data-password-meter-target="#<%= PasswordTxtBox.ClientID %>"
                    data-password-meter-help="#helpLbl">
                </div>
            </div>
            <div class="form-floating mb-3">
                <asp:TextBox ID="UsernameTxtBox"
                    runat="server"
                    CssClass="form-control"
                    TextMode="SingleLine"
                    ToolTip="Username"
                    Placeholder="Username"
                    Required="required"
                    MaxLength="50"></asp:TextBox>
                <label for="<%= UsernameTxtBox.ClientID %>" class="text-muted">Username</label>
            </div>

            <div class="form-floating mb-3">
                <asp:TextBox
                    ID="EmailTxtBox"
                    runat="server"
                    TextMode="Email"
                    CssClass="form-control"
                    ToolTip="Email"
                    Placeholder="Email"
                    Required="required"
                    MaxLength="100"></asp:TextBox>
                <label for="<%= EmailTxtBox.ClientID %>" class="text-muted">Email</label>
            </div>
            <%--<div id="username_feedback" class="mb-3"></div>--%>

            <div class="input-group mb-3">
                <div class="form-floating flex-grow-1">
                    <asp:TextBox ID="PasswordTxtBox"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        ToolTip="Password"
                        Placeholder="Password"
                        Required="required"
                        MaxLength="50"></asp:TextBox>
                    <label for="<%= PasswordTxtBox.ClientID %>"
                        class="text-muted">
                        Password</label>
                </div>
                <span class="input-group-text"
                    data-toggle="passwordToggler"
                    data-toggle-class="bi-eye"
                    data-toggle-target="#<%= PasswordTxtBox.ClientID %>"
                    style="cursor: pointer;">
                    <i class="bi bi-eye-slash"></i>
                </span>
            </div>

            <div class="form-floating mb-3">
                <asp:TextBox
                    ID="AgeTxtBox"
                    runat="server"
                    TextMode="Number"
                    CssClass="form-control"
                    ToolTip="Age"
                    Placeholder="Age"
                    Required="required"
                    MaxLength="100"></asp:TextBox>
                <label for="<%= AgeTxtBox.ClientID %>" class="text-muted">Age</label>
            </div>

            <div class="form-floating mb-3">
                <asp:DropDownList ID="GenderDropDownList" runat="server" Required="required" CssClass="form-select">
                    <asp:ListItem Selected="False" Text="Male" Value="m"></asp:ListItem>
                    <asp:ListItem Selected="False" Text="Female" Value="f"></asp:ListItem>
                </asp:DropDownList>
                <label for="<%= GenderDropDownList.ClientID %>" class="text-muted">Gender</label>
            </div>

             <div class="d-grid gap-2 col-6 mx-auto mt-5">
                  <asp:Button ID="RegisterBtn" runat="server" Text="Register" OnClick="RegisterBtn_Click" CssClass="btn btn-md btn-block text-white" Style="background-color: #6A5ACD;"/>
                <%-- <asp:Panel ID="ErrorPanel" runat="server" class="alert alert-danger mt-3" role="alert" Visible="false">
                     <asp:Label ID="ErrorLbl" runat="server" Text="Login credential is incorrect."></asp:Label>
                 </asp:Panel>--%>
                </div>


           
            

          
        </form>
          
    </div>
 

    <%--      <div class="mb-3">
            <span class="form-text" id="helpLbl"></span>
        </div>--%>

    <%--<div id="admin-div">
        <div class="input-group mb-3">

          <div class="form-floating flex-grow-1">
            <asp:TextBox
              ID="SecretTxtBox"
              runat="server"
              TextMode="Password"
              CssClass="form-control"
              ToolTip="Admin Secret Code"
              Placeholder="Admin Secret Code"
              Required="required"></asp:TextBox>
            <label for="<%= SecretTxtBox.ClientID %>" class="text-muted">Secret Code</label>
          </div>
          <span class="input-group-text"
            data-toggle="passwordToggler"
            data-toggle-class="bi-eye"
            data-toggle-target="#<%= SecretTxtBox.ClientID %>"
            style="cursor: pointer;">
            <i class="bi bi-eye-slash"></i>
          </span>
        </div>
        <asp:Panel ID="SecretPanel" CssClass="alert alert-danger mb-3" runat="server" Visible="false" role="alert">
          Invalid secret code
       
        </asp:Panel>
      </div>--%>

      <%--<div id="student-div">
        <div class="form-floating mb-3">
          <asp:TextBox
            ID="FullNameTxtBox"
            runat="server"
            TextMode="SingleLine"
            Enabled="false"
            CssClass="form-control"
            ToolTip="Full Name"
            Placeholder="Full Name"
            Required="required"
            MaxLength="50"></asp:TextBox>
          <label for="<%= FullNameTxtBox.ClientID %>" class="text-muted">Full Name</label>
        </div>
       

        <div class="form-floating mb-3">
          <asp:DropDownList ID="GenderDropDownList" runat="server" Enabled="false" Required="required" CssClass="form-select">
            <asp:ListItem Selected="True" Text="Please select a gender" Value=""></asp:ListItem>
            <asp:ListItem Selected="False" Text="Male" Value="m"></asp:ListItem>
            <asp:ListItem Selected="False" Text="Female" Value="f"></asp:ListItem>
          </asp:DropDownList>
          <label for="<%=GenderDropDownList.ClientID %>" class="text-muted">Gender</label>
        </div>
      </div>--%>

    
    <%--</form>
  </div>--%>
  <input type="hidden" id="NavLocation" value="register" disabled="disabled" />
  <script>
    $("[id$='RegisterBtn']").on('click', function () {
      const passwd = $passwordTxtBox.val()
      const valid = isValidPassword(passwd)
      if (!valid) {
        $passwordTxtBox.addClass("is-invalid")
      }
      return valid
    })
  </script>
</asp:Content>