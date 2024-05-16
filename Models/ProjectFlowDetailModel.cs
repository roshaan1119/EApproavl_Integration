using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EApproval.Models
{
    public class ProjectFlowDetailModel
    {
        public int FLOWDETAILID { get; set; }
        public int P_FLOWID { get; set; }
        public string NAME { get; set; }
        public string APPROVALID { get; set; }
        public string PROJECTLIMIT { get; set; }
    }
}