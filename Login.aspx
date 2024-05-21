<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EApproval.Login" %>

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="">
    <meta name="author" content="">
    <meta name="robots" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
    <meta property="og:title" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
    <meta property="og:description" content="W3crm:Customer Relationship Management Admin Bootstrap 5 Template">
    <meta property="og:image" content="https://w3crm.dexignzone.com/xhtml/social-image.png">
    <meta name="format-detection" content="telephone=no">

    <!-- PAGE TITLE HERE -->
    <title>E-Approval Daewoo</title>
    <!-- FAVICONS ICON -->
    <%--<link rel="shortcut icon" type="image/png" href="images/TtitleImg.png" />--%>
    <link rel="shortcut icon" type="image/png" href="images/favicon_daewoo_express_logo.png" />

    <link href="vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
    <style>
        .gradient-custom-2 {
            /* fallback for old browsers */
            background: #fccb90;
            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
        }

        @media (min-width: 768px) {
            .gradient-form {
                height: 100vh !important;
            }
        }

        @media (min-width: 769px) {
            .gradient-custom-2 {
                border-top-right-radius: .3rem;
                border-bottom-right-radius: .3rem;
            }
        }
    </style>
</head>

<body class="vh-100" scroll="no" style="overflow: hidden">
    <section class="h-100 gradient-form" style="background-color: #eee;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-10">
                    <div class="card rounded-3 text-black">
                        <div class="row g-0">
                            <div class="col-lg-6">
                                <div class="card-body p-md-5 mx-md-4">
                                    <div class="text-center">
                                        <img src="images/logo.png" style="width: 185px;" alt="logo">
                                        <h4 class="mt-1 mb-5 pb-1">E Approval Sign In</h4>
                                    </div>
                                    <form>
                                        <p>Continue your E-Approval journey with Daewoo</p>

                                        <div  class="form-outline mb-4">
                                           <%-- <input type="email" id="form2Example11" class="form-control"
                                                placeholder="Phone number or email address" />
                                            <label class="form-label" for="form2Example11">Username</label>--%>
                                             <input type="text" id="txtEmail" class="form-control" placeholder="abc@gmail.com" >

                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="dz-password" placeholder="Password..." class="form-control" />
                                            <%--<label class="form-label" for="form2Example22">Password</label>--%>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <select id="ddlProjects" class="form-control">
                                                <%--<option value="" disabled selected>Select Project</option>--%>
                                            </select>

                                        </div>

                                        <div class="text-center pt-1 mb-5 pb-1">
                                            <button type="button" onclick="Login();" style="background: #0095DA" class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3">Login</button>
                                            <a class="text-muted" href="#!">Forgot password?</a>
                                        </div>

                                       <%-- <div class="d-flex align-items-center justify-content-center pb-4">
                                            <p class="mb-0 me-2">Don't have an account?</p>
                                            <button type="button" class="btn btn-outline-danger">Create new</button>
                                        </div>--%>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-6 d-flex align-items-center gradient-custom-2" style="background: #0095DA">
                                <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                    <h4 class="mb-4">We are more than just a company</h4>
                                    <p class="large mb-0">
                                        Daewoo Express is the first and the biggest foreign investment company with an advanced and organized transport system in Pakistan. It is the only transport company tho have a nationwide network with various international trade links
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--**********************************
	Scripts
***********************************-->
    <!-- Required vendors -->
    <script src="vendor/global/global.min.js"></script>
    <script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="js/deznav-init.js"></script>
    <script src="js/plugins-init/sweetalert-init.js"></script>

    <script src="vendor/sweetalert2/dist/sweetalert2.min.js"></script>

    <script src="js/custom.js"></script>

    <script type="text/javascript">
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
        function Login() {
            if ($("#txtEmail").val() == "admin") {
                $.ajax({
                    type: "POST",
                    contentType: 'application/json; charset=utf-8',
                    url: "api/users/Login",
                    data: PostDataJson(),
                    dataType: 'json',
                    success: function (data) {
                        let list = data.Data;
                        if (data.Success) {
                            LoadUserPermissions(list.Session_USERROLEID, list.Session_USERID, list.Session_PROJECTID);
                        }
                        else {
                            sweetAlert("", "Invalid Credentials", "error");
                        }
                    }
                });
            }
            else {
                if ($("#ddlProjects").val() == -1) {
                    sweetAlert("", "Please select project", "error");
                }
                else {
                    $.ajax({
                        type: "POST",
                        contentType: 'application/json; charset=utf-8',
                        url: "api/users/Login",
                        data: PostDataJson(),
                        dataType: 'json',
                        success: function (data) {
                            let list = data.Data;
                            if (data.Success) {
                                LoadUserPermissions(list.Session_USERROLEID, list.Session_USERID, list.Session_PROJECTID);
                            }
                            else {
                                sweetAlert("", "Invalid Credentials", "error");
                            }
                        }
                    });
                }
            }
        }
        function LoadUserPermissions(UserRoleId, user_id, project_id) {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/users/LoadUserPermissions",
                dataType: 'json',
                success: function (data) {
                    if (project_id == 61) { //WIMS-WORKSHOP
                        window.location.href = 'WIMS_Workshop_Dashboard.aspx?ProjectType=' + '' + '&Mode=' + '';
                    }
                    else if (project_id == 26) { //WIMS-ADMIN
                        window.location.href = 'WIMS_Admin_Dashboard.aspx?ProjectType=' + '' + '&Mode=' + '';
                    }
                    else if (project_id == 81) { //ECS
                        window.location.href = 'ECS_Dashboard.aspx?ProjectType=' + '' + '&Mode=' + '';
                    }
                    else { //Admin 
                        window.location.href = 'Projects.aspx';
                    }
                }
            });
        }
        function PostDataJson() {
            return JSON.stringify({
                "EMAIL": $("#txtEmail").val(),
                "PASSOWRD": $("#dz-password").val(),
                "PROJECTID": $("#ddlProjects").val()
            });
        }
        window.onload = BindProjectList;
    </script>

</body>
</html>