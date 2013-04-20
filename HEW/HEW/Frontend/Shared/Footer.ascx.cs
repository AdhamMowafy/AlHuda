using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Frontend.Shared
{
    public partial class Footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetHomeNews();
        }

        private void GetHomeNews()
        {
            HEWDataContext context = new HEWDataContext();
            IEnumerable<New> homeNews =
                context.News.Where(i => i.IsPublished).OrderByDescending(i => i.PublishDate).Take(3).ToList();
            rptFooterNews.DataSource = homeNews;
            rptFooterNews.DataBind();
        }

        public void btnRegister_Click(object sender, EventArgs e)
        {
            HEWDataContext context = new HEWDataContext();
            if (context.Newsletters.Any(i => i.Email == txtMail.Text.Trim()))
            {
                return;
            }
            
            Newsletter newsletter = new Newsletter{Email = txtMail.Text.Trim()};
            context.Newsletters.InsertOnSubmit(newsletter);
            context.SubmitChanges();

            txtMail.Text = string.Empty;
        }
    }
}