using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AccountList : System.Web.UI.Page
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
        var query = db.Accounts.OrderBy(x => x.Username).AsQueryable();

        string catID = Request.QueryString["cat"].ToSafetyString().Trim();
        if (catID != string.Empty)
        {
            if (DropDownList_Category.Items.FindByValue(catID) != null)
                DropDownList_Category.SelectedValue = catID;
            query = query.Where(x => x.AccountCategoryID == catID);
        }

        string keyword = Request.QueryString["keyword"].ToSafetyString().Trim();
        if (keyword != string.Empty)
        {
            input_Keyword.Value = keyword;
            query = query.Where(x => x.Username.Contains(keyword) ||
                                     x.FullName.Contains(keyword) ||
                                     x.Email.Contains(keyword) ||
                                     x.Mobile.Contains(keyword));
        }

        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }
    public void LoadCategory()
    {
        DBEntities db = new DBEntities();
        var data = db.AccountCategories.OrderBy(x => x.AccountCategoryID).ToList();

        DropDownList_Category.DataTextField = "Title";
        DropDownList_Category.DataValueField = "AccountCategoryID";
        DropDownList_Category.AutoPostBack = true;

        DropDownList_Category.DataSource = data;
        DropDownList_Category.DataBind();

        //Chèn 1 item mặc định
        ListItem item = new ListItem(".: Chọn loại tài khoản :.", string.Empty);
        DropDownList_Category.Items.Insert(0, item);
    }
    private void SearchData()
    {
        string catID = DropDownList_Category.SelectedValue.Trim();
        string keyword = input_Keyword.Value.Trim();
        string url = "/AccountList.aspx?cat={0}&keyword={1}".StringFormat(catID, keyword);
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
        string username = LinkButton_Delete.CommandArgument.ToSafetyString();

        //Nếu là admin đang đăng nhập, thì bỏ qua
        if (username == SessionUtility.Admin.Username)
            return;

        DBEntities db = new DBEntities();
        var item = db.Accounts.FirstOrDefault(x => x.Username == username);

        if (item != null)
        {
            db.Accounts.Remove(item);
            db.SaveChanges();
            SearchData();
        }
    }

    protected void LinkButton_Status_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Status = sender as LinkButton;
        string username = LinkButton_Status.CommandArgument.ToSafetyString();

        DBEntities db = new DBEntities();
        var item = db.Accounts.FirstOrDefault(x => x.Username == username);

        if (item != null)
        {
            item.Status = !item.Status;
            db.SaveChanges();
            SearchData();
        }
    }
}