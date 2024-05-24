<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modes.aspx.cs" Inherits="EApproval.Modes" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #printBody {
            height: auto;
            overflow: auto;
            width: auto;
        }
    </style>
    <style type="text/css" media="print">
        @media print {
            #printBody {
                height: auto;
                overflow: auto;
                width: auto;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <div class="offcanvas-body" id="a">
            <div class="container-fluid">
                <div class="row" id="searchMode" style="display: none;">
                    <div class="col-xl-2 mb-2">
                        <label for="StartDate" id="lblStartDate" class="form-label">Start Date<span class="text-danger"></span></label>
                        <input type="date" class="form-control" id="StartDate" />
                    </div>
                    <div class="col-xl-2 mb-2">
                        <label for="EndDate" id="lblEndDate" class="form-label">End Date<span class="text-danger"></span></label>
                        <input type="date" class="form-control" id="EndDate" />
                    </div>
                    <div class="col-xl-2 mb-2" id="dvProject">
                        <label for="ddlProjects" id="lblProjects" class="form-label">Sub Project<span class="text-danger"></span></label>
                        <select class="form-control" onchange="clearListOnProjectChange();" id="ddlProjects">
                        </select>
                    </div>
                    <div class="col-xl-2 mb-2">
                        <label for="ddlProjects" id="lblStatus" class="form-label">Status<span class="text-danger"></span></label>
                        <select class="form-control" onchange="GetListByStatus();" id="ddlStatus">
                        </select>
                    </div>
                    <div class="col-xl-2 mb-2" style="padding-top: 30px;"> 
                        <%--GetContentList();--%>
                        <button type="button" style="display: inline-block;" class="btn btn-sm btn-info" id="btnGetContent" onclick="GetListByStatus();"> <span class="fa fa-search"> </span> </button> 
                        <button type="button" class="btn btn-sm btn-warning" id="btnClearContent" onclick="ClearContent();"> <span class="fa fa-refresh"> </span> </button>
                        <button class="btn btn-sm btn-dark dropdown-toggle" id="btnStatus" type="button" style="display: none;" data-bs-toggle="dropdown"> <span class="fa fa-eye-slash"> </span> Action</button>
                        <div class="dropdown-menu">
                            <% if (Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 4 || Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 21)
                                { %>
                            <a class="dropdown-item input-success" onclick="UpdateStatus('Approve');" href="#">Forward to Authorizer</a>
                            <%--<a class="dropdown-item input-danger" onclick="UpdateStatus('Reject');" href="#">Rejected</a>--%>

                            <% } %>
                            <% else
                                { %>
                            <a class="dropdown-item input-success" onclick="UpdateStatus('Approve');" href="#">Approve</a>
                            <a class="dropdown-item input-danger" onclick="UpdateStatus('Reject');" href="#">Reject</a>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
            
            <%--WIMS-ADMIN => Request--%>
            <div class="row" id="WIMSAdmin_Request" style="display: none; padding: 10px;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTable" id="reports-tbl_wrapper_Request_ADM">
                                    <table id="tblList_Request_ADM" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Req #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Item Qty</th>
                                                <th style="text-align: center">Request Qty</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-ADMIN => Request--%>

            <%--WIMS-ADMIN => PO--%>
            <div class="row" id="WIMSAdmin_PO" style="display: none;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables" id="reports-tbl_wrapper_PO_ADM">
                                    <table id="tblList_PO_ADM" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Workshop</th>
                                                <th style="text-align: center">PO #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Item</th>
                                                <th style="text-align: center">Qty</th>
                                                <th style="text-align: center">Amount</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-ADMIN => PO--%>

            <%--WIMS-ADMIN => GRN--%>
            <div class="row" id="WIMSAdmin_GRN" style="display: none;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables" id="reports-tbl_wrapper_GRN_ADM">
                                    <table id="tblList_GRN_ADM" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Workshop</th>
                                                <th style="text-align: center">GRN #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Item</th>
                                                <th style="text-align: center">Qty</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-ADMIN => GRN--%>

            <%--WIMS-ADMIN => TAKE-IN --%>
            <div class="row" id="WIMSAdmin_TakeIn" style="display: none;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables_wrapper" id="reports-tbl_wrapper_TakeIn_ADM">

                                    <table id="tblList_TakeIn_ADM" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Workshop</th>
                                                <th style="text-align: center">Req #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Item</th>
                                                <th style="text-align: center">Qty</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-ADMIN => TAKE-IN --%>

            <%--WIMS-ADMIN => PV --%>
            <div class="row" id="WIMSAdmin_PV" style="display: none;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables_wrapper" id="reports-tbl_wrapper_PV_ADM">
                                    <table id="tblList_PV_ADM" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Workshop</th>
                                                <th style="text-align: center">PV #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Type</th>
                                                <th style="text-align: center">Amount</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center; font-size: smaller;">
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-ADMIN => TAKE-IN --%>

            <%--WIMS-WORKSHOP => Request--%>
            <div class="row" id="WIMSWS_Request" style="display: none; padding: 10px;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTable" id="reports-tbl_wrapper_Request_WS">
                                    <table id="tblList_Request_WS" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Req #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Item Qty</th>
                                                <th style="text-align: center">Request Qty</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-WORKSHOP=> Request--%>

            <%--WIMS-WORKSHOP => PO--%>
            <div class="row" id="WIMSWS_PO" style="display: none;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables" id="reports-tbl_wrapper_PO_WS">
                                    <table id="tblList_PO_WS" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Workshop</th>
                                                <th style="text-align: center">PO #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Item</th>
                                                <th style="text-align: center">Qty</th>
                                                <th style="text-align: center">Amount</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-WORKSHOP => PO--%>

            <%--WIMS-WORKSHOP => GRN--%>
            <div class="row" id="WIMSWS_GRN" style="display: none;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables" id="reports-tbl_wrapper_GRN_WS">
                                    <table id="tblList_GRN_WS" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox"></div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Workshop</th>
                                                <th style="text-align: center">GRN #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Item</th>
                                                <th style="text-align: center">Qty</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-WORKSHOP => GRN--%>

            <%--WIMS-WORKSHOP => TAKE-IN --%>
            <div class="row" id="WIMSWS_TakeIn" style="display: none;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables_wrapper" id="reports-tbl_wrapper_TakeIn_WS">
                                    <table id="tblList_TakeIn_WS" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Workshop</th>
                                                <th style="text-align: center">Req #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Item</th>
                                                <th style="text-align: center">Qty</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-WORKSHOP => TAKE-IN --%>

            <%--WIMS-WORKSHOP => PV --%>
            <div class="row" id="WIMSWS_PV" style="display: none;">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables_wrapper" id="reports-tbl_wrapper_PV_WS">
                                    <table id="tblList_PV_WS" class="display table table-hover" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Workshop</th>
                                                <th style="text-align: center">PV #</th>
                                                <th style="text-align: center">Date</th>
                                                <th style="text-align: center">Type</th>
                                                <th style="text-align: center">Amount</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center; font-size: smaller;">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-WORKSHOP => PV --%>

            <%--ECS => Payment Approval --%>
            <div class="row" id="PAF" style="display: none;" >
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <div class="dataTables_wrapper" id="reports-tbl_wrapper_PAF">
                                    <table id="tblListPAF" class="display table table-hover" style="width:50px">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <div class="form-check custom-checkbox">
                                                    </div>
                                                </th>
                                               <%-- <th style="text-align: center">Sr#</th>--%>
                                                <th style="text-align: center">Ref#</th>
                                                <th style="text-align: center">GL-Code</th>
                                                <th style="text-align: center">Company</th>
                                                <th style="text-align: center">Department</th>
                                                <th style="text-align: center">Type</th>
                                                <th style="text-align: center">Amount</th>
                                                <th style="text-align: center">Description</th>
                                                <th style="text-align: center">Status</th>
                                                <th style="text-align: center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center; font-size: smaller;">
                                        </tbody>
            
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--WIMS-ADMIN => TAKE-IN --%>


        </div>
        <%--<CR:CrystalReportViewer ID="dtlViewer" runat="server" AutoDataBind="true" />--%>
    </div>
    <div class="modal fade bd-example-modal-lg" id="RejectedReasonModel" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5" id="title"> Please enter rejection remarks. </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <% if (Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]) == 81 && Convert.ToInt32(HttpContext.Current.Session["USERTYPEID"]) == 22) %>
                    <% { %>
                    <div class="row" id="rbReasons">
                        <div class="col-sm-12">
                            <h6>Please select reason</h6>
                            <input type="radio" id="rbGlCode" name="rbReasons" value="ChangeGLCode" />
                            <label for="rbGlCode">Change GL-Code</label> <br />
                            <input type="radio" id="rbOther" name="rbReasons" value="Other" checked />
                            <label for="rbOther">Others</label>
                        </div>
                    </div>
                    <% } %>
                    <div class="row">
                        <div class="col-xl-12">
                        	<div class="mt-3 invite">
                        		<label class="form-label">Reason<span class="text-danger"> *</span></label>
                                <textarea id="txtReason" class="form-control" placeholder="Rejection remarks..."></textarea>
                        	</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger light" onclick="clearFields();" data-bs-dismiss="modal">Close</button>
                    <button type="button" onclick="UpdateStatus('RejectReason');" class="btn btn-info">Submit Remarks</button>
                </div>
            </div>
        </div>
    </div>
    <%--MODAL POP UP FOR REASONS--%>
    <div class="modal fade bd-example-modal-lg" id="DetailModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5" id=""> Reasons </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <div class="dataTables" id="AssignedProject-tbl_wrapper">
                            <table id="tblReasons" class="display table table-hover" role="gridcell" aria-describedby="reports-tbl_info">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">User Type</th>
                                        <th style="text-align: center">Status</th>
                                        <th style="text-align: center">Remarks</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align: center;">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade bd-example-modal-lg" id="AttachementModel" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5" id=""> Attachements </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <div class="dataTables">
                            
                           <table id="tblImages" class="display table table-hover" role="gridcell" aria-describedby="reports-tbl_info">
                            <tbody style="text-align: center;">
                                <tr>
                                    <td>
                                        <img id="img1" src="#" height="350" width="260" class="ImagePreviewBox" /></td>
                                    <td>               
                                        <img id="img2" src="#" height="350" width="260" class="ImagePreviewBox" /></td>
                                    <td>               
                                        <img id="img3" src="#" height="350" width="260" class="ImagePreviewBox" /></td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <script src="js/project/modes.js"></script>

    
    <script type="text/javascript">
        var QueryString_PT = '<%= Request.QueryString["ProjectType"].ToString() %>';
        var QueryString_Mode = '<%= Request.QueryString["Mode"].ToString() %>';
        var UserType = '<%= Convert.ToInt32(Session["USERTYPEID"]) %>';
        var Project_Id = '<%= Convert.ToInt32(HttpContext.Current.Session["PROJECTID"]) %>';
        var SelectedList = [];
        function GetProjectType() {
            if (Project_Id == 26) {
                $('#searchMode').show();
                LoadSearchFilters();
                LoadStatusForDropDown();
                GetContentList(-1);
            }
            else if (Project_Id == 61) {
                $('#searchMode').show();
                LoadSearchFilters();
                LoadStatusForDropDown();
                GetContentList(-1);
            }
            else if (Project_Id == 81) {
                $('#searchMode').show();
                $('#dvProject').hide();
                LoadSearchFilters();
                LoadStatusForDropDown();
                GetContentList(-1);
            }
        }
        function LoadStatusForDropDown() {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/LoaStatusDropdown",
                dataType: 'json',
                success: function (data) {
                    let Success = data.Success;
                    let DataList = data.Data;
                    if (Success) {
                        $("#ddlStatus").append('<option value="-1">All</option>')
                        $.each(DataList, function (i, ddstatus) {
                            $('#ddlStatus').append('<option value="' + ddstatus.STATUSID + '">' + ddstatus.STATUS + '</option>');
                        });
                    }
                }
            });
        }
        function LoadSearchFilters() {
            var EndDate = '<%= DateTime.Today.ToString("yyyy-MM-dd") %>';
            var StartDate = '<%= DateTime.Today.AddDays(-30).ToString("yyyy-MM-dd") %>';
            $('#StartDate').val(StartDate);
            $('#EndDate').val(EndDate);

            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/loadSubProjectByProjectName?ProjectName=" + QueryString_PT,
                dataType: 'json',
                success: function (data) {
                    let Success = data.Success;
                    let DataList = data.Data;
                    if (Success) {
                        $.each(DataList, function (i, project) {
                            $('#ddlProjects').append('<option value="' + project.PROJECT_CODE + '">' + project.PROJECT_NAME + '</option>');
                        });
                    }
                }
            });
        }
        function GetListByStatus() {
            var status = $('#ddlStatus').val();
            GetContentList(status);
        }
        function clearListOnProjectChange() {
            SelectedList = [];
        }
        function GetContentList(status) {
            var ddlProject = $('#ddlProjects').val();
            if (ddlProject == null) {
                ddlProject = 0;
            }
            var fromDate = $('#StartDate').val().replace(/-/g, '');
            var toDate = $('#EndDate').val().replace(/-/g, '');
            if (ddlProject == -1) {
                sweetAlert("Oops...", "Please Select Project", "error");
            }
            else {
                //WIMS-ADMIN
                if (Project_Id == 26) {
                    // Wims-admin => Request
                    if (QueryString_Mode == 41) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_ADMIN_Request?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSAdmin_Request').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let tHeads = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    var statusStyle = '';
                                    if (DataList != null) {
                                        $("#tblList_Request_ADM").DataTable().clear();
                                        $("#tblList_Request_ADM").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                                if (item.ApprovalStatus != 'PENDING') {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType = 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                                if (item.StatusId == 2 || item.StatusId == 4) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.Req_No + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.Req_No + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.Req_No + '</td><td style=' + rowStyle + '>' + item.Req_Date + '</td><td style=' + rowStyle + '>' + item.Item + '</td><td style=' + rowStyle + '>' + item.Req_Qty + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>'
                                        });
                                        $("#tblList_Request_ADM tbody").append(lst);
                                        $("#tblList_Request_ADM tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_Request_ADM").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSAdmin_Request').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                }
                                else {
                                    $('#WIMSAdmin_Request').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                    // Wims-admin => POs
                    else if (QueryString_Mode == 43) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_ADMIN_PO?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSAdmin_PO').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let cbList = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    if (DataList != null) {
                                        $("#tblList_PO_ADM").DataTable().clear();
                                        $("#tblList_PO_ADM").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            debugger;
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                                if (item.ApprovalStatus != 'PENDING') {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                                if (item.StatusId == 2 || item.StatusId == 4 || item.StatusId == 3) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 1 || UserType == 22) { //Approver-1, Approver-2
                                                if ((item.StatusId == 4 || item.StatusId == 7) || (item.StatusId == 5 || item.StatusId == 8 || item.StatusId == 3)) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.PO_NO + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.PO_NO + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.PO_WS + '</td><td style=' + rowStyle + '>' + item.PO_NO + '</td><td style=' + rowStyle + '>' + item.Date + '</td><td style=' + rowStyle + '>' + item.Item + '</td><td style=' + rowStyle + '>' + item.Qty + '</td><td style=' + rowStyle + '>' + item.Amount + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                        });
                                        $("#tblList_PO_ADM tbody").append(lst);
                                        $("#tblList_PO_ADM tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_PO_ADM").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSAdmin_PO').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                }
                                else {
                                    $('#WIMSAdmin_PO').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                    // Wims-admin => GRN
                    else if (QueryString_Mode == 44) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_ADMIN_GRN?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSAdmin_GRN').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    //$("#tblList_GRN_ADM tbody").html('');
                                    if (DataList != null) {
                                        $("#tblList_GRN_ADM").DataTable().clear();
                                        $("#tblList_GRN_ADM").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                                if (item.ApprovalStatus != 'PENDING') {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                                if (item.StatusId == 2 || item.StatusId == 4) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.GRN_NO + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.GRN_NO + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.GRN_WS + '</td><td style=' + rowStyle + '>' + item.GRN_NO + '</td><td style=' + rowStyle + '>' + item.Date + '</td><td style=' + rowStyle + '>' + item.Item + '</td><td style=' + rowStyle + '>' + item.Qty + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                        });
                                        $("#tblList_GRN_ADM tbody").append(lst);
                                        $("#tblList_GRN_ADM tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_GRN_ADM").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSAdmin_GRN').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                    //$("#tblList_GRN_ADM tbody").html(lst);
                                }
                                else {
                                    $('#WIMSAdmin_GRN').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                    // Wims-admin => TakeIn
                    else if (QueryString_Mode == 45) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_ADMIN_TakeIn?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSAdmin_TakeIn').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    if (DataList != null) {
                                        $("#tblList_TakeIn_ADM").DataTable().clear();
                                        $("#tblList_TakeIn_ADM").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                                if (item.ApprovalStatus != 'PENDING') {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType = 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                                if (item.StatusId == 2 || item.StatusId == 4) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.Req_No + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.Req_No + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.INPUT_WS + '</td><td style=' + rowStyle + '>' + item.Req_No + '</td><td style=' + rowStyle + '>' + item.Date + '</td><td style=' + rowStyle + '>' + item.Item + '</td><td style=' + rowStyle + '>' + item.Qty + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                        });
                                        $("#tblList_TakeIn_ADM tbody").append(lst);
                                        $("#tblList_TakeIn_ADM tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_TakeIn_ADM").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSAdmin_TakeIn').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                }
                                else {
                                    $('#WIMSAdmin_TakeIn').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                    // Wims-admin => Payment Voucher
                    else if (QueryString_Mode == 46) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_ADMIN_PV?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSAdmin_PV').show();
                                    let lst = '';
                                    let cbList = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    if (DataList != null) {
                                        $("#tblList_PV_ADM").DataTable().clear();
                                        $("#tblList_PV_ADM").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                                if (item.ApprovalStatus != 'PENDING') {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                                if (item.StatusId == 2 || item.StatusId == 4 || item.StatusId == 3) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 1 || UserType == 22) { //Approver 1, Approver 2
                                                if ((item.StatusId == 4 || item.StatusId == 7) || (item.StatusId == 5 || item.StatusId == 8 || item.StatusId == 3)) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.Payment_Voucher + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.Payment_Voucher + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.PV_WS + '</td><td style=' + rowStyle + '>' + item.Payment_Voucher + '</td><td style=' + rowStyle + '>' + item.Date + '</td><td style=' + rowStyle + '>' + item.Type + '</td><td style=' + rowStyle + '>' + item.Amount + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                        });
                                        $("#tblList_PV_ADM tbody").append(lst);
                                        $("#tblList_PV_ADM tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_PV_ADM").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSAdmin_PV').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                }
                                else {
                                    $('#WIMSAdmin_PV').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                }
                //WIMS-WORKSHOP
                else if (Project_Id == 61) {
                    // WIMS-WORKSHOP => Request
                    if (QueryString_Mode == 100) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_WS_Request?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSWS_Request').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let tHeads = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    var statusStyle = '';
                                    if (DataList != null) {
                                        $("#tblList_Request_WS").DataTable().clear();
                                        $("#tblList_Request_WS").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                                if (item.ApprovalStatus != 'PENDING') {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType = 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                                if (item.StatusId == 2 || item.StatusId == 4) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.Req_No + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.Req_No + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.Req_No + '</td><td style=' + rowStyle + '>' + item.Req_Date + '</td><td style=' + rowStyle + '>' + item.Item + '</td><td style=' + rowStyle + '>' + item.Req_Qty + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>'
                                        });
                                        $("#tblList_Request_WS tbody").append(lst);
                                        $("#tblList_Request_WS tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_Request_WS").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSWS_Request').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                }
                                else {
                                    $('#WIMSWS_Request').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                    // WIMS-WORKSHOP => POs
                    else if (QueryString_Mode == 101) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_WS_PO?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSWS_PO').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    if (DataList != null) {
                                        $("#tblList_PO_WS").DataTable().clear();
                                        $("#tblList_PO_WS").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            
                                            if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                                if (item.ApprovalStatus != 'PENDING') {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                                if (item.StatusId == 2 || item.StatusId == 4 || item.StatusId == 3) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 1 || UserType == 22) { //Approver-1, Approver-2
                                                if ((item.StatusId == 4 || item.StatusId == 7) || (item.StatusId == 5 || item.StatusId == 8 || item.StatusId == 3)) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.PO_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.PO_NO + "'" + ')" title="View Report" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.PO_NO + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" title="Reason" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetTakeInByPO(' + "'" + item.PO_NO + "'" + ')" title="PO Take-In Report" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M14.7379 2.76181H8.08493C6.00493 2.75381 4.29993 4.41181 4.25093 6.49081V17.2038C4.20493 19.3168 5.87993 21.0678 7.99293 21.1148C8.02393 21.1148 8.05393 21.1158 8.08493 21.1148H16.0739C18.1679 21.0298 19.8179 19.2998 19.8029 17.2038V8.03781L14.7379 2.76181Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M14.4751 2.75V5.659C14.4751 7.079 15.6231 8.23 17.0431 8.234H19.7981" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M14.2882 15.3585H8.88818" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M12.2432 11.606H8.88721" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg></button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.PO_WS + '</td><td style=' + rowStyle + '>' + item.PO_NO + '</td><td style=' + rowStyle + '>' + item.Date + '</td><td style=' + rowStyle + '>' + item.Item + '</td><td style=' + rowStyle + '>' + item.Qty + '</td><td style=' + rowStyle + '>' + item.Amount + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                        });
                                        $("#tblList_PO_WS tbody").append(lst);
                                        $("#tblList_PO_WS tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_PO_WS").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSWS_PO').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                }
                                else {
                                    $('#WIMSWS_PO').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                    // WIMS-WORKSHOP => GRN
                    else if (QueryString_Mode == 102) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_WS_GRN?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSWS_GRN').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    //$("#tblList_GRN_ADM tbody").html('');
                                    if (DataList != null) {
                                        $("#tblList_GRN_WS").DataTable().clear();
                                        $("#tblList_GRN_WS").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (item.ApprovalStatus != 'PENDING') {
                                                cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            }
                                            else {
                                                cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            }
                                            //if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                            //    if (item.ApprovalStatus != 'PENDING') {
                                            //        cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            //    }
                                            //    else {
                                            //        cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            //    }
                                            //}
                                            //else if (UserType == 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                            //    if (item.StatusId == 2 || item.StatusId == 4) {
                                            //        cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            //    }
                                            //    else {
                                            //        cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.GRN_NO + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            //    }
                                            //}
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.GRN_NO + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.GRN_NO + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            //actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.GRN_NO + "'" + ')" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.GRN_WS + '</td><td style=' + rowStyle + '>' + item.GRN_NO + '</td><td style=' + rowStyle + '>' + item.Date + '</td><td style=' + rowStyle + '>' + item.Item + '</td><td style=' + rowStyle + '>' + item.Qty + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                        });
                                        $("#tblList_GRN_WS tbody").append(lst);
                                        $("#tblList_GRN_WS tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_GRN_WS").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSWS_GRN').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                    //$("#tblList_GRN_ADM tbody").html(lst);
                                }
                                else {
                                    $('#WIMSWS_GRN').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                    // WIMS-WORKSHOP => TakeIn
                    else if (QueryString_Mode == 103) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_WS_TakeIn?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSWS_TakeIn').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    if (DataList != null) {
                                        $("#tblList_TakeIn_WS").DataTable().clear();
                                        $("#tblList_TakeIn_WS").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (item.ApprovalStatus != 'PENDING') {
                                                cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            }
                                            else {
                                                cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            }
                                            //if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                            //    if (item.ApprovalStatus != 'PENDING') {
                                            //        cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            //    }
                                            //    else {
                                            //        cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            //    }
                                            //}
                                            //else if (UserType == 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                            //    if (item.StatusId == 2 || item.StatusId == 4) {
                                            //        cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            //    }
                                            //    else {
                                            //        cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Req_No + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                            //    }
                                            //}
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.Req_No + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.Req_No + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.INPUT_WS + '</td><td style=' + rowStyle + '>' + item.Req_No + '</td><td style=' + rowStyle + '>' + item.Date + '</td><td style=' + rowStyle + '>' + item.Item + '</td><td style=' + rowStyle + '>' + item.Qty + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                        });
                                        $("#tblList_TakeIn_WS tbody").append(lst);
                                        $("#tblList_TakeIn_WS tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_TakeIn_WS").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSWS_TakeIn').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                }
                                else {
                                    $('#WIMSWS_TakeIn').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                    // WIMS-WORKSHOP => Payment Voucher
                    else if (QueryString_Mode == 104) {
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadWIMS_WS_PV?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#WIMSWS_PV').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    if (DataList != null) {
                                        $("#tblList_PV_WS").DataTable().clear();
                                        $("#tblList_PV_WS").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (UserType == 4 || UserType == 21) { //Initiator-1, Initiator-2
                                                if (item.ApprovalStatus != 'PENDING') {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 2 || UserType == 3) { //Authorizer-1, Authorizer-2
                                                if (item.StatusId == 2 || item.StatusId == 4 || item.StatusId == 3) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 1 || UserType == 22) { //Approver 1, Approver 2
                                                if ((item.StatusId == 4 || item.StatusId == 7) || (item.StatusId == 5 || item.StatusId == 8 || item.StatusId == 3)) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.Payment_Voucher + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.Payment_Voucher + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.Payment_Voucher + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.PV_WS + '</td><td style=' + rowStyle + '>' + item.Payment_Voucher + '</td><td style=' + rowStyle + '>' + item.Date + '</td><td style=' + rowStyle + '>' + item.Type + '</td><td style=' + rowStyle + '>' + item.Amount + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                        });
                                        $("#tblList_PV_WS tbody").append(lst);
                                        $("#tblList_PV_WS tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblList_PV_WS").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    else {
                                        $('#WIMSWS_PV').hide();
                                        sweetAlert("Oops...", "No Record Found", "info");
                                    }
                                }
                                else {
                                    $('#WIMSWS_PV').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                }
                //ECS
                else if (Project_Id == 81) {
                    if (QueryString_Mode == 121) { // ECS => Payment Approval
                        //var rejectRsn = $("input[name='rbReasons']:checked").val();
                        //alert(rejectRsn);
                        $.ajax({
                            type: "GET",
                            contentType: 'application/json; charset=utf-8',
                            url: "api/projects/LoadPAFList?ProjectId=" + ddlProject + "&fromDate=" + fromDate + "&toDate=" + toDate + "&Mode=" + QueryString_Mode + "&Status=" + status,
                            dataType: 'json',
                            success: function (data) {
                                let Success = data.Success;
                                let DataList = data.Data;
                                if (Success) {
                                    $('#PAF').show();
                                    let lst = '';
                                    let rowStyle = '';
                                    let actionLink = '';
                                    let tHeads = '';
                                    let iRowNum = 0;
                                    var data = [];
                                    var statusStyle = '';
                                    if (DataList != null) {
                                        debugger;
                                        $("#tblListPAF").DataTable().clear();
                                        $("#tblListPAF").DataTable().destroy();
                                        $(DataList).each(function (i, item) {
                                            iRowNum += 1;
                                            rowStyle = "'text-align:center; font-size:small;'";
                                            if (UserType == 4 || UserType == 21) { //Staff/Initiator
                                                if ((item.ApprovalStatus != 'PENDING') && (item.StatusId != 8)) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.RefNo + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.RefNo + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 2 || UserType == 3) { // Authorizer 1, 2
                                                if (item.StatusId == 2 || item.StatusId == 4 || item.StatusId == 7 || item.StatusId == 8 || item.StatusId == 3) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.RefNo + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.RefNo + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else if (UserType == 1) { // Approver 1
                                                if (((item.StatusId == 4 || item.StatusId == 7 || item.StatusId == 8 || item.StatusId == 1 || item.StatusId == 3))) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.RefNo + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.RefNo + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            else { // Approver 2
                                                if (item.StatusId == 7 || item.StatusId == 8 || item.StatusId == 1 || item.StatusId == 3) {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" checked disabled onchange="GetSelectedValues(' + "'" + item.RefNo + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                                else {
                                                    cbList = '<div class="form-check custom-checkbox cbSelected"><input type="checkbox" onchange="GetSelectedValues(' + "'" + item.RefNo + "'" + ',' + iRowNum + ');" class="form-check-input" id="' + iRowNum + '"></div>';
                                                }
                                            }
                                            actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByRequestId(' + "'" + item.PaymentApprovalId + "'" + ')" ><svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M15.1614 12.0531C15.1614 13.7991 13.7454 15.2141 11.9994 15.2141C10.2534 15.2141 8.83838 13.7991 8.83838 12.0531C8.83838 10.3061 10.2534 8.89111 11.9994 8.89111C13.7454 8.89111 15.1614 10.3061 15.1614 12.0531Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M11.998 19.3549C15.806 19.3549 19.289 16.6169 21.25 12.0529C19.289 7.48892 15.806 4.75092 11.998 4.75092H12.002C8.194 4.75092 4.711 7.48892 2.75 12.0529C4.711 16.6169 8.194 19.3549 12.002 19.3549H11.998Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetReasonsByRequestId(' + "'" + item.RefNo + "'" + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                                + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetImagesRequestId(' + "'" + item.PaymentApprovalId + "'" + ')" data_toggle="modal" data_target="#AttachementModel"  > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M21.21 7.89918V16.0502C21.21 19.0702 19.32 21.2002 16.3 21.2002H7.65C4.63 21.2002 2.75 19.0702 2.75 16.0502V7.89918C2.75 4.87918 4.64 2.75018 7.65 2.75018H16.3C19.32 2.75018 21.21 4.87918 21.21 7.89918Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path d="M5.28125 16.4309L6.80925 14.8179C7.34025 14.2549 8.22525 14.2279 8.78925 14.7579C8.80625 14.7749 9.72625 15.7099 9.72625 15.7099C10.2813 16.2749 11.1883 16.2839 11.7533 15.7299C11.7903 15.6939 14.0872 12.9079 14.0872 12.9079C14.6792 12.1889 15.7422 12.0859 16.4622 12.6789C16.5102 12.7189 18.6803 14.9459 18.6803 14.9459" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/><path fill-rule="evenodd" clip-rule="evenodd" d="M10.3127 9.13309C10.3127 10.1021 9.52769 10.8871 8.55869 10.8871C7.58969 10.8871 6.80469 10.1021 6.80469 9.13309C6.80469 8.16409 7.58969 7.37909 8.55869 7.37909C9.52769 7.38009 10.3127 8.16409 10.3127 9.13309Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/></svg> </button>';
                                            lst = lst + '<tr><td>' + cbList + '</td><td style=' + rowStyle + '>' + item.RefNo + '</td><td style=' + rowStyle + '>' + item.GLCode + '</td><td style=' + rowStyle + '>' + item.CompanyName + '</td><td style=' + rowStyle + '>' + item.Department + '</td><td style=' + rowStyle + '>' + item.TypeName + '</td><td style=' + rowStyle + '>' + item.Amount + '</td><td style=' + rowStyle + '>' + item.Description + '</td><td style=' + rowStyle + '><span id=' + item.StatusId + ' class="status">' + item.ApprovalStatus + '</span></td><td style=' + rowStyle + '>' + actionLink + '</td></tr>'
                                        });
                                        $("#tblListPAF tbody").append(lst);
                                        $("#tblListPAF tbody tr").each(function () {
                                            var $span = $(this).find('span.status');
                                            var $value = $(this).find('span').attr("id");
                                            var $check = $(this).find('div.form-check');
                                            if ($value === "0") { //Pending
                                                $span.addClass('badge badge-warning');
                                                $check.addClass('checkbox-warning');
                                            }
                                            else if ($value === "4" || $value === "7") { //Approver-1,2 Approval
                                                $span.addClass('badge badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "5" || $value === "8") { //Approver-1,2 Rejection
                                                $span.addClass('badge badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "2") { //Authorizer Approval
                                                $span.addClass('badge light badge-success');
                                                $check.addClass('checkbox-success');
                                            }
                                            else if ($value === "3" || $value === "6") { //Authorizer Rejection
                                                $span.addClass('badge light badge-danger');
                                                $check.addClass('checkbox-danger');
                                            }
                                            else if ($value === "1") { //Initiator Approval
                                                $span.addClass('badge light badge-info');
                                                $check.addClass('checkbox-info');
                                            }
                                        });
                                        $("#tblListPAF").DataTable({
                                            dom: 'ZBfrltip',
                                            pageLength: 10,
                                            select: true,
                                            lengthChange: true,
                                            language: {
                                                paginate: {
                                                    next: '<i class="fa-solid fa-angle-right"></i>',
                                                    previous: '<i class="fa-solid fa-angle-left"></i>'
                                                }
                                            },
                                        });
                                    }
                                    //else {
                                    //    $('#PAF').hide();
                                    //    sweetAlert("Oops...", "No Record Found", "info");
                                    //}
                                }
                                else {
                                    $('#PAF').hide();
                                    sweetAlert("Oops...", "No Record Found", "info");
                                }
                            }
                        });
                    }
                }
               
            }
        }
        function ClearContent() {
            var EndDate = '<%= DateTime.Today.ToString("yyyy-MM-dd") %>';
            var StartDate = '<%= DateTime.Today.AddDays(-30).ToString("yyyy-MM-dd") %>';
            $('#StartDate').val(StartDate);
            $('#EndDate').val(EndDate);
            $('#ddlProjects').val(1000);
            $('#ddlStatus').val(-1);
            $('#WIMSAdmin_Request').hide();
            $('#WIMSAdmin_PO').hide();
            $('#WIMSAdmin_GRN').hide();
            $('#WIMSAdmin_TakeIn').hide();
            $('#WIMSAdmin_PV').hide();
            $('#PAF').hide();
            $('#btnStatus').hide();
            $("input[name='rbReasons']:checked").val(0);
            GetContentList(-1);
            SelectedList = [];
        }
        function GetDetailsByRequestId(Req_No) {
            window.open("Details.aspx?Req_No=" + Req_No + "&SecreenId=" + QueryString_Mode, '_blank');
        }
        function GetTakeInByPO(Req_No) {
            window.open("Details.aspx?Req_No=" + Req_No + "&SecreenId=" + 0, '_blank');
        }

        function GetSelectedValues(Req_No, RowNo) {
            if ($("#" + RowNo).is(":checked")) {
                SelectedList += "," + Req_No;
            }
            else {
                var separator = separator || ",";
                var values = SelectedList.split(separator);
                for (var i = 0; i < values.length; i++) {
                    if (values[i] == Req_No) {
                        values.splice(i, 1);
                        SelectedList = values.join(separator);
                    }
                }
            }
            if (SelectedList.length > 0) {
                $('#btnStatus').show();
            }
            else {
                $('#btnStatus').hide();
            } 
        }
        function UpdateStatus(status) {
            if (status == "Approve") {
                $.ajax({
                    type: "POST",
                    contentType: 'application/json; charset=utf-8',
                    url: "api/approval/UpdateStatus?Status=" + status,
                    data: PostDataJson(status),
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            if (status == 'Approve') {
                                sweetAlert(" ", "Status approved", "success");
                            }
                            else {
                                sweetAlert(" ", "Status rejected", "success");
                            }
                            ClearContent();
                        }
                        else {
                            sweetAlert(" ", "Failed to access database", "error");
                        }
                        SelectedList = [];
                        GetContentList(-1);
                    }
                });
            }
            else if (status == "Reject") {
                $("#RejectedReasonModel").modal('show');
            }
            else {
                status = "Reject";
                if ($('#txtReason').val() == '') {
                    sweetAlert(" ", "Please enter remarks", "error");
                }
                else {
                    $.ajax({
                        type: "POST",
                        contentType: 'application/json; charset=utf-8',
                        url: "api/approval/UpdateStatus?Status=" + status,
                        data: PostDataJson(status),
                        dataType: 'json',
                        success: function (data) {
                            if (data.Success) {
                                if (status == 'Approve') {
                                    sweetAlert(" ", "Status approved", "success");
                                }
                                else {
                                    sweetAlert(" ", "Status rejected", "success");
                                }
                                $('#txtReason').val('');
                                $("#RejectedReasonModel").modal('hide');
                            }
                            else {
                                sweetAlert(" ", "Failed to access database", "error");
                            }
                            SelectedList = [];
                            GetContentList(-1);
                        }
                    });
                }
            } 
        }
        function PostDataJson(status) {
            if (status == "Approve") {
                return JSON.stringify({
                    "WIMS_PROJECT_ID": $('#ddlProjects').val(),
                    "FLOWDETAILID": QueryString_Mode,
                    "STATUS": status,
                    "REQNO": SelectedList
                });
            }
            else {
                var UserType = '<%= Convert.ToInt32(Session["USERTYPEID"]) %>';
                var PROJECTID = '<%= Convert.ToInt32(Session["PROJECTID"]) %>';
                var radioValue = $("input[name='rbReasons']:checked").val();
                if (PROJECTID == 81 && UserType == 22) {
                    return JSON.stringify({
                        "WIMS_PROJECT_ID": 0,
                        "FLOWDETAILID": QueryString_Mode,
                        "STATUS": status,
                        "REQNO": SelectedList,
                        "REASON": radioValue + ': ' + $('#txtReason').val(),
                        "RBREASON": radioValue
                    });
                }
                else {
                    return JSON.stringify({
                        "WIMS_PROJECT_ID": $('#ddlProjects').val(),
                        "FLOWDETAILID": QueryString_Mode,
                        "STATUS": status,
                        "REQNO": SelectedList,
                        "REASON": $('#txtReason').val()
                    });
                }
            }
        }
        function GetReasonsByRequestId(ReqNo) {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/GetReasonByRequestId?ReqNo=" + ReqNo,
                dataType: 'json',
                success: function (data) {
                    let Success = data.Success;
                    let Response = data.Response;
                    let DataList = data.Data;
                    if (Success) {
                        let lst = '';
                        let rowStyle = '';
                        let actionLink = '';
                        let iRowNum = 0;
                        var data = [];
                        $("#tblReasons tbody").html('');
                        if (DataList != null) {
                            $(DataList).each(function (i, item) {
                                iRowNum += 1;
                                rowStyle = "'text-align:center;'";
                                lst = lst + '<tr><td style=' + rowStyle + '>' + item.USERTYPE + '</td><td style=' + rowStyle + '>' + item.STATUS + '</td><td style=' + rowStyle + '>' + item.REMARKS + '</td></tr>';
                            });
                        }
                        else {
                            lst += '<tr><td colspan="10" style="color:red;text-align:center;">No Record Found</td></tr>'
                        }
                        $("#tblReasons tbody").html(lst);
                    }
                }
            });
        }
        function GetImagesRequestId(PaymentApprovalId) {
 
            $.ajax({
                type: "GET",
                contentType: false,
                url: "api/projects/GetImagesByRequestId?PaymentApprovalId=" + PaymentApprovalId,
                dataType: 'json',
                success: function (data) {
                    debugger;
                    let Success = data.Success;
                    let Response = data.Response;
                    let DataList = data.Data;
                    if (Success) {
                        if (DataList != null) {
                            $(DataList).each(function (i, item) {
                                $("#img1").attr("src", "https://ecs.daewoo.net.pk/uploads/" + item.Image1);
                                $("#img2").attr("src", "https://ecs.daewoo.net.pk/uploads/" + item.Image2);
                                $("#img3").attr("src", "https://ecs.daewoo.net.pk/uploads/" + item.Image3);
                            });
                            $('#AttachementModel').modal('show');
                        }
                    }
                }
            });
        }
        window.onload = GetProjectType;
    </script>
    
</asp:Content>
