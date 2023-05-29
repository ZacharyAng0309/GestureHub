<%@ Page Title="About" Language="C#" MasterPageFile="~/SiteAnon.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="GestureHub.About" %>


<asp:Content ID="BreadContent" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Default.aspx">Home</a></li>
    <li class="breadcrumb-item active" aria-current="page">About Us</li>
</asp:Content>

<asp:Content ID="AboutUsContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container shadow rounded-3 p-4 mb-5 bg-white">
        <%--About Us--%>
        <div class="text-center pb-4">
            <ul class="list-group">
                <li class="list-group-item active" aria-current="true" style="background-color: #6A5ACD;">ABOUT US</li>
                <li class="list-group-item">Welcome to our sign language education website! Our mission is to provide a user-friendly platform that promotes accessibility and inclusion for the deaf and hard-of-hearing population. 
                   We offer top-notch materials and tools to empower individuals to communicate effectively in sign language.</li>
            </ul>
        </div>
        <%--Objectives--%>
        <div class="text-center pb-4">
            <ul class="list-group">
                <li class="list-group-item active" aria-current="true" style="background-color: #6A5ACD;">OBJECTIVES</li>
                <li class="list-group-item">
                    <b>Access to High-Quality Resources:</b>
                    We strive to provide users with a wide range of high-quality resources for learning sign language, including video tutorials, interactive exercises, and vocabulary lists.
                </li>
                <li class="list-group-item">
                    <b>Awareness of Deaf Culture:</b>
                    We aim to increase awareness and understanding of deaf culture among hearing individuals, fostering a more inclusive society.
                </li>
                <li class="list-group-item">
                    <b>Language Development Support:</b>
                    We are dedicated to supporting language development in children who are deaf or hard of hearing, providing them with the tools they need to communicate effectively.
                </li>
                <li class="list-group-item">
                    <b>Community and Connection:</b>
                    Our platform aims to foster community and connection among deaf and hard-of-hearing individuals, as well as hearing individuals interested in learning sign language.
                </li>
                <li class="list-group-item">
                    <b>Accessibility for All:</b>
                    We are committed to providing accessible and inclusive educational resources for people interested in learning sign language, regardless of their background or experience level.
                </li>
            </ul>
        </div>
        <%--Mission Statement--%>
        <div class="text-center pb-4">
            <ul class="list-group">
                <li class="list-group-item active" aria-current="true" style="background-color: #6A5ACD;">MISSION STATEMENT</li>
                <li class="list-group-item">Our e-learning platform offers high-quality learning resources for individuals interested in learning sign language and provides a means of communication for people who are deaf or hard of hearing. 
                   We focus on making sign language accessible and easy to learn for everyone.</li>
            </ul>
        </div>
        <%--Vision Statement--%>
        <div class="text-center pb-4">

            <ul class="list-group">
                <li class="list-group-item active" aria-current="true" style="background-color: #6A5ACD;">VISION STATEMENT</li>
                <li class="list-group-item list-group-numbered">
                    <b>Accessibility:</b>
                    We strive to provide accessibility to people who are Deaf or hard of hearing and use sign language as their primary means of communication.
                </li>
                <li class="list-group-item">
                    <b>Educational Resource:</b>
                    We aim to serve as an educational resource for individuals seeking to learn sign language, supporting their language learning journey.
                </li>
                <li class="list-group-item">
                    <b>Raise Awareness:</b>
                    We are committed to raising awareness about Deaf culture and the importance of sign language.
                </li>
                <li class="list-group-item">
                    <b>Community and Connection:</b>
                    Our platform aims to foster community and connection among deaf and hard-of-hearing individuals, as well as hearing individuals who are interested in learning sign language.
                </li>
            </ul>

        </div>
    </div>


    <script>
    </script>
</asp:Content>