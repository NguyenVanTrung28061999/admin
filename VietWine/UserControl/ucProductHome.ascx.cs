using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class ucProductHome : System.Web.UI.UserControl
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
        var query = from c in db.ProductCategories
                    orderby c.Position ascending
                    where c.Status == true
                    select new
                    {
                        c.Title,
                        ProductList = (
                                      from p in db.Products
                                      orderby p.Price ascending
                                      where p.Status == true && c.ProductCategoryID == p.ProductCategoryID
                                      select new
                                      {
                                          ID = p.ProductID,
                                          p.Avatar,
                                          p.Title,
                                          p.Price
                                      }).Take(8)
                    };
        Repeater_Main.DataSource = query.Take(4).ToList();
        Repeater_Main.DataBind();
    }



    protected void LinkButton_Cart_Click(object sender, EventArgs e)
    {
        Commons.LinkButton_Order_Click(sender, e);
    }
}