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
                    <p class="card-text">Learning sign languages with GestureHub in these easy steps!</p>
                         <a href="/Member/Courses.aspx" class="btn btn-primary ">Continue Learning</a>
                </div>
            </div>
         
         <%--Recent Quizzes--%>
        <h3 class="mb-3">View Recent Quiz Results</h3>
           <%--<form runat="server">
                <asp:GridView ID="GridView2" class="table table-bordered table-responsive table-hover"
                runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True"
                PagerSettings-PageButtonCount="5" PagerSettings-Mode="NumericFirstLast" AllowSorting="True"
                DataKeyNames="result_id">
                <Columns>
                    <asp:BoundField DataField="result_id" HeaderText="Result ID" SortExpression="result_id"
                        InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="user_id" HeaderText="User ID" SortExpression="user_id" />
                    <asp:BoundField DataField="quiz_id" HeaderText="Quiz ID" SortExpression="quiz_id" />
                    <asp:BoundField DataField="score" HeaderText="Score" SortExpression="score" />
                    <asp:BoundField DataField="completed_at" HeaderText="Completed Date" SortExpression="completed_at" />
                </Columns>
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5"></PagerSettings>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>"
                SelectCommand="SELECT * FROM [quizresult] WHERE [user_id] = @UserId">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            </form>--%>
            <%--Feedbacks Given--%>
            <h3 class="mb-3">View Feedback</h3>
            <form runat="server">
                <asp:GridView ID="GridView1" class="table table-bordered table-responsive table-hover"
                runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True"
                PagerSettings-PageButtonCount="5" PagerSettings-Mode="NumericFirstLast" AllowSorting="True"
                DataKeyNames="feedback_id">
                <Columns>
                    <asp:BoundField DataField="feedback_id" HeaderText="Feedback ID" SortExpression="feedback_id"
                        InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="user_id" HeaderText="User ID" SortExpression="user_id" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" SortExpression="course_id" />
                    <asp:BoundField DataField="feedback" HeaderText="Feedback" SortExpression="feedback" />
                    <asp:BoundField DataField="created_at" HeaderText="Created Date" SortExpression="created_at" />
                </Columns>
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5"></PagerSettings>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:GestureHubDatabase %>"
                SelectCommand="SELECT * FROM [feedback] WHERE [user_id] = @UserId">
                <SelectParameters>
                    <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            </form>
            

        </div>
        </div>
</asp:Content>
