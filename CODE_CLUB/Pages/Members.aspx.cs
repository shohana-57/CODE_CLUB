using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_Members : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadMembers();

    }


    private void LoadMembers()
    {
        DataTable dt = DatabaseHelper.GetMembers();

        if (dt.Rows.Count == 0)
        {
            rptMembers.Visible = false;
            lblEmpty.Visible = true;
        }
        else
        {
            rptMembers.DataSource = dt;
            rptMembers.DataBind();
        }
    }

    protected string GetInitials(string fullName)
    {
        if (string.IsNullOrWhiteSpace(fullName)) return "?";
        string[] parts = fullName.Split(' ');
        string initials = "";
        foreach (string part in parts)
        {
            if (part.Length > 0)
                initials += part[0];
        }
        return initials.ToUpper();
    }
}
