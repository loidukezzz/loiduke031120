using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace MyLibrary.Model
{
    [Table("Orderdetails")]
    public class Orderdetail
    {
        [Key]
        public int Id { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }

        public float Price { get; set; }
        public int Quantity { get; set; }
        public float Amount { get; set; }
    }
}
