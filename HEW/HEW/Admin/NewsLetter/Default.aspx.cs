using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HEW.Model;

namespace HEW.Admin.NewsLetter
{
    public partial class Default : System.Web.UI.Page
    {
        protected string strRegisteredUsers;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
                GetRegisteredUsers();
        } 

        private void GetRegisteredUsers()
        {
            HEWDataContext context = new HEWDataContext();
            strRegisteredUsers = context.Newsletters.Count().ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string ss = txtNewsletter.Value;
        }
    }
}