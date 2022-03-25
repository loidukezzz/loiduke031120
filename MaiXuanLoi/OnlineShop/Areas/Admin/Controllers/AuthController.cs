using MyLibrary.DAO;
using MyLibrary.Model;
using OnlineShop.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class AuthController : Controller
    {
        // GET: Admin/Auth
        UserDAO userDAO = new UserDAO();
        public ActionResult Login()
        {
            ViewBag.StrError = "";
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection filed)
        {
            String user = filed["username"];
            String pass = MyString.ToMD5(filed["password"]);
            String error = "";
            //xu ly
            User user_row = userDAO.getRow(user);
            if (user_row != null)
            {
                if (user_row.Password.Equals(pass))
                {
                    Session["UserAdmin"] = user_row.UserName;
                    Session["UserId"] = user_row.Id.ToString();
                    return RedirectToAction("Index", "Dashboard");
                }
                else
                {
                    error = "mật khẩu không chính xác. Vui lòng thử lại!";
                }
            }
            else
            {
                error = "tên đăng nhập không tồn tại";
            }
            ViewBag.StrError = "<div class='text-danger'>" + error + "</div>";
            return View();
        }
        public ActionResult Logout()
        {
            Session["UserAdmin"] = "";
            Session["UserId"] = "";
            return Redirect("~/Admin/login");
        }
    }
}