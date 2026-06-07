using System;

public partial class Pages_MemberLogout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (SessionManager.IsAdminLoggedIn())
            SessionManager.LogoutAdmin();

      
        if (SessionManager.IsMemberLoggedIn())
            SessionManager.LogoutMember();

        string[] cookieNames = new string[Request.Cookies.Count];
        for (int i = 0; i < Request.Cookies.Count; i++)
            cookieNames[i] = Request.Cookies[i].Name;

        foreach (string name in cookieNames)
        {
            var cookie = new System.Web.HttpCookie(name, "")
            {
                Expires = DateTime.Now.AddDays(-1)
            };
            Response.Cookies.Add(cookie);
        }

        
        Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
        Response.Cache.SetNoStore();

       
        Response.Redirect("~/Pages/Default.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }
}