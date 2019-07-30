$(function() {
	"use strict";
	
	// default 달력
	// demos : http://jqueryui.com/datepicker/
	$('.ui-datepicker-trigger').datepicker({
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dateFormat: 'yy-mm-dd',
		//autoSize: true, //오토리사이즈(body등 상위태그의 설정에 따른다)
		changeMonth: true, //월변경가능
		changeYear: true, //년변경가능
		showMonthAfterYear: true, //년 뒤에 월 표시
		yearRange: '2012:2020' //2012년부터 2020년까지
		
	});
	
	// qna 달력
	$('.ui-datepicker-trigger-qna').datepicker({
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		dateFormat: 'yy-mm-dd',
		changeMonth: true, //월변경가능
		changeYear: true, //년변경가능
		showMonthAfterYear: true, //년 뒤에 월 표시
		yearRange: '2012:2020' //2012년부터 2020년까지
	});
	
	// datepicker stdt, endt term validator
	$('.stdt').datepicker("option", "maxDate", $('.endt').val());
	$('.stdt').datepicker("option", "onClose", function (selectedDate) {
		$(".endt").datepicker("option", "minDate", selectedDate);
	});

	$('.endt').datepicker("option", "minDate", $(".stdt").val());
	$('.endt').datepicker("option", "onClose", function (selectedDate) {
		$(".stdt").datepicker("option", "maxDate", selectedDate);
	});
	
	$('a.btnCalendar').click(function(event) {
		event.preventDefault();
		$(this).parent().find('input').datepicker('show');
	});	
});
