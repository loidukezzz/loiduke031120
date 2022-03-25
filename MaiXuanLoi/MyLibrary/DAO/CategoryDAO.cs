﻿using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class CategoryDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<Category> getList(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Categorys
                    .Where(m =>m.Status != 0)
                    .OrderBy(m => m.Orders)                   
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Categorys
                    .Where(m => m.Status == 0)
                    .OrderBy(m => m.Orders)
                    .ToList();
                return list;
            }
        }

        public List<Category> getList(int? parentid = 0)
        {
                var list = db.Categorys
                    .Where(m =>m.ParentId == parentid && m.Status == 1)
                    .OrderBy(m => m.Orders)
                    .ToList();
                return list;           
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Categorys.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public Category getRow(int? id)
        {
            var row = db.Categorys.Find(id);
            return row;
        }
        public Category getRow(String slug)
        {
            var row = db.Categorys.Where(m => m.Slug == slug).FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(Category row)
        {
            db.Categorys.Add(row);
            db.SaveChanges();
        }
        //Sua
        public void Update(Category row)
        {
            db.Entry(row).State = EntityState.Modified;
            db.SaveChanges();
        }
        //Xoa
        public void Delete(Category row)
        {
            db.Categorys.Remove(row);
            db.SaveChanges();
        }

        public List<int> getListId(int parentid)
        {
            List<int> listcatid = new List<int>();
            List<Category> listcategory1 = this.getList(parentid);
            if (listcategory1.Count > 0)
            {
                foreach (var cat1 in listcategory1)
                {
                    listcatid.Add(cat1.Id);
                    List<Category> listcategory2 = this.getList(cat1.Id);
                    if (listcategory2.Count > 0)
                    {
                        foreach (var cat2 in listcategory2)
                        {
                            listcatid.Add(cat2.Id);
                            List<Category> listcategory3 = this.getList(cat2.Id);
                            if (listcategory3.Count > 0)
                            {
                                foreach (var cat3 in listcategory3)
                                {
                                    listcatid.Add(cat3.Id);
                                }
                            }
                        }
                    }
                }
            }
            listcatid.Add(parentid);
            return listcatid;
        }
    }
}
