using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class MenuDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Menu> getList()
        {
            var list = db.Menus.ToList();
            return list;
        }
        public List<Menu> getList(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Menus
                    .Where(m => m.Status != 0)
                    .OrderBy(m => m.Orders)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Menus
                    .Where(m => m.Status == 0)
                    .OrderBy(m => m.Orders)
                    .ToList();
                return list;
            }
        }
        public List<Menu> getList(int parentid)
        {
            var list = db.Menus
                .Where(m => m.ParentId == parentid && m.Status == 1)
                .ToList();
            return list;
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Menus.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Menu getRow(int? id)
        {
            var row = db.Menus.Find(id);
            return row;
        }
        public Menu getRow(String name)
        {
            var row = db.Menus.Where(m => m.Name == name).FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Menu row)
        {
            db.Menus.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Menu row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Menu row)
        {
            db.Menus.Remove(row);
            db.SaveChanges();
        }
    }
}
