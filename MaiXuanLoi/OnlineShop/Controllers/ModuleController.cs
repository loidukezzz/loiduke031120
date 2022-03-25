using MyLibrary.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class ModuleController : Controller
    {
        CategoryDAO catDAO = new CategoryDAO();
        MenuDAO menuDAO = new MenuDAO();
        SliderDAO sliderDAO = new SliderDAO();
        ProductDAO productDAO = new ProductDAO();
        PostsDAO postDAO = new PostsDAO();
        // GET: Module
        public ActionResult MainMenu()
        {
            var list = menuDAO.getList(0);
            return View("MainMenu", list);
        }
        public ActionResult Slideshow()
        {
            var list = sliderDAO.getList("Slideshow");
            return View("Slideshow", list);
        }
        public ActionResult Category()
        {
            var list = catDAO.getList("Index");
            return View("Category", list);
        }
        public ActionResult Deals()
        {  
            int limit = 5;
            var list = productDAO.getListDeal(limit);
            return View("Deals", list);
        }
        public ActionResult ItemHome()
        {
            int limit = 12;
            var list = productDAO.getList(limit);
            return View("ItemHome", list);
        }
        public ActionResult Regions()
        {

            return View();
        }
        public ActionResult Services()
        {

            return View();
        }
        public ActionResult Subcribe()
        {

            return View();
        }
    }
}