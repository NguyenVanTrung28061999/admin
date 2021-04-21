using CodeUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PictureEdit : System.Web.UI.Page
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
        var data = db.PictureCategories
                     .OrderBy(x => x.PictureMainCategory.Position)
                     .ThenBy(x => x.Position)
                     .Select(x => new
                     {
                         x.PictureCategoryID,
                         Title = x.PictureMainCategory.Title + " - " + x.Title
                     })
                     .ToList();

        DropDownList_Category.DataTextField = "Title";
        DropDownList_Category.DataValueField = "PictureCategoryID";
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
        var item = db.Pictures.FirstOrDefault(x => x.PictureID == ID);
        if (item == null)
        {
            ucMessage.ShowError("Bản tin này không tồn tại, <a href='PictureList.aspx'>về trang danh sách</a>");
            return;
        }

        input_ID.Value = item.PictureID.ToString();
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


    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        int ID = Request.QueryString["id"].ToInt();
        if (ID == 0)
        {
            Insert();
        }
        else
        {
            Update(ID);
        }
    }

    private void Insert()
    {
        Picture item = new Picture();
        item.PictureCategoryID = DropDownList_Category.SelectedValue.ToInt();
        item.Title = input_Title.Value.Trim();

        if (input_Position.Value.ToInt() > 0)
            item.Position = input_Position.Value.ToInt();
        item.Code = input_Code.Value.Trim();
        item.Description = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/Picture/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtension;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        item.Status = radio_StatusYes.Checked;


        //item.Gender = radio_GenderMale.Checked;
        item.CreateTime = DateTime.Now;
        //item.CreateBy = SessionUtility.Admin.Username;

        //Kiểm tra dữ liệu khác rỗng
        if (!IsValid(item))
        {
            return;
        }

        //Kiểm tra mật khẩu 2 lần
        //if (input_Password.Value.Trim() != input_Repassword.Value.Trim())
        //{
        //    ucMessage.ShowError("Hãy nhập mật khẩu 2 lần giống nhau");
        //    return;
        //}

        //Thêm vào bảng
        DBEntities db = new DBEntities();

        db.Pictures.Add(item);
        db.SaveChanges();

        //Về trang danh sách
        Response.Redirect("PictureList.aspx");
    }

    private void Update(int ID)
    {
        DBEntities db = new DBEntities();
        var item = db.Pictures.FirstOrDefault(x => x.PictureID == ID);

        if (item == null)
        {
            ucMessage.ShowError("Tài khoản không tồn tại, <a href='PictureList.aspx'>về trang danh sách</a>");
            return;
        }

        item.PictureCategoryID = DropDownList_Category.SelectedValue.ToInt();
        item.Title = input_Title.Value.Trim();

        if (input_Position.Value.ToInt() > 0)
            item.Position = input_Position.Value.ToInt();
        item.Code = input_Code.Value.Trim();
        item.Description = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/Picture/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtension;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        item.Status = radio_StatusYes.Checked;


        //item.Gender = radio_GenderMale.Checked;
        item.CreateTime = DateTime.Now;
        //item.CreateBy = SessionUtility.Admin.Username;

        //Kiểm tra dữ liệu khác rỗng
        if (!IsValid(item))
        {
            return;
        }
        //Lưu thay đổi
        db.SaveChanges();

        ucMessage.ShowSuccess("Đã lưu Hình Ảnh");
        Response.Redirect("PictureList.aspx");
    }

    private bool IsValid(Picture item)
    {
        if (item.Title == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập tiêu đề");
            return false;
        }

        return true;
    }
}