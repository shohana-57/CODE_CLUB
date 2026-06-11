using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pages_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

        if (!IsPostBack)
        {
            string remembered = SessionManager.GetRememberedAdmin();
            if (!string.IsNullOrEmpty(remembered))
                txtAdminUser.Text = remembered;
        }


    }

    protected void btnMemberLogin_Click(object sender, EventArgs e)
    {
        string email = txtMemberEmail.Text.Trim();
        string pwd = txtMemberPwd.Text;

        if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(pwd))
        {
            ShowError("Please enter your email and password.");
            return;
        }

        var row = DatabaseHelper.ValidateMember(email, pwd);

        if (row != null)
        {
            SessionManager.SetMemberSession(
               (int)row["MemberID"],
               row["FullName"].ToString(),
               row["Email"].ToString(),
               row["Role"].ToString()
           );
            Response.Redirect("~/Pages/Default.aspx");
        }
        else
        {
            ShowError("Invalid email or password. Please try again.");
            txtMemberPwd.Text = ""; 
        }
    }

    protected void btnAdminLogin_Click(object sender, EventArgs e)
    {
        string username = txtAdminUser.Text.Trim();
        string pwd = txtAdminPwd.Text;
        bool remember = chkRemember.Checked;

        if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(pwd))
        {
            ShowError("Please enter username and password.");
            return;
        }

        bool valid = DatabaseHelper.ValidateAdmin(username, pwd);

        if (valid)
        {
            SessionManager.SetAdminSession(username, remember);
            Response.Redirect("~/Pages/Admin/Dashboard.aspx");
        }
        else
        {
            ShowError("Invalid admin credentials.");
            txtAdminPwd.Text = "";
        }


    }

    private void ShowError(string msg)
    {
        pnlError.Visible = true;
        errMsg.InnerHtml = msg;
    }
}
