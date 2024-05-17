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
    [RoutePrefix("api/projects")]
    public class ProjectController : ApiController
    {
        [Route("AddNewProject")]
        [HttpPost]
        [Obsolete]
        public async Task<Object> AddNewProject([FromBody] ProjectModel model)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.AddNewProject(model)).Result;
        }
        [Route("AddProjectFlowDetail")]
        [HttpPost]
        [Obsolete]
        public async Task<Object> AddProjectFlowDetail([FromBody] ProjectFlowDetailModel model)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.AddProjectFlowDetail(model)).Result;
        }
        [Route("GetProjectList")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetProjectList()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetProjectList()).Result;
        }
        [Route("GetProjectForDropDown")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetProjectForDropDown()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetProjectForDropDown()).Result;
        }
        [Route("GetProjectFlowSecreenByProjectId")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetProjectFlowSecreenByProjectId(int ProjectId)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetProjectFlowSecreenByProjectId(ProjectId)).Result;
        }
        [Route("GetProjectDetail")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetProjectDetail()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetProjectDetail()).Result;
        }
        [Route("GetProjectDetailById")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetProjectDetailById(int ProjectId, int ProjectFlowId)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetProjectDetailById(ProjectId, ProjectFlowId)).Result;
        }
        [Route("UpdateProjectFlowDetail")]
        [HttpPost]
        [Obsolete]
        public async Task<Object> UpdateProjectFlowDetail(ProjectFlowDetailModel model)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.UpdateProjectFlowDetail(model)).Result;
        }
        [Route("getRolesForProjectApprovalRegistration")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> getRolesForProjectApprovalRegistration()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetRolesForProjectApprovalProcess()).Result;
        }
        [Route("loadSubProjectByProjectName")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> loadSubProjectByProjectName(string ProjectName)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.loadSubProjectByProjectName(ProjectName)).Result;
        }
        [Route("LoadWIMS_ADMIN_Request")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Request(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("LoadWIMS_ADMIN_PO")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_PO(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("LoadWIMS_ADMIN_GRN")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_GRN(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("LoadWIMS_ADMIN_TakeIn")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_TakeIn(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("LoadWIMS_ADMIN_PV")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_PV(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("GetDetailByRequestNo")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetDetailByRequestNo(int Mode, string Req_No)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetDetailByRequestNo(Mode, Req_No)).Result;
        }
        [Route("LoaStatusDropdown")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoaStatusDropdown()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.FetchStatusForDropDown()).Result;
        }
        [Route("GetReasonByRequestId")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetReasonByRequestId(string ReqNo)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetRasonsByRequstId(ReqNo)).Result;
        }
        [Route("LoadPAFList")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadPAFList(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("GetImagesByRequestId")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> GetImagesByRequestId(int PaymentApprovalId)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.GetImagesByRequestId(PaymentApprovalId)).Result;
        }
        [Route("LoadWIMS_WS_Request")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_WS_Request(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("LoadWIMS_WS_PO")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_WS_PO(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("LoadWIMS_WS_GRN")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_WS_GRN(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("LoadWIMS_WS_TakeIn")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_WS_TakeIn(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        [Route("LoadWIMS_WS_PV")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_WS_PV(int ProjectId, string fromDate, string toDate, int Mode, int status)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadContentByProjectId(fromDate, toDate, ProjectId, Mode, status)).Result;
        }
        //[Route("ExporttoPDF")]
        //[HttpGet]
        //[Obsolete]
        //public async Task<Object> ExporttoPDF()
        //{
        //    OracaleManager serviceController = new OracaleManager();
        //    return await Task.FromResult(serviceController.GetDetailByRequestNo()).Result;
        //}
    }
}
