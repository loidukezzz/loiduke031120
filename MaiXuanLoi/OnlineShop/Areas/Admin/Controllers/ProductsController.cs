using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MyLibrary.DAO;
using MyLibrary.Model;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class ProductsController : BaseController
    {
        ProductDAO proDAO = new ProductDAO();
        CategoryDAO catDAO = new CategoryDAO();
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();

        // GET: Admin/Products
        public ActionResult Index()
        {
            return View(proDAO.getList("Index"));
        }
        public ActionResult Trash()
        {
            return View(proDAO.getList("Trash"));
        }
        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = proDAO.getRow(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.ListCat = new SelectList(catDAO.getList("Index"), "Id", "Name");
            ViewBag.ListOrder = new SelectList(catDAO.getList("Orders"), "Id", "Name");
            Product pro = new Product();
            return View(pro);
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                if (product.ImageUpload != null)
                {                   
                    String fileName = Path.GetFileNameWithoutExtension(product.ImageUpload.FileName);
                    String extension = Path.GetExtension(product.ImageUpload.FileName);
                    fileName = fileName + extension;
                    product.Img = "Content/images/items/" + fileName;
                    product.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                    product.Updated_at = DateTime.Now;
                    proDAO.Insert(product);
                    return RedirectToAction("Index");
                }
            }
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = new Product();
            product = proDAO.getRow(id);            
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product product)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (product.ImageUpload != null)
                    {
                        String fileName = Path.GetFileNameWithoutExtension(product.ImageUpload.FileName);
                        String extension = Path.GetExtension(product.ImageUpload.FileName);
                        fileName = fileName + extension;
                        product.Img = "Content/images/items/" + fileName;
                        product.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                        product.Updated_at = DateTime.Now;
                    }
                    proDAO.Update(product);
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View(product);
            }
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Retrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có id", "danger");
                return RedirectToAction("Index");

            }
            Product product = proDAO.getRow(id);
            if (product == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            product.Status = 1;
            product.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            proDAO.Update(product);
            TempData["XMessage"] = new MyMessage("Khôi phục thành công", "success");
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có id", "danger");
                return RedirectToAction("Index");
            }
            Product product = proDAO.getRow(id);
            if (product == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");
            }
            proDAO.Delete(product);
            TempData["XMessage"] = new MyMessage("Đã xoá thành công", "success");
            return RedirectToAction("Trash");//chuyen trang ve thung rac
        }
        // GET: Admin/Category/Delete/5
        public ActionResult Deltrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có id", "danger");
                return RedirectToAction("Index");

            }
            Product product = proDAO.getRow(id);
            if (product == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            product.Status = 0;
            product.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            proDAO.Update(product);
            TempData["XMessage"] = new MyMessage("Đã Xoá Vào Thùng Rác", "success");
            return RedirectToAction("Index");
        }
    }
}
