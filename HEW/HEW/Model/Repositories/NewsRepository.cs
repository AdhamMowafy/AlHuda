using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HEW.Model.Repositories
{
    public class NewsRepository
    {
        static HEWDataContext _ModelDbContext;

        public static New GetNewsItem(int newsId)
        {
            _ModelDbContext = new HEWDataContext();
            return _ModelDbContext.News.SingleOrDefault(i => i.ID == newsId);
        }

        public static List<New> GetPublishedNewsList()
        {
            _ModelDbContext = new HEWDataContext();
            return _ModelDbContext.News.Where(i => i.IsPublished).OrderByDescending(i=>i.PublishDate).ToList();
        }

        public static List<New> GetPublishedOtherNewsList(int newsId)
        {
            _ModelDbContext = new HEWDataContext();
            return _ModelDbContext.News.Where(i => i.IsPublished && i.ID != newsId).OrderByDescending(i => i.PublishDate).ToList();
        }
    }
}