using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class SliderDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Slider> getList()
        {
            var list = db.Sliders.ToList();
            return list;
        }
        public List<Slider> getListpage(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Sliders
                    .Where(m => m.Status != 0)
                    .OrderBy(m => m.Orders)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Sliders
                    .Where(m => m.Status == 0)
                    .OrderBy(m => m.Orders)
                    .ToList();
                return list;
            }
        }
        public List<Slider> getList(String position)
        {
            var list = db.Sliders
                .Where(m => m.Position == position && m.Status == 1)
                .ToList();
            return list;
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Sliders.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Slider getRow(int? id)
        {
            var row = db.Sliders.Find(id);
            return row;
        }
        public Slider getRow(String name)
        {
            var row = db.Sliders
                .Where(m => m.Name == name)
                .FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Slider row)
        {
            db.Sliders.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Slider row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Slider row)
        {
            db.Sliders.Remove(row);
            db.SaveChanges();
        }
    }
}
