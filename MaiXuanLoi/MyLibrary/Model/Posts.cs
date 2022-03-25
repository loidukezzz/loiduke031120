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
    [Table("Posts")]
    public class Posts
    {
        public Posts()
        {
            Img = "~/Content/images/posts/add.png";
        }
        [Key]
        public int Id { get; set; }
        public int TopId { get; set; }
        [Required]
        public string Title { get; set; }
        public string Slug { get; set; }
        [Required]
        public string Detail { get; set; }
        public string Img { get; set; }
        [Required]
        public string Type { get; set; }
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
