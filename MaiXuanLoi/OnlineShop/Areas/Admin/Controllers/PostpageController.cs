using MyLibrary.DAO;
using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class PostpageController : BaseController
    {
        // GET: Admin/Postpage
        PostsDAO postDAO = new PostsDAO();

        // GET: Admin/News
        public ActionResult Index()
        {
            return View(postDAO.getListpage("page"));
        }
        public ActionResult Trash()
        {
            return View(postDAO.getListpage("Trash"));
        }
        // GET: Admin/News/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Posts posts = postDAO.getRow(id);
            if (posts == null)
            {
                return HttpNotFound();
            }
            return View(posts);
        }

        // GET: Admin/News/Create
        public ActionResult Create()
        {
            Posts posts = new Posts();
            return View(posts);
        }

        // POST: Admin/News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Posts posts)
        {
            if (ModelState.IsValid)
            {
                if (posts.ImageUpload != null)
                {
                    String fileName = Path.GetFileNameWithoutExtension(posts.ImageUpload.FileName);
                    String extension = Path.GetExtension(posts.ImageUpload.FileName);
                    fileName = fileName + extension;
                    posts.Img = "Content/images/posts/" + fileName;
                    posts.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/posts/"), fileName));
                    posts.Updated_at = DateTime.Now;
                    posts.Type = "page";
                    postDAO.Insert(posts);
                    return RedirectToAction("Index");
                }
            }
            return View(posts);
        }

        // GET: Admin/News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Posts posts = new Posts();
            posts = postDAO.getRow(id);
            if (posts == null)
            {
                return HttpNotFound();
            }
            return View(posts);
        }

        // POST: Admin/News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Posts posts)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (posts.ImageUpload != null)
                    {
                        String fileName = Path.GetFileNameWithoutExtension(posts.ImageUpload.FileName);
                        String extension = Path.GetExtension(posts.ImageUpload.FileName);
                        fileName = fileName + extension;
                        posts.Img = "Content/images/posts/" + fileName;
                        posts.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/posts/"), fileName));
                        posts.Updated_at = DateTime.Now;
                    }
                    postDAO.Update(posts);
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View(posts);
            }
        }

        // GET: Admin/News/Delete/5
        public ActionResult Retrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có id", "danger");
                return RedirectToAction("Index");

            }
            Posts posts = postDAO.getRow(id);
            if (posts == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            posts.Status = 1;
            posts.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            postDAO.Update(posts);
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
            Posts posts = postDAO.getRow(id);
            if (posts == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");
            }
            postDAO.Delete(posts);
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
            Posts posts = postDAO.getRow(id);
            if (posts == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            posts.Status = 0;
            posts.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            postDAO.Update(posts);
            TempData["XMessage"] = new MyMessage("Đã Xoá Vào Thùng Rác", "success");
            return RedirectToAction("Index");
        }
    }
}