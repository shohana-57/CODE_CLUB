using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
}
