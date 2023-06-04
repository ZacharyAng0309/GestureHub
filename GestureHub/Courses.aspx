<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAnon.master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="GestureHub.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
      <li class="breadcrumb-item"><a href="/Home.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Courses</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      <div class="container shadow rounded-3 p-4 mb-5 bg-white">
         <form runat="server">
            <%--BEGINNER LEVEL--%>
            <h2 class="border-bottom border-3 text-center p-2 mt-3">BEGINNER LEVEL</h2>
            <div class="row justify-content-evenly py-2">
                <asp:Panel ID="EasyCoursePanelHolder" runat="server"></asp:Panel>
            </div>
            <%--INTERMEDIATE LEVEL--%>
            <h2 class="border-bottom border-3 text-center p-2 mt-2">INTERMEDIATE LEVEL</h2>
            <div class="row justify-content-evenly py-3 mb-3">
                <asp:Panel ID="IntermediateCoursePanelHolder" runat="server"></asp:Panel>
            </div>
            <%-- ADVANCED LEVEL--%>
            <h2 class="border-bottom border-3 text-center p-2 mt-2">ADVANCED LEVEL</h2>
            <div class="row justify-content-evenly py-3 mb-3">
                <asp:Panel ID="HardCoursePanelHolder" runat="server"></asp:Panel>
            </div>
        </form>
       
    </div>
</asp:Content>
