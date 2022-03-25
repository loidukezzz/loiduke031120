using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class TopicDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Topic> getList()
        {
            var list = db.Topics.ToList();
            return list;
        }
        public List<Topic> getList(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Topics
                    .Where(m => m.Status != 0)
                    .OrderBy(m => m.Orders)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Topics
                    .Where(m => m.Status == 0)
                    .OrderBy(m => m.Orders)
                    .ToList();
                return list;
            }
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Topics.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Topic getRow(int? id)
        {
            var row = db.Topics.Find(id);
            return row;
        }
        public Topic getRow(String slug)
        {
            var row = db.Topics.Where(m => m.Slug == slug).FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Topic row)
        {
            db.Topics.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Topic row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Topic row)
        {
            db.Topics.Remove(row);
            db.SaveChanges();
        }
    }
}
