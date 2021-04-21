<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductChartJS.aspx.cs" Inherits="ProductChartJS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Thống kê Sản phẩm</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
      <div id="chartdiv" runat="server" style="width: 1200px; height: 600px">
            <%-- Here Chart Will Load --%>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
</asp:Content>

