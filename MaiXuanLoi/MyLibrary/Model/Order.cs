using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace MyLibrary.Model
{
    [Table("Orders")]
    public class Order
    {
        [Key]
        public int Id { get; set; }
        public string Code { get; set; }
        public int UserId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ExportDate { get; set; }
        public string DeliveryAddress { get; set; }
        public string DeliveryName { get; set; }
        public string DeliveryPhone { get; set; }
        public string DeliveryEmail { get; set; }
        public DateTime? Updated_at { get; set; }
        public string Updated_by { get; set; }
        public int Status { get; set; }
    }
}
