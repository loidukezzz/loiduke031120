using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class LinkDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Link> getList()
        {
            var list = db.Links.ToList();
            return list;
        }
        public List<Link> getList(int parentid)
        {
            var list = db.Links.ToList();
            return list;
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Links.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Link getRow(int? id)
        {
            var row = db.Links.Find(id);
            return row;
        }
        public Link getRow(String slug)
        {
            var row = db.Links
                .Where(m => m.Slug == slug)
                .FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Link row)
        {
            db.Links.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Link row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Link row)
        {
            db.Links.Remove(row);
            db.SaveChanges();
        }
    }
    }
