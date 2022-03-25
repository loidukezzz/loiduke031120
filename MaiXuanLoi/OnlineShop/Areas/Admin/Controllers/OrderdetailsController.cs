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
    public class OrderdetailsController : BaseController
    {
        OrderdetailDAO OrderdetailDAO = new OrderdetailDAO();

        // GET: Admin/Orderdetails
        public ActionResult Index()
        {
            return View(OrderdetailDAO.getList());
        }

        // GET: Admin/Orderdetails/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Orderdetail orderdetail = OrderdetailDAO.getRow(id);
            if (orderdetail == null)
            {
                return HttpNotFound();
            }
            return View(orderdetail);
        }

        // GET: Admin/Orderdetails/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Orderdetails/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Orderid,Productid,Price,Quantity,Amount")] Orderdetail orderdetail)
        {
            if (ModelState.IsValid)
            {
                OrderdetailDAO.Insert(orderdetail);
                return RedirectToAction("Index");
            }

            return View(orderdetail);
        }

        // GET: Admin/Orderdetails/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Orderdetail orderdetail = OrderdetailDAO.getRow(id);
            if (orderdetail == null)
            {
                return HttpNotFound();
            }
            return View(orderdetail);
        }

        // POST: Admin/Orderdetails/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Orderdetail orderdetail)
        {
            if (ModelState.IsValid)
            {
                OrderdetailDAO.Update(orderdetail);
                return RedirectToAction("Index");
            }
            return View(orderdetail);
        }

        // GET: Admin/Orderdetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Orderdetail orderdetail = OrderdetailDAO.getRow(id);
            if (orderdetail == null)
            {
                return HttpNotFound();
            }
            return View(orderdetail);
        }

        // POST: Admin/Orderdetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Orderdetail orderdetail = OrderdetailDAO.getRow(id);
            return RedirectToAction("Index");
        }
    }
}
