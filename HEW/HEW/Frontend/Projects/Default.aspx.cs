using System;

namespace HEW.Frontend.Projects
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RenderProjectCategories();
        }

        private void RenderProjectCategories()
        {
            var projectCatList = Model.Repositories.ProjectsRepository.GetProjectsCategories();

            rptProjectCategories.DataSource = projectCatList;
            rptProjectCategories.DataBind();
        }
    }
}