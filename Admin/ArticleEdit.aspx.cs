using CodeUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArticleEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.HideAll();
            LoadCategory();
            LoadData();
        }
    }

    public void LoadCategory()
    {
        DBEntities db = new DBEntities();
        var data = db.ArticleCategories
                     .OrderBy(x => x.ArticleMainCategory.Position)
                     .ThenBy(x => x.Position)
                     .Select(x => new
                     {
                         x.ArticleCategoryID,
                         Title = x.ArticleMainCategory.Title + " - " + x.Title
                     })
                     .ToList();

        DropDownList_Category.DataTextField = "Title";
        DropDownList_Category.DataValueField = "ArticleCategoryID";
        DropDownList_Category.AutoPostBack = true;

        DropDownList_Category.DataSource = data;
        DropDownList_Category.DataBind();
    }

    public void LoadData()
    {
        int ID = Request.QueryString["id"].ToInt();
        if (ID == 0)
        {
            return;
        }

        DBEntities db = new DBEntities();
        var item = db.Articles.FirstOrDefault(x => x.ArticleID == ID);
        if (item == null)
        {
            ucMessage.ShowError("Bản tin này không tồn tại, <a href='ArticleList.aspx'>về trang danh sách</a>");
            return;
        }

        input_ID.Value = item.ArticleID.ToString();
        input_Title.Value = item.Title;
        input_Code.Value = item.Code;

        if (item.Position.HasValue)
            input_Position.Value = item.Position.ToString();

        if (item.Status == true)
            radio_StatusYes.Checked = true;
        else
            radio_StatusNo.Checked = true;

        textarea_Description.Value = item.Description;

        a_Avatar.HRef = item.Avatar;
        img_Avatar.Src = item.Avatar;

        textarea_Content.Value = item.Content;
        input_SourcePage.Value = item.SourcePage;
        input_SourceLink.Value = item.SourceLinhk;
    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        string username = Request.QueryString["id"].ToSafetyString();
        if (username == string.Empty)
        {
            Insert();
        }
        else
        {
            Update(username);
        }
    }

    private void Insert()
    {
        Account item = new Account();
        item.AccountCategoryID = DropDownList_Category.SelectedValue;
        //item.Username = input_Username.Value.Trim();
        //item.Password = input_Password.Value.Trim();

        //item.Status = radio_StatusYes.Checked;
        //item.FullName = input_FullName.Value.Trim();
        //item.Email = input_Email.Value.Trim();
        //item.Mobi = input_Mobile.Value.Trim();
        //item.Address = textarea_Address.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/Account/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtension;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        //item.Gender = radio_GenderMale.Checked;
        item.CreateTime = DateTime.Now;

        ////Kiểm tra dữ liệu khác rỗng
        //if (!IsValid(item))
        //{
        //    return;
        //}

        //Kiểm tra mật khẩu 2 lần
        //if (input_Password.Value.Trim() != input_Repassword.Value.Trim())
        //{
        //    ucMessage.ShowError("Hãy nhập mật khẩu 2 lần giống nhau");
        //    return;
        //}

        //Kiểm tra không trùng username
        DBEntities db = new DBEntities();
        if (db.Accounts.Any(x => x.Username == item.Username))
        {
            ucMessage.ShowError("Username này đã có sẵn, hãy chọn Username khác");
            return;
        }

        //Thêm vào bảng
        db.Accounts.Add(item);
        db.SaveChanges();

        //Về trang danh sách
        Response.Redirect("AccountList.aspx");
    }

    private void Update(string username)
    {
        DBEntities db = new DBEntities();
        var item = db.Accounts.FirstOrDefault(x => x.Username == username);

        if (item == null)
        {
            ucMessage.ShowError("Tài khoản không tồn tại, <a href='AccountList.aspx'>về trang danh sách</a>");
            return;
        }

        //if (input_Password.Value.Trim() != string.Empty)
        //    item.Password = input_Password.Value.Trim();

        item.Status = radio_StatusYes.Checked;
        //item.FullName = input_FullName.Value.Trim();
        //item.Email = input_Email.Value.Trim();
        //item.Mobi = input_Mobile.Value.Trim();
        //item.Address = textarea_Address.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/Account/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtension;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        //item.Gender = radio_GenderMale.Checked;

        //Kiểm tra khác rỗng
        //if (!IsValid(item))
        //{
        //    return;
        //}

        //if (input_Password.Value.Trim() != input_Repassword.Value.Trim())
        //{
        //    ucMessage.ShowError("Hãy nhập mật khẩu 2 lần giống nhau");
        //    return;
        //}

        //Lưu thay đổi
        db.SaveChanges();

        //Load lại session
        if (SessionUtility.Admin.Username == username)
            SessionUtility.Admin = item;

        ucMessage.ShowSuccess("Đã lưu tài khoản");
    }

    private bool IsValid(Article item)
    {
        if (item.Title == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập tiêu đề");
            return false;
        }

        return true;
    }
}