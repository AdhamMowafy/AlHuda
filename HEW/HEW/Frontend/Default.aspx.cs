using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;
using System.Configuration;

namespace HEW.Frontend
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetHomeNews();
            GetHomeProjects();
        }

        private void GetHomeNews()
        {
            HEWDataContext context = new HEWDataContext();
            IEnumerable<New> homeNews =
                context.News.Where(i => i.IsPublished).OrderByDescending(i => i.PublishDate).Take(2).ToList();
            rptNews.DataSource = homeNews;
            rptNews.DataBind();
        }

        private void GetHomeProjects()
        {
            HEWDataContext context = new HEWDataContext();
            
            var result = (from pr in context.Projects
                          where pr.IsHome && pr.ProjectsImages.Count > 0
                          select new {pr.ID, pr.Name, ImgsCount = pr.ProjectsImages.Count});

            rptHomeProjects.DataSource = result;
            rptHomeProjects.DataBind();
        } 

        protected string GetRandomImg(int projectId, int count)
        {
            Random rd = new Random();
            int rndImg = rd.Next(0, count);
            HEWDataContext context = new HEWDataContext();
            return
                context.ProjectsImages.Where(i => i.ProjectID == projectId).Skip(rndImg).Take(1).SingleOrDefault().
                    ImgPublicID;
        }

        protected string GetRandomProjectImage(int projectId)
        {
            string[] projectImgs =
                Directory.GetFiles(Server.MapPath(ConfigurationManager.AppSettings["ProjectImages"] + "Thumbnail/" + projectId + "/"));

            Random rand = new Random();
            int imgIndex = rand.Next(0, projectImgs.Length - 1);

            return Path.GetFileName(projectImgs[imgIndex]);
        }
    }
}