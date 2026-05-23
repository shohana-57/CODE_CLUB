<%@ Page Title="Events" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="Events.aspx.cs" Inherits="Pages_Events" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section events-section">
    <div class="section-label">// EVENTS</div>
    <h2 class="section-title">Upcoming Events</h2>

    <div class="events-list">
      <asp:Repeater ID="rptEvents" runat="server">
        <ItemTemplate>
          <div class="event-item reveal">
            <div class="event-date">
              <span class="event-day"><%# Convert.ToDateTime(Eval("EventDate")).Day %></span>
              <span class="event-month"><%# Convert.ToDateTime(Eval("EventDate")).ToString("MMM") %></span>
            </div>
            <div class="event-info">
              <span class="event-type"><%# Eval("EventType") %></span>
              <h3><%# Eval("Title") %></h3>
              <p><%# Eval("Description") %></p>
            </div>
            <a href="~/Pages/Join.aspx" runat="server" class="btn btn-sm">Register</a>
          </div>
        </ItemTemplate>
      </asp:Repeater>
    </div>

    <asp:Label ID="lblEmpty" runat="server" Visible="false" CssClass="empty-state">
      No upcoming events. Stay tuned!
    </asp:Label>

  </section>

</asp:Content>

