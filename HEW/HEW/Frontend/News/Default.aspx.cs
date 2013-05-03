using System;

namespace HEW.Frontend.News
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetNewsList();
        }

        private void GetNewsList()
        {
            rptNews.DataSource = Model.Repositories.NewsRepository.GetPublishedNewsList();
            rptNews.DataBind();
        }
    }
}