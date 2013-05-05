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
            var newsResult = Model.Repositories.NewsRepository.GetPublishedNewsList();
            foreach (var @new in newsResult)
            {
                @new.Title = Helpers.TrimString(@new.Title, 56);
                @new.Body = Helpers.TrimString(@new.Body, 200);
            }
            rptNews.DataSource = newsResult;
            rptNews.DataBind();
        }
    }
}