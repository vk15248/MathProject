using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class DocumentController : ApiController
    {
        Document[] documents = new Document[]
        {
            new Document { Id = 1, Name = "Tomato Soup", Category = "Groceries", Number = 1, ChangeDate = DateTime.Today },
            new Document { Id = 2, Name = "Yo-yo", Category = "Toys", Number = 1, ChangeDate = DateTime.Today},
            new Document { Id = 3, Name = "Hammer", Category = "Hardware",Number = 1, ChangeDate = DateTime.Today }
        };

        // GET: api/Document
        public IEnumerable<Document> Get()
        {
            return documents;
        }

        // GET: api/Document/5
        public Document Get(int id)
        {
            return null;
        }

        // POST: api/Document
        public void Post([FromBody]Document value)
        {
        }

        // PUT: api/Document/5
        public void Put(int id, [FromBody]Document value)
        {
        }

        // DELETE: api/Document/5
        public void Delete(int id)
        {
        }
    }
}
