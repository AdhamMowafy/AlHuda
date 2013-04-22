using System;

namespace HEW.Frontend.About
{
    public partial class LeftMenu : System.Web.UI.UserControl
    {
        protected string StrVisionSelected = "";
        protected string StrMissionSelected = "";
        protected string StrClientsSelected = "";
        protected string StrIsoSelected = "";
        protected string StrMessageSelected = "";
        protected string StrResourcesSelected = "";
        protected string StrWhatWeDoSelected = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.RawUrl.ToLower().Contains("mission.aspx"))
                StrMissionSelected = "active";
            else if (Request.RawUrl.ToLower().Contains("clients.aspx"))
                StrClientsSelected = "active";
            else if (Request.RawUrl.ToLower().Contains("iso.aspx"))
                StrIsoSelected = "active";
            else if (Request.RawUrl.ToLower().Contains("message.aspx"))
                StrMessageSelected = "active";
            else if (Request.RawUrl.ToLower().Contains("resources.aspx"))
                StrResourcesSelected = "active";
            else if (Request.RawUrl.ToLower().Contains("whatwedp.aspx"))
                StrWhatWeDoSelected = "active";
            else
                StrVisionSelected = "active";
        }
    }
}