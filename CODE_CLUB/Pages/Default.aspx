<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CODE_CLUB.Pages.Default" %>
<asp:Content ID="Title" ContentPlaceHolderID="PageTitle" runat="server">Home
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
    
  <section class="section hero-section">
    <div class="hero-bg">
      <div class="code-rain" id="codeRain"></div>
    </div>
    <div class="hero-inner">
      <div class="hero-tag">EST. 2026 · CODING COMMUNITY</div>
      <h1 class="hero-title">
        Where<br />
        <span class="accent">Code</span><br />
        Comes Alive
      </h1>
      <p class="hero-sub">A community of passionate developers learning, building, and sharing knowledge together.</p>
      <div class="hero-cta">
        <a href="~/Pages/Join.aspx" runat="server" class="btn btn-primary">Join the Club</a>
        <a href="~/Pages/Projects.aspx" runat="server" class="btn btn-ghost">See Our Work</a>
      </div>
      <div class="hero-stats">
        <div class="stat"><span class="stat-num" data-target="120">0</span><span class="stat-label">Members</span></div>
        <div class="stat"><span class="stat-num" data-target="30">0</span><span class="stat-label">Projects</span></div>
        <div class="stat"><span class="stat-num" data-target="15">0</span><span class="stat-label">Events</span></div>
      </div>
    </div>
  </section>
</asp:Content>

