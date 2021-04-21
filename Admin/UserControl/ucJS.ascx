<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucJS.ascx.cs" Inherits="ucJS" %>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="../scripts/jquery-3.4.1.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<%--<script>
    var chartData; // globar variable for hold chart data
    google.load("visualization", "1", { packages: ["corechart"] });

    // Here We will fill chartData

    $(document).ready(function () {

        $.ajax({
            url: "Thongke.aspx/GetChartData",
            data: "",
            dataType: "json",
            type: "POST",
            contentType: "application/json; chartset=utf-8",
            success: function (data) {
                chartData = data.d;
            },
            error: function () {
                alert("Error loading data! Please try again.");
            }
        }).done(function () {
            // after complete loading data
            google.setOnLoadCallback(drawChart);
            drawChart();
        });
    });


    function drawChart() {
        var data = google.visualization.arrayToDataTable(chartData);

        var options = {
            title: "Số sản phẩm đã bán",
            pointSize: 5
        };

        var pieChart = new google.visualization.PieChart(document.getElementById('chart_div'));
        pieChart.draw(data, options);

    }

</script>--%>

<script>
    var chartData; // globar variable for hold chart data
    google.load("visualization", "1", { packages: ["corechart"] });

    // Here We will fill chartData

    $(document).ready(function () {

        $.ajax({
            url: "ChartData.aspx/GetChartDataWithDatetime",
            data: "",
            dataType: "json",
            type: "POST",
            contentType: "application/json; chartset=utf-8",
            success: function (data) {
                chartData = data.d;
            },
            error: function () {
                alert("Error loading data! Please try again.");
            }
        }).done(function () {
            // after complete loading data
            google.setOnLoadCallback(drawChart);
            drawChart();
        });
    });


    function drawChart() {
        var data = google.visualization.arrayToDataTable(chartData);

        var options = {
            title: "Số lượng sản phẩm trong kho",
            pointSize: 5
        };

        var pieChart = new google.visualization.PieChart(document.getElementById('chartdiv'));
        pieChart.draw(data, options);

    }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/admin/js/scripts.js"></script>

<script src="tinyeditor/1.jquery.tinymce.min.js"></script>
<script src="tinyeditor/2.tinymce.min.js"></script>
<script src="tinyeditor/3.tinymce.customfunction.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
