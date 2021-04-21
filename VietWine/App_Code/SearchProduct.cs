using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

/// <summary>
/// Summary description for SearchProduct
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class SearchProduct : System.Web.Services.WebService {

  
    [WebMethod]
    public string Search(string keyword) 
    {
        DBEntities db = new DBEntities();
        var data = db.Products.Where(x => x.Title.Contains(keyword)).ToList();
        if(data != null)
        {
            data = data.Where(x => x.Title.Contains(keyword)).ToList();
        }
        return "Không tìm thấy";
    }
    
}
