using CodeUtility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArticleCategoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.ShowInfo("Mời nhập thông tin, sau đó nhấn [Lưu]");
            LoadMainData();
            LoadData();
            LoadDetail();
        }
    }

    public void LoadMainData()
    {
        DBEntities db = new DBEntities();
        var data = db.ArticleMainCategories
                     .OrderBy(x => x.Position)
                     .Select(x => new
                     {
                         x.ArticleMainCategoryID,
                         x.Title
                     });

        DropDownList_Category.DataValueField = "ArticleMainCategoryID";
        DropDownList_Category.DataTextField = "Title";
        DropDownList_Category.DataSource = data.ToList();
        DropDownList_Category.DataBind();

        DropDownList_CategoryDetail.DataValueField = "ArticleMainCategoryID";
        DropDownList_CategoryDetail.DataTextField = "Title";
        DropDownList_CategoryDetail.DataSource = data.ToList();
        DropDownList_CategoryDetail.DataBind();
    }

    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = db.ArticleCategories
                      .OrderBy(x => x.Position)
                      .Select(x => new
                      {
                          x.ArticleCategoryID,
                          x.Title,
                          x.ArticleMainCategoryID
                      })
                      .AsQueryable();

        int mID = Request.QueryString["mid"].ToInt();
        if (mID <= 0)
        {
            mID = DropDownList_Category.SelectedValue.ToInt();
        }

        query = query.Where(x => x.ArticleMainCategoryID == mID);
        DropDownList_Category.SelectedValue = mID.ToString();

        ListBox_List.DataValueField = "ArticleCategoryID";
        ListBox_List.DataTextField = "Title";

        ListBox_List.DataSource = query.ToList();
        ListBox_List.DataBind();

        //Thêm 1 item mặc định
        ListItem item = new ListItem();
        item.Value = string.Empty;
        item.Text = ".: Chọn loại tin tức cấp con :.";
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
        var item = db.ArticleCategories.FirstOrDefault(x => x.ArticleCategoryID == id);

        if (item == null)
            return;

        //Load data
        input_ID.Value = item.ArticleCategoryID.ToString();
        input_Code.Value = item.Code;
        input_Position.Value = item.Position.ToSafetyString();
        input_Title.Value = item.Title;
        textarea_Description.Value = item.Desition;
        a_Avatar.HRef = item.Avatar;
        img_Avatar.Src = item.Avatar;
        DropDownList_CategoryDetail.SelectedValue = item.ArticleMainCategoryID.ToString();

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
        int mid = DropDownList_Category.SelectedValue.ToInt();
        int id = ListBox_List.SelectedValue.ToInt();
        Response.Redirect("ArticleCategoryList.aspx?id={0}&mid={1}".StringFormat(id, mid));
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        int id = Request.QueryString["id"].ToInt();

        DBEntities db = new DBEntities();
        var item = db.ArticleMainCategories.FirstOrDefault(x => x.ArticleMainCategoryID == id);

        if (item != null)
        {
            //Kiểm tra ràng buộc dữ liệu
            var childCoutQuery = db.ArticleCategories.Where(x => x.ArticleCategoryID == id).Count();
            if (childCoutQuery > 0)
            {
                ucMessage.ShowError("Không thể xóa dữ liệu do ràng buộc với các thư liên hệ liên quan");
                return;
            }

            db.ArticleMainCategories.Remove(item);
            db.SaveChanges();
            Response.Redirect("ArticleMainCategoryList.aspx");
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
        ArticleMainCategory item = new ArticleMainCategory();

        if (input_Position.Value != string.Empty)
            item.Position = input_Position.Value.ToInt();
        else
            item.Position = null;

        item.Code = input_Code.Value.Trim();
        item.Title = input_Title.Value.Trim();
        item.Desition = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/ArticleMainCategory/Avatar/";
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
        db.ArticleMainCategories.Add(item);
        db.SaveChanges();

        //Về trang danh sách
        Response.Redirect("ArticleMainCategoryList.aspx");
    }

    private void Update(int ID)
    {
        DBEntities db = new DBEntities();
        var item = db.ArticleMainCategories.FirstOrDefault(x => x.ArticleMainCategoryID == ID);

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
        item.Desition = textarea_Description.Value.Trim();

        //Nếu có chọn up hình
        if (FileUpload_Avatar.HasFile)
        {
            string folder = "/FileUploads/ArticleMainCategory/Avatar/";
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

    private bool IsValid(ArticleMainCategory item)
    {
        if (item.Title == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập tiêu đề");
            return false;
        }

        return true;
    }

    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        int mid = DropDownList_Category.SelectedValue.ToInt();

        Response.Redirect("ArticleCategoryList.aspx?mid={0}".StringFormat(mid));
    }
}