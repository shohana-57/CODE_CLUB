//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;


//public partial class MasterPage : System.Web.UI.MasterPage
//{
//    protected bool IsMemberLoggedIn;
//    protected string MemberName = "";
//    protected bool IsAdminLoggedIn;
//    protected string AdminName = "";

//    protected void Page_Load(object sender, EventArgs e)
//    {
//        try
//        {
//            IsMemberLoggedIn = SessionManager.IsMemberLoggedIn();
//            if (IsMemberLoggedIn)
//            {
//                MemberName = SessionManager.GetMemberName();
//            }

//            IsAdminLoggedIn = SessionManager.IsAdminLoggedIn();
//            if (IsAdminLoggedIn)
//            {
//                AdminName = SessionManager.GetAdminName();
//            }
//        }
//        catch
//        {
//            IsMemberLoggedIn = false;
//            IsAdminLoggedIn = false;
//        }

//    }
//}

using System;
using System.Web;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected bool IsMemberLoggedIn => HttpContext.Current?.Session["MemberID"] != null;

    protected bool IsAdminLoggedIn
    {
        get { return HttpContext.Current?.Session["AdminName"] != null || HttpContext.Current?.User?.Identity?.IsAuthenticated == true; }
    }

    protected string MemberName
    {
        get { return HttpContext.Current?.Session["MemberName"]?.ToString() ?? ""; }
    }

    protected string AdminName
    {
        get { return HttpContext.Current?.Session["AdminName"]?.ToString() ?? HttpContext.Current?.User?.Identity?.Name ?? "Admin"; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Set member/guest visibility
        phMember.Visible = IsMemberLoggedIn;
        phGuest.Visible = !IsMemberLoggedIn;
        litMemberName.Text = MemberName;

        // Set admin badge
        phAdmin.Visible = IsAdminLoggedIn;
        litAdminName.Text = AdminName;
    }
}