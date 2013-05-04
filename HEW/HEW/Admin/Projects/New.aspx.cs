using HEW.Model;
using System;
using System.Linq;

namespace HEW.Admin.Projects
{
    public partial class New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int projectId = 0;
                if (Request.QueryString["ID"] != null)
                {
                    if (int.TryParse(Request.QueryString["ID"], out projectId))
                        RenderProjectItem(projectId);
                }
            }
        }

        private void RenderProjectItem(int projectId)
        {
            Model.Project projectObj = Model.Repositories.ProjectsRepository.GetProjectItem(projectId);
            if (projectObj == null)
                Response.Redirect("Default.aspx");

            txtName.Text = projectObj.Name;
            txtDescription.Text = projectObj.Description;
            ddlCategories.SelectedValue = projectObj.CategoryID.ToString();
            cbIsHome.Checked = projectObj.IsHome;
            cbIsSideMenu.Checked = projectObj.IsSide;
        }

        private void AddProject()
        {
            HEWDataContext context = new HEWDataContext();
            Project projectObj = new Project();
            projectObj.Name = txtName.Text.Trim();
            projectObj.Description = txtDescription.Text.Trim();
            projectObj.IsHome = cbIsHome.Checked;
            projectObj.IsSide = cbIsSideMenu.Checked;
            projectObj.CategoryID = Int16.Parse(ddlCategories.SelectedValue);
            context.Projects.InsertOnSubmit(projectObj);
            context.SubmitChanges();

            Response.Redirect("Default.aspx");
        }

        private void EditProject(int projectId)
        {
            HEWDataContext context = new HEWDataContext();
            var projectObj = context.Projects.SingleOrDefault(i => i.ID == projectId);
            projectObj.Name = txtName.Text.Trim();
            projectObj.Description = txtDescription.Text.Trim();
            projectObj.IsHome = cbIsHome.Checked;
            projectObj.IsSide = cbIsSideMenu.Checked;
            projectObj.CategoryID = Int16.Parse(ddlCategories.SelectedValue);
            context.SubmitChanges();
            
            Response.Redirect(Request.RawUrl);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
                AddProject();
            else
                EditProject(int.Parse(Request.QueryString["ID"]));
        }
    }
}