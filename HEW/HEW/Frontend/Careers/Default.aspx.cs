using System;

namespace HEW.Frontend.Careers
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RenderCreers();
        }

        private void RenderCreers()
        {
            rptCareers.DataSource = Model.Repositories.CareersRepository.GetPublishVacanciesCategories();
            rptCareers.DataBind();
        }
    }
}