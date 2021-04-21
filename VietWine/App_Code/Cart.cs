using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Cart
{
    //thuộc tính ko có set chỉ có lấy ra ko có truyền vào

    public double Amount
    {
        get
        {
            return CartItems.Sum(x => x.Quantity * x.Price);
        }
    }

    public int Count
    {
        get
        {
            return CartItems.Sum(x => x.Quantity);
        }
    }
    public string FullName { get; set; }
    public string Mobile { get; set; }
    public string Address { get; set; }

    private List<CartItem> _CartItems;
    public List<CartItem> CartItems {
        //Lazy load List CartItem, để luôn sẵn sàng thêm món mới vào
        get
        {
            if(_CartItems == null)
                _CartItems = new List<CartItem>();
            
            return _CartItems;
        }
    }
}

