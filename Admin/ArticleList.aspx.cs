﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ArticleList : System.Web.UI.Page
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
        var query = db.Articles.OrderByDescending(x => x.ArticleID)
            .Select(x => new
        {
            x.ArticleID,
            x.ArticleCategoryID,
            x.Title,
            x.Avatar,
            x.Description,
            x.CreateBy,
            x.CreateTime,
            x.Status,
            CatTitle = x.ArticleCategory.Title,
            MainCatTitle = x.ArticleCategory.ArticleMainCategory.Title
        }).AsQueryable();

        int catID = Request.QueryString["cat"].ToInt();
        if (catID != 0)
        {
            if (DropDownList_Category.Items.FindByValue(catID.ToString()) != null)
                DropDownList_Category.SelectedValue = catID.ToString();
            query = query.Where(x => x.ArticleID == catID);
        }

        string keyword = Request.QueryString["keyword"].ToSafetyString().Trim();
        if (keyword != string.Empty)
        {
            input_Keyword.Value = keyword;
            query = query.Where(x => x.Title.Contains(keyword));
        }

        int totalItems = query.Count();
        if (totalItems > 0)
        {
            int pageSize = 5; //10 là số phần tử trên mỗi trang
            int maxPage = 5; //5 là số trang tối đã sẽ hiển thị, còn lại là ...
            int page = Request.QueryString["page"].ToInt(); // Trang hiện tại
            if (page <= 0)
                page = 1;


            // .: Lưu ý sửa lại link cho đúng với trang và điều kiện thực tế của mỗi trang :. \\
            string url = "/ArticletList.aspx?cat={0}&keyword={1}&page={2}".StringFormat(catID, keyword, "{0}");
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
        var data = db.ArticleCategories.OrderBy(x => x.ArticleMainCategory.Position).ThenBy(x => x.Position).Select(x => new {
            x.ArticleCategoryID,
            Title = x.ArticleMainCategory.Title + " - " + x.Title
        }).ToList();

        DropDownList_Category.DataTextField = "Title";
        DropDownList_Category.DataValueField = "ArticleCategoryID";
        DropDownList_Category.AutoPostBack = true;

        DropDownList_Category.DataSource = data;
        DropDownList_Category.DataBind();

        //Chèn 1 item mặc định
        ListItem item = new ListItem(".: Chọn loại tin tức :.", string.Empty);
        DropDownList_Category.Items.Insert(0, item);
    }

    private void SearchData()
    {
        string catID = DropDownList_Category.SelectedValue.Trim();
        string keyword = input_Keyword.Value.Trim();
        string url = "/ArticleList.aspx?cat={0}&keyword={1}".StringFormat(catID, keyword);
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

    protected void LinkButton_Status_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Status = sender as LinkButton;
        int ID = LinkButton_Status.CommandArgument.ToInt();

        DBEntities db = new DBEntities();
        var item = db.Articles.FirstOrDefault(x => x.ArticleID == ID);

        if (item != null)
        {
            item.Status = !item.Status;
            db.SaveChanges();
            SearchData();
        }
    }

    protected void LinkButton_Delete_Click1(object sender, EventArgs e)
    {
        LinkButton LinkButton_Delete = sender as LinkButton;
        int ID = LinkButton_Delete.CommandArgument.ToInt();



        DBEntities db = new DBEntities();
        var item = db.Articles.FirstOrDefault(x => x.ArticleID == ID);

        if (item != null)
        {
            db.Articles.Remove(item);
            db.SaveChanges();
            SearchData();
        }
    }
}