<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Pages_Admin_Dashboard" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

    <section class="section admin-section">
    <div class="section-label">// ADMIN PANEL</div>
    <h2 class="section-title">Dashboard</h2>
    <p class="admin-welcome">
      Welcome back, <strong><asp:Literal ID="litWelcome" runat="server" /></strong>
    </p>

    <div class="admin-stats">
      <div class="admin-stat-card">
        <span class="asc-num"><asp:Literal ID="litMembers"  runat="server" /></span>
        <span class="asc-label">Members</span>
      </div>
      <div class="admin-stat-card">
        <span class="asc-num"><asp:Literal ID="litProjects" runat="server" /></span>
        <span class="asc-label">Projects</span>
      </div>
         <div class="admin-stat-card">
        <span class="asc-num"><asp:Literal ID="litEvents"   runat="server" /></span>
        <span class="asc-label">Events</span>
      </div>
      <div class="admin-stat-card">
        <span class="asc-num"><asp:Literal ID="litContacts" runat="server" /></span>
        <span class="asc-label">Messages</span>
      </div>
    </div>

    <div class="admin-nav">
      <a href="ManageProjects.aspx" class="btn btn-ghost">⬡ Manage Projects</a>
      <a href="ManageEvents.aspx"   class="btn btn-ghost">◷ Manage Events</a>
      <a href="~/Pages/MemberLogout.aspx" runat="server" class="btn btn-ghost nav-logout">⇤ Logout</a>
    </div>
         <h3 class="admin-sub-title">Registered Members</h3>
    <div class="table-wrap">
      <asp:GridView ID="gvMembers" runat="server"
        AutoGenerateColumns="false"
        CssClass="admin-table"
        EmptyDataText="No members yet.">
        <Columns>
          <asp:BoundField DataField="FullName"   HeaderText="Name" />
          <asp:BoundField DataField="Email"      HeaderText="Email" />
          <asp:BoundField DataField="SkillLevel" HeaderText="Skill" />
          <asp:BoundField DataField="Role"       HeaderText="Role" />
          <asp:BoundField DataField="JoinedAt"   HeaderText="Joined"
            DataFormatString="{0:dd MMM yyyy}" />
        </Columns>
      </asp:GridView>
    </div>
        <h3 class="admin-sub-title" style="margin-top:40px">Recent Feedback</h3>
    <div class="table-wrap">
      <asp:GridView ID="gvFeedback" runat="server"
        AutoGenerateColumns="false"
        CssClass="admin-table"
        EmptyDataText="No feedback yet.">
        <Columns>
          <asp:BoundField DataField="Name"        HeaderText="Name" />
          <asp:BoundField DataField="Email"       HeaderText="Email" />
          <asp:BoundField DataField="Rating"      HeaderText="★" />
          <asp:BoundField DataField="Message"     HeaderText="Feedback" />
          <asp:BoundField DataField="SubmittedAt" HeaderText="Date"
            DataFormatString="{0:dd MMM yyyy}" />
        </Columns>
      </asp:GridView>
    </div>

         <h3 class="admin-sub-title" style="margin-top:40px">Contact Messages</h3>
    <div class="table-wrap">
      <asp:GridView ID="gvContacts" runat="server"
        AutoGenerateColumns="false"
        CssClass="admin-table"
        EmptyDataText="No messages yet.">
        <Columns>
          <asp:BoundField DataField="Name"        HeaderText="Name" />
          <asp:BoundField DataField="Email"       HeaderText="Email" />
          <asp:BoundField DataField="Message"     HeaderText="Message" />
          <asp:BoundField DataField="SubmittedAt" HeaderText="Date"
            DataFormatString="{0:dd MMM yyyy}" />
        </Columns>
      </asp:GridView>
    </div>

  </section>



</asp:Content>
