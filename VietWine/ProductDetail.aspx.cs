using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            LoadCarousel();
        }
    }
    public void LoadData()
    {
        var id = Request.QueryString["id"].ToInt();
        if (id <= 0)
            Response.Redirect("/");
        DBEntities db = new DBEntities();
        var query = db.Products
                      .Where(x => x.Status == true && x.ProductID == id)
                      .Select(x => new
                      {
                          x.ProductID,
                          x.Title,
                          x.Name,
                          x.Taste,
                          x.AddressProduct,
                          x.Price,
                          x.Avatar,
                          x.BgAvatar1,
                          x.BgAvatar2,

                          ProductInfo = db.ProductInfoes
                                          .Where(p => p.Status == true && p.ProductID == x.ProductID)
                                          .OrderBy(p => p.Position)
                                          .Select(p => new
                                          {
                                              p.ProductInfoID,
                                              p.ProductID,
                                              p.Title,
                                              p.Description
                                          })
                      });
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }

    public void LoadCarousel()
    {
        var id = Request.QueryString["id"].ToInt();
        DBEntities db = new DBEntities();
        var query = db.Products
                      .Where(x => x.Status == true && x.Avatar != null && x.ProductID != id)
                      .OrderBy(x => x.Position)
                      .Select(x => new
                      {
                          x.ProductID,
                          x.Avatar

                      });
        Repeater_Carousel.DataSource = query.Take(12).ToList();
        Repeater_Carousel.DataBind();

    }

    protected void LinkButton_Order_Click(object sender, EventArgs e)
    {
        Commons.LinkButton_Order_Click(sender, e);
    }

    protected void LinkButton_Minus_Click(object sender, EventArgs e)
    {
        int value = input_Quantity.Value.ToInt();
        if (value > 1)
        {
            value--;
            input_Quantity.Value = value.ToString();
            LinkButton_Order.CommandName = value.ToString();
        }
    }

    protected void LinkButton_Plus_Click(object sender, EventArgs e)
    {
        int value = input_Quantity.Value.ToInt();
        if (value < 99)
        {
            value++;
            input_Quantity.Value = value.ToString();
            LinkButton_Order.CommandName = value.ToString();
        }
    }
}