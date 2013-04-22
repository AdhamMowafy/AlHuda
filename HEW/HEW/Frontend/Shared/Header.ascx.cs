using System;
using System.Web.UI;

namespace HEW.Frontend.Shared
{
    public partial class Header : UserControl
    {
        protected string StrHomeSelected = "";
        protected string StrAboutSelected = "";
        protected string StrBoardSelected = "";
        protected string StrPartnershipsSelected = "";
        protected string StrProjectsSelected = "";
        protected string StrNewsSelected = "";
        protected string StrContactSelected = "";
        protected string StrCareersSelected = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.RawUrl.ToLower().Contains("/about/"))
                StrAboutSelected = "selected";
            else if (Request.RawUrl.ToLower().Contains("/board/"))
                StrBoardSelected = "selected";
            else if (Request.RawUrl.ToLower().Contains("/partnerships/"))
                StrPartnershipsSelected = "selected";
            else if (Request.RawUrl.ToLower().Contains("/projects/"))
                StrProjectsSelected = "selected";
            else if (Request.RawUrl.ToLower().Contains("/news/"))
                StrNewsSelected = "selected";
            else if (Request.RawUrl.ToLower().Contains("/contact/"))
                StrContactSelected = "selected";
            else if (Request.RawUrl.ToLower().Contains("/careers/"))
                StrCareersSelected = "selected";
            else 
                StrHomeSelected = "selected";
        }
    }
}