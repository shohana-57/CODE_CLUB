using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Pages_Join : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (SessionManager.ISMemberLoggedIn())
            Response.Redirect("~/Pages/Default.aspx");
    }

    protected void btnJoin_click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string name = txtName.Text.Trim();
        string email = txtEmail.Text.Trim();
        string pwd = txtPassword.Text;
        string skill = ddlSkill.SelectedValue;
        string why = txtWhy.Text.Trim();

        if (DatabaseHelper.EmailExists(email))
        {
            ShowMessage("That email is already registered. " +
                        "<a href='Login.aspx'>Login instead?</a>", isError: true);
            return;
        }


        bool ok = DatabaseHelper.RegisterMember(name, email, pwd, skill, why);

        if (ok)
        {
            var row = DatabaseHelper.ValidateMember(email, pwd);
            if (row != null)
            {
                SessionManager.SetMemberSession(
                    (int)row["MemberID"],
                    row["FullName"].ToString(),
                    row["Email"].ToString(),
                    row["Role"].ToString()
                );
            }

            pnlForm.Visible = false;
            ShowMessage("🎉 Welcome to CodeClub, " + name +
                        "! Your account has been created.", isError: false);
        }

        else
        {
            ShowMessage("Registration failed. Please try again.", isError: true);
        }
    }

    private void ShowMessage(string msg, bool isError)
    {
        pnlMessage.Visible = true;
        formMsg.InnerHtml = msg;
        formMsg.Attributes["class"] = isError ? "form-message error" : "form-message success";
    }
}
