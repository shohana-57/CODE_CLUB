using System;
using System.Data;
using System.Text;

public partial class Pages_Projects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadProjects();
    }

    private void LoadProjects()
    {
        DataTable dt = DatabaseHelper.GetProjects(visibleOnly: true);

        if (dt.Rows.Count == 0)
        {
            rptProjects.Visible = false;
            lblEmpty.Visible = true;
        }
        else
        {
            rptProjects.DataSource = dt;
            rptProjects.DataBind();
        }
    }

    // Called from .aspx to build tech badge spans
    protected string BuildTechBadges(string technologies)
    {
        if (string.IsNullOrWhiteSpace(technologies)) return "";
        var sb = new StringBuilder();
        foreach (var tech in technologies.Split(','))
            sb.Append("<span>" + tech.Trim() + "</span>");
        return sb.ToString();
    }
}
