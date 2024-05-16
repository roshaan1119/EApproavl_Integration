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
    [RoutePrefix("api/dashboard")]
    public class DashboardController : ApiController
    {
        [Route("LoadWIMS_ADMIN_Dashboard_Status")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_Status()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadWIMS_ADMIN_Dashboard_Status()).Result;
        }

        [Route("LoadWIMS_ADMIN_Dashboard_PO_AMT")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_PO_AMT(string tenor)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadWIMS_ADMIN_Dashboard_PO_AMT(tenor)).Result;
        }

        [Route("LoadWIMS_ADMIN_Dashboard_PV_STATUS_DT")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_PV_STATUS_DT(string tenor)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadWIMS_ADMIN_Dashboard_PV_STATUS_DT(tenor)).Result;
        }

        [Route("LoadWIMS_ADMIN_Dashboard_PV_GRAPH")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_PV_GRAPH(string tenor)
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadWIMS_ADMIN_Dashboard_PV_GRAPH(tenor)).Result;
        }

        [Route("LoadWIMS_ADMIN_Dashboard_PO_PENDING")]
        [HttpGet]
        [Obsolete]
        public async Task<Object> LoadWIMS_ADMIN_Dashboard_PO_PENDING()
        {
            OracaleManager serviceController = new OracaleManager();
            return await Task.FromResult(serviceController.LoadWIMS_ADMIN_Dashboard_PO_PENDING()).Result;
        }
    }
}
