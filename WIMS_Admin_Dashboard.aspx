<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WIMS_Admin_Dashboard.aspx.cs" Inherits="EApproval.WIMS_Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-body" id="dashboard_body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-9 wid-100">
                    <div class="row projectstatus"></div>
                    <div class="row">
                        <div class="col-xl-8">
                            <div class="card overflow-hidden">
                                <div class="card-header border-0 pb-0 flex-wrap">
                                    <h4 class="heading mb-0">Payment Voucher</h4>
                                    <ul class="nav nav-pills mix-chart-tab" id="pills-tab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link active" data-series="week" id="pills-week-tab" data-bs-toggle="pill" data-bs-target="#pills-week" type="button" role="tab" aria-selected="true">Week</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" data-series="month" id="pills-month-tab" data-bs-toggle="pill" data-bs-target="#pills-month" type="button" role="tab" aria-selected="false">Month</button>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <button class="nav-link" data-series="year" id="pills-year-tab" data-bs-toggle="pill" data-bs-target="#pills-year" type="button" role="tab" aria-selected="false">Year</button>
                                        </li>
                                        <%--<li class="nav-item" role="presentation">
                                            <button class="nav-link" data-series="all" id="pills-all-tab" data-bs-toggle="pill" data-bs-target="#pills-all" type="button" role="tab" aria-selected="false">All</button>
                                        </li>--%>
                                    </ul>
                                </div>
                                <div class="card-body  p-0">
                                    <div id="overiewChart"></div>
                                    <div class="ttl-project">
                                        <div class="pr-data">
                                            <h5 id="total_pv"></h5>
                                            <span>Number of PV's</span>
                                        </div>
                                         <div class="pr-data">
                                            <h5 id="pending_pv" class="text-primary"></h5>
                                            <span>Pending PV's</span>
                                        </div>
                                        <div class="pr-data">
                                            <h5 id="approve_pv" class="text-success"></h5>
                                            <span>Approved PV's</span>
                                        </div>
                                        <div class="pr-data">
                                            <h5 id="rejected_pv" class="text-danger"></h5>
                                            <span>Rejected PV's</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4">
                            <div class="card">
                                <div class="card-header border-0">
                                    <h4 class="heading mb-0">Purchase Order Status</h4>
                                </div>
                                <div class="card-body p-0">
                                    <div class="dt-do-bx">
                                        <div class="draggable-zone dropzoneContainer to-dodroup dz-scroll">
                                            <div class="sub-card draggable-handle draggable">
                                                <div class="d-items">
                                                    <span class="text-warning dang d-block mb-2">
                                                        <svg class="me-1" width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M3.61051 15.3276H14.3978C15.5843 15.3276 16.329 14.0451 15.7395 13.0146L10.35 3.59085C9.75676 2.5536 8.26126 2.55285 7.66726 3.5901L2.26876 13.0139C1.67926 14.0444 2.42326 15.3276 3.61051 15.3276Z" stroke="#FF9F00" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                                            <path d="M9.00189 10.0611V7.7361" stroke="#FF9F00" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                                            <path d="M8.99625 12.375H9.00375" stroke="#FF9F00" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                        </svg>
                                                        Pending PO's
                                                    </span>
                                                    <div class="d-flex justify-content-between flex-wrap">
                                                        <div class="d-items-2">
                                                            <div>
                                                                <svg width="9" height="16" viewBox="0 0 9 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                    <rect width="1" height="1" fill="#888888" />
                                                                    <rect y="3" width="1" height="1" fill="#888888" />
                                                                    <rect y="6" width="1" height="1" fill="#888888" />
                                                                    <rect y="9" width="1" height="1" fill="#888888" />
                                                                    <rect y="12" width="1" height="1" fill="#888888" />
                                                                    <rect y="15" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="3" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="6" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="9" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="12" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="15" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="3" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="6" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="9" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="12" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="15" width="1" height="1" fill="#888888" />
                                                                </svg>
                                                            </div>
                                                            <div class="pending_po">
                                                                <%--<div class="form-check custom-checkbox">
                                                                    <input type="checkbox" checked class="form-check-input" id="customCheckBox1" disabled>
                                                                    <label class="form-check-label" for="customCheckBox1"><b>HOQ-LRQ-2403-14</b><span style="font-size:13px"> - Pending From Authorizer</span></label>
                                                                </div>
                                                                <span>2024-03-26</span>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<div class="sub-card draggable-handle draggable">
                                                <div class="d-items">
                                                    <span class="text-success dang d-block mb-2">
                                                        <svg class="me-1" width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M15 4.5L6.75 12.75L3 9" stroke="#3AC977" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                        </svg>
                                                        Approved Requests
                                                    </span>
                                                    <div class="d-flex justify-content-between flex-wrap">
                                                        <div class="d-items-2">
                                                            <div>
                                                                <svg width="9" height="16" viewBox="0 0 9 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                    <rect width="1" height="1" fill="#888888" />
                                                                    <rect y="3" width="1" height="1" fill="#888888" />
                                                                    <rect y="6" width="1" height="1" fill="#888888" />
                                                                    <rect y="9" width="1" height="1" fill="#888888" />
                                                                    <rect y="12" width="1" height="1" fill="#888888" />
                                                                    <rect y="15" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="3" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="6" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="9" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="12" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="15" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="3" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="6" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="9" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="12" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="15" width="1" height="1" fill="#888888" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <div class="form-check custom-checkbox">
                                                                    <input type="checkbox" checked class="form-check-input" id="customCheckBox03" disabled>
                                                                    <label class="form-check-label" for="customCheckBox1"><b>HOQ-LRQ-2403-14</b><span style="font-size:13px"> - Approved</span></label>
                                                                </div>
                                                                <span>2024-01-01</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>

                                            <%--<div class="sub-card draggable-handle draggable">
                                                <div class="d-items">
                                                    <span class="text-danger dang d-block mb-2">
                                                       <svg class="me-1" width="13" height="13" viewBox="0 0 13 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                            <path d="M1 1L12 12M1 12L12 1" stroke="#FF5E5E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                                                       </svg>
                                                        Rejected Requests
                                                    </span>
                                                    <div class="d-flex justify-content-between flex-wrap">
                                                        <div class="d-items-2">
                                                            <div>
                                                                <svg width="9" height="16" viewBox="0 0 9 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                    <rect width="1" height="1" fill="#888888" />
                                                                    <rect y="3" width="1" height="1" fill="#888888" />
                                                                    <rect y="6" width="1" height="1" fill="#888888" />
                                                                    <rect y="9" width="1" height="1" fill="#888888" />
                                                                    <rect y="12" width="1" height="1" fill="#888888" />
                                                                    <rect y="15" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="3" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="6" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="9" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="12" width="1" height="1" fill="#888888" />
                                                                    <rect x="4" y="15" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="3" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="6" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="9" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="12" width="1" height="1" fill="#888888" />
                                                                    <rect x="8" y="15" width="1" height="1" fill="#888888" />
                                                                </svg>
                                                            </div>
                                                            <div>
                                                                <div class="form-check custom-checkbox">
                                                                    <input type="checkbox" checked class="form-check-input" id="customCheckBox04" disabled>
                                                                    <label class="form-check-label" for="customCheckBox1"><b>HOQ-LRQ-2403-14</b><span style="font-size:13px"> - Rejected</span></label>
                                                                </div>
                                                                <span>2024-01-01</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 t-earn">
                    <div class="card">
                        <div class="card-header border-0 pb-0">
                            <h4 class="heading mb-0">Purchase Order</h4>
                        </div>
                        <div class="card-body px-0 overflow-hidden">
                            <div class="total-earning">
                                <h2 id="poamount"> </h2>
                                <ul class="nav nav-pills mb-3 earning-tab earning-chart" id="pills-tab1" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link day active" data-series="day" id="pills-day-tab1" data-bs-toggle="pill" data-bs-target="#pills-day1" type="button" role="tab" aria-selected="true">Day</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pills-week-tab1" data-series="week" data-bs-toggle="pill" data-bs-target="#pills-week1" type="button" role="tab" aria-selected="false">Week</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pills-month-tab1" data-series="month" data-bs-toggle="pill" data-bs-target="#pills-month1" type="button" role="tab" aria-selected="false">Month</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="pills-year-tab1" data-series="year" data-bs-toggle="pill" data-bs-target="#pills-year1" type="button" role="tab" aria-selected="false">Year</button>
                                    </li>
                                </ul>
                                <div id="earningChart"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
 
</asp:Content>



