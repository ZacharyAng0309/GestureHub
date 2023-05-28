<%@ Page Title="Courses" Language="C#" MasterPageFile="~/SiteAnon.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="GestureHub.Course" %>

<asp:Content ID="BreadContent" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Home.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">Course</li>
</asp:Content>

<asp:Content ID="LoginContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <%--BEGINNER LEVEL--%>
        <h2 class="border-bottom border-3 text-center p-2 mb-3">BEGINNER LEVEL</h2>
        <div class="row justify-content-evenly py-3 mb-3">
            <div class="card" data-mdb-ripple-color="light" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Alphabet</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
             <div class="card" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Weekdays</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
             <div class="card" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">Body</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
        </div>
        <%--INTERMEDIATE LEVEL--%>
        <h2 class="border-bottom border-3 text-center p-2">INTERMEDIATE LEVEL</h2>
        <div class="row justify-content-evenly py-3 mb-3">
            <div class="card" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">VOCAB TITLE</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
            <div class="card" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">VOCAB TITLE</h5>
                    <p class="card-text pt-2">">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
            <div class="card" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">VOCAB TITLE</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
        </div>
       <%-- ADVANCED LEVEL--%>
        <h2 class="border-bottom border-3 text-center p-2">ADVANCED LEVEL</h2>
        <div class="row justify-content-evenly py-3 mb-3">
            <div class="card" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">VOCAB TITLE</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
            <div class="card" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">VOCAB TITLE</h5>
                    <p class="card-text pt-2">">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
            <div class="card" style="width: 20rem;">
                <img src="#" class="card-img-top" alt="IMAGE">
                <div class="card-body">
                    <h5 class="card-title">VOCAB TITLE</h5>
                    <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                </div>
            </div>
        </div>
       
    </div>

    <script>
        
    </script>
</asp:Content>