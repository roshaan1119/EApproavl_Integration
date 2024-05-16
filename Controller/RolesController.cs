using EApproval.Models;
using EApproval.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Http;

namespace EApproval.Controller
{
    [RoutePrefix("api/roles")]
    public class RolesController : ApiController
    {
        [Route("saveRole")]
        [HttpPost]
        [Obsolete]
        public async Task<Object> saveRole([FromBody] UserRoleModel roleModel)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.PostRole(roleModel)).Result;
        }
        [Route("getRoles")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> getRoles()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.getRoleList()).Result;
        }
    }
}
