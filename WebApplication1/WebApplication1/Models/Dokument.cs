using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Document
    {
        public int Id { get; set; }
        public String FileName { get; set; }
        public int Number { get; set; }
        public DateTime ChangeDate { get; set; }
        public String Description { get; set; }
        public int UserId { get; set; }
        public String Class { get; set; }
        public String Category { get; set; }
        public String Name { get; set; }
    }
}