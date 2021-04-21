using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AccountPasswordChange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.ShowInfo("Mời nhập mật khẩu mới");
            string username = Request.QueryString["id"].ToSafetyString();
            input_Username.Value = username;
        }
    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        string username = Request.QueryString["id"].ToSafetyString().Trim();
        string password = input_Password.Value.Trim();
        string rePassword = input_Repassword.Value.Trim();

        //Kiểm tra không rỗng
        if (username == string.Empty || password == string.Empty || rePassword == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập đầy đủ các thông tin trên");
            return;
        }

        if (password != rePassword)
        {
            ucMessage.ShowError("Vui lòng nhập mật khẩu 2 lần giống nhau");
            return;
        }

        //Vào DB lấy 1 item có username phù hợp
        DBEntities db = new DBEntities();
        var item = db.Accounts.FirstOrDefault(x => x.Username == username);

        if (item == null)
        {
            ucMessage.ShowError("Dữ liệu không tồn tại");
            return;
        }

        item.Password = password;
        db.SaveChanges();
        ucMessage.ShowSuccess("Đã cập nhật mật khẩu");
        SessionUtility.Admin = item;
        return;
    }
}
