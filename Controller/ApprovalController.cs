using EApproval.Models;
using EApproval.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace EApproval.Controller
{
    [RoutePrefix("api/approval")]
    public class ApprovalController : ApiController
    {
        [Route("UpdateStatus")]
        [HttpPost]
        [Obsolete]
        public async Task<Object> UpdateStatus(ApprovalModel model, string Status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.UpdateStatus(model, Status)).Result;
        }
    }
}
