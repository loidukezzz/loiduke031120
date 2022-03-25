using MyLibrary.DAO;
using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Controllers
{
    public class SiteController : Controller
    {
        // GET: Site
        CategoryDAO catDAO = new CategoryDAO();
        MenuDAO menuDAO = new MenuDAO();
        LinkDAO linkDAO = new LinkDAO();
        ContactDAO conDAO = new ContactDAO();
        ProductDAO proDAO = new ProductDAO();
        PostsDAO postDAO = new PostsDAO();
        TopicDAO topicDAO = new TopicDAO();
        //CategoryDAO catDAO = new CategoryDAO();
        // GET: Site
        public ActionResult Index(String slug = "", int? page=1)
        {
            if (slug == "")
            {
                return this.Home();
            }
            else
            {
                Link row_link = linkDAO.getRow(slug);
                if (row_link != null)
                {
                    string stypelink = row_link.Type;
                    switch (stypelink)
                    {
                        case "category": { return this.ProductCategory(slug, page); }
                        case "topic": { return this.PostsTopic(); }
                        case "page": { return this.PostsPage(slug); }
                    }
                }
                else
                {
                    //chi tiet san pham
                    if (proDAO.getRow(slug) != null)
                    {
                        return this.ProductDetail(slug);
                    } 
                    //chi tiet bai viet
                    if (postDAO.getRow(slug) != null)
                    {
                        return this.PostsDetail(slug);
                    }
                    return this.Error404(slug);
                }
            }
            return this.Error404(slug);
        }
        public ActionResult Home()
        {
            var list = catDAO.getList("Index");
            return View("Home", list);
        }
        public ActionResult Product(int? page)
        {   
            int pageSize = 12;
            int pageNumber = page??1;
            var list = proDAO.getList(pageSize,pageNumber);
            return View("Product", list);
          
        }
        public ActionResult ProductHome(int catid)
        {
            int limit = 8;
            var list = proDAO.getListhome(catid, limit);
            return View("ProductHome", list);
        }
        public ActionResult ProductCategory(String slug, int? page)
        {
            int pagesize = 5;
            int pageNumber = page ?? 1;
            var row = catDAO.getRow(slug);  
            int catid = row.Id;
            List<int> listcatid = catDAO.getListId(catid);
            var list = proDAO.getList(listcatid, pagesize, pageNumber);

            List<Category> listcat = catDAO.getList(catid);
            ViewBag.ListCat = listcat;
            String cat = row.Name;
            ViewBag.Cat = cat;
            return View("ProductCategory",list);
        }
        public ActionResult ProductDetail(String slug)
        {
            int limit = 5;
            var row = proDAO.getRow(slug);
            int catid = row.CategoryId;
            List<int> listcatid = catDAO.getListId(catid);
            var listother = proDAO.getList(listcatid, limit,row.Id, true);
            ViewBag.ListOther = listother;
            return View("ProductDetail", row);
        }
        public ActionResult Posts()
        {
            int limit = 6;
            var list = postDAO.getList("news",limit);
            var listtopic = postDAO.getRow();
            ViewBag.Listtopic = listtopic;
            return View("Posts", list);
        }
        public ActionResult PostsTopic()
        {
            int limit = 3;
            var list = postDAO.getList("news", limit);
            return View("PostsTopic", list);
        }
        public ActionResult PostsDetail(String slug)
        {
            int limit = 3;
            var row = postDAO.getRow(slug);
            String post = row.Type;
            var listother = postDAO.getList(post, limit);
            ViewBag.ListOther = listother;
            return View("PostsDetail", row);
        }
        public ActionResult PostsPage(String slug)
        {
            var row = postDAO.getRow(slug);
            return View("PostsPage", row);
        }
        public ActionResult Muahang()
        {
            return View("Muahang");
        }
        public ActionResult Vanchuyen()
        {
            return View("Vanchuyen");
        }
        public ActionResult Doitra()
        {
            return View("Doitra");
        }
        public ActionResult Baohanh()
        {
            return View("Baohanh");
        }
        public ActionResult Hoantien()
        {
            return View("Hoantien");
        }
        public ActionResult Contact()
        {
            return View("Contact");
        }

        // POST: Admin/Contacts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(Contact contact)
        {
            if (ModelState.IsValid)
            {
                conDAO.Insert(contact);
                return RedirectToAction("Contact");
            }

            return View(contact);
        }
        //public ActionResult SearchProduct(String key, int? page)
        //{
        //    int pagesize = 8;
        //    int pageNumber = page ?? 1;
        //    var list = proDAO.SearchByKey(key, pagesize, pageNumber);
        //    var search = key;
        //    ViewBag.Search = search;
        //    return View("SearchProduct", list);
        //}
        [HttpGet]
        public ActionResult SearchProduct(String key, int? page)
        {
            if(Request.HttpMethod != "GET")
            {
                page = 1;
            }
            int pagesize = 8;
            int pageNumber = (page ?? 1);
            var list = proDAO.SearchByKey(key, pagesize, pageNumber);
            var search = key;
            ViewBag.Search = search;
            return View("SearchProduct", list);
        }
        [HttpPost]
        public ActionResult SearchProduct(String key, int? page,FormCollection filed)
        {
            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            int pagesize = 8;
            int pageNumber = page ?? 1;
            var list = proDAO.SearchByKey(key, pagesize, pageNumber);
            var search = key;
            ViewBag.Search = search;
            return View("SearchProduct", list);
        }
        public ActionResult Error404(String slug)
        {
            return View("Error404");
        }
    }
}