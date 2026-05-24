using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_MemberLogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool wasAdmin = SessionManager.IsAdminLoggedIn();
        bool wasMember = SessionManager.IsMemberLoggedIn();

        if (wasAdmin)
            SessionManager.LogoutAdmin();

        if (wasMember)
            SessionManager.LogoutMember();

        foreach (string cookieName in Request.Cookies.Keys)
        {
            var cookie = new System.Web.HttpCookie(cookieName, "")
            {
                Expires = DateTime.Now.AddDays(-1)
            };
            Response.Cookies.Add(cookie);
        }

      
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        Response.Redirect("~/Pages/Default.aspx", endResponse: true);
    }

}
