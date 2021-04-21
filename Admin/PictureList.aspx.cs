using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PictureList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategory();
            LoadData();
        }
    }

    public void LoadData()
    {
        DBEntities db = new DBEntities();

        var query = db.Pictures
                      .OrderBy(x => x.PictureID)
                      .Select(x => new
                      {
                          x.PictureID,
                          x.PictureCategoryID,
                          x.Title,
                          x.Avatar,
                          x.Description,
                          x.CreateBy,
                          x.CreateTime,
                          x.Status,
                          CatTitle = x.PictureCategory.Title,
                          MainCatTitle = x.PictureCategory.PictureMainCategory.Title
                      })
                      .AsQueryable();


        int catID = Request.QueryString["cat"].ToInt();
        if (catID != 0)
        {
            if (DropDownList_Category.Items.FindByValue(catID.ToString()) != null)
                DropDownList_Category.SelectedValue = catID.ToString();
            query = query.Where(x => x.PictureCategoryID == catID);
        }

        string keyword = Request.QueryString["keyword"].ToSafetyString().Trim();

        if (keyword != string.Empty)
        {
            input_Keyword.Value = keyword;
            query = query.Where(x => x.Title.ToLower().Contains(keyword.ToLower()));
        }


        Repeater_Main.DataSource = query.Take(10).ToList();
        Repeater_Main.DataBind();
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


        //Chèn 1 item mặc định
        ListItem item = new ListItem(".:Chọn loại Hình Ảnh :.", string.Empty);
        DropDownList_Category.Items.Insert(0, item);
    }


    private void SearchData()
    {
        //Cơ chế phân quyền
        string catID = DropDownList_Category.SelectedValue.Trim();
        string keyword = input_Keyword.Value.Trim();
        string url = "/Admin/PictureList.aspx?cat={0}&keyword={1}".StringFormat(catID, keyword);
        Response.Redirect(url);
    }


    protected void LinkButton_Search_Click(object sender, EventArgs e)
    {

        SearchData();
       
    }

    protected void LinkButton_ClearSearch_Click(object sender, EventArgs e)
    {
        DropDownList_Category.SelectedValue = string.Empty;
        input_Keyword.Value = string.Empty;
        SearchData();
    }

    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchData();
    }


    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Delete = sender as LinkButton;
        int ID = LinkButton_Delete.CommandArgument.ToInt();

        DBEntities db = new DBEntities();
        var item = db.Pictures.FirstOrDefault(x => x.PictureID == ID);

        if (item != null)
        {
            db.Pictures.Remove(item);
            db.SaveChanges();
            SearchData();
        }
    }

    protected void LinkButton_Status1_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Status1 = sender as LinkButton;
        int ID = LinkButton_Status1.CommandArgument.ToInt();

        DBEntities db = new DBEntities();
        var item = db.Pictures.FirstOrDefault(x => x.PictureID == ID);

        if (item != null)
        {
            item.Status = !item.Status;
            db.SaveChanges();
            SearchData();

        }
    }
}