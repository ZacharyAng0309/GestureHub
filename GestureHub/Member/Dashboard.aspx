<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="GestureHub.Member.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item active"><a href="/Member/Dashboard.aspx">Dashboard</a></li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
       
        <div class="row justify-content-between p-3 px-2">
            <div class="card mb-4">
                <div class="card-body">
                    <h3 class="card-title">Welcome back, <asp:Label runat="server" ID="MemberName"></asp:Label></h3>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                         <a href="/Member/Courses.aspx" class="btn btn-primary ">Continue Learning</a>
                </div>
            </div>
            <%--Recent Courses--%>
            <div class="card col-md-3 mb-4">
                <div class="card-header">Recent Course</div>
                <div class="card-body">
                    <h3 class="card-title">Course Title</h3>
                     <img src="/Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                    <div class="d-grid gap-2 col-12 mx-auto">
                    <a href="#" class="btn btn-success">View Course</a>
                        </div>
                </div>
            </div>
             <div class="card col-md-3 mb-4">
                <div class="card-header">Recent Course</div>
                <div class="card-body">
                    <h3 class="card-title">Course Title</h3>
                     <img src="/Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                   <div class="d-grid gap-2 col-12 mx-auto">
                    <a href="#" class="btn btn-success">View Course</a>
                        </div>
                </div>
            </div>
             <div class="card col-md-3 mb-4">
                <div class="card-header">Recent Course</div>
                <div class="card-body">
                    <h3 class="card-title">Course Title</h3>
                     <img src="/Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                   <div class="d-grid gap-2 col-12 mx-auto">
                    <a href="#" class="btn btn-success">View Course</a>
                        </div>
                </div>
            </div>
           
        </div>
         <%--Recent Quizzes--%>
          <div class="row justify-content-between p-3 px-2">
                 <div class="card col-md-3 mb-4">
                <div class="card-header">Recent Quiz Results</div>
                <div class="card-body">
                    <h3 class="card-title">Quiz 1: Subject </h3>
                    <h6 class="card-text mt-4">
                        Quiz Score: ?/5 
                    </h6>
                    <h6 class="card-text my-4">
                        Date Completed: X/X/23
                    </h6>
                      <div class="d-grid gap-2 col-12 mx-auto">
                    <a href="#" class="btn btn-danger">Redo Quiz</a>
                        </div>
                </div>
            </div>
            <div class="card col-md-3 mb-4">
                <div class="card-header">Recent Quiz Results</div>
                <div class="card-body">
                    <h3 class="card-title">Quiz 2: Subject</h3>
                     <h6 class="card-text mt-4">
                        Quiz Score: ?/5 
                    </h6>
                    <h6 class="card-text my-4">
                        Date Completed: X/X/23
                    </h6>
                     <div class="d-grid gap-2 col-12 mx-auto">
                    <a href="#" class="btn btn-danger">Redo Quiz</a>
                        </div>
                </div>
            </div>
            <div class="card  col-md-3 mb-4">
                <div class="card-header">Recent Quiz Results</div>
                <div class="card-body">
                    <h3 class="card-title">Quiz 3: Subject</h3>
                     <h6 class="card-text mt-4">
                        Quiz Score: ?/5 
                    </h6>
                    <h6 class="card-text my-4">
                        Date Completed: X/X/23
                    </h6>
                      <div class="d-grid gap-2 col-12 mx-auto">
                    <a href="#" class="btn btn-danger">Redo Quiz</a>
                        </div>
                </div>
            </div>
            </div>
            <%--Feedbacks Given--%>
        <h3 class="border-bottom pb-2">Feedbacks Given per Course</h3>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">CourseID</th>
                    <th scope="col">Feedback</th>
                    <th scope="col">Created At</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                </tr>
            </tbody>
        </table>

        </div>
</asp:Content>
