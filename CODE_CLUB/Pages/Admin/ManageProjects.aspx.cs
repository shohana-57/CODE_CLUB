using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Admin_ManageProjects : System.Web.UI.Page
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
        bool ok = DatabaseHelper.AddProject(
            txtTitle.Text.Trim(),
            txtCategory.Text.Trim(),
            txtDesc.Text.Trim(),
            txtTech.Text.Trim(),
            txtUrl.Text.Trim()
        );

        if (ok)
        {
            pnlMsg.Visible = true;
            addMsg.InnerHtml = "✓ Project added successfully.";
            txtTitle.Text = txtCategory.Text = txtDesc.Text =
            txtTech.Text = txtUrl.Text = "";
            BindGrid();
        }
    }


    protected void gvProjects_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteProject")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            DatabaseHelper.DeleteProject(id);
            BindGrid();
        }
    }

    private void BindGrid()
    {
        gvProjects.DataSource = DatabaseHelper.GetProjects(visibleOnly: false);
        gvProjects.DataBind();
    }
}