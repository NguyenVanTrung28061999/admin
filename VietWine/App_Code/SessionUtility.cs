using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SessionUtility
/// </summary>
public class SessionUtility
{
   private static Cart _MyCart;
   public static Cart MyCart
    {
        get
        {
            //Lazy load
            if(_MyCart == null)
            {
                HttpContext.Current.Session["MyCart"] = new Cart();
                _MyCart = HttpContext.Current.Session["MyCart"] as Cart; ;
            }

            return _MyCart;
        }
        
    }


}