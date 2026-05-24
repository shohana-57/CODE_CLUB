using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string saved = SessionManager.GetVisitorName();
            if (!string.IsNullOrEmpty(saved))
                txtName.Text = saved;
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        int.TryParse(hdnRating.Value, out int rating);

        bool ok = DatabaseHelper.SaveFeedback(
            txtName.Text.Trim(),
            txtEmail.Text.Trim(),
            txtFeedback.Text.Trim(),
            rating
        );

        if (ok)
        {
            pnlForm.Visible = false;
            pnlSuccess.Visible = true;
        }
    }
}
