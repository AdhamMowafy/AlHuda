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
            var ss =
               
                context.News.Where(i => i.IsPublished).OrderByDescending(i => i.PublishDate).Take(2);
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

        
    }
}