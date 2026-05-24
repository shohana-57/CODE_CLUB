using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pages_Admin_ManageEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!SessionManager.IsAdminLoggedIn())
            Response.Redirect("~/Pages/Login.aspx");

        if (!IsPostBack)
            BindGrid();

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (!DateTime.TryParse(txtDate.Text, out DateTime date)) return;

        bool ok = DatabaseHelper.AddEvent(
            txtTitle.Text.Trim(),
            ddlType.SelectedValue,
            txtDesc.Text.Trim(),
            date
        );

        if (ok)
        {
            pnlMsg.Visible = true;
            addMsg.InnerHtml = "✓ Event added successfully.";
            txtTitle.Text = txtDesc.Text = txtDate.Text = "";
            BindGrid();
        }
    }

    protected void gvEvents_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteEvent")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DatabaseHelper.DeleteEvent(id);
            BindGrid();
        }
    }

    private void BindGrid()
    {
        gvEvents.DataSource = DatabaseHelper.GetEvents(visibleOnly: false);
        gvEvents.DataBind();
    }
}