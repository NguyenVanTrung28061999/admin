using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
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
        var data = db.Products.OrderByDescending(x => x.CreateTime).Where(x => x.Status == true).Select(x => x);
        Repeater_ProductHot.DataSource = data.Take(12).ToList();
        Repeater_ProductHot.DataBind();
    }
}