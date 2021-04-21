using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Comons
/// </summary>
public static class Comons
{
    public static string SplitImage(this object value)
    {
        if (value == null)
            return string.Empty;
        string[] result = value.ToString().Split('\n');
        return result[0];
    }

    public static string[] SplitImageList(this object value)
    {
        if (value == null)
            return new string[] { };
        string[] result = value.ToString().Trim().Split(';');
        return result;
    }
}