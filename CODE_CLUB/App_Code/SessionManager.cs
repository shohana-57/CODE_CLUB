using System;
using System.Web;
using System.Web.Security;

public static class SessionManager
{
    private const string KEY_ADMIN_NAME = "AdminName";
    private const string KEY_ADMIN_ID = "AdminID";
    private const string KEY_MEMBER_ID = "MemberID";
    private const string KEY_MEMBER_NAME = "MemberName";
    private const string KEY_MEMBER_EMAIL = "MemberEmail";
    private const string KEY_MEMBER_ROLE = "MemberRole";

    private const string COOKIE_REMEMBER_ADMIN = "CC_AdminRemember";
    private const string COOKIE_VISITOR_NAME = "CC_VisitorName";

    public static void SetAdminSession(string username, bool rememberMe)
    {
        HttpContext.Current.Session[KEY_ADMIN_NAME] = username;
        FormsAuthentication.SetAuthCookie(username, rememberMe);

        if (rememberMe)
        {
            var cookie = new HttpCookie(COOKIE_REMEMBER_ADMIN, username)
            {
                Expires = DateTime.Now.AddDays(7),
                HttpOnly = true,
                Secure = false
            };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
    }

    public static bool IsAdminLoggedIn()
    {
        return HttpContext.Current.Session[KEY_ADMIN_NAME] != null
            || HttpContext.Current.User.Identity.IsAuthenticated;
    }

    public static string GetAdminName()
    {
        return HttpContext.Current.Session[KEY_ADMIN_NAME]?.ToString()
            ?? HttpContext.Current.User.Identity.Name
            ?? "Admin";
    }

    public static void LogoutAdmin()
    {
        HttpContext.Current.Session.Abandon();
        FormsAuthentication.SignOut();

        var cookie = new HttpCookie(COOKIE_REMEMBER_ADMIN, "")
        {
            Expires = DateTime.Now.AddDays(-1),
            HttpOnly = true
        };
        HttpContext.Current.Response.Cookies.Add(cookie);

        var sessionCookie = new HttpCookie("CodeClubSession", "")
        {
            Expires = DateTime.Now.AddDays(-1)
        };
        HttpContext.Current.Response.Cookies.Add(sessionCookie);
    }

    public static string GetRememberedAdmin()
    {
        var cookie = HttpContext.Current.Request.Cookies[COOKIE_REMEMBER_ADMIN];
        return cookie?.Value;
    }

    public static void SetMemberSession(int memberId, string fullName,
                                        string email, string role)
    {
        HttpContext.Current.Session[KEY_MEMBER_ID] = memberId;
        HttpContext.Current.Session[KEY_MEMBER_NAME] = fullName;
        HttpContext.Current.Session[KEY_MEMBER_EMAIL] = email;
        HttpContext.Current.Session[KEY_MEMBER_ROLE] = role;

        var cookie = new HttpCookie(COOKIE_VISITOR_NAME, fullName)
        {
            Expires = DateTime.Now.AddDays(1),
            HttpOnly = true
        };
        HttpContext.Current.Response.Cookies.Add(cookie);
    }

    public static bool IsMemberLoggedIn()
    {
        return HttpContext.Current.Session[KEY_MEMBER_ID] != null;
    }

    public static int GetMemberID()
    {
        var val = HttpContext.Current.Session[KEY_MEMBER_ID];
        return val != null ? (int)val : 0;
    }

    public static string GetMemberName()
    {
        return HttpContext.Current.Session[KEY_MEMBER_NAME]?.ToString() ?? "";
    }

    public static string GetMemberEmail()
    {
        return HttpContext.Current.Session[KEY_MEMBER_EMAIL]?.ToString() ?? "";
    }

    public static void LogoutMember()
    {
        HttpContext.Current.Session.Abandon();

        var cookie = new HttpCookie(COOKIE_VISITOR_NAME, "")
        {
            Expires = DateTime.Now.AddDays(-1)
        };
        HttpContext.Current.Response.Cookies.Add(cookie);

        var sessionCookie = new HttpCookie("CodeClubSession", "")
        {
            Expires = DateTime.Now.AddDays(-1)
        };
        HttpContext.Current.Response.Cookies.Add(sessionCookie);
    }

    public static string GetVisitorName()
    {
        var cookie = HttpContext.Current.Request.Cookies[COOKIE_VISITOR_NAME];
        return cookie?.Value ?? "";
    }
}