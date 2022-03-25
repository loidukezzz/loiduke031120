using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace MyLibrary.Model
{
    [Table("Links")]
    public class Link
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Slug { get; set; }
        [Required]
        //Type=Caterogy,Topic, Page
        public string Type { get; set; }
        public int TableId { get; set; }
    }
}
