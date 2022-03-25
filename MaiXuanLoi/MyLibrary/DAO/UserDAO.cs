using MyLibrary.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyLibrary.DAO
{
    public class UserDAO
    {
        private ClothesWebsiteDBContext db = new ClothesWebsiteDBContext();
        //Tra ve danh sach list object
        public List<User> getList()
        {
            var list = db.Users.ToList();
            return list;
        }
        public List<User> getList(String page = "Index")
        {
            if (page == "Index")
            {
                var list = db.Users
                    .Where(m => m.Status != 0)
                    .ToList();
                return list;
            }
            else
            {
                var list = db.Users
                    .Where(m => m.Status == 0)
                    .ToList();
                return list;
            }
        }
        //Tra ve so luong
        public long getCount()
        {
            var count = db.Users.Count();
            return count;
        }
        //Tra ve mot mau tin object
        public User getRow(int? id)
        {
            var row = db.Users.Find(id);
            return row;
        }

        public User getRow(String user)
        {
            var row = db.Users
                .Where(m => m.Roles == 1 && m.Status == 1 && (m.UserName == user || m.Email == user))
                .FirstOrDefault();
            return row;
        }
        //Them
        public void Insert(User row)
        {
            try { 
                db.Users.Add(row);
                db.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        
        //Sua
        public void Update(User row)
        {
            try
            {
                db.Entry(row).State = EntityState.Modified;
                db.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
        //Xoa
        public void Delete(User row)
        {
            try
            {
                db.Users.Remove(row);
                db.SaveChanges();
            }
            catch (DbEntityValidationException dbEx)
            {
                foreach (var validationErrors in dbEx.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        System.Console.WriteLine("Property: {0} Error: {1}", validationError.PropertyName, validationError.ErrorMessage);
                    }
                }
            }
        }
    }
}
