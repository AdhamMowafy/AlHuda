using HEW.Model;
using System;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace HEW.Admin.Projects
{
    public partial class ProjectImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            if (!Directory.Exists(Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/")))
            {
                Directory.CreateDirectory(
                    Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/"));
            }
            string path = Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/") + Guid.NewGuid() + "." + e.FileName.Split('.')[1];
            AjaxFileUpload1.SaveAs(path);

            CloudinaryDotNet.Account account = new CloudinaryDotNet.Account("dlyvxs7of", "634626974285569",
                                                                            "FtB_0jhcmFypFS7QTwCBKcPRGzE");

            CloudinaryDotNet.Cloudinary cloudinary = new CloudinaryDotNet.Cloudinary(account);
            CloudinaryDotNet.Actions.ImageUploadParams uploadParams = new CloudinaryDotNet.Actions.ImageUploadParams()
            {
                File = new CloudinaryDotNet.Actions.FileDescription(path)
            };

            CloudinaryDotNet.Actions.ImageUploadResult uploadResult = cloudinary.Upload(uploadParams);
            
            HEWDataContext context = new HEWDataContext();
            context.ProjectsImages.InsertOnSubmit(new ProjectsImage
                {ImgPublicID = uploadResult.PublicId, ProjectID = int.Parse(Request.QueryString["ProjectID"])});
            context.SubmitChanges();

            File.Delete(path);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton Delete = (LinkButton)sender;
            string imageID = Delete.CommandArgument;

            HEWDataContext context = new HEWDataContext();
            ProjectsImage image = context.ProjectsImages.SingleOrDefault(i=>i.ID == int.Parse(imageID));

            CloudinaryDotNet.Account account = new CloudinaryDotNet.Account("dlyvxs7of", "634626974285569",
                                                                            "FtB_0jhcmFypFS7QTwCBKcPRGzE");
            CloudinaryDotNet.Cloudinary cloudinary = new CloudinaryDotNet.Cloudinary(account);
            cloudinary.DeleteResources(new [] {image.ImgPublicID});
            
            context.ProjectsImages.DeleteOnSubmit(image);
            context.SubmitChanges();

            rptImages.DataBind();
        }
    }
}