using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EApproval.Models
{
    public class ApprovalModel
    {
        public int APPROVALID { get; set; }
        public int WIMS_PROJECT_ID { get; set; } // Mode.aspx => ddlProjectId
        public int FLOWDETAILID { get; set; } // Querystring
        public int UPDATEDBY { get; set; } // Session UserId
        public DateTime STATUSDATE { get; set; } // GetDate of System
        public DateTime APPRVOALDATE { get; set; } // GetDate of System
        public DateTime REJECTEDDATE { get; set; } // GetDate of System
        public string REASON { get; set; } // Mode.aspx => txtReason
        public int STATUS { get; set; } // Approve/Reject
        public int USERTYPEID { get; set; } // Session UserTypeId
        public string REQNO { get; set; } // Mode.aspx => Selected List From checkboxes
        public decimal AMOUNT { get; set; }
        public string RBREASON { get; set; }
    }
}