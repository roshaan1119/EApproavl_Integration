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
            BindReport();
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
            if (SecreenId != 1)
            {
                var taskResult = await oracle.GetDetailByRequestNo(SecreenId, Req_No);
                dt = ((dynamic)taskResult).Data.dt as DataTable;
                dtApprovalAuth = ((dynamic)taskResult).Data.dtApprovalAuth as DataTable;
            }
            if (Project_Id == "61") //For WIMS-WS
            {
                if (SecreenId == 0) //PO Take-In Report
                {
                    var result = await oracle.LoadWIMSWSPOTakeIn(Req_No, dt.Rows[0]["PO_WS"].ToString(), Convert.ToInt32(dt.Rows[0]["PO_PROJECT"]), DateTime.Today.AddYears(-2).ToString("yyyyMMdd"), DateTime.Today.ToString("yyyyMMdd"));
                    dt = ((dynamic)result).Data.dt as DataTable;
                }
                else if (SecreenId == 1) //PV Summary
                {
                    var result = await oracle.LoadWIMSWSPvSummary(Req_No);
                    dt = ((dynamic)result).Data.dt as DataTable;
                }
            }
           
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
                else if (SecreenId == 0) //WIMS_WS_PO_TAKEIN
                {
                    if (dt.Rows.Count > 0)
                    {
                        Reports.WIMS_PO_TAKEIN_REPORT rpt = new Reports.WIMS_PO_TAKEIN_REPORT();
                        rpt.Database.Tables["tbl_WIMS_PO_TAKEIN"].SetDataSource(dt);
                        rptViewer.ReportSource = rpt;
                    }
                }
                else if (SecreenId == 1) //WIMS_WS_PV_SUMMARY
                {
                    if (dt.Rows.Count > 0)
                    {
                        int poqtyValue = 0;
                        int pvqtyValue = 0;
                        int poamtValue = 0;
                        int pvamtValue = 0;
                        Reports.WIMS_PV_SUMMARY_REPORT rpt = new Reports.WIMS_PV_SUMMARY_REPORT();

                        foreach (DataRow row in dt.Rows)
                        {
                           if (row["PV_TYPE"].ToString() == "1")
                           {
                                poqtyValue += Convert.ToInt32(row["PO_IN_QTY"]);
                                pvqtyValue += Convert.ToInt32(row["PV_IN_QTY"]);
                                poamtValue += Convert.ToInt32(row["PO_G_TOTAL_AMOUNT"]);
                                pvamtValue += Convert.ToInt32(row["PV_AMOUNT"]);
                                if (poqtyValue != pvqtyValue && poamtValue != pvamtValue)
                                {
                                    for (int ll_row = 0; ll_row < dt.Rows.Count - 1; ll_row++)
                                    {
                                        var currentRow = dt.Rows[ll_row];
                                        var nextRow = dt.Rows[ll_row + 1];

                                        var currentReqNo = currentRow["pv_req_no"].ToString();
                                        var nextReqNo = nextRow["pv_req_no"].ToString();

                                        var currentPoNo = currentRow["pv_po_no"].ToString();
                                        var nextPoNo = nextRow["pv_po_no"].ToString();

                                        var currentPartNo = currentRow["part_no"].ToString();
                                        var nextPartNo = nextRow["part_no"].ToString();

                                        if (currentReqNo == nextReqNo && currentPoNo == nextPoNo && currentPartNo == nextPartNo)
                                        {
                                            nextRow["po_in_qty"] = 0;
                                            nextRow["po_g_total_amount"] = 0;
                                            nextRow["po_aftertax_amt"] = 0;
                                        }
                                    }
                                }
                            }
                        }
                        
                        rpt.Database.Tables["tbl_WIMS_PV_SUMMARY"].SetDataSource(dt);
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