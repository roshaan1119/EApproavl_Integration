using EApproval.Models;
using EApproval.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Xml.Linq;

namespace EApproval.Controller
{
    [RoutePrefix("api/users")]
    public class UsersController : ApiController
    {
        [Route("BindRoles")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> BindRoles()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.getRoleList()).Result;
        }
        [Route("GetUsersList")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> getUsersList()
        {
            int UserId = Convert.ToInt32(HttpContext.Current.Session["USERID"]);
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.getUsersList()).Result;
        }
        [Route("PostUserRecord")]
        [HttpPost]
        [Obsolete]
        public async Task<Object> PostUserRecord([FromBody] UserModel model)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.PostUserRecord(model)).Result;
        }
        [Route("Login")]
        [HttpPost]
        [Obsolete]
        public async Task<Object> Login([FromBody] UserModel model)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.Login(model)).Result;
        }
        [Route("Logout")]
        [HttpPost]
        public async Task<Object> Logout()
        {
            HttpContext.Current.Session.RemoveAll();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.Session.Clear();
            return await Task.FromResult(new { Success = true, Response = "Logged Out" });
        }
        [Route("GetApprovingAuthorities")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetApprovingAuthorities()
        {
            int UserId = Convert.ToInt32(HttpContext.Current.Session["USERID"]);
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetApprovingAuthorities()).Result;
        }
        [Route("LoadUserPermissions")]
        [HttpGet]
        [Obsolete]  
        public async Task<Object> LoadUserPermissions()
        {
            int UserId = Convert.ToInt32(HttpContext.Current.Session["USERID"]);
            int ProjectId = Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]);
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadUserPermissions(UserId, ProjectId)).Result;
        }
        [Route("GetAssignedProjectByUserId")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetAssignedProjectByUserId(int UserId)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetAssignedProjectByUserId(UserId)).Result;
        }
    }
}
