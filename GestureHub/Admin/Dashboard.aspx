<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GestureHub.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
     <li class="breadcrumb-item active"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-5 mb-5 bg-white">
          <div class="row justify-content-between p-3 px-2">
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title">Welcome back, Admin</h3>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <%--<a href="/Member/Courses.aspx" class="btn btn-primary ">Continue Learning</a>--%>
                </div>
            </div>
            <%--Number of Users--%>
            <div class="card col-md-3 mb-4">
                <div class="card-body">
                    <h4 class="card-title">Number of Members</h4>
                     <p class="card-text">19238 Members</p>
                   
                   
                </div>
            </div>
             <div class="card col-md-3 mb-4">
                <div class="card-body">
                    <h4 class="card-title">Number of Admins</h4>
                    <p class="card-text">19238 Admins</p> 
                  
                </div>
            </div>
             <div class="card col-md-3 mb-4">
                <div class="card-body">
                    <h4 class="card-title">Total Users</h4>
                    <p class="card-text">19238 Total Users</p>
                   
                </div>
            </div>
        </div>
         <%--Next Line--%>
          <div class="row justify-content-between p-3 px-2">
                 <div class="card col-md-3 mb-4">
                <div class="card-body">
                    <h4 class="card-title">Number of Courses/Quizzes</h4>
                     <p class="card-text">Beginner Level:</p>
                    <p class="card-text">Intermediate Level:</p>
                    <p class="card-text">Advanced Level:</p>
                   
                      
                </div>
            </div>
            <div class="card col-md-3 mb-4">
                <div class="card-body">
                    <h4 class="card-title">Number of Female</h4>
                     <p class="card-text">5</p>
                   
                </div>
            </div>
            <div class="card  col-md-3 mb-4">
                <div class="card-body">
                    <h4 class="card-title">Number of Male</h4>
                     <p class="card-text">5</p>
                   </div>
            </div>
            </div>
        

    </div>
</asp:Content>
