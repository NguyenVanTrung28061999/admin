using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CodeUtility;

/// <summary>
/// Summary description for Commons
/// </summary>
public class Commons
{

    public static void LinkButton_Order_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Order = sender as LinkButton;
        int ID = LinkButton_Order.CommandArgument.ToInt();
        int quantity = LinkButton_Order.CommandName.ToInt();


        CartItem item = SessionUtility.MyCart
                                      .CartItems
                                      .FirstOrDefault(x => x.ProductID == ID);


        if (item == null)
        {
            DBEntities db = new DBEntities();
            var productItem = db.Products.FirstOrDefault(x => x.ProductID == ID);
            if (productItem == null)
            {
                SessionUtility.MyCart.CartItems.Remove(item);
                return;
            }

            item = new CartItem();
            item.ProductID = ID;
            item.Title = productItem.Title;
            item.Avatar = productItem.Avatar;
            item.Price = productItem.Price.Value;
            item.Quantity = quantity;
            SessionUtility.MyCart.CartItems.Add(item);
        }
        else
        {
            item.Quantity += quantity;
        }

        ScriptManager.RegisterStartupScript(LinkButton_Order, typeof(Page), Guid.NewGuid().ToString(),
                                                "Msg.success('Đã thêm vào giỏ', 4000)", true);

    }

    public static void LinkButton_Order_Click()
    {
        throw new NotImplementedException();
    }
}