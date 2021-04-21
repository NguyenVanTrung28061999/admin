using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for CheckUserNameService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class CheckUserNameService : System.Web.Services.WebService
{

    [WebMethod]
    public string SearchUser(string username)
    {
        DBEntities db = new DBEntities();
        if (username != null)
        {
            var data = db.Accounts.Any(x => x.Username == username);
            if (data == false)
                return "Không có tài khoản " + username + " vui lòng kiểm tra lại trước khi nhập mật khẩu!";
        }
        return "";
    }

}
