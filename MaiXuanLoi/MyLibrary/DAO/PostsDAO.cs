using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class PostsDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Posts> getList()
        {
            var list = db.Posts.ToList();
            return list;
        }
        public List<Posts> getListpage(String page = "page")
        {
            if (page == "page")
            {
                var list = db.Posts
                    .Where(m => m.Type == page && m.Status != 0)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Posts
                    .Where(m => m.Type == page && m.Status == 0)
                    .ToList();
                return list;
            }
        }
        public List<Posts> getListnews(String page = "news")
        {
            if (page == "news")
            {
                var list = db.Posts
                    .Where(m => m.Type == page && m.Status != 0)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Posts
                    .Where(m => m.Status == 0)
                    .ToList();
                return list;
            }
        }
        public List<Posts> getList(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Posts
                    .Where(m => m.Status != 0)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Posts
                    .Where(m => m.Status == 0)
                    .ToList();
                return list;
            }
        }
        public List<Posts> getList(String type, int limit)
        {
            var list = db.Posts
                .Where(m => m.Status == 1 && m.Type == type)
                .OrderByDescending(m => m.Created_at)
                .Take(limit)
                .ToList();
            return list;
        }
        public List<Posts> getList(int limit)
        {

            var list = db.Posts
                .Where(m => m.Status == 1)
                .OrderByDescending(m => m.Created_at)
                .Take(limit)
                .ToList();
            return list;
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Posts.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Posts getRow(int? id)
        {
            var row = db.Posts.Find(id);
            return row;
        }
        public Posts getRow()
        {
            var row = db.Posts.FirstOrDefault();
            return row;
        }
        public Posts getRow(String slug)
        {
            var row = db.Posts
                .Where(m => m.Slug == slug && m.Status == 1)
                .FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Posts row)
        {
            db.Posts.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Posts row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Posts row)
        {
            db.Posts.Remove(row);
            db.SaveChanges();
        }
    }
}

