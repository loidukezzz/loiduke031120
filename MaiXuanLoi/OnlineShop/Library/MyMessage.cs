using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineShop
{
    public class MyMessage
    {
        public String Msg { get; set; }
        public String Type { get; set; }
        public MyMessage ( String msg, String type){
            this.Msg = msg;
            this.Type = type;
        }
    }
}