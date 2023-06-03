<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMember.Master" AutoEventWireup="true" CodeBehind="CourseOverview.aspx.cs" Inherits="GestureHub.Member.CourseOverview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Member/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Member/Courses.aspx">Courses</a></li>
    <li class="breadcrumb-item active" aria-current="page">CourseOverview</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="container shadow rounded-3 p-4 mb-5 bg-white">
            <div class="d-flex flex-column">
                <asp:Label class="text-center p-2 mb-4" ID="CourseTitleLabel" Text="Alphabet" runat="server"></asp:Label>
                <asp:Label class="border-bottom border-3 text-center p-2 mb-4" ID="CourseDescriptionLabel" Text="Alphabet" runat="server"></asp:Label>
                <asp:Panel ID="VocabularyPanel" runat="server" CssClass="container p-4">
                    <!-- Add vocabulary to the panel here -->
                </asp:Panel>
                <%--<div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Accordion Item #1
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                        </div>
                    </div>
                </div>
            </div>--%>
                <div class="row justify-content-around mt-5">
                    <a href="/Member/Courses.aspx" class="btn btn-secondary align-items-center col-3">BACK</a>
                    <asp:Button ID="quizButton" runat="server" CssClass="btn btn-success align-items-center col-3" Text="TAKE QUIZ" OnClick="QuizButton_Click" />
                    <a href="/Member/Feedback.aspx" class="btn btn-primary align-items-center col-3">GIVE FEEDBACK</a>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
