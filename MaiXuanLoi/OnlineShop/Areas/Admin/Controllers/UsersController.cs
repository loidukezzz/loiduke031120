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
using OnlineShop.Library;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class UsersController : BaseController
    {
        UserDAO userDAO = new UserDAO();
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        // GET: Admin/Users
        public ActionResult Index()
        {
            return View(userDAO.getList("Index"));
        }
        public ActionResult Trash()
        {
            return View(userDAO.getList("Trash"));
        }
        // GET: Admin/Users/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = userDAO.getRow(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Admin/Users/Create
        public ActionResult Create()
        {
            User user = new User();
            return View(user);
        }

        // POST: Admin/Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                if (user.ImageUpload != null)
                {
                    String fileName = Path.GetFileNameWithoutExtension(user.ImageUpload.FileName);
                    String extension = Path.GetExtension(user.ImageUpload.FileName);
                    fileName = fileName + extension;
                    user.Img = "Content/images/posts/" + fileName;
                    user.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/posts/"), fileName));
                    user.Updated_at = DateTime.Now;
                    user.Password = MyString.ToMD5(user.Password);
                    userDAO.Insert(user);
                    return RedirectToAction("Index");
                }
            }
            return View(user);
        }

        // GET: Admin/Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = new User();
            user = userDAO.getRow(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admin/Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (user.ImageUpload != null)
                    {
                        String fileName = Path.GetFileNameWithoutExtension(user.ImageUpload.FileName);
                        String extension = Path.GetExtension(user.ImageUpload.FileName);
                        fileName = fileName + extension;
                        user.Img = "Content/images/avatars/" + fileName;
                        user.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/avatars/"), fileName));
                        user.Updated_at = DateTime.Now;
                    }
                    userDAO.Update(user);
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View(user);
            }
        }

        public ActionResult Retrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có id", "danger");
                return RedirectToAction("Index");

            }
            User user = userDAO.getRow(id);
            if (user == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            user.Status = 1;
            user.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            userDAO.Update(user);
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
            User user = userDAO.getRow(id);
            if (user == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");
            }
            userDAO.Delete(user);
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
            User user = userDAO.getRow(id);
            if (user == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            user.Status = 0;
            user.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            userDAO.Update(user);
            TempData["XMessage"] = new MyMessage("Đã Xoá Vào Thùng Rác", "success");
            return RedirectToAction("Index");
        }
    }
}
