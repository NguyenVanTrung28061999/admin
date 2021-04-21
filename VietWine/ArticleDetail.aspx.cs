using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArticleDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            LoadList();
        }
    }
    public void LoadData()
    {
        var id = Request.QueryString["id"].ToInt();
        DBEntities db = new DBEntities();
        var query = db.Articles
                      .Where(x => x.Status == true && x.ArticleID == id)
                      .OrderBy(x => x.Position)
                      .Select(x => new
                      {
                          x.ArticleID,
                          x.Avatar,
                          x.Title,
                          x.Content
                      });

        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }
    public void LoadList()
    {
        var id = Request.QueryString["id"].ToInt();
        DBEntities db = new DBEntities();
        var query = db.Articles
                      .Where(x => x.Status == true && x.ArticleID != id)
                      .OrderBy(x => x.Position)
                      .Select(x => new
                      {
                          x.ArticleID,
                          x.Avatar,
                          x.Title,
                          x.CreateTime
                      });

        Repeater_Article.DataSource = query.Take(10).ToList();
        Repeater_Article.DataBind();
    }
}