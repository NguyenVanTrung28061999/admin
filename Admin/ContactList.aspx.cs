using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactList : System.Web.UI.Page
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
        var query = db.Contacts.OrderByDescending(x => x.CreateTime).AsQueryable();

        int catID = Request.QueryString["cat"].ToInt();
        if (catID > 0)
        {
            if (DropDownList_Category.Items.FindByValue(catID.ToString()) != null)
                DropDownList_Category.SelectedValue = catID.ToString();
            query = query.Where(x => x.ContactCategoryID == catID);
        }

        string keyword = Request.QueryString["keyword"].ToSafetyString().Trim();
        if (keyword != string.Empty)
        {
            input_Keyword.Value = keyword;
            query = query.Where(x => x.FullName.Contains(keyword) ||
                                     x.Email.Contains(keyword) ||
                                     x.Mobile.Contains(keyword));
        }

        int totalItems = query.Count();

        if (totalItems > 0)
        {
            //Đổ vào Repeater
            int pageSize = 10; //10 là số phần tử trên mỗi trang
            int maxPage = 5; //5 là số trang tối đã sẽ hiển thị, còn lại là ...
            int page = Request.QueryString["page"].ToInt(); // Trang hiện tại
            if (page <= 0)
                page = 1;

            // .: Lưu ý sửa lại link cho đúng với trang và điều kiện thực tế của mỗi trang :. \\
            string url = "/ContactList.aspx?cat={0}&keyword={1}&page={2}".StringFormat(catID, keyword, "{0}");
            ucPagging.TotalItems = totalItems;
            ucPagging.CurrentPage = page;
            ucPagging.PageSize = pageSize;
            ucPagging.MaxPage = maxPage;
            ucPagging.URL = url;
            ucPagging.DataBind();
            Repeater_Main.DataSource = query.Pagging(page, pageSize).ToList();
            Repeater_Main.DataBind();
            tr_EmptyData.Visible = false;
        }
        else
        {
            tr_EmptyData.Visible = true;
        }
    }

    public void LoadCategory()
    {
        DBEntities db = new DBEntities();
        var data = db.ContactCategories.OrderBy(x => x.ContactCategoryID).ToList();

        DropDownList_Category.DataTextField = "Title";
        DropDownList_Category.DataValueField = "ContactCategoryID";
        DropDownList_Category.AutoPostBack = true;

        DropDownList_Category.DataSource = data;
        DropDownList_Category.DataBind();

        //Chèn 1 item mặc định
        ListItem item = new ListItem(".: Chọn loại liên hệ :.", string.Empty);
        DropDownList_Category.Items.Insert(0, item);
    }

    private void SearchData()
    {
        string catID = DropDownList_Category.SelectedValue.Trim();
        string keyword = input_Keyword.Value.Trim();
        string url = "/ContactList.aspx?cat={0}&keyword={1}".StringFormat(catID, keyword);
        Response.Redirect(url);
    }

    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchData();
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

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Delete = sender as LinkButton;
        int ID = LinkButton_Delete.CommandArgument.ToInt();

        DBEntities db = new DBEntities();
        var item = db.Contacts.FirstOrDefault(x => x.ContactID == ID);

        if (item != null)
        {
            db.Contacts.Remove(item);
            db.SaveChanges();
            SearchData();
        }
    }

    protected void LinkButton_Status_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Status = sender as LinkButton;
        int ID = LinkButton_Status.CommandArgument.ToInt();

        DBEntities db = new DBEntities();
        var item = db.Contacts.FirstOrDefault(x => x.ContactID == ID);

        if (item != null)
        {
            item.Status = !item.Status;
            db.SaveChanges();
            SearchData();
        }
    }
}