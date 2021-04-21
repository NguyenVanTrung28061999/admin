using CodeUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactCategoryList : System.Web.UI.Page
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
        var query = db.ContactCategories
                      .OrderBy(x => x.Position)
                      .Select(x => new
                      {
                          x.ContactCategoryID,
                          x.Title
                      })
                      .AsQueryable();

        ListBox_List.DataValueField = "ContactCategoryID";
        ListBox_List.DataTextField = "Title";

        ListBox_List.DataSource = query.ToList();
        ListBox_List.DataBind();

        //Thêm 1 item mặc định
        ListItem item = new ListItem();
        item.Value = string.Empty;
        item.Text = ".: Chọn loại tài khoản :.";
        ListBox_List.Items.Insert(0, item);

        //Chọn item theo id
        int id = Request.QueryString["id"].ToInt();
        if (ListBox_List.Items.FindByValue(id.ToString()) != null)
            ListBox_List.Items.FindByValue(id.ToString()).Selected = true;
    }

    public void LoadDetail()
    {
        int id = Request.QueryString["id"].ToInt();
        if (id == 0)
            return;

        DBEntities db = new DBEntities();
        var item = db.ContactCategories.FirstOrDefault(x => x.ContactCategoryID == id);

        if (item == null)
            return;

        //Load data
        input_ID.Value = item.ContactCategoryID.ToString();
        input_Code.Value = item.Code;
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
        int id = ListBox_List.SelectedValue.ToInt();
        Response.Redirect("ContactCategoryList.aspx?id={0}".StringFormat(id));
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        int id = Request.QueryString["id"].ToInt();

        DBEntities db = new DBEntities();
        var item = db.ContactCategories.FirstOrDefault(x => x.ContactCategoryID == id);

        if (item != null)
        {
            //Kiểm tra ràng buộc dữ liệu
            var childCoutQuery = db.Contacts.Where(x => x.ContactCategoryID == id).Count();
            if (childCoutQuery > 0)
            {
                ucMessage.ShowError("Không thể xóa dữ liệu do ràng buộc với các thư liên hệ liên quan");
                return;
            }

            db.ContactCategories.Remove(item);
            db.SaveChanges();
            Response.Redirect("ContactCategoryList.aspx");
        }
    }

    protected void LinkButton_Save_Click(object sender, EventArgs e)
    {
        int id = Request.QueryString["id"].ToInt();
        if (id == 0)
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
        ContactCategory item = new ContactCategory();

        if (input_Position.Value != string.Empty)
            item.Position = input_Position.Value.ToInt();
        else
            item.Position = null;

        item.Code = input_Code.Value.Trim();
        item.Title = input_Title.Value.Trim();
        item.Description = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/ContactCategory/Avatar/";
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

        //Thêm vào bảng
        DBEntities db = new DBEntities();
        db.ContactCategories.Add(item);
        db.SaveChanges();

        //Về trang danh sách
        Response.Redirect("ContactCategoryList.aspx");
    }

    private void Update(int ID)
    {
        DBEntities db = new DBEntities();
        var item = db.ContactCategories.FirstOrDefault(x => x.ContactCategoryID == ID);

        if (item == null)
        {
            ucMessage.ShowError("Dữ liệu không tồn tại");
            return;
        }

        if (input_Position.Value != string.Empty)
            item.Position = input_Position.Value.ToInt();
        else
            item.Position = null;

        item.Code = input_Code.Value.Trim();
        item.Title = input_Title.Value.Trim();
        item.Description = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/ContactCategory/Avatar/";
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

    private bool IsValid(ContactCategory item)
    {
        if (item.Title == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập tiêu đề");
            return false;
        }

        return true;
    }
}