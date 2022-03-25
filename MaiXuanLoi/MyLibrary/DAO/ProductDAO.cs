using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace MyLibrary.DAO
{
    public class ProductDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Product> getList()
        {

            var list = db.Products              
                .OrderByDescending(m => m.Created_at)
                .ToList();
            return list;
        }
        public List<Product> getList(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Products
                    .Where(m => m.Status != 0)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Products
                    .Where(m => m.Status == 0)
                    .ToList();
                return list;
            }
        }
        public List<Product> getList(int limit)
        {

            var list = db.Products
                //.Where(m=>m.CategoryId == catid && m.Status == 1)
                .Where(m => m.Status == 1)
                .OrderByDescending(m => m.Created_at)
                .Take(limit)
                .ToList();
            return list;
        }
        public PagedList.IPagedList<Product> getList(int pageSize,int pageNumber)
        {
            var list = db.Products
                .Where(m => m.Status == 1)
                .OrderByDescending(m=>m.Created_at)
                .ToPagedList(pageNumber, pageSize);
            return list;
        }
        
        public List<Product> getListhome(int catid, int limit)
        {
            var list = db.Products
                //.Where(m=>m.CategoryId == catid && m.Status == 1)
                .Where(m => m.Status == 1 && m.CategoryId == catid)
                .OrderByDescending(m => m.Created_at)
                .Take(limit)
                .ToList();
            return list;
        }
        public List<Product> getList(List<int> listcatid, int limit, int notid, bool check = true)
        {
            var list = db.Products
                .Where(m => m.Status == 1 && m.Id !=notid && listcatid.Contains(m.CategoryId))
                .OrderByDescending(m => m.Created_at)
                .Take(limit)
                .ToList();
            return list;
        }
        public PagedList.IPagedList<Product> getList(List<int> listcatid, int pageSize, int pageNumber)
        {
            var list = db.Products
                .Where(m => m.Status == 1 && listcatid.Contains(m.CategoryId))
                .OrderByDescending(m => m.Created_at)
                .ToPagedList(pageNumber, pageSize);
            return list;
        }
        public List<Product> getListDeal(int limit)
        {
            
            var list = db.Products
                //.Where(m=>m.CategoryId == catid && m.Status == 1)
                .Where(m => m.Status == 1 && m.Price > m.PriceSale)
                .OrderByDescending(m => m.Created_at)
                .Take(limit)
                .ToList();
            return list;
        }
        public PagedList.IPagedList<Product> SearchByKey(String key,int pageSize, int pageNumber)
        {

            var list = db.Products
                .Where(m=> m.Name.Contains(key))
                .ToPagedList(pageNumber, pageSize);
            return list;
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Products.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Product getRow(int? id)
        {
            var row = db.Products.Find(id);
            return row;
        }
        public Product getRow(String slug)
        {
            var row = db.Products
                .Where(m => m.Slug == slug && m.Status == 1)
                .FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Product row)
        {
            db.Products.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Product row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Product row)
        {
            db.Products.Remove(row);
            db.SaveChanges();
        }
    }
}
