using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Frontend.About
{
    public partial class Default : System.Web.UI.Page
    {
        protected string strNetAssets;
        protected string strCapital;
        protected string strStaff;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetCapabilities();
        }

        private void GetCapabilities()
        {
            HEWDataContext context = new HEWDataContext();
            Capability capability = context.Capabilities.SingleOrDefault();
            strCapital = capability.NetAssestsDevelopment;
            strNetAssets = capability.NetAssestsDevelopment;
            strStaff = capability.TotalEmployees;
        }
    }
}