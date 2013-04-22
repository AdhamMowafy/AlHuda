using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Admin.News
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
            Model.New nNew = context.News.SingleOrDefault(i => i.ID == id);
            context.News.DeleteOnSubmit(nNew);
            context.SubmitChanges();
            gvNews.DataBind();
        }
    }
}