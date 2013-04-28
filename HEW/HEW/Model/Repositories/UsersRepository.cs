using System.Collections.Generic;
using System.Linq;

namespace HEW.Model.Repositories
{
    public class UsersRepository
    {
        static HEWDataContext _ModelDbContext = new HEWDataContext();

        public static User GetUserByCredentials(string strUserName, string strPassword)
        {
            return
                _ModelDbContext.Users.SingleOrDefault(
                    i => i.UserName == strUserName && i.Password == strPassword && i.IsActive);
        }
    }
}