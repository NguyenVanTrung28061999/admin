<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChartData.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/UserControl/ucJS.ascx" TagPrefix="uc1" TagName="ucJS" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Trang chủ  -Admin</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
    <main>

        <div id="chartdiv" runat="server" style="width: 1200px; height: 600px">
            <%-- Here Chart Will Load --%>
        </div>
      
        <uc1:ucJS runat="server" ID="ucJS" />
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

