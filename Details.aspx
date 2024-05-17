<%@ Page Language="C#" AutoEventWireup="true" Async="true"  CodeBehind="Details.aspx.cs" Inherits="EApproval.Details" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src='<%=ResolveUrl("~/crystalreportviewers13/js/crviewer/crv.js")%>' type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <CR:CrystalReportViewer ID="rptViewer" runat="server" AutoDataBind="true" Height="1000px" ReportSourceID="CrystalReportSource1" ToolPanelWidth="200px" Width="1100" ToolPanelView="None" Visible="true"/>
            <CR:CrystalReportSource runat="server" ID="CrystalReportSource1" Visible="true" />
        </div>
        
    </form>
</body>
</html>



