<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Join.aspx.cs" Inherits="Pages_Join" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section join-section">
    <div class="section-label">// JOIN US</div>
    <div class="join-inner">
      <h2 class="section-title">Create Your Account</h2>
      <p>Fill in the form below to become a CodeClub member.</p>

     
      <asp:Panel ID="pnlMessage" runat="server" Visible="false">
        <div class="form-message" id="formMsg" runat="server"></div>
      </asp:Panel>

      <asp:Panel ID="pnlForm" runat="server">
        <div class="join-form">

          <div class="form-row">
            <div class="form-group">
              <label for="txtName">Full Name</label>
              <asp:TextBox ID="txtName" runat="server" CssClass="form-input"
                           placeholder="Your full name" />
              <asp:RequiredFieldValidator ID="rfvName" runat="server"
                ControlToValidate="txtName"
                ErrorMessage="Name is required."
                CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="form-group">
              <label for="txtEmail">Email Address</label>
              <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"
                           CssClass="form-input" placeholder="your@email.com" />
              <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                ControlToValidate="txtEmail"
                ErrorMessage="Email is required."
                CssClass="field-error" Display="Dynamic" />
              <asp:RegularExpressionValidator ID="revEmail" runat="server"
                ControlToValidate="txtEmail"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                ErrorMessage="Enter a valid email."
                CssClass="field-error" Display="Dynamic" />
            </div>
          </div>

          <div class="form-row">
            <div class="form-group">
              <label for="txtPassword">Password</label>
              <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                           CssClass="form-input" placeholder="Min 6 characters" />
              <asp:RequiredFieldValidator ID="rfvPwd" runat="server"
                ControlToValidate="txtPassword"
                ErrorMessage="Password is required."
                CssClass="field-error" Display="Dynamic" />
              <asp:RegularExpressionValidator ID="revPwd" runat="server"
                ControlToValidate="txtPassword"
                ValidationExpression=".{6,}"
                ErrorMessage="At least 6 characters."
                CssClass="field-error" Display="Dynamic" />
            </div>
            <div class="form-group">
              <label for="txtConfirm">Confirm Password</label>
              <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password"
                           CssClass="form-input" placeholder="Repeat password" />
              <asp:CompareValidator ID="cvPwd" runat="server"
                ControlToValidate="txtConfirm"
                ControlToCompare="txtPassword"
                ErrorMessage="Passwords do not match."
                CssClass="field-error" Display="Dynamic" />
            </div>
          </div>

          <div class="form-group">
            <label for="ddlSkill">Skill Level</label>
            <asp:DropDownList ID="ddlSkill" runat="server" CssClass="form-input">
              <asp:ListItem Value="">-- Select your level --</asp:ListItem>
              <asp:ListItem Value="Beginner">Beginner — just starting out</asp:ListItem>
              <asp:ListItem Value="Intermediate">Intermediate — comfortable with basics</asp:ListItem>
              <asp:ListItem Value="Advanced">Advanced — building real projects</asp:ListItem>
            </asp:DropDownList>
          </div>

          <div class="form-group">
            <label for="txtWhy">Why do you want to join?</label>
            <asp:TextBox ID="txtWhy" runat="server" TextMode="MultiLine"
                         Rows="3" CssClass="form-input"
                         placeholder="Tell us about yourself..." />
            <asp:RequiredFieldValidator ID="rfvWhy" runat="server"
              ControlToValidate="txtWhy"
              ErrorMessage="Please tell us why you want to join."
              CssClass="field-error" Display="Dynamic" />
          </div>

          <asp:Button ID="btnJoin" runat="server" Text="Apply to Join"
                      CssClass="btn btn-primary btn-full"
                      OnClick="btnJoin_Click" />

          <p class="form-footer">
            Already a member? <a href="~/Pages/Login.aspx" runat="server">Login here</a>
          </p>
        </div>
      </asp:Panel>

    </div>
  </section>

</asp:Content>
