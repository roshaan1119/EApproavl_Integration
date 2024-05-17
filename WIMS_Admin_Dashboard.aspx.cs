using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EApproval
{
    public partial class WIMS_Admin_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ValidateUser();
            }
        }
        protected void ValidateUser()
        {

        }
    }
}