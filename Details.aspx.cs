using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using EApproval.CR_DataSets;
using EApproval.Utility;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EApproval
{
    public partial class Details : System.Web.UI.Page
    {
        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReport();
            }
        }

        [Obsolete]
        protected async void BindReport()
        {
            OracaleManager oracle = new OracaleManager();
            var Req_No = Request.QueryString["Req_No"].ToString();
            string Project_Id = HttpContext.Current.Session["PROJECTID"].ToString();
            int SecreenId = Convert.ToInt32(Request.QueryString["SecreenId"]);
            DataTable dt = new DataTable();
            DataTable dtApprovalAuth = new DataTable();
            ReportDataSet ds = new ReportDataSet();
            var taskResult = await oracle.GetDetailByRequestNo(SecreenId, Req_No);
            dt = ((dynamic)taskResult).Data.dt as DataTable;
            dtApprovalAuth = ((dynamic)taskResult).Data.dtApprovalAuth as DataTable;
            rptViewer.DisplayGroupTree = false;
            //WIMS-ADMIN, WIMS-WORKSHOP
            if (Project_Id == "26" || Project_Id == "61")
            {
                if (SecreenId == 41 || SecreenId == 100) //WIMS_ADM_REQUEST, WIMS_WS_REQUEST 
                {
                    if (dt.Rows.Count > 0)
                    {
                        Reports.WIMS_ADM_REQUEST_REPORT rpt = new Reports.WIMS_ADM_REQUEST_REPORT();
                        Reports.WIMS_ADM_SIGNATURE_SUBREPORT sigRpt = new Reports.WIMS_ADM_SIGNATURE_SUBREPORT();
                        rpt.Database.Tables["tbl_WIMS_ADM_Request"].SetDataSource(dt);
                        rpt.Subreports["WIMS_ADM_SIGNATURE_SUBREPORT.rpt"].SetDataSource(dtApprovalAuth);
                        rptViewer.ReportSource = rpt;
                    }
                }
                else if (SecreenId == 43 || SecreenId == 101) //WIMS_ADM_PO, WIMS_WS_PO
                {
                    if (dt.Rows.Count > 0)
                    {
                        Reports.WIMS_ADM_PO_REPORT rpt = new Reports.WIMS_ADM_PO_REPORT();
                        Reports.WIMS_ADM_SIGNATURE_SUBREPORT sigRpt = new Reports.WIMS_ADM_SIGNATURE_SUBREPORT();
                        rpt.Database.Tables["tbl_WIMS_ADM_PO"].SetDataSource(dt);
                        rpt.Subreports["WIMS_ADM_SIGNATURE_SUBREPORT.rpt"].SetDataSource(dtApprovalAuth);
                        rptViewer.ReportSource = rpt;
                    }
                }
                else if (SecreenId == 44 || SecreenId == 102) //WIMS_ADM_GRN, WIMS_WS_GRN
                {
                    if (dt.Rows.Count > 0)
                    {
                        Reports.WIMS_ADM_GRN_REPORT rpt = new Reports.WIMS_ADM_GRN_REPORT();
                        Reports.WIMS_ADM_SIGNATURE_SUBREPORT sigRpt = new Reports.WIMS_ADM_SIGNATURE_SUBREPORT();
                        rpt.Database.Tables["tbl_WIMS_ADM_GRN"].SetDataSource(dt);
                        rpt.Subreports["WIMS_ADM_SIGNATURE_SUBREPORT.rpt"].SetDataSource(dtApprovalAuth);
                        rptViewer.ReportSource = rpt;
                    }
                }
                else if (SecreenId == 45 || SecreenId == 103) //WIMS_ADM_TAKEIN, WIMS_WS_TAKEIN
                {
                    if (dt.Rows.Count > 0)
                    {
                        Reports.WIMS_ADM_TAKEIN_REPORT rpt = new Reports.WIMS_ADM_TAKEIN_REPORT();
                        Reports.WIMS_ADM_SIGNATURE_SUBREPORT sigRpt = new Reports.WIMS_ADM_SIGNATURE_SUBREPORT();
                        rpt.Database.Tables["tbl_WIMS_ADM_TAKEIN"].SetDataSource(dt);
                        rpt.Subreports["WIMS_ADM_SIGNATURE_SUBREPORT.rpt"].SetDataSource(dtApprovalAuth);
                        rptViewer.ReportSource = rpt;
                    }
                }
                else if (SecreenId == 46 || SecreenId == 104) //WIMS_ADM_PV, WIMS_WS_PV
                {
                    if (dt.Rows.Count > 0)
                    {
                        Reports.WIMS_ADM_PV_REPORT rpt = new Reports.WIMS_ADM_PV_REPORT();
                        Reports.WIMS_ADM_SIGNATURE_SUBREPORT sigRpt = new Reports.WIMS_ADM_SIGNATURE_SUBREPORT();
                        rpt.Database.Tables["tbl_WIMS_ADM_PV"].SetDataSource(dt);
                        rpt.Subreports["WIMS_ADM_SIGNATURE_SUBREPORT.rpt"].SetDataSource(dtApprovalAuth);
                        rptViewer.ReportSource = rpt;
                    }
                }
            }
            //ECS
            else if (Project_Id == "81")
            {
                if (SecreenId == 121) //ECS => PAF
                {
                    if (dt.Rows.Count > 0)
                    {
                        Reports.PaymentApprovalReport rpt = new Reports.PaymentApprovalReport();
                        Reports.WIMS_ADM_SIGNATURE_SUBREPORT sigRpt = new Reports.WIMS_ADM_SIGNATURE_SUBREPORT();
                        rpt.Database.Tables["sp_ReprtViewers;1"].SetDataSource(dt);
                        rpt.Subreports["WIMS_ADM_SIGNATURE_SUBREPORT.rpt"].SetDataSource(dtApprovalAuth);
                        rptViewer.ReportSource = rpt;
                    }
                }
            }
        }
    }
}