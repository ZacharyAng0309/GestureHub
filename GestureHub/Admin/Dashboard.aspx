<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GestureHub.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item active"><a href="/Admin/Dashboard.aspx">Dashboard</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-5 mb-5 bg-white">
        <form runat="server">
            <div class="row justify-content-between p-3 px-2">
                <div class="card mb-4">
                    <div class="card-body">
                        <h3 class="card-title">Welcome back, Admin</h3>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    </div>
                </div>
                <asp:HiddenField ID="AdminNumberField" runat="server" Value="7" />
                <asp:HiddenField ID="MemberNumberField" runat="server" Value="23" />
                <asp:HiddenField ID="MaleNumberField" runat="server" Value="23" />
                <asp:HiddenField ID="FemaleNumberField" runat="server" Value="23" />
                <canvas id="UserChart" height="400" width="400"></canvas>
                <script>
                    $(document).ready(function () {

                        var admins = parseInt($('#MainContent_MainContent_AdminNumberField').val());
                        var members = parseInt($('#MainContent_MainContent_MemberNumberField').val());

                        var ctx = document.getElementById('UserChart').getContext('2d');
                        var UserChart = new Chart(ctx, {
                            type: 'pie',
                            data: {
                                labels: ['Admins', 'Members'],
                                datasets: [{
                                    label: '# of Users and Admins',
                                    data: [admins, members],
                                    backgroundColor: ['#ff6384', '#36a2eb', '#ffce56'],
                                    hoverBackgroundColor: ['#ff6384', '#36a2eb', '#ffce56'],
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                responsive: true,
                                //maintainAspectRatio: false,
                                width: 500,
                                height: 500
                            }
                        });
                    });
                </script>
                <%--Number of Users--%>
                <div class="card col-md-3 mb-4">
                    <div class="card-body">
                        <h4 class="card-title">Number of Members</h4>
                        <asp:Label ID="MembersNumberLabel" runat="server" Text="19238 Members"></asp:Label>
                    </div>
                </div>
                <div class="card col-md-3 mb-4">
                    <div class="card-body">
                        <h4 class="card-title">Number of Admins</h4>
                        <asp:Label ID="AdminsNumberLabel" runat="server" Text="19238 Members"></asp:Label>
                    </div>
                </div>
                <div class="card col-md-3 mb-4">
                    <div class="card-body">
                        <h4 class="card-title">Total Users</h4>
                        <asp:Label ID="UsersNumberLabel" runat="server" Text="19238 Members"></asp:Label>
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
        </form>
    </div>
</asp:Content>
