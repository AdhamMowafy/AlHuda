using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEW.Frontend.Projects
{
    public partial class ProjectsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "AL HUDA Engineering Works - Projects List";
            int projectCategory;
            if (int.TryParse(Request.QueryString["ProjectCategory"], out projectCategory))
            {
                Page.Title += " " + RenderProjectCategories(projectCategory);
            }
        }

        private string RenderProjectCategories(int projectCategory)
        {
            var projectsList = Model.Repositories.ProjectsRepository.GetProjectsByCategory(projectCategory);

            rptProjectCategories.DataSource = projectsList;
            rptProjectCategories.DataBind();

            return "";//projectsList.GetEnumerator()..ProjectsCategory.Name;
        }

    }
}