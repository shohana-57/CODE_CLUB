<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="ManageEvents.aspx.cs" Inherits="Pages_Admin_ManageEvents" %>


<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section admin-section">
    <div class="section-label">// ADMIN — EVENTS</div>
    <h2 class="section-title">Manage Events</h2>
    <a href="Dashboard.aspx" class="btn btn-ghost" style="margin-bottom:24px;display:inline-flex">← Back</a>

    <div class="admin-form-box">
      <h3>Add New Event</h3>
      <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="form-message success" id="addMsg" runat="server"></div>
      </asp:Panel>
      <div class="form-row">
        <div class="form-group">
          <label>Title</label>
          <asp:TextBox ID="txtTitle" runat="server" CssClass="form-input" />
        </div>
        <div class="form-group">
          <label>Type</label>
          <asp:DropDownList ID="ddlType" runat="server" CssClass="form-input">
            <asp:ListItem>Workshop</asp:ListItem>
            <asp:ListItem>Competition</asp:ListItem>
            <asp:ListItem>Talk</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
          </asp:DropDownList>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group">
          <label>Date</label>
          <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-input" />
        </div>
      </div>
      <div class="form-group">
        <label>Description</label>
        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-input" />
      </div>
      <asp:Button ID="btnAdd" runat="server" Text="Add Event"
                  CssClass="btn btn-primary" OnClick="btnAdd_Click" />
    </div>

    <div class="table-wrap" style="margin-top:32px">
      <asp:GridView ID="gvEvents" runat="server"
        AutoGenerateColumns="false"
        CssClass="admin-table"
        DataKeyNames="EventID"
        OnRowCommand="gvEvents_RowCommand"
        EmptyDataText="No events yet.">
        <Columns>
          <asp:BoundField DataField="Title"     HeaderText="Title" />
          <asp:BoundField DataField="EventType" HeaderText="Type" />
          <asp:BoundField DataField="EventDate" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" />
          <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
              <asp:LinkButton CommandName="DeleteEvent"
                              CommandArgument='<%# Eval("EventID") %>'
                              Text="✕ Delete"
                              CssClass="tbl-delete"
                              OnClientClick="return confirm('Delete this event?');"
                              runat="server" />
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
      </asp:GridView>
    </div>

  </section>

</asp:Content>

