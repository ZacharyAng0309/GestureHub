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
                        <h3 class="card-title">Welcome back, <asp:Label runat="server" ID="AdminName"></asp:Label></h3>
                        <p class="card-text">Bringing you latest statistics.</p>
                    </div>
                </div>
                <asp:HiddenField ID="AdminNumberField" runat="server" Value="7" />
                <asp:HiddenField ID="MemberNumberField" runat="server" Value="23" />
                <asp:HiddenField ID="MaleNumberField" runat="server" Value="23" />
                <asp:HiddenField ID="FemaleNumberField" runat="server" Value="23" />
                <asp:HiddenField ID="EasyCourseNumberField" runat="server" Value="23" />
                <asp:HiddenField ID="IntermediateCourseNumberField" runat="server" Value="23" />
                <asp:HiddenField ID="HardCourseNumberField" runat="server" Value="23" />
                <%--Number of Users--%>
                <div class="card col-md-3 mb-4">
                    <div class="card-body">
                        <h4 class="card-title">Number of Users</h4>
                        <canvas id="UserChart" style="max-width: 300px; max-height: 250px;"></canvas>
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
                                        //width: 100,
                                        //height: 100
                                    }
                                });
                            });
                        </script>
                    </div>
                </div>             
                <div class="card col-md-3 mb-4">
                    <div class="card-body">
                        <h4 class="card-title">Type of Genders</h4>
                         <canvas id="GenderChart" style="max-width: 300px; max-height: 250px;"></canvas>
                        <script>
                            $(document).ready(function () {

                                var male = parseInt($('#MainContent_MainContent_MaleNumberField').val());
                                var female = parseInt($('#MainContent_MainContent_FemaleNumberField').val());

                                var ctx = document.getElementById('GenderChart').getContext('2d');
                                var GenderChart = new Chart(ctx, {
                                    type: 'pie',
                                    data: {
                                        labels: ['Male', 'Female'],
                                        datasets: [{
                                            label: '# of Male and Female',
                                            data: [male, female],
                                            backgroundColor: ['#ff6384', '#36a2eb', '#ffce56'],
                                            hoverBackgroundColor: ['#ff6384', '#36a2eb', '#ffce56'],
                                            borderWidth: 1
                                        }]
                                    },
                                    options: {
                                        responsive: true,
                                        //maintainAspectRatio: false,
                                        //width: 100,
                                        //height: 100
                                    }
                                });
                            });
                        </script>
                    </div>


                </div>
                <div class="card col-md-3 mb-4">
                    <div class="card-body">
                        <h4 class="card-title">Number of Difficulty Levels</h4>
                         <canvas id="LevelChart" style="max-width: 300px; max-height: 250px;"></canvas>
                        <script>
                            $(document).ready(function () {

                                var easy = parseInt($('#MainContent_MainContent_EasyCourseNumberField').val());
                                var medium = parseInt($('#MainContent_MainContent_IntermediateCourseNumberField').val());
                                var hard = parseInt($('#MainContent_MainContent_HardCourseNumberField').val());

                                var ctx = document.getElementById('LevelChart').getContext('2d');
                                var LevelChart = new Chart(ctx, {
                                    type: 'pie',
                                    data: {
                                        labels: ['Easy', 'Intermediate','Hard'],
                                        datasets: [{
                                            label: '# of Easy,Intermediate,Hard',
                                            data: [easy, medium, hard],
                                            backgroundColor: ['#ff6384', '#36a2eb', '#ffce56'],
                                            hoverBackgroundColor: ['#ff6384', '#36a2eb', '#ffce56'],
                                            borderWidth: 1
                                        }]
                                    },
                                    options: {
                                        responsive: true,
                                        //maintainAspectRatio: false,
                                        //width: 100,
                                        //height: 100
                                    }
                                });
                            });
                        </script>
                    </div>
                </div>
               
</div>



            <%--Next Line--%>
           <%-- <div class="row justify-content-between p-3 px-2">
               
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
            </div>--%>
        </form>
    </div>
</asp:Content>
