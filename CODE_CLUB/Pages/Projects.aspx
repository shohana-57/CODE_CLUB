<%@ Page Title="Projects" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Projects.aspx.cs" Inherits="Pages_Projects" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section projects-section">
    <div class="section-label">// PROJECTS</div>
    <h2 class="section-title">Our Work</h2>

    <div class="projects-grid">
      <asp:Repeater ID="rptProjects" runat="server">
        <ItemTemplate>
          <div class="project-card reveal">
            <div class="project-tag"><%# Eval("Category") %></div>
            <h3><%# Eval("Title") %></h3>
            <p><%# Eval("Description") %></p>
            <div class="project-tech">
              <%# BuildTechBadges(Eval("Technologies").ToString()) %>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>
    </div>

    <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="empty-state">
      No projects found yet. Check back soon!
    </asp:Label>

  </section>

</asp:Content>
