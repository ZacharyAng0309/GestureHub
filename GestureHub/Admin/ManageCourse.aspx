<%@ Page Title="Manage Course" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ManageCourse.aspx.cs" Inherits="GestureHub.Admin.ManageCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
     <li class="breadcrumb-item make the text in primary colour in bootstrap">Manage Materials</li>
    <li class="breadcrumb-item active" aria-current="page">Manage Course</li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container shadow rounded-3 p-5 mb-5 bg-white">
        
        
        <form runat="server">
            <div class="row">
                <div class="col-6">
                    <h1 class="mb-3">Manage Course</h1>
                </div>
                <div class="col-6">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button type="button" onclick="location.href='AddCourse.aspx'" class="btn btn-success mb-3">Add Course</button>
                    </div>
                </div>

            </div>
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
