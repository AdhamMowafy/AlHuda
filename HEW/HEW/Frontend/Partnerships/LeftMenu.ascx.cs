using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEW.Frontend.Partnerships
{
    public partial class LeftMenu : System.Web.UI.UserControl
    {
        protected string StrPartnershipsSelected = "";
        protected string StrSisterSelected = "";
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.RawUrl.ToLower().Contains("Sister.aspx"))
                StrSisterSelected = "active";
            else
                StrPartnershipsSelected = "active";
        }
    }
}