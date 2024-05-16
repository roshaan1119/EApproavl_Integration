<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="EApproval.ProjectDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body p-0">
                            <div class="table-responsive active-projects manage-client">
                                <div class="tbl-caption">
                                    <h4 class="heading mb-0"></h4>
                                    <div>
                                        
                                    </div>
                                </div>
                                <div class="dataTables_wrapper no-footer" id="reports-tbl_wrapper">
                                    <table id="reports-tbl" class="table dataTable no-footer" role="grid" aria-describedby="reports-tbl_info">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center">Sr #</th>
                                                <th style="text-align: center">Project</th>
                                                <th style="text-align: center">Flow</th>
                                                <th style="text-align: center">Approval Authorities</th>
                                                <th style="text-align: center">Limitations</th>
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
    <script type="text/javascript">
        function GetProjectList() {
            $.ajax({
                type: "GET",
                contentType: 'application/json; charset=utf-8',
                url: "api/projects/GetProjectDetail",
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
                                lst = lst + '<tr><td style=' + rowStyle + '>' + iRowNum + '</td><td style=' + rowStyle + '>' + item.NAME + '</td><td style=' + rowStyle + '>' + item.FLOWDETAIL + '</td><td style=' + rowStyle + '>' + item.APPROVING_PERSONS + '</td><td style=' + rowStyle + '>' + item.PROJECTLIMIT + '</td></tr>';
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
        window.onload = GetProjectList;
    </script>
</asp:Content>
