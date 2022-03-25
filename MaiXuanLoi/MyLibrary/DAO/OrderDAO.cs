using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class OrderDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Order> getList()
        {
            var list = db.Orders.ToList();
            return list;
        }
        public List<Order> getList(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Orders
                    .Where(m => m.Status != 0)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Orders
                    .Where(m => m.Status == 0)
                    .ToList();
                return list;
            }
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Orders.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Order getRow(int? id)
        {
            var row = db.Orders.Find(id);
            return row;
        }
        public Order getRow(int userid)
        {
            var row = db.Orders.Where(m => m.UserId == userid).FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Order row)
        {
            db.Orders.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Order row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Order row)
        {
            db.Orders.Remove(row);
            db.SaveChanges();
        }
    }
}
