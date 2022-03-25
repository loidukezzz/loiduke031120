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
    public class CategoryController : BaseController
    {
        CategoryDAO catDAO = new CategoryDAO();
        // GET: Admin/Category
        public ActionResult Index()
        {
            return View(catDAO.getList("Index"));
        }

        public ActionResult Trash()
        {
            return View(catDAO.getList("Trash"));
        }
        // GET: Admin/Category/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = catDAO.getRow(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Admin/Category/Create
        public ActionResult Create()
        {
            ViewBag.ListCat = new SelectList(catDAO.getList("Index"), "Id", "Name", 0);
            ViewBag.ListOrder = new SelectList(catDAO.getList("Orders"), "Id", "Name", 0);
            Category category = new Category();
            return View(category);
        }

        // POST: Admin/Category/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Category category)
        {
            if (ModelState.IsValid)
            {
                if (category.ImageUpload != null)
                {
                    String fileName = Path.GetFileNameWithoutExtension(category.ImageUpload.FileName);
                    String extension = Path.GetExtension(category.ImageUpload.FileName);
                    fileName = fileName + extension;
                    category.Image = "Content/images/banners/" + fileName;
                    category.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/banners/"), fileName));
                    category.Updated_at = DateTime.Now;
                    catDAO.Insert(category);
                    return RedirectToAction("Index");
                }
            }
            return View(category);
        }

        // GET: Admin/Category/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = new Category();
            category = catDAO.getRow(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Category/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Category category)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (category.ImageUpload != null)
                    {
                        String fileName = Path.GetFileNameWithoutExtension(category.ImageUpload.FileName);
                        String extension = Path.GetExtension(category.ImageUpload.FileName);
                        fileName = fileName + extension;
                        category.Image = "Content/images/banners/" + fileName;
                        category.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/banners/"), fileName));
                        category.Updated_at = DateTime.Now;
                    }
                    catDAO.Update(category);
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View(category);
            }
        }
        public ActionResult Retrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có id", "danger");
                return RedirectToAction("Index");

            }
            Category category = catDAO.getRow(id);
            if (category == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            category.Status = 1;
            category.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            catDAO.Update(category);
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
            Category category = catDAO.getRow(id);
            if (category == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");
            }
            catDAO.Delete(category);
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
            Category category = catDAO.getRow(id);
            if (category == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            category.Status = 0;
            category.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            catDAO.Update(category);
            TempData["XMessage"] = new MyMessage("Đã Xoá Vào Thùng Rác", "success");
            return RedirectToAction("Index");
        }
        public ActionResult Status(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có Id", "danger");
            }
            Category category = catDAO.getRow(id);
            if (category == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
            }
            category.Status = (category.Status == 1) ? 2 : 1;
            category.Updated_at = DateTime.Now;
            category.Updated_by = Session["UserId"].ToString();
            catDAO.Update(category);
            TempData["XMessage"] = new MyMessage("Thay đổi trạng thái thành công", "success");
            return RedirectToAction("Index");
        }
    }
}
