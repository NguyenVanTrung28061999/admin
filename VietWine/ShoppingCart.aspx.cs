using CodeUtility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_PreRender(object sender, EventArgs e)//phương thức trong page này phải được tải tất cả trước khi hiện giao diện
    {
        LoadData();
        if (SessionUtility.MyCart.Count == 0)
        {
            div_cartempry.Visible = true;
            div_cartbody.Visible = false;
        }
        else
        {
            div_cartempry.Visible = false;
            div_cartbody.Visible = true;
        }
    }
    public void LoadData()
    {
        span_Count.InnerHtml = SessionUtility.MyCart.Count.ToString();
        span_Amount.InnerHtml = SessionUtility.MyCart.Amount.ToString("n0") + "đ";
        Repeater_Main.DataSource = SessionUtility.MyCart.CartItems;
        Repeater_Main.DataBind();
    }

    protected void LinkButton_Remove_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Remove = sender as LinkButton;
        int ID = LinkButton_Remove.CommandArgument.ToInt();
        SessionUtility.MyCart.CartItems.RemoveAll(x => x.ProductID == ID);
        LoadData();
    }

    protected void LinkButton_Minus_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Minus = sender as LinkButton;
        int ID = LinkButton_Minus.CommandArgument.ToInt();
        CartItem item = SessionUtility.MyCart.CartItems.FirstOrDefault(x => x.ProductID == ID);
        if (item != null && item.Quantity >= 1)
        {
            item.Quantity -= 1;
        }
        if (item.Quantity <= 0)
        {
            SessionUtility.MyCart.CartItems.RemoveAll(x => x.ProductID == ID);
        }

        LoadData();
    }

    protected void LinkButton_Plus_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Plus = sender as LinkButton;
        int ID = LinkButton_Plus.CommandArgument.ToInt();
        CartItem item = SessionUtility.MyCart.CartItems.FirstOrDefault(x => x.ProductID == ID);
        if (item != null)
        {
            item.Quantity += 1;
        }

        LoadData();
    }
}