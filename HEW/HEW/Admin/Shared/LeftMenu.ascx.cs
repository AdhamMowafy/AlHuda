using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEW.Admin.Shared
{
    public partial class LeftMenu : System.Web.UI.UserControl
    {
        protected string strProjects;
        protected string strNews;
        protected string strNewsletter;
        protected string strCareers;
        protected string strUsers;
        protected string strCapabilities;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.IsInRole("1"))
            {
                strProjects = "<li><a href=\"/Admin/Projects\">Projects</a></li>";
                strNews = "<li><a href=\"/Admin/News\">News</a></li>";
                strNewsletter = "<li><a href=\"/Admin/NewsLetter\">Newsletters</a></li>";
                strCareers = "<li><a href=\"/Admin/Careers\">Careers</a></li>";
                strUsers = "<li><a href=\"/Admin/UserManagement\">Users Management</a></li>";
                strCapabilities = "<li><a href=\"/Admin/Capabilities\">Capabilities</a></li>";
            }
            else
            {
                 if (HttpContext.Current.User.IsInRole("2"))
                     strProjects = "<li><a href=\"/Admin/Projects\">Projects</a></li>";
                 else if (HttpContext.Current.User.IsInRole("3"))
                     strNews = "<li><a href=\"/Admin/News\">News</a></li>";
                 else if (HttpContext.Current.User.IsInRole("4"))
                     strCareers = "<li><a href=\"/Admin/Careers\">Careers</a></li>";
                 else if (HttpContext.Current.User.IsInRole("5"))
                     strNewsletter = "<li><a href=\"/Admin/NewsLetter\">Newsletters</a></li>";
                 else if (HttpContext.Current.User.IsInRole("6"))
                     strUsers = "<li><a href=\"/Admin/UserManagement\">Users Management</a></li>";
                 else if (HttpContext.Current.User.IsInRole("7"))
                     strUsers = "<li><a href=\"/Admin/Capabilities\">Capabilities</a></li>";
            }

            if(Request.RawUrl.Trim().ToLower().Contains("/projects/"))
                strProjects = "<li class=\"heading selected\">Projects</li>";
            else if (Request.RawUrl.Trim().ToLower().Contains("/news/"))
                strNews = "<li class=\"heading selected\">News</li>";
            else if (Request.RawUrl.Trim().ToLower().Contains("/careers/"))
                strCareers = "<li class=\"heading selected\">careers</li>";
            else if (Request.RawUrl.Trim().ToLower().Contains("/newsLetter/"))
                strNewsletter = "<li class=\"heading selected\">Newsletter</li>";
            else if (Request.RawUrl.Trim().ToLower().Contains("/usermanagement/"))
                strUsers = "<li class=\"heading selected\">Users Management</li>";
            else if (Request.RawUrl.Trim().ToLower().Contains("/capabilities/"))
                strCapabilities = "<li class=\"heading selected\">Capabilities</li>";
        }
    }
}