using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class SessionUtility
{
   public static Account Admin
    {
        get
        {
            return HttpContext.Current.Session["Admin"] as Account;
        }
        set
        {
            HttpContext.Current.Session["Admin"] = value;
        }
    }
}