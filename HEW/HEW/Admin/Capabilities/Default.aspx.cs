using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Admin.Capabilities
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                RenderCapabilities();
        }

        private void RenderCapabilities()
        {
            HEWDataContext context = new HEWDataContext();
            var cpabilitiesObj = context.Capabilities.SingleOrDefault();
            if(cpabilitiesObj == null)
                return;
            txtAssetsDev.Text = cpabilitiesObj.NetAssestsDevelopment;
            txtCapitalDev.Text = cpabilitiesObj.CapitalDevelopment;
            txtStaff.Text = cpabilitiesObj.TotalEmployees;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool isInsert = false;
            HEWDataContext context = new HEWDataContext();
            var cpabilitiesObj = context.Capabilities.SingleOrDefault();
            if (cpabilitiesObj == null)
            {
                cpabilitiesObj = new Capability();
                isInsert = true;
            }
            cpabilitiesObj.CapitalDevelopment = txtCapitalDev.Text.Trim();
            cpabilitiesObj.NetAssestsDevelopment = txtAssetsDev.Text.Trim();
            cpabilitiesObj.TotalEmployees = txtStaff.Text.Trim();

            if(isInsert)
                context.Capabilities.InsertOnSubmit(cpabilitiesObj);

            context.SubmitChanges();
            Response.Redirect(Request.RawUrl);
        }
    }
}