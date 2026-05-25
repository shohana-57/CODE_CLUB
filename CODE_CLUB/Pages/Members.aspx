<%@ Page Title="Members" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="Pages_Members" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section members-section">
    <div class="section-label">// MEMBERS</div>
    <h2 class="section-title">Meet the Team</h2>

    <div class="members-grid">
      <asp:Repeater ID="rptMembers" runat="server">
        <ItemTemplate>
          <div class="member-card reveal">
            <div class="member-avatar">
              <%# GetInitials(Eval("FullName").ToString()) %>
            </div>
            <div class="member-info">
              <h3><%# Eval("FullName") %></h3>
              <span class="member-role"><%# Eval("Role") %></span>
              <div class="member-skills">
                <span><%# Eval("SkillLevel") %></span>
              </div>
            </div>
          </div>
        </ItemTemplate>
      </asp:Repeater>
    </div>

    <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="empty-state">
      No members yet. Be the first to join!
    </asp:Label>

  </section>

</asp:Content>
