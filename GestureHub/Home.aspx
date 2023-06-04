<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/SiteAnon.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GestureHub._Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bg-grey {
            background-color: #f8f9fa;
        }

        .desc-group > div:not(:last-child) {
            border-right: 1px solid black;
            height: 80%;
        }
    </style>
    <link rel="stylesheet" href="/Content/OwlCarousel/owl.carousel.css">
    <link rel="stylesheet" href="/Content/OwlCarousel/owl.theme.css">
    <script src="Scripts/owl.carousel.min.js"></script>
    <script src="Scripts/owl.carousel.js"></script>
    <script src="Scripts/Home.js"></script>
</asp:Content>

<asp:Content ID="BreadContent" ContentPlaceHolderID="BreadcrumbContent" runat="server" class="pt-0">
</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="container pt-3">
            <div class="row justify-content-around">
                <div class="col-md-6 d-flex flex-column justify-content-center ms-5 ps-5">
                    <h3 class="mb-2">LEARN ABOUT SIGN LANGUAGES FOR FREE!
                    </h3>
                    <p class="mb-5">
                        PROVIDING YOU WITH THE ONLINE SIGN LANGUAGE LEARNING PLATFORM WITH LATEST MATERIALS.
                    </p>
                    <div class="d-flex justify-content-start">
                        <a href="/Register.aspx" class="btn btn-primary btn-lg me-2">GET STARTED</a>
                        <a href="/Courses.aspx" class="btn btn-primary btn-lg">BROWSE COURSES</a>
                    </div>
                </div>
                <div class="col-md-4 ">
                    <img src="Images\GestureHubLogo.png" class="img-fluid rounded mx-auto d-block" alt="...">
                </div>
            </div>
        </section>
        <section class="p-5" style="background-color:#D3D3D3;">
            <div class="row justify-content-around desc-group ">
                <div class="col-md-3 p-5">
                    <div class="d-flex flex-column align-items-center">
                        <h4 class="ms-4 align-self-center">300+</h4>
                        <p class="text-center">Learning Materials.</p>
                    </div>
                </div>
                <div class="col-md-3 p-5">
                    <div class="d-flex flex-column align-items-center">
                        <h4 class="ms-4 align-self-center">20+</h4>
                        <p class="text-center">Trending Categories.</p>
                    </div>
                </div>
                <div class="col-md-3 p-5">
                    <div class="d-flex flex-column align-items-center">
                        <h4 class="ms-4 align-self-center">10K+</h4>
                        <p class="text-center">Worldwide Students.</p>
                    </div>
                </div>
                <div class="col-md-3 p-5">
                    <div class="d-flex flex-column align-items-center">
                        <h4 class="ms-4 align-self-center">5K+</h4>
                        <p class="text-center">Feeback/Reviews.</p>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="d-flex justify-content-center pt-5">
                <h2 class="text-center">Recent Courses</h2>
            </div>
            <div class="owl-carousel owl-theme mx-5 justify-content-center mt-3">
                <div class="card me-3 item h-75 w-75" data-mdb-ripple-color="light">
                    <img src="Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                    <div class="card-body">
                        <h5 class="card-title">Alphabet</h5>
                        <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                    </div>
                </div>
                <div class="card me-3 item h-75 w-75" data-mdb-ripple-color="light">
                    <img src="Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                    <div class="card-body">
                        <h5 class="card-title">Alphabet</h5>
                        <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                    </div>
                </div>
                <div class="card me-3 item h-75 w-75" data-mdb-ripple-color="light">
                    <img src="Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                    <div class="card-body">
                        <h5 class="card-title">Alphabet</h5>
                        <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                    </div>
                </div>
                <div class="card me-3 item h-75 w-75" data-mdb-ripple-color="light">
                    <img src="Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                    <div class="card-body">
                        <h5 class="card-title">Alphabet</h5>
                        <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                    </div>
                </div>
                <div class="card me-3 item h-75 w-75" data-mdb-ripple-color="light">
                    <img src="Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                    <div class="card-body">
                        <h5 class="card-title">Alphabet</h5>
                        <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                    </div>
                </div>
               <div class="card me-3 item h-75 w-75" data-mdb-ripple-color="light">
                    <img src="Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                    <div class="card-body">
                        <h5 class="card-title">Alphabet</h5>
                        <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                    </div>
                </div>
                <div class="card me-3 item h-75 w-75" data-mdb-ripple-color="light">
                    <img src="Images/GestureHubLogo.png" class="card-img-top" alt="IMAGE">
                    <div class="card-body">
                        <h5 class="card-title">Alphabet</h5>
                        <p class="card-text pt-2">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-success align-items-center d-grid gap-2">VIEW</a>
                    </div>
                </div>
            </div>
        </section>
        <section class="container-fluid pt-3 px-5">
            <div class="row justify-content-around">
                <div class="col-md-5 d-flex flex-column justify-content-center ms-5 ps-5">
                    <h3 class="mb-2">WHY SHOULD YOU CHOOSE US?
                    </h3>
                    <p class="mb-5">
                        PROVIDING YOU WITH THE ONLINE SIGN LANGUAGE LEARNING PLATFORM WITH LATEST MATERIALS.
                    </p>
                    <div class="d-flex justify-content-start">
                        <a href="/Register.aspx" class="btn btn-primary btn-lg me-2">START NOW</a>
                    </div>
                </div>
                <div class="col-md-5 ">
                    <div class="row justify-content-center mb-4 ">
                        <div class="col-md-6 mb-4">
                            <img src="Images/HomePage1.png" class="img-fluid rounded" alt="...">
                        </div>
                        <div class="col-md-6 mb-4">
                            <img src="Images/HomePage2.png" class="img-fluid rounded" alt="...">
                        </div>
                        <div class="col-md-6 mb-4">
                            <img src="Images/HomePage3.png" class="img-fluid rounded" alt="...">
                        </div>
                        <div class="col-md-6 mb-4">
                            <img src="Images/HomePage4.png" class="img-fluid rounded" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

</asp:Content>
