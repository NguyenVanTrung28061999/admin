using CodeUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductMainCategoryList : System.Web.UI.Page
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

        var query = db.ProductMainCategories.OrderBy(x => x.Position)
                                            .Select(x => new
                                            {
                                                x.ProductMainCategoryID,
                                                x.Title
                                            }).AsQueryable();

        ListBox_List.DataValueField = "ProductMainCategoryID";
        ListBox_List.DataTextField = "Title";

        ListBox_List.DataSource = query.ToList();
        ListBox_List.DataBind();


        //Thêm 1 item mặc định
        ListItem item = new ListItem();
        item.Value = string.Empty;
        item.Text = ".: Chọn loại tim tức cấp cha :.";
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
        var item = db.ProductMainCategories.FirstOrDefault(x => x.ProductMainCategoryID == id);

        if (item == null)
            return;

        //Load data
        input_ID.Value = item.ProductMainCategoryID.ToString();
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
        ucMessage.ShowInfo("Mời nhập thông tin mới sau đó nhấn [Lưu]");
    }

    protected void ListBox_List_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = ListBox_List.SelectedValue.ToInt();
        Response.Redirect("ProductMainCategoryList.aspx?id={0}".StringFormat(id));
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        int id = Request.QueryString["id"].ToInt();
        DBEntities db = new DBEntities();
        var item = db.ProductMainCategories.FirstOrDefault(x => x.ProductMainCategoryID == id);

        if (item != null)
        {

            //Kiểm tra ràng buộc dữu liệu
            var childCoutQuery = db.ProductCategories.Where(x => x.ProductMainCategoryID == id).Count();
            if (childCoutQuery > 0)
            {
                ucMessage.ShowError("Không thể xóa dữ liệu do ràng buộc với các lọa Sản Phẩm liên quan");
                return;
            }

            db.ProductMainCategories.Remove(item);
            db.SaveChanges();
            Response.Redirect("ProductMainCategoryList.aspx");
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
        ProductMainCategory item = new ProductMainCategory();
        item.ProductMainCategoryID = input_ID.Value.Trim().ToInt();

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
            string folder = "/FileUploads/ProductMainCategoryList/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtersion = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtersion;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        if (!IsValid(item))
        {
            return;
        }

        //Kiểm tra không cùng mã loại tài khoản
        DBEntities db = new DBEntities();
        if (db.ProductMainCategories.Any(x => x.ProductMainCategoryID == item.ProductMainCategoryID))
        {
            ucMessage.ShowError("Username này đã có sẵn, hãy chọn mã loại tài khoản khác");
            return;
        }

        //Thêm vào bảng
        db.ProductMainCategories.Add(item);
        db.SaveChanges();

        //Về trang danh sách
        Response.Redirect("ProductMainCategoryList.aspx");
    }

    private void Update(int ID)
    {
        DBEntities db = new DBEntities();
        var item = db.ProductMainCategories.FirstOrDefault(x => x.ProductMainCategoryID == ID);

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
            string folder = "/FileUploads/ProductMainCategoryList/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtersion = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtersion;

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

        ucMessage.ShowSuccess("Đã cập nhật sữ liệu");
    }

    private bool IsValid(ProductMainCategory item)
    {
        if (item.Title == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập lại tiêu đề");
            return false;
        }
        return true;
    }
}