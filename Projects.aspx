<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="EApproval.Projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <div class="page-titles">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M3 6.5C3 3.87479 3.02811 3 6.5 3C9.97189 3 10 3.87479 10 6.5C10 9.12521 10.0111 10 6.5 10C2.98893 10 3 9.12521 3 6.5Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M14 6.5C14 3.87479 14.0281 3 17.5 3C20.9719 3 21 3.87479 21 6.5C21 9.12521 21.0111 10 17.5 10C13.9889 10 14 9.12521 14 6.5Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M3 17.5C3 14.8748 3.02811 14 6.5 14C9.97189 14 10 14.8748 10 17.5C10 20.1252 10.0111 21 6.5 21C2.98893 21 3 20.1252 3 17.5Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M14 17.5C14 14.8748 14.0281 14 17.5 14C20.9719 14 21 14.8748 21 17.5C21 20.1252 21.0111 21 17.5 21C13.9889 21 14 20.1252 14 17.5Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                    Setup Pages </a>
                </li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Projects</a></li>
            </ol>
            <a class="text-primary fs-13" data-bs-toggle="offcanvas" href="#offcanvasExample1" role="button" aria-controls="offcanvasExample1">+ Define a New Project </a>
        </div>
        <div class="container-fluid">
            <div class="row">
                <%--<div class="col-xl-3 col-sm-6">
                    <div class="card box-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="icon-box icon-box-lg bg-success-light rounded-circle">
                                    <svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M22.9715 29.3168C15.7197 29.3168 9.52686 30.4132 9.52686 34.8043C9.52686 39.1953 15.6804 40.331 22.9715 40.331C30.2233 40.331 36.4144 39.2328 36.4144 34.8435C36.4144 30.4543 30.2626 29.3168 22.9715 29.3168Z" stroke="#3AC977" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M22.9714 23.0537C27.7304 23.0537 31.5875 19.1948 31.5875 14.4359C31.5875 9.67694 27.7304 5.81979 22.9714 5.81979C18.2125 5.81979 14.3536 9.67694 14.3536 14.4359C14.3375 19.1787 18.1696 23.0377 22.9107 23.0537H22.9714Z" stroke="#3AC977" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    </svg>
                                </div>
                                <div class="total-projects ms-3">
                                    <h3 class="text-success count">24</h3>
                                    <span>Total Completed</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <%--<div class="col-xl-3 col-sm-6">
                    <div class="card box-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="icon-box icon-box-lg bg-primary-light rounded-circle">
                                    <svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M32.8961 26.5849C34.1612 26.5849 35.223 27.629 35.0296 28.8783C33.8947 36.2283 27.6026 41.6855 20.0138 41.6855C11.6178 41.6855 4.8125 34.8803 4.8125 26.4862C4.8125 19.5704 10.0664 13.1283 15.9816 11.6717C17.2526 11.3579 18.5553 12.252 18.5553 13.5605C18.5553 22.4263 18.8533 24.7197 20.5368 25.9671C22.2204 27.2145 24.2 26.5849 32.8961 26.5849Z" stroke="var(--primary)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M41.1733 19.2019C41.2739 13.5059 34.2772 4.32428 25.7509 4.48217C25.0877 4.49402 24.5568 5.04665 24.5272 5.70783C24.3121 10.3914 24.6022 16.4605 24.764 19.2118C24.8134 20.0684 25.4864 20.7414 26.341 20.7907C29.1693 20.9526 35.4594 21.1736 40.0759 20.4749C40.7035 20.3802 41.1634 19.8355 41.1733 19.2019Z" stroke="var(--primary)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    </svg>

                                </div>
                                <div class="total-projects ms-3">
                                    <h3 class="text-primary count">12</h3>
                                    <span>Total In Progress</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <%--<div class="col-xl-3 col-sm-6">
                    <div class="card box-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="icon-box icon-box-lg bg-purple-light rounded-circle">
                                    <svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M22.9717 41.0539C22.9717 41.0539 37.3567 36.6983 37.3567 24.6908C37.3567 12.6814 37.878 11.7439 36.723 10.5889C35.5699 9.43391 24.858 5.69891 22.9717 5.69891C21.0855 5.69891 10.3736 9.43391 9.21863 10.5889C8.0655 11.7439 8.58675 12.6814 8.58675 24.6908C8.58675 36.6983 22.9717 41.0539 22.9717 41.0539Z" stroke="#BB6BD9" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path d="M26.4945 26.4642L19.4482 19.4179" stroke="#BB6BD9" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path d="M19.4487 26.4642L26.495 19.4179" stroke="#BB6BD9" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    </svg>
                                </div>
                                <div class="total-projects ms-3">
                                    <h3 class="text-purple count">07</h3>
                                    <span>Total Not Started</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <%--<div class="col-xl-3 col-sm-6">
                    <div class="card box-hover">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <div class="icon-box icon-box-lg bg-danger-light rounded-circle">
                                    <svg width="46" height="46" viewBox="0 0 46 46" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M34.0396 20.974C36.6552 20.6065 38.6689 18.364 38.6746 15.6471C38.6746 12.9696 36.7227 10.7496 34.1633 10.3296" stroke="#FF5E5E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path d="M37.4912 27.262C40.0243 27.6407 41.7925 28.5276 41.7925 30.3557C41.7925 31.6139 40.96 32.4314 39.6137 32.9451" stroke="#FF5E5E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M22.7879 28.0373C16.7616 28.0373 11.6147 28.9504 11.6147 32.5973C11.6147 36.2423 16.7297 37.1817 22.7879 37.1817C28.8141 37.1817 33.9591 36.2779 33.9591 32.6292C33.9591 28.9804 28.846 28.0373 22.7879 28.0373Z" stroke="#FF5E5E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M22.7876 22.8325C26.742 22.8325 29.9483 19.6281 29.9483 15.6719C29.9483 11.7175 26.742 8.51123 22.7876 8.51123C18.8333 8.51123 15.627 11.7175 15.627 15.6719C15.612 19.6131 18.7939 22.8194 22.7351 22.8325H22.7876Z" stroke="#FF5E5E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path d="M11.5344 20.974C8.91691 20.6065 6.90504 18.364 6.89941 15.6471C6.89941 12.9696 8.85129 10.7496 11.4107 10.3296" stroke="#FF5E5E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                        <path d="M8.0825 27.262C5.54937 27.6407 3.78125 28.5276 3.78125 30.3557C3.78125 31.6139 4.61375 32.4314 5.96 32.9451" stroke="#FF5E5E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                    </svg>
                                </div>
                                <div class="total-projects ms-3">
                                    <table class="table-responsive table">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Name</th>
                                                <th style="text-align: center">Approving Authorities</th>
                                            </tr>
                                        </thead>
                                        <tbody style="text-align: center;">
                                            <tr>
                                                <td>1</td>
                                                <td>Request</td>
                                                <td>
                                                    <input type="checkbox" class="checkbox-inline" id="role1" value="1" /> <label for="role1" class="form-check-inline form-check-label"> CEO </label>
                                                    <input type="checkbox" class="checkbox-inline" id="role2" value="2" /> <label for="role2" class="form-check-inline form-check-label"> HOD </label>
                                                    <input type="checkbox" class="checkbox-inline" id="role3" value="3" /> <label for="role3" class="form-check-inline form-check-label"> DM </label>
                                                    <input type="checkbox" class="checkbox-inline" id="role4" value="4" /> <label for="role4" class="form-check-inline form-check-label"> STAFF </label>
                                                    <input type="checkbox" class="checkbox-inline" id="role5" value="5" /> <label for="role5" class="form-check-inline form-check-label"> VP </label>
                                                </td>
                                            </tr>
                                        </tbody>
                                        
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
                
                <div id="projectList" class="row">

                </div>

            </div>
        </div>
    </div>

    <div class="offcanvas offcanvas-end customeoff" tabindex="-1" id="offcanvasExample1">
        <div class="offcanvas-header">
            <h5 class="modal-title" id="#gridSystemModal1">Project & Flow Definations</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>
        <div class="offcanvas-body">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-xl-6 mb-3">
                        <label for="txtProjectName" class="form-label">Project Name<span class="text-danger"> *</span></label>
                        <input type="text" class="form-control" onkeyup="AutoFlowName();" id="txtProjectName" placeholder="Project Name e.g WIMS, FMS etc..." />
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="txtFlowName" class="form-label">Flow Name<span class="text-danger"> *</span></label>
                        <input type="text" class="form-control" disabled="disabled" readonly="readonly" id="txtFlowName" placeholder="Project Name e.g WIMS Flow etc..." />
                    </div>
                </div>
                <div>
                    <input type="button" class="btn btn-primary me-1" value="Add New Project"- onclick="AddNewProject();" />
                    <input type="button" class="btn btn-danger light ms-1" value="Cancel" onclick="clearFields();" />
                </div>

            </div>
        </div>
    </div>

    <%--MODAL FOR PROJECT FLOW--%>
    <div class="modal fade" id="FlowDetailModal" tabindex="-1" aria-labelledby="FlowDetailModal" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-center">
			<div class="modal-content">
			  <div class="modal-header">
				<h1 class="modal-title fs-5" id="FlowDetailModals">Add Flow Details</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			  </div>
			  <div class="modal-body">
					<div class="row">
						<div class="col-xl-12">
							<label class="form-label">Project<span class="text-danger"> *</span></label>
							<input type="text" class="form-control" id="tb_ProjectName" readonly="readonly" disabled="disabled" />
							<label class="form-label mt-3">Flow Name<span class="text-danger"> *</span></label>
							<input class="form-control" type="text" id="tb_FlowName" disabled="disabled" readonly="readonly" />
                            <input type="hidden" id="hdProjectFlowId" />
							<div class="mt-3 invite">
								<label class="form-label">Flow Detail<span class="text-danger"> *</span></label>
								<input type ="text" class="form-control" id="txtFlowDetail" placeholder="Request, PO, GRN etc...">
                                <label class="form-label mt-3">Approving Persons<span class="text-danger"> *</span></label>
                                <div class="checkbox-inline" id="cbRoleList" contenteditable="true">
                                    
                                </div>
                                <label class="form-label mt-3">Apply Limitation<span class="text-danger"> </span></label>
                                <input type ="text" class="form-control" id="txtLimitation" placeholder="Payment Voucher >= 10M etc...">
							</div>
						</div>
					</div>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-danger light" onclick="clearFields();" data-bs-dismiss="modal">Close</button>
				<button type="button" onclick="SaveFlowDetail();" class="btn btn-primary">Save Detail</button>
			  </div>
			</div>
		  </div>
		</div>

    <div class="modal fade" id="FlowDetailModalForEdit" tabindex="-1" aria-labelledby="FlowDetailModalForEdit" aria-hidden="true">
    	  <div class="modal-dialog modal-dialog-center">
    		<div class="modal-content">
    		  <div class="modal-header">
    			<h1 class="modal-title fs-5" id="FlowDetailModalsForEdit">Edit Flow Details</h1>
    			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
    		  </div>
    		  <div class="modal-body">
    				<div class="row">
    					<div class="col-xl-12">
                            <div class="table-responsive active-projects style-1">
                                <input type="hidden" id="hfFlowDetailId" />
                                <table id="tblList-tblwrapper" class="table">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center">Sr #</th>
                                            <th style="text-align: center">Name</th>
                                            <th style="text-align: center">Approving Authorities</th>
                                            <th style="text-align: center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody style="text-align: center;">

                                    </tbody>
                                </table>
                            </div>
    				</div>
    		  </div>
    		  <div class="modal-footer">
    			<%--<button type="button" class="btn btn-danger light" onclick="clearFields();" data-bs-dismiss="modal">Close</button>--%>
    			<%--<button type="button" onclick="SaveFlowDetailChanges();" class="btn btn-primary">Save changes</button>--%>
    		  </div>
    		</div>
    	  </div>
    	</div>
        </div>


    <script type="text/javascript">
        let ApprovingAuthorities = [];
        function clearFields() {
            $("#txtProjectName").val('');
            $("#txtFlowName").val('');
            $("#tb_ProjectName").val('');
            $("#tb_FlowName").val('');
            $("#txtFlowDetail").val('');
            $("#hdProjectFlowId").val('');
            GetProjectList();
        }

        function AutoFlowName() {
            $("#txtProjectName").val().toUpperCase();
            var flowName = $("#txtProjectName").val() + '-F';
            $("#txtFlowName").val(flowName)
        }

        function AddNewProject() {
            if ($("#txtProjectName").val() == '') {
                sweetAlert("Oops...", "Please enter project name", "error");
            }
            else if ($("#txtFlowName").val() == '') {
                sweetAlert("Oops...", "Please enter flow name", "error");
            }
            else {
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    url: "api/projects/AddNewProject",
                    data: PostDataJson(),
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            sweetAlert("", "Project added successfully", "success");
                            clearFields();
                            GetProjectList();
                        } else {
                            sweetAlert("", "Failed to add project as project already exists", "error");
                            GetProjectList();
                        }
                    }
                });
            }
        }

        function GetApprovingAuthorities() {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/users/GetApprovingAuthorities",
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
                        $("#cbRoleList").html('');
                        if (DataList != null) {
                            $(DataList).each(function (i, item) {
                                iRowNum += 1;
                                rowStyle = "'text-align:center;'"; 
                                lst = lst + '<input type="checkbox" class="checkbox-inline" id="cbRole' + item.AUTHORITYID + '" value=' + item.AUTHORITYID + ' onchange="GetSelectedValues(' + item.AUTHORITYID + ');" /> <label for="cbRole' + item.AUTHORITYID + '" class="form-check-inline form-check-label"> ' + item.AUTHORITYNAME + ' </label>';
                            });
                        }
                        $("#cbRoleList").html(lst);
                    }
                }
            });
        }

        function GetSelectedValues(CheckedValues) {
            if ($("#cbRole" + CheckedValues).is(":checked")) {
                ApprovingAuthorities += "," + $("#cbRole" + CheckedValues).val();
            }
            //else {
            //    ApprovingAuthorities = values.indexOf($("#cbRole" + CheckedValues).val());
            //    values.splice(ApprovingAuthorities, 1);
            //}
        }

        function SaveFlowDetail() {
            //alert("You Selected : " + ApprovingAuthorities);
            if (ApprovingAuthorities.length <= 0) {
                sweetAlert("Oops...", "Please select atleast one approving authority", "error");
            } 
            else if ($("#tb_ProjectName").val() == '') {
                sweetAlert("Oops...", "Please enter project name", "error");
            }
            else if ($("#tb_FlowName").val() == '') {
                sweetAlert("Oops...", "Please enter flow name", "error");
            }
            else if ($("#txtFlowDetail").val() == '') {
                sweetAlert("Oops...", "Please enter flow detail name", "error");
            }
            else {
                $.ajax({
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    url: "api/projects/AddProjectFlowDetail",
                    data: PostDetailDataJson(),
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            sweetAlert("", "Detail added successfully", "success");
                            $("#txtFlowDetail").val('');
                            $("#txtLimitation").val('');
                            ApprovingAuthorities = [];
                            GetProjectList();
                        } else {
                            sweetAlert("", "Failed to add details as it already exists", "error");
                            GetProjectList();
                        }
                    }
                });
                
            }
        }

        function PostDataJson() {
            return JSON.stringify({
                "NAME": $("#txtProjectName").val(),
                "FLOWNAME": $("#txtFlowName").val(),
            });
        }

        function PostDetailDataJson() {
            return JSON.stringify({
                "P_FLOWID": $("#hdProjectFlowId").val(),
                "NAME": $("#txtFlowDetail").val(),
                "APPROVALID": ApprovingAuthorities,
                "PROJECTLIMIT": $("#txtLimitation").val(),
            });
        }
        
        function GetProjectList() {
            $.ajax({
                type: 'GET',
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/GetProjectList",
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
                        $("#projectList").html('');
                        if (DataList != null) {
                            GetApprovingAuthorities();
                            $(DataList).each(function (i, item) {
                                iRowNum += 1;
                                rowStyle = "'text-align:center;'";
                                if (item.FLOWDETAIL != null) {
                                    actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByProjectId(' + item.PROJECTID + ',' + item.PROJECTFLOWID + ')" data-bs-toggle="modal" data-bs-target="#FlowDetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12.0001 8.32733V15.6537" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.6668 11.9905H8.3335" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M16.6857 2H7.31429C4.04762 2 2 4.31208 2 7.58516V16.4148C2 19.6879 4.0381 22 7.31429 22H16.6857C19.9619 22 22 19.6879 22 16.4148V7.58516C22 4.31208 19.9619 2 16.6857 2Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>'
                                        + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByProjectId(' + item.PROJECTID + ',' + item.PROJECTFLOWID + ')" data-bs-toggle="modal" data-bs-target="#FlowDetailModalForEdit" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg></button>';
                                        //+ '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByProjectId(' + item.PROJECTID + ',' + item.PROJECTFLOWID + ')" data-bs-toggle="modal" data-bs-target="#FlowDetailModalForEdit" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.3345 2.75018H7.66549C4.64449 2.75018 2.75049 4.88918 2.75049 7.91618V16.0842C2.75049 19.1112 4.63549 21.2502 7.66549 21.2502H16.3335C19.3645 21.2502 21.2505 19.1112 21.2505 16.0842V7.91618C21.2505 4.88918 19.3645 2.75018 16.3345 2.75018Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M8.43994 12.0002L10.8139 14.3732L15.5599 9.6272" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg></button>';
                                    lst = lst + '<div class="col-xl-3 col-sm-6"><div class="card box-hover"><div class="card-header"><h5 class="mb-0">' + iRowNum + ' . ' + item.NAME + '</h5></div><div class="card-body"><div class="products style-1"><div><h6>' + item.FLOWNAME + '</h6><span>' + item.PROJECTSTATUS + '</span></div></div><p class=""my-3> ' + item.FLOWDETAIL + ' </p></div><div class="card-footer d-flex justify-content-between flex-wrap"><div class="due-progress"><p class="mb-0 text-secondary"><span class="text-purple">  </span></p></div><p class="mb-0 text-secondary"><span class="text-success">' + actionLink + '</span></p></div></div></div>';
                                }
                                else {
                                    actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByProjectId(' + item.PROJECTID + ',' + item.PROJECTFLOWID + ')" data-bs-toggle="modal" data-bs-target="#FlowDetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12.0001 8.32733V15.6537" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.6668 11.9905H8.3335" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path fill-rule="evenodd" clip-rule="evenodd" d="M16.6857 2H7.31429C4.04762 2 2 4.31208 2 7.58516V16.4148C2 19.6879 4.0381 22 7.31429 22H16.6857C19.9619 22 22 19.6879 22 16.4148V7.58516C22 4.31208 19.9619 2 16.6857 2Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                       /* + '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetDetailsByProjectId(' + item.PROJECTID + ',' + item.PROJECTFLOWID + ')" data-bs-toggle="modal" data-bs-target="#FlowDetailModalForEdit" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg></button>';*/
                                    lst = lst + '<div class="col-xl-3 col-sm-6"><div class="card box-hover"><div class="card-header"><h5 class="mb-0">' + iRowNum + ' . ' + item.NAME + '</h5></div><div class="card-body"><div class="products style-1"><div><h6>' + item.FLOWNAME + '</h6><span>' + item.PROJECTSTATUS + '</span></div></div><p class=""my-3> ' + item.FLOWDETAIL + ' </p></div><div class="card-footer d-flex justify-content-between flex-wrap"><div class="due-progress"><p class="mb-0 text-secondary"><span class="text-purple">  </span></p></div><p class="mb-0 text-secondary"><span class="text-success">' + actionLink + '</span></p></div></div></div>';
                                }
                            });
                        }
                        $("#projectList").html(lst);
                    }
                }
            });
        }
       // getRolesForApprovalRegistration
        function GetDetailsByProjectId(ProjectId, ProjectFlowId) {
            let cbList = '';
            /*let iRowNum = 0;*/
            $.ajax({
                type: 'GET',
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                url: "api/projects/GetProjectDetailById?ProjectId=" + ProjectId + "&ProjectFlowId=" + ProjectFlowId,
                context: document.body,
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
                        if (DataList != null) {
                            $(DataList).each(function (i, item) {
                                $("#tb_ProjectName").val(item.NAME);
                                $("#tb_FlowName").val(item.FLOWNAME);
                                $("#hdProjectFlowId").val(ProjectFlowId);
                                $("#hfFlowDetailId").val(item.FLOWDETAILID);
                                //$("#ddlProjectStatus").append('<option value="' + item.STATUS + '">' + item.PROJECTSTATUS + '</option>');

                                if (item.FLOWDETAILID != 0 || item.FLOWDETAILID != null || item.FLOWDETAILID != '') {
                                    $("#tblList-tblwrapper tbody").html('');
                                    iRowNum += 1;
                                    cbList = cbList;//'<input type="checkbox" class="checkbox-inline" id="cbRole' + item.FLOWDETAILID + '" value=' + item.FLOWDETAILID + ' /> <label for="cbRole' + item.FLOWDETAILID + '" class="form-check-inline form-check-label"> ' + item.FLOWDETAIL + ' </label>';
                                    rowStyle = "'text-align:center;'";
                                    actionLink = '<a href="javascript:void(0);" onclick="SaveFlowDetailChanges(\'' + item.FLOWDETAILID + '\')" class="btn btn-warning btn-sm content-icon" ><i class="fa fa-edit"></i></a>';
                                    lst = lst + '<tr><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '><textbox id="txtFlowDetailName' + item.FLOWDETAILID + '" contenteditable class="form-control">' + item.FLOWDETAIL + '</textbox></td><td style=' + rowStyle + '> ' + cbList + ' </td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                                    $("#tblList-tblwrapper tbody").html(lst);
                                }
                                else {
                                    sweetAlert("", "No Record Found", "error");
                                }
                            });
                        }
                        else {
                            alert("No Record Found");
                        }
                    }
                    else {
                        alert(Response);
                    }
                }
            });
            
            //$.ajax({
            //    type: "GET",
            //    contentType: 'application/json; charset=utf-8',
            //    url: "api/projects/getRolesForProjectApprovalRegistration",
            //    dataType: 'json',
            //    success: function (res) {
            //        let Success = res.Success;
            //        let Response = res.Response;
            //        let RoleList = res.Data;
            //        if (Success) {
            //            let iRowNumA = 0;
            //            var res = [];
            //            if (RoleList != null) {
            //                $(RoleList).each(function (j, roleList) {
            //                    iRowNumA += 1;
            //                    cbList += '<input type="checkbox" class="checkbox-inline" id="cbRole' + iRowNumA + '" value=' + roleList.USERROLEID + ' /> <label for="cbRole' + iRowNumA + '" class="form-check-inline form-check-label"> ' + roleList.ROLENAME + ' </label>';
            //                });
            //            }
            //            else {

            //            }

            //        }
            //    }
            //});
        }

        function SaveFlowDetailChanges(FlowDetailId) {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/UpdateProjectFlowDetail",
                data: PostDetailDataForUpdateJson(FlowDetailId),
                dataType: 'json',
                success: function (data) {
                    if (data.Success) {
                        sweetAlert("", "Record updated successfully", "success");
                        GetProjectList();
                    } else {
                        sweetAlert("", "Failed to add details as it already exists", "error");
                        GetProjectList();
                    }
                }
            });
        }
        function PostDetailDataForUpdateJson(FlowDetailId) {
            return JSON.stringify({
                "NAME": $("#txtFlowDetailName" + FlowDetailId).text(),
                "FLOWDETAILID": FlowDetailId
            });
        }

        window.onload = GetProjectList;
    </script>
</asp:Content>
