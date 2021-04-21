using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;
public partial class AccountCategoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.ShowInfo("Mời nhập thông tin, sau đó nhấn [Lưu]");
            LoadData();
            LoadDetail();
        }
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = db.AccountCategories
                      .OrderBy(x => x.Position)
                      .Select(x => new
                      {
                          x.AccountCategoryID,
                          Title = x.AccountCategoryID + " - " + x.Title
                      })
                      .AsQueryable();

        ListBox_List.DataValueField = "AccountCategoryID";
        ListBox_List.DataTextField = "Title";

        ListBox_List.DataSource = query.ToList();
        ListBox_List.DataBind();

        //Thêm 1 item mặc định
        ListItem item = new ListItem();
        item.Value = string.Empty;
        item.Text = ".: Chọn loại tài khoản :.";
        ListBox_List.Items.Insert(0, item);

        //Chọn item theo id
        string id = Request.QueryString["id"].ToSafetyString();
        if (ListBox_List.Items.FindByValue(id) != null)
            ListBox_List.Items.FindByValue(id).Selected = true;
    }

    public void LoadDetail()
    {
        string id = Request.QueryString["id"].ToSafetyString();
        if (id == string.Empty)
            return;

        DBEntities db = new DBEntities();
        var item = db.AccountCategories.FirstOrDefault(x => x.AccountCategoryID == id);

        if (item == null)
            return;

        //Load data
        input_ID.Value = item.AccountCategoryID;
        input_Position.Value = item.Position.ToSafetyString();
        input_Title.Value = item.Title;
        textarea_Description.Value = item.Description;
        a_Avatar.HRef = item.Avatar;
        img_Avatar.Src = item.Avatar;

        if (item.Status == true)
        {
            radio_StatusNo.Checked = false;
            radio_StatusYes.Checked = true;
        }
        else
        {
            radio_StatusYes.Checked = false;
            radio_StatusNo.Checked = true;
        }

        ucMessage.ShowInfo("Mời nhập thông tin mới, sau đó nhấn [Lưu]");
    }
    protected void ListBox_List_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id = ListBox_List.SelectedValue;
        Response.Redirect("AccountCategoryList.aspx?id={0}".StringFormat(id));
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToSafetyString();

        DBEntities db = new DBEntities();
        var item = db.AccountCategories.FirstOrDefault(x => x.AccountCategoryID == id);

        if (item != null)
        {
            //Kiểm tra ràng buộc dữ liệu
            var childCoutQuery = db.Accounts.Where(x => x.AccountCategoryID == id).Count();
            if (childCoutQuery > 0)
            {
                ucMessage.ShowError("Không thể xóa dữ liệu do ràng buộc với các tài khoản liên quan");
                return;
            }

            db.AccountCategories.Remove(item);
            db.SaveChanges();
            Response.Redirect("AccountCategoryList.aspx");
        }
    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"].ToSafetyString();
        if (id == string.Empty)
        {
            Insert();
        }
        else
        {
            Update(id);
        }
    }
    private void Insert()
    {
        AccountCategory item = new AccountCategory();
        item.AccountCategoryID = input_ID.Value.Trim();
        if (input_Position.Value != string.Empty)
            item.Position = input_Position.Value.ToInt();
        else
            item.Position = null;

        item.Title = input_Title.Value.Trim();
        item.Description = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/AccountCategory/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtension;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        item.Status = radio_StatusYes.Checked;

        if (!IsValid(item))
        {
            return;
        }

        //Kiểm tra tồn tại
        DBEntities db = new DBEntities();
        if (db.AccountCategories.Any(x => x.AccountCategoryID == item.AccountCategoryID))
        {
            ucMessage.ShowError("Mã loại tài khoản này đã có sẵn, hãy chọn mã loại khác");
            return;
        }

        //Thêm vào bảng
        db.AccountCategories.Add(item);
        db.SaveChanges();

        //Về trang danh sách
        Response.Redirect("AccountCategoryList.aspx");
    }

    private void Update(string id)
    {
        DBEntities db = new DBEntities();
        var item = db.AccountCategories.FirstOrDefault(x => x.AccountCategoryID == id);

        if (item == null)
        {
            ucMessage.ShowError("Dữ liệu không tồn tại");
            return;
        }

        if (input_Position.Value != string.Empty)
            item.Position = input_Position.Value.ToInt();
        else
            item.Position = null;

        item.Title = input_Title.Value.Trim();
        item.Description = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/AccountCategory/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtension;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        item.Status = radio_StatusYes.Checked;

        if (!IsValid(item))
        {
            return;
        }

        db.SaveChanges();
        LoadData();
        LoadDetail();

        ucMessage.ShowSuccess("Đã cập nhật dữ liệu");
    }

    private bool IsValid(AccountCategory item)
    {
        if (item.AccountCategoryID == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập mã loại tài khoản");
            return false;
        }

        if (item.Title == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập tiêu đề");
            return false;
        }

        return true;
    }
}