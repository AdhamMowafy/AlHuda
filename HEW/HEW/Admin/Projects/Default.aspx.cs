using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Admin.Projects
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton Delete = (ImageButton)sender;
            string IDVal = Delete.CommandArgument;
            int id = int.Parse(IDVal);

            HEWDataContext context = new HEWDataContext();
            Project project = context.Projects.SingleOrDefault(i => i.ID == id);
            IEnumerable<ProjectsImage> images = context.ProjectsImages.Where(i => i.ProjectID == id);

            CloudinaryDotNet.Account account = new CloudinaryDotNet.Account("dlyvxs7of", "634626974285569",
                                                                            "FtB_0jhcmFypFS7QTwCBKcPRGzE");
            CloudinaryDotNet.Cloudinary cloudinary = new CloudinaryDotNet.Cloudinary(account);
            cloudinary.DeleteResources(images.Select(i => i.ImgPublicID).ToArray());

            context.ProjectsImages.DeleteAllOnSubmit(images);
            context.Projects.DeleteOnSubmit(project);
            context.SubmitChanges();
            gvProjects.DataBind();


        }
    }
}