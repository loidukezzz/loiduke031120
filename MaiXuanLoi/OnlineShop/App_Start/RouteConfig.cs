using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace OnlineShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            //tuy bien url khac
            routes.MapRoute(
               name: "Trangchu",
               url: "trang-chu",
               defaults: new { controller = "Site", action = "Home", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "Dangnhap",
               url: "dang-nhap",
               defaults: new { controller = "AuthSite", action = "Login", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "Dangky",
               url: "dang-ky",
               defaults: new { controller = "AuthSite", action = "Register", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "Timkiem",
               url: "tim-kiem",
               defaults: new { controller = "Site", action = "SearchProduct", id = UrlParameter.Optional }
           );
            routes.MapRoute(
                name: "Tatcasanpham",
                url: "tat-ca-san-pham",
                defaults: new { controller = "Site", action = "Product", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Tatcatintuc",
                url: "tat-ca-tin-tuc",
                defaults: new { controller = "Site", action = "Posts", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "Lienhe",
               url: "lien-he",
               defaults: new { controller = "Site", action = "Contact", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "ChinhsachMuahang",
               url: "chinh-sach-mua-hang",
               defaults: new { controller = "Site", action = "Muahang", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "ChinhsachVanchuyen",
               url: "chinh-sach-van-chuyen",
               defaults: new { controller = "Site", action = "Vanchuyen", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "ChinhsachDoitra",
               url: "chinh-sach-doi-tra",
               defaults: new { controller = "Site", action = "Doitra", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "ChinhsachBaohanh",
               url: "chinh-sach-bao-hanh",
               defaults: new { controller = "Site", action = "Baohanh", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "Chinhsachhoantien",
               url: "chinh-sach-hoan-tien",
               defaults: new { controller = "Site", action = "Hoantien", id = UrlParameter.Optional }
           );
            routes.MapRoute(
                name: "Gioithieu",
                url: "gioi-thieu",
                defaults: new { controller = "Site", action = "PostsPage", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Chitietsanpham",
                url: "chi-tiet-san-pham/{slug}",
                defaults: new { controller = "Site", action = "ProductDetail", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Chitietbaiviet",
                url: "bai-viet/{slug}",
                defaults: new { controller = "Site", action = "PostsDetail", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "CategorySlug",
                url: "loai-san-pham/{slug}",
                defaults: new { controller = "Site", action = "ProductCategory", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "AddToCart",
               url: "add-to-cart",
               defaults: new { controller = "ShoppingCart", action = "ShowToCart", id = UrlParameter.Optional }
           );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Site", action = "Home", id = UrlParameter.Optional }
            );
        }
    }
}
