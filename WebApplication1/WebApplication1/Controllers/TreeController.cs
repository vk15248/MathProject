using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class TreeController : ApiController
    {
        public class MyDataController : ApiController
        {
            /* [HttpGet]
             public HttpResponseMessage TreeData()

             {
                 return new HttpResponseMessage(HttpStatusCode.Accepted);
                 //return new HttpResponseMessage("[{'id':1,'text':'Root node','children':[{'id':2,'text':'Child node 1'},{'id':3,'text':'Child node 2'}]}]");
             }*/

            [Route("api/treeData")]
            [HttpGet]
            public IHttpActionResult treeData()
            {
                return Ok("[{'id':1,'text':'Root node','children':[{'id':2,'text':'Child node 1'},{'id':3,'text':'Child node 2'}]}]");
            }

        }
    }
}
