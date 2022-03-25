using MyLibrary.DAO;
using MyLibrary.Model;
using OnlineShop.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class AuthSiteController : Controller
    {
        // GET: AuthSite
        ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        UserDAO userDAO = new UserDAO();
        public ActionResult Index()
        {
            ViewBag.UserName = Convert.ToString(Session["UserName"]);
            return View();
        }
        public ActionResult Login()
        {
            ViewBag.StrError = "";
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
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
                    Session["UserSite"] = user_row.UserName;
                    Session["UserIdSite"] = user_row.Id.ToString();
                    return RedirectToAction("Home", "Site");
                }
                else
                {
                    error = "mật khẩu không chính xác";
                }
            }
            else
            {
                error = "tên đăng nhập không tồn tại";
            }
            ViewBag.StrError = "<div class = 'text-danger'>" + error + "</div>";
            return View();
        }
        public ActionResult Logout()
        {
            Session["UserSite"] = "";
            Session["UserIdSite"] = "";
            return Redirect("~/login");
        }
        
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User user)
        {
            var check = db.Users.FirstOrDefault(s => s.Email == user.Email && s.UserName == user.UserName);
            if (check == null)
            {
                user.Status = 1;
                userDAO.Insert(user);
                user.Password = MyString.ToMD5(user.Password);
                ViewBag.error = "Đăng ký thành công";
                return RedirectToAction("Register");
            }
                    
            return View();  
        }        
    }
}