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
    public class LinksController : BaseController
    {
        LinkDAO catDAO = new LinkDAO();

        // GET: Admin/Links
        public ActionResult Index()
        {
            return View(catDAO.getList());
        }

        // GET: Admin/Links/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Link link = catDAO.getRow(id);
            if (link == null)
            {
                return HttpNotFound();
            }
            return View(link);
        }

        // GET: Admin/Links/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Links/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Slug,Type,TableId")] Link link)
        {
            if (ModelState.IsValid)
            {
                catDAO.Insert(link);
                return RedirectToAction("Index");
            }

            return View(link);
        }

        // GET: Admin/Links/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Link link = catDAO.getRow(id);
            if (link == null)
            {
                return HttpNotFound();
            }
            return View(link);
        }

        // POST: Admin/Links/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Link link)
        {
            if (ModelState.IsValid)
            {
                catDAO.Update(link);
                return RedirectToAction("Index");
            }
            return View(link);
        }

        // GET: Admin/Links/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Link link = catDAO.getRow(id);
            if (link == null)
            {
                return HttpNotFound();
            }
            return View(link);
        }

        // POST: Admin/Links/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Link link = catDAO.getRow(id);
            return RedirectToAction("Index");
        }
    }
}
