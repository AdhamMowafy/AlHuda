using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEW.Frontend.News
{
    public partial class NewsDetails : System.Web.UI.Page
    {
        protected string strNewsImgPublicId;
        protected string strNewsTitle;
        protected string strNewsBody;
        protected string strPiblishDate;

        protected void Page_Load(object sender, EventArgs e)
        {
            int newsId;
            if (Request.QueryString["ID"] != null)
            {
                if (int.TryParse(Request.QueryString["ID"], out newsId))
                {
                    GetOtherNews(newsId);
                    GetNewsDetails(newsId);
                }
            }
            else
                Response.Redirect("Default.aspx");
        }

        private void GetOtherNews(int newsId)
        {
            rptOtherNews.DataSource = Model.Repositories.NewsRepository.GetPublishedOtherNewsList(newsId);
            rptOtherNews.DataBind();
        }

        private void GetNewsDetails(int newsId)
        {
            var newsItem = Model.Repositories.NewsRepository.GetNewsItem(newsId);
            if(newsItem == null || !newsItem.IsPublished)
                Response.Redirect("Default.aspx");

            Page.Title = "AL HUDA Engineering Works - " + newsItem.Title;
            strNewsImgPublicId = newsItem.ImgPublicID;
            strNewsTitle = newsItem.Title;
            strNewsBody = newsItem.Body;
            strPiblishDate = Convert.ToDateTime(newsItem.PublishDate).ToString("dd/MM/yyyy");
        }
    }
}