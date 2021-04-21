using CodeUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductEdit : System.Web.UI.Page
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
        var data = db.ProductCategories
                     .OrderBy(x => x.ProductMainCategory.Position)
                     .ThenBy(x => x.Position)
                     .Select(x => new
                     {
                         x.ProductCategoryID,
                         Title = x.ProductMainCategory.Title + " - " + x.Title
                     })
                     .ToList();

        DropDownList_Category.DataTextField = "Title";
        DropDownList_Category.DataValueField = "ProductCategoryID";
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
        var item = db.Products.FirstOrDefault(x => x.ProductID == ID);
        var detail = db.ProductInfoes.FirstOrDefault(x => x.ProductID == x.ProductInfoID);
        if (item == null)
        {
            ucMessage.ShowError("sản phẩm này không tồn tại, <a href='ProductList.aspx'>về trang danh sách</a>");
            return;
        }

        input_ID.Value = item.ProductID.ToString();
        input_Title.Value = item.Title;
        input_Code.Value = item.Code;
        if (item.Price > 0)
        {
            input_Price.Value = item.Price.ToString();
        }
        else
        {
            input_Price.Value = string.Empty;
        }

        if (item.OldPrice > 0)
            input_OldPrice.Value = item.OldPrice.ToString();
        else
            input_OldPrice.Value = string.Empty;

        if (item.Quantity > 0)
            input_Quantity.Value = item.Quantity.ToString();
        else
            input_Quantity.Value = string.Empty;

        input_TitleInfo.Value = detail.Title;
        textarea_Description.Value = detail.Description;

        if (item.Position.HasValue)
            input_Position.Value = item.Position.ToString();

        if (item.Status == true)
            radio_StatusYes.Checked = true;
        else
            radio_StatusNo.Checked = true;
       
        DropDownList_Category.SelectedValue = item.ProductCategoryID.ToString();
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
        Product item = new Product();
        ProductInfo detail = new ProductInfo();
        item.ProductCategoryID = DropDownList_Category.SelectedValue.ToInt();
        item.Title = input_Title.Value.Trim();

        if (input_Position.Value.ToInt() > 0)
            item.Position = input_Position.Value.ToInt();
        item.Code = input_Code.Value.Trim();
        item.Description = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/Product/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtension;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        item.Status = radio_StatusYes.Checked;
       
        if (input_Price.Value.ToDouble() > 0)
            item.Price = input_Price.Value.ToDouble();
        else
            item.Price = null;

        if (input_OldPrice.Value.ToDouble() > 0)
            item.OldPrice = input_OldPrice.Value.ToDouble();
        else
            item.OldPrice = null;

        if (input_Quantity.Value.ToInt() > 0)
            item.Quantity = input_Quantity.Value.ToInt();
        else
            item.Quantity = null;

        input_TitleInfo.Value = detail.Title;
        textarea_Description.Value = detail.Description;
        
        item.CreateTime = DateTime.Now;
        item.CreateBy = SessionUtility.Admin.Username;

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

        db.Products.Add(item);
        db.ProductInfoes.Add(detail);
        db.SaveChanges();

        //Về trang danh sách
        Response.Redirect("ProductList.aspx");
    }

    private void Update(int ID)
    {
        DBEntities db = new DBEntities();
        var item = db.Products.FirstOrDefault(x => x.ProductID == ID);
        var detail = db.ProductInfoes.FirstOrDefault(x => x.ProductID == ID);

        if (item == null)
        {
            ucMessage.ShowError("Tài khoản không tồn tại, <a href='ProductList.aspx'>về trang danh sách</a>");
            return;
        }

        item.ProductCategoryID = DropDownList_Category.SelectedValue.ToInt();
        item.Title = input_Title.Value.Trim();

        if (input_Position.Value.ToInt() > 0)
            item.Position = input_Position.Value.ToInt();
        item.Code = input_Code.Value.Trim();
        item.Description = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/Product/Avatar/";
            string fileName = RandomUtility.RandomID();
            string fileExtension = Path.GetExtension(FileUpload_Avatar.FileName);
            string url = folder + fileName + fileExtension;

            FileUpload_Avatar.SaveAs(Server.MapPath(url));
            item.Avatar = url;
        }

        input_TitleInfo.Value = detail.Title;
        textarea_Description.Value = detail.Description;

        item.Status = radio_StatusYes.Checked;
        
        if (input_Price.Value.ToDouble() > 0)
            item.Price = input_Price.Value.ToDouble();
        else
            item.Price = null;

        if (input_OldPrice.Value.ToDouble() > 0)
            item.OldPrice = input_OldPrice.Value.ToDouble();
        else
            item.OldPrice = null;

        if (input_Quantity.Value.ToInt() > 0)
            item.Quantity = input_Quantity.Value.ToInt();
        else
            item.Quantity = null;

       
        item.CreateTime = DateTime.Now;
        item.CreateBy = SessionUtility.Admin.Username;

        //Kiểm tra dữ liệu khác rỗng
        if (!IsValid(item))
        {
            return;
        }
        //Lưu thay đổi
        db.SaveChanges();

        ucMessage.ShowSuccess("Đã lưu sản phẩm");
        Response.Redirect("ProductList.aspx");
    }

    private bool IsValid(Product item)
    {
        if (item.Title == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập tiêu đề");
            return false;
        }

        return true;
    }
}