<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Login" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section login-section">
    <div class="login-wrapper">

    
      <div class="login-tabs">
        <button class="tab-btn active" onclick="switchTab('member', this)">Member Login</button>
        <button class="tab-btn" onclick="switchTab('admin', this)">Admin Login</button>
      </div>

      
      <asp:Panel ID="pnlError" runat="server" Visible="false">
        <div class="form-message error" id="errMsg" runat="server"></div>
      </asp:Panel>

      
      <div id="tabMember" class="login-tab-content active">
        <h2 class="section-title">Member Login</h2>
        <div class="form-group">
          <label for="txtMemberEmail">Email</label>
          <asp:TextBox ID="txtMemberEmail" runat="server" TextMode="Email"
                       CssClass="form-input" placeholder="your@email.com" />
        </div>
        <div class="form-group">
          <label for="txtMemberPwd">Password</label>
          <asp:TextBox ID="txtMemberPwd" runat="server" TextMode="Password"
                       CssClass="form-input" placeholder="Your password" />
        </div>
        <asp:Button ID="btnMemberLogin" runat="server" Text="Login as Member"
                    CssClass="btn btn-primary btn-full"
                    OnClick="btnMemberLogin_Click" />
        <p class="form-footer">
          Not a member? <a href="~/Pages/Join.aspx" runat="server">Register here</a>
        </p>
      </div>

      <div id="tabAdmin" class="login-tab-content">
        <h2 class="section-title">Admin Login</h2>
        <div class="form-group">
          <label for="txtAdminUser">Username</label>
          <asp:TextBox ID="txtAdminUser" runat="server"
                       CssClass="form-input" placeholder="admin" />
        </div>
        <div class="form-group">
          <label for="txtAdminPwd">Password</label>
          <asp:TextBox ID="txtAdminPwd" runat="server" TextMode="Password"
                       CssClass="form-input" placeholder="Admin password" />
        </div>
        <div class="form-group form-check">
          <asp:CheckBox ID="chkRemember" runat="server" />
          <label for="chkRemember">Remember me for 7 days</label>
        </div>
        <asp:Button ID="btnAdminLogin" runat="server" Text="Login as Admin"
                    CssClass="btn btn-primary btn-full"
                    OnClick="btnAdminLogin_Click" />
      </div>

    </div>
  </section>

  <script>
      function switchTab(tab, btn) {
          document.querySelectorAll('.login-tab-content').forEach(t => t.classList.remove('active'));
          document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
          document.getElementById('tab' + tab.charAt(0).toUpperCase() + tab.slice(1)).classList.add('active');
          btn.classList.add('active');
      }
  </script>

</asp:Content>

