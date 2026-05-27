using System;
using System.Web.UI;

public partial class Pages_Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string saved = SessionManager.GetVisitorName();
            if (!string.IsNullOrEmpty(saved))
            {
                txtName.Text = saved;
            }
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
            return;

        bool ok = DatabaseHelper.SaveContact(txtName.Text, txtEmail.Text, txtMessage.Text);

        if (ok)
        {
            pnlForm.Visible = false;
            pnlSuccess.Visible = true;
        }
        else
        {
            lblError.Visible = true;
        }
    }

    protected System.Web.UI.WebControls.Label lblError =>
        (System.Web.UI.WebControls.Label)FindControl("lblContactError")
        ?? new System.Web.UI.WebControls.Label();
}
