using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Image = System.Web.UI.WebControls.Image;

namespace HEW.Admin.Projects
{
    public partial class ProjectImages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetProjectImages();
        }

        private void GetProjectImages()
        {
            if(!Directory.Exists(Server.MapPath("/FrontEnd/Projects/Images/Thumbnail/" + Request.QueryString["ProjectID"])))
                return;

            string[] fileList =
                Directory.GetFiles(Server.MapPath("/FrontEnd/Projects/Images/Thumbnail/" + Request.QueryString["ProjectID"]));
            for (int i = 0; i < fileList.Count(); i++)
            {
                fileList[i] = Path.GetFileName(fileList[i]);
            }
            rptImages.DataSource = fileList;
            rptImages.DataBind();
        }

        protected void UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            if (!Directory.Exists(Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/")))
            {
                Directory.CreateDirectory(
                    Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/"));
                Directory.CreateDirectory(
                    Server.MapPath("/FrontEnd/Projects/Images/Thumbnail/" + Request.QueryString["ProjectID"] + "/"));
                Directory.CreateDirectory(
                    Server.MapPath("/FrontEnd/Projects/Images/Gallery/" + Request.QueryString["ProjectID"] + "/"));
            }
            string path = Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/") + Guid.NewGuid() + "." + e.FileName.Split('.')[1];
            AjaxFileUpload1.SaveAs(path);

            ImageConverter ic = new ImageConverter();
            System.Drawing.Image image = (System.Drawing.Image)ic.ConvertFrom(File.ReadAllBytes(path));
            image = ResizeImage(image, 176, 162);
            image.Save(path.Replace("\\Original\\", "\\Thumbnail\\"));

            image = (System.Drawing.Image)ic.ConvertFrom(File.ReadAllBytes(path));
            image = ResizeImage(image, 800, 800);
            image.Save(path.Replace("\\Original\\", "\\Gallery\\"));

            
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
            string imageName = Delete.CommandArgument;

            if (File.Exists(Server.MapPath("/FrontEnd/Projects/Images/Thumbnail/" + Request.QueryString["ProjectID"] + "/" + imageName)))
                File.Delete(
                    Server.MapPath("/FrontEnd/Projects/Images/Thumbnail/" + Request.QueryString["ProjectID"] + "/" +
                                   imageName));
            if (File.Exists(Server.MapPath("/FrontEnd/Projects/Images/Gallery/" + Request.QueryString["ProjectID"] + "/" + imageName)))
                File.Delete(
                    Server.MapPath("/FrontEnd/Projects/Images/Gallery/" + Request.QueryString["ProjectID"] + "/" +
                                   imageName));

            if (File.Exists(Server.MapPath("/FrontEnd/Projects/Images/Gallery/" + Request.QueryString["ProjectID"] + "/" + imageName)))
                File.Delete(
                    Server.MapPath("/FrontEnd/Projects/Images/Original/" + Request.QueryString["ProjectID"] + "/" +
                                   imageName));

            GetProjectImages();
        }
    }
}