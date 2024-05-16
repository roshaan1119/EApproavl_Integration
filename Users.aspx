<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="EApproval.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content-body">
        <div class="page-titles">
            <ol class="breadcrumb">
                <li>
                    <%--<h5 class="bc-title">Task</h5>--%>
                </li>
                <li class="breadcrumb-item"><a href="javascript:void(0)">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M3 6.5C3 3.87479 3.02811 3 6.5 3C9.97189 3 10 3.87479 10 6.5C10 9.12521 10.0111 10 6.5 10C2.98893 10 3 9.12521 3 6.5Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M14 6.5C14 3.87479 14.0281 3 17.5 3C20.9719 3 21 3.87479 21 6.5C21 9.12521 21.0111 10 17.5 10C13.9889 10 14 9.12521 14 6.5Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M3 17.5C3 14.8748 3.02811 14 6.5 14C9.97189 14 10 14.8748 10 17.5C10 20.1252 10.0111 21 6.5 21C2.98893 21 3 20.1252 3 17.5Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M14 17.5C14 14.8748 14.0281 14 17.5 14C20.9719 14 21 14.8748 21 17.5C21 20.1252 21.0111 21 17.5 21C13.9889 21 14 20.1252 14 17.5Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
     Setup Pages </a>
                </li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Users</a></li>
            </ol>
            <a class="btn btn-primary btn-sm" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" onclick="BindUserRoles();" aria-controls="offcanvasExample">+ Add New User </a>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive active-projects manage-client">
                                <div class="tbl-caption">
                                    <h4 class="heading mb-0"></h4>
                                    <div>
                                        <%--<a class="btn btn-primary btn-sm" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" onclick="BindUserRoles();" aria-controls="offcanvasExample">+ Add New User</a>--%>
                                    </div>
                                </div>
                               <div class="dataTables_wrapper no-footer" id="reports-tbl_wrapper">
                                   <table id="reports-tbl" class="table dataTable no-footer" role="grid" aria-describedby="reports-tbl_info">
                                       <thead>
                                           <tr>
                                               <th style="text-align: center">Sr #</th>
                                               <th style="text-align: center">Name</th>
                                               <th style="text-align: center">Login Name</th>
                                               <th style="text-align: center">Email</th>
                                               <th style="text-align: center">Role</th>
                                               <th style="text-align: center">Status</th>
                                               <th style="text-align: center">Screen Allowed</th>
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
        </div>
    </div>

    <div class="offcanvas offcanvas-end customeoff" tabindex="-1" id="offcanvasExample">
        <div class="offcanvas-header">
            <h5 class="modal-title" id="#gridSystemModal">Add New User</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>
        <div class="offcanvas-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 mb-3">
                        <label for="txtUserName" class="form-label">User Name<span class="text-danger"> *</span></label>
                        <input type="text" class="form-control" name="txtUserName" id="txtUserName" placeholder="Employee Name..." />
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="txtEmail" class="form-label">Email<span class="text-danger"> *</span></label>
                        <input type="email" class="form-control" name="txtEmail" id="txtEmail" placeholder="abc@gmail.com..." />
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="txtLoginName" class="form-label">Login Name<span class="text-danger"> *</span></label>
                        <input type="text" class="form-control" name="txtLoginName" id="txtLoginName" placeholder="login name" />
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="txtPassword" class="form-label">Password<span class="text-danger"> *</span></label>
                        <input type="password" class="form-control" name="txtPassword" id="txtPassword" placeholder="password" />
                    </div>
                    <div class="col-xl-4 mb-3">
                        <label class="form-label">User Role<span class="text-danger"> *</span></label>
                        <select class="form-control" id="ddlUserRole">
                        </select>
                    </div>
                    <div class="col-xl-4 mb-3">
                        <label class="form-label">User Type<span class="text-danger"> *</span></label>
                        <select class="form-control" id="ddlUserType">
                        </select>
                    </div>
                    <div class="col-xl-4 mb-3">
                        <label class="form-label">Project<span class="text-danger"> *</span></label>
                        <select class="form-control" id="ddlProjects" onchange="GetFlowSecreenByProjectId();">
                        </select>
                    </div>
                    <div class="col-xl-12 mb-12">
                         <label class="form-label" id="screenAccess" style="display:none;">Screen Access<span class="text-danger"> *</span></label>
                        <div class="checkbox-inline" id="cbSecreenList" contenteditable="true">
                            
                        </div>
                    </div>
                </div>
                <div>
                    <input type="button" id="btnAssignNewProject" style="display:none;" class="btn btn-info me-1" value="Assign New Project" onclick="AssignNewProject();" />
                    <input type="button" class="btn btn-primary me-1" value="Save Record" onclick="saveUserRecord();" />
                    <input type="button" class="btn btn-success me-1" style="display:none;" value="Save Changes" onclick="saveChanges();" />
                    <input type="button" class="btn btn-danger light ms-1" value="Cancel" onclick="clearFields();" />
                </div>

            </div>
        </div>
    </div>
    <%--MODAL POP UP FOR ASSIGNED PROJECTS--%>
    <div class="modal fade bd-example-modal-lg" id="DetailModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fs-5" id="title"> Assigned Projects and Secreens </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal">
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <div class="dataTables" id="AssignedProject-tbl_wrapper">
                            <table id="tblAssignedProjects" class="display table table-hover" role="gridcell" aria-describedby="reports-tbl_info">
                                <thead>
                                    <tr>
                                        <th style="text-align: center">Sr #</th>
                                        <th style="text-align: center">Project Name</th>
                                        <th style="text-align: center">Secreen Allowed</th>
                                        <th style="text-align: center">User Type</th>
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
    <script type="text/javascript">
        let FlowSecreenId = [];
        function saveChanges() {
            sweetAlert("", "User added successfully.", "success");
            clearFields();
            getUsersList();
        }
        function AssignNewProject() {
            $("#ddlProjects").val(-1);
            $("#screenAccess").hide();
            FlowSecreenId = [];
            $('#txtUserName').attr('disabled', true);
            $('#txtEmail').attr('disabled', true);
            $('#txtLoginName').attr('disabled', true);
            $('#txtPassword').attr('disabled', true);
            $("#screenAccess").hide();
        }
        function BindUserRoles() {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/users/BindRoles",
                dataType: 'json',
                success: function (data) {
                    let Success = data.Success;
                    let Response = data.Response;
                    let DataList = data.Data;
                    if (Success) {
                        $("#ddlUserRole").append('<option value="-1">Select</option>')
                        $.each(DataList, function (i, role) {
                            $('#ddlUserRole').append('<option value="' + role.USERROLEID + '">' + role.ROLENAME + '</option>');
                        });
                        BindProjectList();
                        BindUserTypes();
                    }
                }
            });
        }
        function BindUserTypes() {
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
                        $("#ddlUserType").append('<option value="-1">Select</option>')
                        $.each(DataList, function (i, userType) {
                            $('#ddlUserType').append('<option value="' + userType.AUTHORITYID + '">' + userType.AUTHORITYNAME + '</option>');
                        });
                    }
                }
            });
        }
        function BindProjectList() {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/GetProjectForDropDown",
                dataType: 'json',
                success: function (data) {
                    let Success = data.Success;
                    let Response = data.Response;
                    let DataList = data.Data;
                    if (Success) {
                        $("#ddlProjects").append('<option value="-1">Select</option>')
                        $.each(DataList, function (i, projects) {
                            $("#ddlProjects").append('<option value="' + projects.PROJECTID + '">' + projects.NAME + '</option>');
                        });
                    }
                }
            });
        }
        function GetFlowSecreenByProjectId() {
            var ProjectId = $("#ddlProjects").val();
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/GetProjectFlowSecreenByProjectId?ProjectId=" + ProjectId,
                dataType: 'json',
                success: function (data) {
                    let Success = data.Success;
                    let Response = data.Response;
                    let DataList = data.Data;
                    let cbList = '';
                    if (Success) {
                        FlowSecreenId = [];
                        $("#screenAccess").show();
                        $("#cbSecreenList").show();
                        $("#cbSecreenList").html('');
                        $.each(DataList, function (i, item) {
                            cbList = cbList + '<input type="checkbox" class="checkbox-inline" id="cbFlowDetailList' + item.FLOWDETAILID + '" value=' + item.FLOWDETAILID + ' onchange="GetSelectedValues(' + item.FLOWDETAILID + ');" /> <label for="cbFlowDetailList' + item.FLOWDETAILID + '" class="form-check-inline form-check-label"> ' + item.FLOWDETAIL + ' </label>';
                        });
                        $("#cbSecreenList").html(cbList);
                    }
                    else {
                        FlowSecreenId = [];
                        $("#screenAccess").hide();
                        $("#cbSecreenList").hide();
                    }
                }
            });
        }
        function GetSelectedValues(FlowDetailId) {
            if ($("#cbFlowDetailList" + FlowDetailId).is(":checked")) {
                FlowSecreenId += "," + $("#cbFlowDetailList" + FlowDetailId).val();
            }
            //else {
            //    alert(FlowSecreenId.slice("," - $("#cbFlowDetailList" + FlowDetailId).val()));
            //}
        }
        function getUsersList() {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/users/GetUsersList",
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
                        $("#reports-tbl tbody").html('');
                        if (DataList != null) {
                            $(DataList).each(function (i, item) {
                                iRowNum += 1;
                                rowStyle = "'text-align:center;'";
                                actionLink = '<button type = "button" class="btn btn-sm text-purple content-icon" onclick="GetAssignedProjects(' + item.USERID + ')" data-bs-toggle="modal" data-bs-target="#DetailModal" > <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M16.334 2.75012H7.665C4.644 2.75012 2.75 4.88912 2.75 7.91612V16.0841C2.75 19.1111 4.634 21.2501 7.665 21.2501H16.333C19.364 21.2501 21.25 19.1111 21.25 16.0841V7.91612C21.25 4.88912 19.364 2.75012 16.334 2.75012Z" stroke="#130F26" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" /><path d="M15.9393 12.013H15.9483" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M11.9301 12.013H11.9391" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /><path d="M7.92128 12.013H7.93028" stroke="#130F26" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg> </button>';
                                lst = lst + '<tr><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.NAME + '</td><td style=' + rowStyle + '>' + item.LOGIN_NAME + '</td><td style=' + rowStyle + '>' + item.EMAIL + '</td><td style=' + rowStyle + '>' + item.ROLENAME + '</td><td style=' + rowStyle + '>' + item.USERSTATUS + '</td><td style=' + rowStyle + '>' + actionLink + '</td></tr>';
                            });
                        }
                        else {
                            lst += '<tr><td colspan="10" style="color:red;text-align:center;">No Record Found</td></tr>'
                        }
                        $("#reports-tbl tbody").html(lst);
                    }
                }
            });
        }
        function GetAssignedProjects(userId) {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/users/GetAssignedProjectByUserId?UserId=" + userId,
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
                        $("#tblAssignedProjects tbody").html('');
                        if (DataList != null) {
                            $(DataList).each(function (i, item) {
                                iRowNum += 1;
                                rowStyle = "'text-align:center;'";
                                lst = lst + '<tr><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.PROJECTNAME + '</td><td style=' + rowStyle + '>' + item.FLOWDETAIL + '</td><td style=' + rowStyle + '>' + item.USERTYPE + '</td></tr>';
                            });
                        }
                        else {
                            lst += '<tr><td colspan="10" style="color:red;text-align:center;">No Record Found</td></tr>'
                        }
                        $("#tblAssignedProjects tbody").html(lst);
                    }
                }
            });
        }
        function saveUserRecord() {
            if ($("#txtUserName").val() == '') {
                sweetAlert("Oops...", "Please enter user name", "error");
            }
            else if ($("#txtEmail").val() == '') {
                sweetAlert("Oops...", "Please enter user email", "error");
            }
            else if ($("#txtLoginName").val() == '') {
                sweetAlert("Oops...", "Please enter login name", "error");
            }
            else if ($("#txtPassword").val() == '') {
                sweetAlert("Oops...", "Please enter password", "error");
            }
            else if ($("#ddlUserRole").val() == '' || $("#ddlUserRole").val() == -1) {
                sweetAlert("Oops...", "Please select role", "error");
            }
            else if ($("#ddlUserType").val() == '' || $("#ddlUserType").val() == -1) {
                sweetAlert("Oops...", "Please select user type", "error");
            }
            else if ($("#ddlProjects").val() == '' || $("#ddlProjects").val() == -1) {
                sweetAlert("Oops...", "Please select project", "error");
            }
            else if (FlowSecreenId.length <= 0) {
                sweetAlert("Oops...", "Please select screen", "error");
            }
            else {
                $.ajax({
                    type: "POST",
                    contentType: 'application/json; charset=utf-8',
                    url: "api/users/PostUserRecord",
                    data: PostDataJson(),
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            $('#btnAssignNewProject').show();
                            sweetAlert("", "Record added successfully.", "success");
                            //clearFields();
                            /*getUsersList();*/
                        } else {
                            sweetAlert("", "User with this email id already exists.", "error");
                            getUsersList();
                        }
                    }
                });
            }
        }
        function PostDataJson() {
            return JSON.stringify({
                "ROLEID": $("#ddlUserRole").val(),
                "NAME": $("#txtUserName").val(),
                "LOGIN_NAME": $("#txtLoginName").val(),
                "EMAIL": $("#txtEmail").val(),
                "PASSOWRD": $("#txtPassword").val(),
                "FLOWDETAILID": FlowSecreenId,
                "USERTYPEID": $("#ddlUserType").val(),
                PROJECTID: $("#ddlProjects").val()
            });
        }
        function clearFields() {
            FlowSecreenId = [];
            $("#cbSecreenList").hide();
            $("#txtUserName").val('');
            $("#txtEmail").val('');
            $("#txtLoginName").val('');
            $("#txtPassword").val('');
            $("#ddlUserRole").val(-1);
            $("#ddlUserType").val(-1);
            $("#ddlProjects").val(-1);
            $("#screenAccess").hide();
            $('#btnAssignNewProject').hide();
        }
        window.onload = getUsersList;
        
    </script>

</asp:Content>
