<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="ManageProjects.aspx.cs" Inherits="Pages_Admin_ManageProjects" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">

  <section class="section admin-section">
    <div class="section-label">// ADMIN — PROJECTS</div>
    <h2 class="section-title">Manage Projects</h2>
    <a href="Dashboard.aspx" class="btn btn-ghost" style="margin-bottom:24px;display:inline-flex">← Back</a>

    
    <div class="admin-form-box">
      <h3>Add New Project</h3>
      <asp:Panel ID="pnlMsg" runat="server" Visible="false">
        <div class="form-message success" id="addMsg" runat="server"></div>
      </asp:Panel>
      <div class="form-row">
        <div class="form-group">
          <label>Title</label>
          <asp:TextBox ID="txtTitle" runat="server" CssClass="form-input" placeholder="Project title" />
        </div>
        <div class="form-group">
          <label>Category</label>
          <asp:TextBox ID="txtCategory" runat="server" CssClass="form-input" placeholder="e.g. Web App" />
        </div>
      </div>
      <div class="form-group">
        <label>Description</label>
        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-input" />
      </div>
      <div class="form-row">
        <div class="form-group">
          <label>Technologies (comma separated)</label>
          <asp:TextBox ID="txtTech" runat="server" CssClass="form-input" placeholder="React, Node.js, SQL" />
        </div>
        <div class="form-group">
          <label>Project URL (optional)</label>
          <asp:TextBox ID="txtUrl" runat="server" CssClass="form-input" placeholder="https://..." />
        </div>
      </div>
      <asp:Button ID="btnAdd" runat="server" Text="Add Project"
                  CssClass="btn btn-primary" OnClick="btnAdd_Click" />
    </div>

  
    <div class="table-wrap" style="margin-top:32px">
      <asp:GridView ID="gvProjects" runat="server"
        AutoGenerateColumns="false"
        CssClass="admin-table"
        DataKeyNames="ProjectID"
        OnRowCommand="gvProjects_RowCommand"
        EmptyDataText="No projects yet.">
        <Columns>
          <asp:BoundField DataField="Title"        HeaderText="Title" />
          <asp:BoundField DataField="Category"     HeaderText="Category" />
          <asp:BoundField DataField="Technologies" HeaderText="Technologies" />
          <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
              <asp:LinkButton CommandName="DeleteProject"
                              CommandArgument='<%# Eval("ProjectID") %>'
                              Text="✕ Delete"
                              CssClass="tbl-delete"
                              OnClientClick="return confirm('Delete this project?');"
                              runat="server" />
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>
      </asp:GridView>
    </div>

  </section>

</asp:Content>

