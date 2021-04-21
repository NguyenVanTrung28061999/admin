using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductList : System.Web.UI.Page
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
        int id = Request.QueryString["id"].ToInt();

        DBEntities db = new DBEntities();
        var data = from p in db.Products
                   orderby p.Position ascending
                   where p.Status == true && p.ProductCategoryID == id
                   select new
                   {
                       ID = p.ProductID,
                       p.Avatar,
                       p.Title,
                       p.Price
                   };
        int pageSize = 9; //10 là số phần tử trên mỗi trang
        int maxPage = 5; //5 là số trang tối đã sẽ hiển thị, còn lại là ...
        int page = Request.QueryString["page"].ToInt(); // Trang hiện tại
        if (page <= 0)
            page = 1;
        int totalItems = data.Count();
        // .: Lưu ý sửa lại link cho đúng với trang và điều kiện thực tế của mỗi trang :. \\
        string url = "~/ProductList.aspx?id={0}&page={1}".StringFormat(id, "{0}");
        //ucPagging.TotalItems = totalItems;
        //ucPagging.CurrentPage = page;
        //ucPagging.PageSize = pageSize;
        //ucPagging.MaxPage = maxPage;
        //ucPagging.URL = url;
        //ucPagging.DataBind();
        Repeater_Main.DataSource = data.Pagging(page, pageSize).ToList();
        Repeater_Main.DataBind();
    }
}