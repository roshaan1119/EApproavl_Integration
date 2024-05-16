using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EApproval.Models
{
    public class UserModel
    {
        public int USERID { get; set; }
        public int ROLEID { get; set; }
        public int USERTYPEID { get; set; }
        public string NAME { get; set; }
        public string LOGIN_NAME { get; set; }
        public string EMAIL { get; set; }
        public string PASSOWRD { get; set; }
        public DateTime ADDEDDATE { get; set; }
        public string FLOWDETAILID { get; set; }
        public int PROJECTID { get; set; }
    }
}