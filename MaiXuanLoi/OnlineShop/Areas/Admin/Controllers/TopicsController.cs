using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MyLibrary.DAO;
using MyLibrary.Model;

namespace OnlineShop.Areas.Admin.Controllers
{
    public class TopicsController : BaseController
    {
        TopicDAO topicDAO = new TopicDAO();

        // GET: Admin/Topics
        public ActionResult Index(Product product)
        {
            return View(topicDAO.getList("Index").Where(m => m.Id == product.Id));
        }
        public ActionResult Trash()
        {
            return View(topicDAO.getList("Trash"));
        }
        // GET: Admin/Topics/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Topic topic = topicDAO.getRow(id);
            if (topic == null)
            {
                return HttpNotFound();
            }
            return View(topic);
        }

        // GET: Admin/Topics/Create
        public ActionResult Create()
        {
            ViewBag.ListCat = new SelectList(topicDAO.getList("Index"), "Id", "Name");
            ViewBag.ListOrder = new SelectList(topicDAO.getList("Orders"), "Id", "Name");
            return View();
        }

        // POST: Admin/Topics/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Topic topic)
        {
            if (ModelState.IsValid)
            {
                topicDAO.Insert(topic);
                return RedirectToAction("Index");
            }

            return View(topic);
        }

        // GET: Admin/Topics/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Topic topic = topicDAO.getRow(id);
            if (topic == null)
            {
                return HttpNotFound();
            }
            return View(topic);
        }

        // POST: Admin/Topics/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Topic topic)
        {
            if (ModelState.IsValid)
            {
                topic.Updated_at = DateTime.Now;
                topicDAO.Update(topic);
                return RedirectToAction("Index");
            }
            return View(topic);
        }

        // GET: Admin/Topics/Delete/5
        public ActionResult Retrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có id", "danger");
                return RedirectToAction("Index");

            }
            Topic topic = topicDAO.getRow(id);
            if (topic == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            topic.Status = 1;
            topic.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            topicDAO.Update(topic);
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
            Topic topic = topicDAO.getRow(id);
            if (topic == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");
            }
            topicDAO.Delete(topic);
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
            Topic topic = topicDAO.getRow(id);
            if (topic == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            topic.Status = 0;
            topic.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            topicDAO.Update(topic);
            TempData["XMessage"] = new MyMessage("Đã Xoá Vào Thùng Rác", "success");
            return RedirectToAction("Index");
        }
    }
}
