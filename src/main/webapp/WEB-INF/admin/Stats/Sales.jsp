<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
		function drawVisualization(){
			var data = google.visualization.arrayToDataTable([
				['Month', 'BBQ', 'BHC', '또래오래', '교촌치킨', '멕시카나', '굽네치킨', '페리카나'],
				['2019/03', 281,  154,    183,     130,      86,      146,      105],
				['2019/04', 150,  175,    237,      97,     102,      143,       96],
				['2019/05', 182,  232,    201,     117,     127,      175,      124],
				['2019/06', 207,  248,    210,     164,     142,      188,      134],
				['2019/07', 189,  197,    228,     188,     187,      171,      150]
			]);
			var options = {
					title : '판매금액 통계',
					vAxis: {title: '매출'},
					hAxis: {title: '월'},
					seriesType: 'bars'
					/* series: {7: {type: 'line'}} */
			};
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>
<body>
	<div id="chart_div" style="width:900px; height: 500px;"></div>
</body>
</html>