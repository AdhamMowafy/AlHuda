using System.Data.SqlTypes;
using System.Drawing;
using System.Drawing.Drawing2D;
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
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
            try
            {
                Account account = new Account("dlyvxs7of", "634626974285569", "FtB_0jhcmFypFS7QTwCBKcPRGzE");
                
                Cloudinary cloudinary = new Cloudinary(account);
                ImageUploadParams uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription("file", new MemoryStream(e.GetContents()))
                    };

                ImageUploadResult uploadResult = cloudinary.Upload(uploadParams);

                HEWDataContext context = new HEWDataContext();
                context.ProjectsImages.InsertOnSubmit(new ProjectsImage
                    {ImgPublicID = uploadResult.PublicId, ProjectID = int.Parse(Request.QueryString["ProjectID"])});
                context.SubmitChanges();
            }
            catch (Exception)
            {
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton Delete = (LinkButton)sender;
            string imageID = Delete.CommandArgument;

            HEWDataContext context = new HEWDataContext();
            ProjectsImage image = context.ProjectsImages.SingleOrDefault(i=>i.ID == int.Parse(imageID));

            Account account = new Account("dlyvxs7of", "634626974285569", "FtB_0jhcmFypFS7QTwCBKcPRGzE");
            Cloudinary cloudinary = new Cloudinary(account);
            cloudinary.DeleteResources(new [] {image.ImgPublicID});
            
            context.ProjectsImages.DeleteOnSubmit(image);
            context.SubmitChanges();

            rptImages.DataBind();
        }
    }
}