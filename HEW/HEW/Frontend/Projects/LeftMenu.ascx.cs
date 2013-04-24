using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEW.Frontend.Projects
{
    public partial class LeftMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RenderProjectCategories();
        }

        private void RenderProjectCategories()
        {
            var projectCatList = Model.Repositories.ProjectsRepository.GetProjectsCategories();
            DataTable dt = Helpers.ToDataTable(projectCatList);
            dt.Columns.Add("Class");
            foreach (DataRow row in dt.Rows)
            {
                if (Request.QueryString["ProjectCategory"] == row["ID"].ToString())
                {
                    row["Class"] = "active";
                }
                else
                {
                    row["Class"] = "";
                }
            }
            dt.AcceptChanges();
            rptProjectCategories.DataSource = dt;
            rptProjectCategories.DataBind();
        }
    }
}