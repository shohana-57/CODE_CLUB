using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace CODE_CLUB.App_Code
{
    public class SessionManager
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
                    HttpOnly = true
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
                Expires = DateTime.Now.AddDays(-1)
            };
            HttpContext.Current.Response.Cookies.Add(cookie);

            var sessionCookie = new HttpCookie("CodeClubSession", "")
            {
                Expires = DateTime.Now.AddDays(-1)
            };
            HttpContext.Current.Response.Cookies.Add(sessionCookie);
        }

    }
}