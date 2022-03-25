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
    public class SlidersController : BaseController
    {
        SliderDAO sliderDAO = new SliderDAO();

        // GET: Admin/Sliders
        public ActionResult Index()
        {
            return View(sliderDAO.getListpage("Index"));
        }
        public ActionResult Trash()
        {
            return View(sliderDAO.getListpage("Trash"));
        }
        // GET: Admin/Sliders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slider slider = sliderDAO.getRow(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            return View(slider);
        }

        // GET: Admin/Sliders/Create
        public ActionResult Create()
        {
            Slider slider = new Slider();
            return View(slider);
        }

        // POST: Admin/Sliders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Slider slider)
        {
            if (ModelState.IsValid)
            {
                if (slider.ImageUpload != null)
                {
                    String fileName = Path.GetFileNameWithoutExtension(slider.ImageUpload.FileName);
                    String extension = Path.GetExtension(slider.ImageUpload.FileName);
                    fileName = fileName + extension;
                    slider.Img = "Content/images/banners/" + fileName;
                    slider.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/banners/"), fileName));
                    slider.Updated_at = DateTime.Now;
                    sliderDAO.Insert(slider);
                    return RedirectToAction("Index");
                }
            }
            return View(slider);
        }

        // GET: Admin/Sliders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slider slider = new Slider();
            slider = sliderDAO.getRow(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            return View(slider);
        }

        // POST: Admin/Sliders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Slider slider)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (slider.ImageUpload != null)
                    {
                        String fileName = Path.GetFileNameWithoutExtension(slider.ImageUpload.FileName);
                        String extension = Path.GetExtension(slider.ImageUpload.FileName);
                        fileName = fileName + extension;
                        slider.Img = "Content/images/banners/" + fileName;
                        slider.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/banners/"), fileName));
                        slider.Updated_at = DateTime.Now;
                    }
                    sliderDAO.Update(slider);
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View(slider);
            }
        }

        // GET: Admin/Sliders/Delete/5
        public ActionResult Retrash(int? id)
        {
            if (id == null)
            {
                TempData["XMessage"] = new MyMessage("Không có id", "danger");
                return RedirectToAction("Index");

            }
            Slider slider = sliderDAO.getRow(id);
            if (slider == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            slider.Status = 1;
            slider.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            sliderDAO.Update(slider);
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
            Slider slider = sliderDAO.getRow(id);
            if (slider == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");
            }
            sliderDAO.Delete(slider);
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
            Slider slider = sliderDAO.getRow(id);
            if (slider == null)
            {
                TempData["XMessage"] = new MyMessage("Mẫu tin không tồn tại", "danger");
                return RedirectToAction("Index");

            }
            slider.Status = 0;
            slider.Updated_at = DateTime.Now;
            //category.Update_by = int.Parse(Session["UserId"].ToString());
            sliderDAO.Update(slider);
            TempData["XMessage"] = new MyMessage("Đã Xoá Vào Thùng Rác", "success");
            return RedirectToAction("Index");
        }
    }
}
