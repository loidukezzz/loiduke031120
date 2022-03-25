using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web;

namespace MyLibrary.Model
{
    [Table("Categorys")]
    public class Category
    {
        public Category()
        {
            Image = "~/Content/images/banners/add.png";
        }
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "Phải nhập")]
        public string Name { get; set; }
        public string Slug { get; set; }
        public int? ParentId { get; set; }
        public String Image { get; set; }
        public String Title { get; set; }
        public String ShortDes { get; set; }
        public String Fulldecription { get; set; }
        public int? Orders { get; set; }
        [Required(ErrorMessage = "Phải nhập")]
        public string Metakey { get; set; }
        [Required(ErrorMessage = "Phải nhập")]
        public string Metadesc { get; set; }
        public DateTime? Created_at { get; set; }
        public string Created_by { get; set; }
        public DateTime? Updated_at { get; set; }
        public string Updated_by { get; set; }
        public int Status { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageUpload { get; set; }
    }
}
