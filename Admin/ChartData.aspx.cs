using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetChartDataWithDatetime();
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

    public static object[] GetChartDataWithDatetime()
    {

        DBEntities db = new DBEntities();
        //var data = (from o in db.Orders
        //            join d in db.OrderDetails on o.OrderID equals d.OrderID
        //            join p in db.Products on d.ProductID equals p.ProductID
        //            where o.CreateTime >= fromDate && o.CreateTime <= toDate
        //            select new
        //            {
        //                d.Quantity,
        //                p.Name
        //            }
        //         ).ToList();
        var data = (from d in db.OrderDetails
                    from p in db.Products
                    where d.ProductID == p.ProductID && p.Status == true
                    select new
                    {
                        p.Name,
                        Quanti = p.Quantity - d.Quantity
                    }).ToList();
        var chartdata = new object[data.Count() + 1];
        chartdata[0] = new object[]
        {
            "Name",
            "Quanti"
        };
        int j = 0;
        foreach (var item in data)
        {
            j++;
            chartdata[j] = new object[] { item.Name, item.Quanti };
        }
        return chartdata;
    }
   
}