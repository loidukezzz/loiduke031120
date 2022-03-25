using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class ContactDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Contact> getList()
        {
            var list = db.Contacts.ToList();
            return list;
        }
        public List<Contact> getList(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Contacts
                    .Where(m => m.Status != 0)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Contacts
                    .Where(m => m.Status == 0)
                    .ToList();
                return list;
            }
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Contacts.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Contact getRow(int? id)
        {
            var row = db.Contacts.Find(id);
            return row;
        }
        public Contact getRow(int id)
        {
            var row = db.Contacts.Where(m => m.Id == id).FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Contact row)
        {
            db.Contacts.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Contact row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Contact row)
        {
            db.Contacts.Remove(row);
            db.SaveChanges();
        }
    }
}
