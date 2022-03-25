using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class OrderdetailDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Orderdetail> getList()
        {
            var list = db.Orderdetails.ToList();
            return list;
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Orderdetails.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Orderdetail getRow(int? id)
        {
            var row = db.Orderdetails.Find(id);
            return row;
        }
        public Orderdetail getRow(int orderid)
        {
            var row = db.Orderdetails.Where(m => m.OrderId == orderid).FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Orderdetail row)
        {
            db.Orderdetails.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Orderdetail row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Orderdetail row)
        {
            db.Orderdetails.Remove(row);
            db.SaveChanges();
        }
    }
}
