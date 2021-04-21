using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ucMessage.HideAll();
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)//phương thức trong page này phải được tải tất cả trước khi hiện giao diện
    {
        LoadData();

    }
    public void LoadData()
    {
        span_Count.InnerHtml = SessionUtility.MyCart.Count.ToString();
        span_Count1.InnerHtml = SessionUtility.MyCart.Count.ToString();
        span_Amount.InnerHtml = SessionUtility.MyCart.Amount.ToString("n0") + "đ";
        span_Amount1.InnerHtml = SessionUtility.MyCart.Amount.ToString("n0") + "đ";
        Repeater_Main.DataSource = SessionUtility.MyCart.CartItems;
        Repeater_Main.DataBind();
    }



    protected void LinkButton_Chekout_Click(object sender, EventArgs e)
    {
        if (SessionUtility.MyCart.Count == 0)
        {
            ucMessage.ShowError("Quý khách vui lòng <a href='/ProductList.aspx?id=1'>chọn sản phẩm</a>");
            return;
        }

        Order item = new Order();
        item.FullName = input_FullName.Value.Trim();
        item.Mobile = input_Mobile.Value.Trim();
        item.Address = textarea_Address.Value.Trim();
        item.CreateTime = DateTime.Now;
        item.OrderStatus = true;
        item.ConfirmStatus = false;
        item.ChargeStatus = false;
        item.DeliveStatus = false;
        item.Amount = SessionUtility.MyCart.Amount;

        if (input_FullName.Value == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập họ tên");
            return;
        }
        if (input_Mobile.Value == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập SĐT");
            return;
        }
        if (textarea_Address.Value == string.Empty)
        {
            ucMessage.ShowError("Vui lòng nhập địa chỉ nhận hàng");
            return;
        }

        //Lưu danh sách món hàng trong đơn hàng
        foreach (var cartItem in SessionUtility.MyCart.CartItems)//quét qua từng phần tử ở trong CartItem
        {
            OrderDetail oderDetailItem = new OrderDetail();
            oderDetailItem.ProductID = cartItem.ProductID;
            oderDetailItem.Quantity = cartItem.Quantity;
            oderDetailItem.Price = cartItem.Price;

            item.OrderDetails.Add(oderDetailItem);//oderDetailItem lấy khóa chính của OrderDetails
        }

        //Lưu tất cả vào DB
        DBEntities db = new DBEntities();
        db.Orders.Add(item);
        db.SaveChanges();

        //Thông báo và xóa giỏ hàng
        SessionUtility.MyCart.CartItems.Clear();

        LoadData();
        ucMessage.ShowSuccess("Đã đặt hàng thành công");

        //xóa trắng form
        input_FullName.Value = string.Empty;
        input_Email.Value = string.Empty;
        input_Mobile.Value = string.Empty;
        textarea_Address.Value = string.Empty;
    }
}