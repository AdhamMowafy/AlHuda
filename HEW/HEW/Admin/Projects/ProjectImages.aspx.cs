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
                if (
                    !Directory.Exists(
                        Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/")))
                {
                    Directory.CreateDirectory(
                        Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/"));
                }
                string path =
                    Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/") +
                    Guid.NewGuid() + "." + e.FileName.Split('.')[1];
                AjaxFileUpload1.SaveAs(path);

                //ImageConverter ic = new ImageConverter();
                //System.Drawing.Image image = (System.Drawing.Image)ic.ConvertFrom(File.ReadAllBytes(path));
                //if (image.Width > 5000 || image.Height > 5000)
                //{
                //    image = ResizeImage(image, 5000, 5000);
                //    image.Save(path);
                //}

                Account account = new Account("dlyvxs7of", "634626974285569",
                                              "FtB_0jhcmFypFS7QTwCBKcPRGzE");
                FileStream file = new FileStream(path, FileMode.Open, FileAccess.Read);
                Cloudinary cloudinary = new Cloudinary(account);
                ImageUploadParams uploadParams = new ImageUploadParams()
                    {
                        File = new FileDescription("file", file)
                    };

                ImageUploadResult uploadResult = cloudinary.Upload(uploadParams);



                HEWDataContext context = new HEWDataContext();
                context.ProjectsImages.InsertOnSubmit(new ProjectsImage
                    {ImgPublicID = uploadResult.PublicId, ProjectID = int.Parse(Request.QueryString["ProjectID"])});
                context.SubmitChanges();

                File.Delete(path);
            }
            catch (Exception)
            {
                { }
                throw;
            }
        }

        private System.Drawing.Image ResizeImage(System.Drawing.Image image, int width, int height)
        {
            if (image.Width <= width && image.Height <= height)
                return image;

            int sourceWidth = image.Width;
            int sourceHeight = image.Height;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)width / (float)sourceWidth);
            nPercentH = ((float)height / (float)sourceHeight);

            if (nPercentH < nPercentW)
            {
                nPercent = nPercentH;
                if (width < (sourceWidth * nPercent))
                {
                    nPercent = nPercentW;
                    height = (int)(sourceHeight * nPercent);
                }
                else
                {
                    width = (int)(sourceWidth * nPercent);
                }
            }
            else
            {
                nPercent = nPercentW;
                if (height < (sourceHeight * nPercent))
                {
                    nPercent = nPercentH;
                    width = (int)(sourceWidth * nPercent);
                }
                else
                {
                    height = (int)(sourceHeight * nPercent);
                }
            }

            Bitmap newImage = new Bitmap(width, height);
            Graphics g = Graphics.FromImage(newImage);
            g.InterpolationMode = InterpolationMode.HighQualityBicubic;

            g.DrawImage(image, 0, 0, width, height);
            g.Dispose();

            return newImage;
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