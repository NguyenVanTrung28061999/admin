using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.HideAll();
        }
    }

    protected void Button_Login_Click(object sender, EventArgs e)
    {
        string username = input_Username.Value.Trim();
        string password = input_Password.Value.Trim();

        DBEntities db = new DBEntities();
        var item = db.Accounts.Where(x => x.Username == username && x.Password == password && x.Status == true).FirstOrDefault();
        var check = db.Accounts.Where(x => x.Username == username && x.Password == password && x.Status == false).FirstOrDefault();
        if (item != null)
        {
            SessionUtility.Admin = item;

            //Thông báo thành công
            ucMessage.ShowSuccess("Đăng nhập thành công, đang chuyển đến trang chủ sau 5s...");

            //Chuyển đến trang chủ bằng js
            ClientScript.RegisterStartupScript(GetType(), Guid.NewGuid().ToString(), "loginRedirectToDefault();", true);
        }
        else if(check != null)
        {
            ucMessage.ShowError("Tài khoản đang bị khóa, hãy kiểm tra lại");
        }
        else
        {
            //Thông báo kiểm tra lại
            ucMessage.ShowError("Tài khoản không hợp lệ, hãy kiểm tra lại");
        }
    }
}