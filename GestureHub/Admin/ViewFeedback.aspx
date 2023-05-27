<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="GestureHub.AdminViewFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BreadcrumbContent" runat="server">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/Home.aspx">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">View Feedback</li>
        </ol>
    </nav>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <h1>View Feedback</h1>
     <div class="table-responsive">
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="true"
        PageSize="10" PagerSettings-PageButtonCount="5" PagerSettings-Mode="NumericFirstLast" CssClass="table table-striped">
             <Columns>
                 <asp:BoundField DataField="FeedbackID" HeaderText="FeedbackID" SortExpression="FeedbackID" />
                 <asp:BoundField DataField="Feedback" HeaderText="Feedback" SortExpression="Feedback" />
                 <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                 <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                 <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                 <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                 <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                 <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                 <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                 <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
             </Columns>
         </asp:GridView>
     </div>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT FeedbackID, Feedback, Date, UserID, UserName, Email, Phone, Subject, Message, Status FROM [Feedback]" DeleteCommand="DELETE FROM [Feedback] WHERE [FeedbackID] = @FeedbackID" UpdateCommand="UPDATE [Feedback] SET [Status] = @Status WHERE [FeedbackID] = @FeedbackID">
         <DeleteParameters>
             <asp:Parameter Name="FeedbackID" Type="Int32" />
         </DeleteParameters>
         <UpdateParameters>
             <asp:Parameter Name="Status" Type="String" />
             <asp:Parameter Name="FeedbackID" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>
</asp:Content>
