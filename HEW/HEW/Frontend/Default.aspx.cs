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
            string[] projects = Directory.GetDirectories(Server.MapPath(ConfigurationManager.AppSettings["ProjectImages"] + "Thumbnail/"));
            for (int i = 0; i < projects.Count(); i++)
            {
                projects[i] = Path.GetFileName(projects[i]);
            }
            HEWDataContext context = new HEWDataContext();
            IEnumerable<Project> homeProjects =
                context.Projects.Where(i => i.IsHome && projects.Contains(i.ID.ToString())).ToList();

            rptHomeProjects.DataSource = homeProjects;
            rptHomeProjects.DataBind();
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