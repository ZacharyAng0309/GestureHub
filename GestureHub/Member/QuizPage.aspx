<%@ Page Title="" Language="C#" MasterPageFile="~/SiteStudent.master" AutoEventWireup="true" CodeBehind="QuizPage.aspx.cs" Inherits="GestureHub.Member.QuizPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <li class="breadcrumb-item"><a href="/Member/Dashboard.aspx">Dashboard</a></li>
    <li class="breadcrumb-item"><a href="/Member/Courses.aspx">Courses</a></li>
    <li class="breadcrumb-item active" aria-current="page">Quiz Page</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="container shadow rounded-3 p-4 mb-5 bg-white">
            <asp:Label runat="server" ID="QuizTitle" Text="Alphabet Test" CssClass="border-bottom border-3 text-center p-2 mb-4"></asp:Label>
            <asp:Label runat="server" ID="QuizDescription" Text="This is a test to see how well you know your alphabet" CssClass="text-center"></asp:Label>
            <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
                <div class="progress-bar" style="width: 0%"></div>
            </div>
            <%--Question--%>
            <div class="py-3">
                <h3 class="text-danger">Question 1 out of 5</h3>
                <h5 class="">1. Which of the following is the correct answer?</h5>
                <figure>
                    <img src="Images\GestureHubLogo.png" alt="#" />
                </figure>
            </div>
            <div class="row justify-content-around py-3">
                <div class="col-6 mb-2">
                    <div class="form-group">
                        <asp:RadioButton ID="radioButton1" runat="server" Text="Radio Button 1" />
                    </div>
                </div>
                <div class="col-6 mb-2">
                    <div class="form-group">
                        <asp:RadioButton ID="radioButton2" runat="server" Text="Radio Button 2" />
                    </div>
                </div>
                <div class="col-6 mb-2">
                    <div class="form-group">
                        <asp:RadioButton ID="radioButton3" runat="server" Text="Radio Button 3" />
                    </div>
                </div>
                <div class="col-6 mb-2">
                    <div class="form-group">
                        <asp:RadioButton ID="radioButton4" runat="server" Text="Radio Button 4" />
                    </div>
                </div>
            </div>

            <%--buttons--%>
            <div class="row d-flex justify-content-between mt-5">
                <a href="#" class="btn btn-secondary align-items-center col-5 col-sm-3">BACK</a>
                <asp:Button ID="submitQuizButton" runat="server" Text="SUBMIT" CssClass="btn btn-success align-items-center col-5 col-sm-3" OnClick="submitQuizButton_Click" />
            </div>

        </div>
    </form>
</asp:Content>
