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
                 <button type="button" id="passwordVisibilityToggle" class="input-group-text" 
                     onclick="toggleRegisterPasswordVisibility()" 
                     data-toggle="passwordToggler"
                    data-toggle-class="bi-eye"
                    data-toggle-target="#<%= PasswordTxtBox.ClientID %>"">
                        <i class="bi bi-eye-slash"></i>
                </button>
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

      function toggleRegisterPasswordVisibility() {
          const passwordInput = document.getElementById("MainContent_MainContent_PasswordTxtBox");
          const passwordVisibilityToggle = document.getElementById("passwordVisibilityToggle");
          //check if passwordInput has class of input-mask
          if (passwordInput.classList.contains("input-mask")) {
              passwordInput.classList.remove("input-mask");
              passwordInput.type = "text";
              passwordVisibilityToggle.innerHTML = '<i class="bi bi-eye"></i>';
          } else {
              passwordInput.classList.add("input-mask");
              passwordInput.type = "password";
              passwordVisibilityToggle.innerHTML = '<i class="bi bi-eye-slash"></i>';
          }
      }
  </script>
</asp:Content>