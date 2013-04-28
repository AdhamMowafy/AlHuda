using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;

namespace HEW.Admin
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void login(string userName, string password)
        {
            Model.User userObj = Model.Repositories.UsersRepository.GetUserByCredentials(userName, password);
            if (userObj == null)
                return;

            int userID = userObj.ID;
            string userRoles = "";
            foreach (Model.UserRole userRole in userObj.UserRoles)
            {
                if (userRoles == "")
                    userRoles = userRole.ID.ToString();
                else
                    userRoles += "," + userRole.ID.ToString();
            }

            if (userRoles == "")
                return;

            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, userID.ToString(), DateTime.Now,
                                                                             DateTime.Now.AddMinutes(30), false,
                                                                             userRoles,
                                                                             FormsAuthentication.FormsCookiePath);

            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));

            if (ticket.IsPersistent) cookie.Expires = ticket.Expiration;
            Response.Cookies.Add(cookie);

            string returnUrl = Request.QueryString["ReturnUrl"];
            if (String.IsNullOrEmpty(returnUrl))
                returnUrl = "Default.aspx";
            Response.Redirect(returnUrl);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            login(txtUserName.Text.Trim().ToLower(), txtPassword.Text.Trim());
        }
    }
}