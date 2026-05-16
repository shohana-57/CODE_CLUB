using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CODE_CLUB.Pages
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadEvents();


        }

        private void LoadEvents()
        {
            DataTable dt = DatabaseHelper.GetEvents(visibleOnly: true);

            if (dt.Rows.Count == 0)
            {
                rptEvents.Visible = false;
                lblEmpty.Visible = true;
            }
            else
            {
                rptEvents.DataSource = dt;
                rptEvents.DataBind();
            }
        }

    }
}