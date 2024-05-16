using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EApproval.Models
{
    public class ProjectModel
    {
        public int PROJECTID { get; set; }
        public string NAME { get; set; }
        public string FLOWNAME { get; set; }
        public ProjectFlowModel FlowModel { get; set; }
    }
}