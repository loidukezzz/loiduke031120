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
    [Table("Products")]
    public class Product
    {
        public Product()
        {
            Img = "~/Content/images/items/add.png";
        }
        [Key]
        public int Id { get; set; }
        public int CategoryId { get; set; }
        [Required]
        public string Name { get; set; }

        public string Slug { get; set; }
        public string Img { get; set; }
        [Required]
        public string Detail { get; set; }

        public int Number { get; set; }

        public float Price { get; set; }

        public float PriceSale { get; set; }
        [Required]
        public string Metakey { get; set; }
        [Required]
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
