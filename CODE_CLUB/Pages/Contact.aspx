<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Pages_Contact" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section contact-section">
    <div class="section-label">// CONTACT</div>
    <h2 class="section-title">Get in Touch</h2>

    <div class="contact-grid">

      <div class="contact-info">
        <p class="contact-intro">Have questions or want to collaborate? Reach out!</p>
        <div class="contact-items">
          <div class="contact-item">
            <span class="contact-icon">✉</span>
            <div>
              <strong>Email</strong>
              <a href="mailto:info@codeclub.com">info@codeclub.com</a>
            </div>
          </div>
          <div class="contact-item">
            <span class="contact-icon">☎</span>
            <div>
              <strong>Phone</strong>
              <span>(123) 456-7890</span>
            </div>
          </div>
          <div class="contact-item">
            <span class="contact-icon">⌖</span>
            <div>
              <strong>Address</strong>
              <span>123 Code Street, Tech City</span>
            </div>
          </div>
        </div>
      </div>

 
        <div class="contact-form-wrap">
        <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
          <div class="form-message success">
            ✓ Message sent! We'll be in touch soon.
          </div>
        </asp:Panel>

        <asp:Panel ID="pnlForm" runat="server">
          <div class="form-group">
            <label>Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-input" placeholder="Your name" />
            <asp:RequiredFieldValidator ControlToValidate="txtName" ErrorMessage="Name required."
              CssClass="field-error" Display="Dynamic" runat="server" />
          </div>
          <div class="form-group">
            <label>Email</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-input" placeholder="your@email.com" />
            <asp:RequiredFieldValidator ControlToValidate="txtEmail" ErrorMessage="Email required."
              CssClass="field-error" Display="Dynamic" runat="server" />
          </div>
          <div class="form-group">
            <label>Message</label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"
                         Rows="4" CssClass="form-input" placeholder="Tell us something..." />
            <asp:RequiredFieldValidator ControlToValidate="txtMessage" ErrorMessage="Message required."
              CssClass="field-error" Display="Dynamic" runat="server" />
          </div>
          <asp:Button ID="btnSend" runat="server" Text="Send Message"
                      CssClass="btn btn-primary btn-full" OnClick="btnSend_Click" />
        </asp:Panel>
      </div>

    </div>
  </section>

</asp:Content>

