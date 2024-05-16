<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="EApproval.Roles" %>

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
                    <%--<svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
                <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
            </svg>--%>
            Setup Pages </a>
                </li>
                <li class="breadcrumb-item active"><a href="javascript:void(0)">Roles</a></li>
            </ol>
            <a class="text-primary fs-13" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">+ Add New Role </a>
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
                                        <%--<a class="text-primary fs-13" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">+ Add New Role </a>--%>
                                        <%--<a class="btn btn-primary btn-sm" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">+ Add New Role</a>--%>
                                    </div>
                                </div>
                                <div class="dataTables_wrapper no-footer" id="reports-tbl_wrapper">
                                    <table id="reports-tbl" class="table dataTable no-footer" role="grid" aria-describedby="reports-tbl_info">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Role</th>
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
            <h5 class="modal-title" id="#gridSystemModal">Add Employee</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>
        <div class="offcanvas-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-6 mb-3">
                        <label for="txtRoleName" class="form-label">Role<span class="text-danger"> *</span></label>
                        <input type="text" class="form-control" name="txtRoleName" id="txtRoleName" placeholder="e.g CEO, HOD etc..." />
                    </div>
                    <%--<div class="col-xl-6 mb-3">
                        <label for="exampleFormControlInput3" class="form-label">Employee Email<span class="text-danger">*</span></label>
                        <input type="email" class="form-control" id="exampleFormControlInput3" placeholder="">
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="exampleFormControlInput4" class="form-label">Password<span class="text-danger">*</span></label>
                        <input type="password" class="form-control" id="exampleFormControlInput4" placeholder="">
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label class="form-label">Designation<span class="text-danger">*</span></label>
                        <select class="default-select style-1 form-control">
                            <option data-display="Select">Please select</option>
                            <option value="html">Software Engineer</option>
                            <option value="css">Civil Engineer</option>
                            <option value="javascript">Web Doveloper</option>
                        </select>
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label class="form-label">Department<span class="text-danger">*</span></label>
                        <select class="default-select style-1 form-control">
                            <option data-display="Select">Please select</option>
                            <option value="html">Software</option>
                            <option value="css">Doit</option>
                            <option value="javascript">Designing</option>
                        </select>
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label class="form-label">Country<span class="text-danger">*</span></label>
                        <select class="default-select style-1 form-control">
                            <option data-display="Select">Please select</option>
                            <option value="html">Ind</option>
                            <option value="css">USA</option>
                            <option value="javascript">UK</option>
                        </select>
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="exampleFormControlInput88" class="form-label">Mobile<span class="text-danger">*</span></label>
                        <input type="number" class="form-control" id="exampleFormControlInput88" placeholder="">
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label class="form-label">Gender<span class="text-danger">*</span></label>
                        <select class="default-select style-1 form-control">
                            <option data-display="Select">Please select</option>
                            <option value="html">Male</option>
                            <option value="css">Female</option>
                            <option value="javascript">Other</option>
                        </select>
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="exampleFormControlInput99" class="form-label">Joining Date<span class="text-danger">*</span></label>
                        <input type="date" class="form-control" id="exampleFormControlInput99">
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="exampleFormControlInput8" class="form-label">Date of Birth<span class="text-danger">*</span></label>
                        <input type="date" class="form-control" id="exampleFormControlInput8">
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label for="exampleFormControlInput10" class="form-label">Reporting To<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="exampleFormControlInput10" placeholder="">
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label class="form-label">Language Select<span class="text-danger">*</span></label>
                        <select class="default-select style-1 form-control">
                            <option data-display="Select">Please select</option>
                            <option value="html">English</option>
                            <option value="css">Hindi</option>
                            <option value="javascript">Canada</option>
                        </select>
                    </div>
                    <div class="col-xl-6 mb-3">
                        <label class="form-label">User Role<span class="text-danger">*</span></label>
                        <select class="default-select style-1 form-control">
                            <option data-display="Select">Please select</option>
                            <option value="html">Parmanent</option>
                            <option value="css">Parttime</option>
                            <option value="javascript">Per Hours</option>
                        </select>
                    </div>
                    <div class="col-xl-12 mb-3">
                        <label class="form-label">Address<span class="text-danger">*</span></label>
                        <textarea rows="3" class="form-control"></textarea>
                    </div>
                    <div class="col-xl-12 mb-3">
                        <label class="form-label">About<span class="text-danger">*</span></label>
                        <textarea rows="3" class="form-control"></textarea>
                    </div>--%>
                </div>
                <div>
                    <input type="button" class="btn btn-primary me-1" value="Save Role" onclick="saveRole();" />
                    <input type="button" class="btn btn-danger light ms-1" value="Cancel" onclick="clearFields();" />
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        function getRolesList() {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/roles/getRoles",
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
                                lst = lst + '<tr><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.ROLENAME + '</td></tr>';
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
        function saveRole() {
            if ($("#txtRoleName").val() == '') {
                sweetAlert("Oops...", "Please enter role", "error");
            }
            else {
                $.ajax({
                    type: "POST",
                    contentType: 'application/json; charset=utf-8',
                    url: "api/roles/saveRole",
                    data: PostRoleJson(),
                    dataType: 'json',
                    success: function (data) {
                        if (data.Success) {
                            sweetAlert("", "Role Saved", "success");
                            clearFields();
                            getRolesList();
                        } else {
                            sweetAlert("", "Failed to Save Role", "error");
                            getRolesList();
                        }
                    }
                });
            }
        }
        function PostRoleJson() {
            return JSON.stringify({
                "ROLENAME": $("#txtRoleName").val(),
            });
        }
        function clearFields() {
            $("#txtRoleName").val('');
        }
        window.onload = getRolesList;
    </script>
</asp:Content>
