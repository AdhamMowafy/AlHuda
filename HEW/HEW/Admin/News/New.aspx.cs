using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using HEW.Model;
using System;
using System.IO;
using System.Linq;
using System.Web;

namespace HEW.Admin.News
{
    public partial class New : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtPublishDate.Attributes.Add("readonly", "readonly");
            if (!IsPostBack)
            {
                int newsId = 0;
                if (Request.QueryString["ID"] != null)
                {
                    if (int.TryParse(Request.QueryString["ID"], out newsId))
                        RenderNewsItem(newsId);
                }
            }
        }

        private void RenderNewsItem(int newsId)
        {
            Model.New newsObj = Model.Repositories.NewsRepository.GetNewsItem(newsId);
            if(newsObj == null)
                Response.Redirect("Default.aspx");

            txtTitle.Text = newsObj.Title;
            txtBody.Text = newsObj.Body;
            txtPublishDate.Text = newsObj.PublishDate.ToString("dd/MM/yyyy");
            cbIsPublished.Checked = newsObj.IsPublished;
            
            imgNews.Visible = true;
            imgNews.ImageUrl = "http://images.weserv.nl/?url=res.cloudinary.com/dlyvxs7of/image/upload/" +
                               newsObj.ImgPublicID + ".jpg&h=162&w=176&t=absolute";
        }

        protected void UploadComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            Session["ImageBytes"] = Convert.ToBase64String(afuImage1.FileBytes);
        }

        [System.Web.Services.WebMethod]
        public static string GetImageID1()
        {
            System.Web.SessionState.HttpSessionState Session = HttpContext.Current.Session;
            String retval = Session["ImageBytes"].ToString();
            Session["ImageBytes"] = null;
            return retval;
        }

        private void AddNews()
        {
            HEWDataContext context = new HEWDataContext();
            Model.New newsObj = new Model.New();
            newsObj.Title = txtTitle.Text.Trim();
            newsObj.Body = txtBody.Text.Trim();
            newsObj.IsPublished = cbIsPublished.Checked;
            newsObj.PublishDate = Convert.ToDateTime(txtPublishDate.Text);
            newsObj.ImgPublicID = UploadImg("");
            context.News.InsertOnSubmit(newsObj);
            context.SubmitChanges();
            
            Response.Redirect("Default.aspx");
        }

        private void EditNews(int newsId)
        {
            HEWDataContext context = new HEWDataContext();
            var newsObj = context.News.SingleOrDefault(i => i.ID == newsId);
            newsObj.Title = txtTitle.Text.Trim();
            newsObj.Body = txtBody.Text.Trim();
            newsObj.IsPublished = cbIsPublished.Checked;
            newsObj.PublishDate = Convert.ToDateTime(txtPublishDate.Text);
            
            if (hdnImage.Value != "")
                newsObj.ImgPublicID = UploadImg("");
            
            context.SubmitChanges();
            Response.Redirect(Request.RawUrl);
        }

        private string UploadImg(string picPublicId)
        {
            byte[] imageBytes = Convert.FromBase64String(hdnImage.Value);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);

            Account account = new Account("dlyvxs7of", "634626974285569", "FtB_0jhcmFypFS7QTwCBKcPRGzE");

            Cloudinary cloudinary = new Cloudinary(account);
            if (!string.IsNullOrEmpty(picPublicId))
                cloudinary.DeleteResources(new string[] {picPublicId});
            
            ImageUploadParams uploadParams = new ImageUploadParams()
            {
                File = new FileDescription("file", ms), 
            };

            ImageUploadResult result = cloudinary.Upload(uploadParams);
            return result.PublicId;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
                AddNews();
            else
                EditNews(int.Parse(Request.QueryString["ID"]));
        }
    }
}