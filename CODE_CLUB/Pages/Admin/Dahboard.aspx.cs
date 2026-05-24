using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pages_Admin_Dahboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!SessionManager.IsAdminLoggedIn())
        {
            Response.Redirect("~/Pages/Login.aspx");
            return;
        }

        if (!IsPostBack)
            LoadDashboard();
    }

    private void LoadDashboard()
    {
        DataTable members = DatabaseHelper.GetMembers();
        DataTable projects = DatabaseHelper.GetProjects(visibleOnly: false);
        DataTable events = DatabaseHelper.GetEvents(visibleOnly: false);
        DataTable contacts = DatabaseHelper.GetContacts();
        DataTable feedback = DatabaseHelper.GetFeedback();

        litMembers.Text = members.Rows.Count.ToString();
        litProjects.Text = projects.Rows.Count.ToString();
        litEvents.Text = events.Rows.Count.ToString();
        litContacts.Text = contacts.Rows.Count.ToString();

        gvMembers.DataSource = members;
        gvMembers.DataBind();

        gvFeedback.DataSource = feedback;
        gvFeedback.DataBind();
    }
}