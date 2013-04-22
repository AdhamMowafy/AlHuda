using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Frontend.Shared
{
    public partial class SideProjects : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetSideProjects();
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

        private void GetSideProjects()
        {
            HEWDataContext context = new HEWDataContext();

            var result = (from pr in context.Projects
                          where pr.IsSide && pr.ProjectsImages.Count > 0
                          select new { pr.ID, pr.Name, ImgsCount = pr.ProjectsImages.Count });

            rptSideProjects.DataSource = result;
            rptSideProjects.DataBind();
        }
    }
}