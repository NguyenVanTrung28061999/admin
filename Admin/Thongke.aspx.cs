using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetChartData();
        }
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static object[] GetChartData()
    {
        DBEntities db = new DBEntities();

        var data = db.Products.Where(x => x.Quantity > 0).ToList();
        

        var chartdata = new object[data.Count + 1];
        chartdata[0] = new object[]
        {
            "Name",
            "Quantity"
        };
        int j = 0;
        foreach (var item in data)
        {
            j++;
            chartdata[j] = new object[] { item.Name, item.Quantity };
        }

        
        

        return chartdata;

    }
   


    //protected void LinkButton_Filter_Click(object sender, EventArgs e)
    //{

    //    DateTime f = DateTime.Parse(txt_fromDate.Text);
    //    DateTime h = DateTime.Parse(txt_toDate.Text);
    //    GetChartDataWithDatetime(f, h);
    //    //ScriptManager.RegisterStartupScript(LinkButton_Filter, typeof(Page), Guid.NewGuid().ToString(), "loadData();", true);
    //}
}