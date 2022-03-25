using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace OnlineShop.Library
{
    public static class MyString
    {
        //ma hoa mat khau
        public static String ToMD5(this String s)
        {
            var bytes = Encoding.UTF8.GetBytes(s);
            var hash = MD5.Create().ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }
    }
}