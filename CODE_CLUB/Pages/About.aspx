<%@ Page Title="About" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Pages_About" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
  <section class="section about-section">
    <div class="section-label">// ABOUT US</div>
    <h2 class="section-title">We Build. We Learn. We Share.</h2>
    <div class="about-grid">
      <div class="about-text">
        <p>CodeClub is a community of passionate developers dedicated to learning and sharing knowledge in coding.</p>
        <p>Whether you are a beginner or a seasoned programmer, there is a place for you here.</p>
      </div>
      <div class="about-cards">
        <div class="feature-card">
          <div class="card-icon">⚡</div>
          <h3>Fast Learning</h3>
          <p>Structured workshops and peer coding sessions to accelerate your skills.</p>
        </div>
        <div class="feature-card">
          <div class="card-icon">🤝</div>
          <h3>Collaboration</h3>
          <p>Work with talented developers on real projects.</p>
        </div>
        <div class="feature-card">
          <div class="card-icon">🚀</div>
          <h3>Innovation</h3>
          <p>Hackathons and challenges to push creative boundaries.</p>
        </div>
        <div class="feature-card">
          <div class="card-icon">🌐</div>
          <h3>Open Source</h3>
          <p>Contribute to and learn from the global community.</p>
        </div>
      </div>
    </div>
  </section>
</asp:Content>