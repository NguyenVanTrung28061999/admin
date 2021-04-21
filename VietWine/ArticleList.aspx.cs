using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArticleList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = db.Articles
                      .Where(x => x.Status == true)
                      .OrderBy(x => x.Position)
                      .Select(x => new
                      {
                          x.ArticleID,
                          x.Avatar,
                          x.Title,
                          x.Description
                      });
        
        int pageSize = 9;
        int maxPage = 5;
        int page = Request.QueryString["page"].ToInt();
        if (page <= 0)
            page = 1;
        int totalItems = query.Count();
        ucPagging.TotalItems = totalItems;
        ucPagging.CurrentPage = page;
        ucPagging.PageSize = pageSize;
        ucPagging.MaxPage = maxPage;
        string url = "~/ArticleList.aspx?page={0}".StringFormat("{0}");
        ucPagging.URL = url;
        ucPagging.DataBind();
        Repeater_Main.DataSource = query.Pagging(page, pageSize).ToList();
        Repeater_Main.DataBind();

    }
}