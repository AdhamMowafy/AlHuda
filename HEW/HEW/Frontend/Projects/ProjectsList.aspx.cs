using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HEW.Frontend.Projects
{
    public partial class ProjectsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "AL HUDA Engineering Works - Projects List";
            int projectCategory;
            if (int.TryParse(Request.QueryString["ProjectCategory"], out projectCategory))
            {
                Page.Title += " " + RenderProjectCategories(projectCategory);
            }
        }

        private string RenderProjectCategories(int projectCategory)
        {
            var projectsList = Model.Repositories.ProjectsRepository.GetProjectsByCategory(projectCategory);
            
            rptProjectCategories.DataSource = projectsList;
            rptProjectCategories.DataBind();

            return "";//projectsList.GetEnumerator()..ProjectsCategory.Name;
        }

        protected void ItemBound(object sender, RepeaterItemEventArgs args)
        {
            
            if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (args.Item.DataItem != null)
                {
                    int projectId = Convert.ToInt32(((Model.ModelViews.ProjectModelViews) args.Item.DataItem).ID);
                    
                    Repeater rp2 = (Repeater)args.Item.FindControl("rptImages");
                    rp2.DataSource = new Model.HEWDataContext().ProjectsImages.Where(i=>i.ProjectID == projectId).ToList();
                    rp2.DataBind();
                }
            }
        }

    }
}