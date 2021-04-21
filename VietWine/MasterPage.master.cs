using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)//phương thức trong page này phải được tải tất cả trước khi hiện giao diện
    {
        LoadCart();
    }
    public void LoadCart()
    {
        span_Count.InnerHtml = SessionUtility.MyCart.Count.ToString();
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var data = from c in db.ProductCategories
                   orderby c.Position ascending
                   where c.Status == true
                   select new
                   {
                       ID = c.ProductCategoryID,
                       c.Title
                   };
        Repeater_Category.DataSource = data.ToList();
        Repeater_Category.DataBind();
        Repeater_MoblieCategory.DataSource = data.ToList();
        Repeater_MoblieCategory.DataBind();
    }
}
