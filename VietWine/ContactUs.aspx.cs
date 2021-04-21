using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            alert_Danger.Visible = false;
            alert_Success.Visible = false;
        }
    }

    protected void LinkButton_Send_Click(object sender, EventArgs e)
    {
        DBEntities db = new DBEntities();
        Contact item = new Contact();
        item.FullName = input_FullName.Value.Trim();
        item.Email = input_Email.Value.Trim();
        item.Mobile = input_Mobi.Value.Trim();
        item.Content = textarea_Content.Value.Trim();
        item.CreateTime = DateTime.Now;
        item.Status = false;

        //kiểm tra lỗi 
        if (item.FullName == string.Empty)
        {
            alert_Danger.InnerText = "vui lòng nhập họ tên";
            alert_Danger.Visible = true;
            return;
        }
        if (item.Email == string.Empty)
        {
            alert_Danger.InnerText = "vui lòng nhập Email";
            alert_Danger.Visible = true;
            return;
        }
        if (item.Mobile == string.Empty)
        {
            alert_Danger.InnerText = "vui lòng nhập số ĐT";
            alert_Danger.Visible = true;
            return;
        }
        if (item.Content == string.Empty)
        {
            alert_Danger.InnerText = "vui lòng nhập nội dung";
            alert_Danger.Visible = true;
            return;
        }

        //lưu vào DB
        db.Contacts.Add(item);
        db.SaveChanges();

        //thông báo thành công 
        alert_Success.InnerText = "Cám ơn bạn đã liên hệ";
        alert_Success.Visible = true;
        alert_Danger.Visible = false;

        //xóa trắng form
        input_FullName.Value = string.Empty;
        input_Email.Value = string.Empty;
        input_Mobi.Value = string.Empty;
        textarea_Content.Value = string.Empty;
    }
}