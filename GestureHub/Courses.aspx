<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAnon.master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="GestureHub.Courses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
      <li class="breadcrumb-item"><a href="/Home.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Courses</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
      <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <%--BEGINNER LEVEL--%>
        <h2 class="border-bottom border-3 text-center p-2 mt-3">BEGINNER LEVEL</h2>
        <div class="row justify-content-evenly py-2">
            <div class="card mt-3" data-mdb-ripple-color="light" style="width: 20rem;">
                <img src="/Images/AlphabetCourseImage.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Alphabet</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                   <div class="row justify-content-around">
                        <a href="/CourseOverview.aspx" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
             <div class="card mt-3" style="width: 20rem;">
                <img src="/Images/WeekCourseImage.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Weekdays</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
        </div>
        <%--INTERMEDIATE LEVEL--%>
        <h2 class="border-bottom border-3 text-center p-2 mt-3">INTERMEDIATE LEVEL</h2>
        <div class="row justify-content-evenly py-3 mb-3">
            <div class="card  mt-3" style="width: 20rem;">
                <img src="/Images/BodyCourseImage.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Body</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
            <div class="card  mt-3" style="width: 20rem;">
                <img src="/Images/GestureHubLogo.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Daily Necessity</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                   <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
        </div>
       <%-- ADVANCED LEVEL--%>
        <h2 class="border-bottom border-3 text-center p-2 mt-3">ADVANCED LEVEL</h2>
        <div class="row justify-content-evenly py-3 mb-3">
            <div class="card  mt-3" style="width: 20rem;">
                <img src="/Images/GestureHubLogo.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Subject</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                   <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
            <div class="card  mt-3" style="width: 20rem;">
                <img src="/Images/GestureHubLogo.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Animal</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
        </div>
       
                    <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
        </div>
        <%--INTERMEDIATE LEVEL--%>
        <h2 class="border-bottom border-3 text-center p-2 mt-3">INTERMEDIATE LEVEL</h2>
        <div class="row justify-content-evenly py-3 mb-3">
            <div class="card  mt-3" style="width: 20rem;">
                <img src="/Images/BodyCourseImage.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Body</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
            <div class="card  mt-3" style="width: 20rem;">
                <img src="/Images/GestureHubLogo.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Daily Necessity</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                   <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
        </div>
       <%-- ADVANCED LEVEL--%>
        <h2 class="border-bottom border-3 text-center p-2 mt-3">ADVANCED LEVEL</h2>
        <div class="row justify-content-evenly py-3 mb-3">
            <div class="card  mt-3" style="width: 20rem;">
                <img src="/Images/GestureHubLogo.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Subject</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                   <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
            <div class="card  mt-3" style="width: 20rem;">
                <img src="/Images/GestureHubLogo.png" class="card-img-top pt-2" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Animal</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <div class="row justify-content-around">
                        <a href="#" class="btn btn-success align-items-center col-5">VIEW</a>
                        <a href="#" class="btn btn-secondary align-items-center col-5">TAKE QUIZ</a>
                    </div> 
                </div>
            </div>
        </div>
       
    </div>
</asp:Content>
