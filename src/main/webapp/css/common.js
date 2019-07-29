$(function() {
	"use strict";
	
	$('.numberonly').on('input propertychange', function(event) {
		var value = $(this).val().replace(/[^0-9]/gi, "");
		$(this).val(value);
	});
	
	$('.emailonly').on('input propertychange', function(event) {
		var value = $(this).val().replace(/[^a-zA-Z0-9_.+-]/gi, "");
		if ($(this).val() != value) {
			alert("형식에 맞지 않는 이메일주소 입니다.\n영대/소문자, 숫자, _.+-만 입력 가능합니다.");
		}
		$(this).val(value);
	});
	
	$('.cutNumber').on('input propertychange', function(event) {
		var value = $(this).val().replace(/(^0+)|[^0-9]/gi, "");
		value = value.replace(/\B(?=(\d{3})+(?!\d))/gi, ",");
		$(this).val(value);
	});
	
	$('.chkall').change(function(event) {
		event.preventDefault();
		
		var isChkAll = $(this).is(':checked');
		
		$('.chk').each( function (index) {
			if ($(this).is(':checked') != isChkAll) {
				if ($(this).is(':disabled') == false) {
					$(this).prop('checked', isChkAll);
				}				
			}
		});
	});
	
	$('.chk').change(function(event) {
		event.preventDefault();
		
		if ($(this).is(':checked') == true) {
			if ($('.chkall').is(':checked') == false) {
				
				// chk 항목들이 모두 체크되면, chkall도 체크
				var isChkAll = true;
				
				$('.chk').each( function (index) {
					if ($(this).is(':disabled') == false && $(this).is(':checked') == false) {
						isChkAll = false;
						return false;
					}
				});
				
				if (isChkAll == true) {
					$('.chkall').prop('checked', true);
				}
			}
		} else {
			if ($('.chkall').is(':checked')) {
				$('.chkall').prop('checked', false);
			}			
		}
	});
});

function ckNumber(obj)
{
    if(isNaN(obj.value))
    {
        alert('숫자만 입력해주세요.');
        obj.value = '';
        obj.focus();
    }
}

function cutNumber(n) 
{
	var reg = /(^[+-]?\d+)(\d{3})/;
	n += '';
	while (reg.test(n))
    	n = n.replace(reg, '$1' + ',' + '$2');
	return n;
}

function getDateFormat(strDate, separator)
{
	if( strDate.length == 8 )
		return strDate.slice(0,4) + separator + strDate.slice(4,6) + separator + strDate.slice(6,8);
	else if( strDate.length == 6 )
		return strDate.slice(0,4) + separator + strDate.slice(4,6);
	else
		return '';
}

function getPhoneFormat(phoneNum)
{
	if( phoneNum.length == 8 )
		return phoneNum.slice(0,4) + '-' + phoneNum.slice(4,8);
	else if( phoneNum.length == 9 )
		return phoneNum.slice(0,2) + '-' + phoneNum.slice(2,5) + '-' + phoneNum.slice(5,9);
	else if( phoneNum.length == 10 ) {
		if( phoneNum.indexOf("02") === 0)
		//if( phoneNum.startsWith("02") )
			return phoneNum.slice(0,2) + '-' + phoneNum.slice(2,6) + '-' + phoneNum.slice(6,10);
		else
			return phoneNum.slice(0,3) + '-' + phoneNum.slice(3,6) + '-' + phoneNum.slice(6,10);
	}
	else if( phoneNum.length == 11 )
		return phoneNum.slice(0,3) + '-' + phoneNum.slice(3,7) + '-' + phoneNum.slice(7,11);
	else if( phoneNum.length == 12 )
		return phoneNum.slice(0,4) + '-' + phoneNum.slice(4,8) + '-' + phoneNum.slice(8,12);
	else
		return phoneNum;
}

function checkMsgLength(area_name, length, byte_name)
{
	var ls_str = area_name.value;
	var li_str_len = ls_str.length;

	var li_max = length;
	var i = 0;
	var li_byte = 0;
	var li_len = 0;
	var ls_one_char = "";
	var ls_str2 = "";
	var com_str = /[&'<>#;]/g;
	
	if(com_str.test(ls_str))
	{	
		area_name.value = ls_str.replace(/[&'<>#;]/g,"");
		alert("&, ', <, >, #, ; 와 같은 특수문자는 입력 할 수 없습니다.");
		return false;
	}

	for(i=0; i< li_str_len; i++) {
		ls_one_char = ls_str.charAt(i);
		if (escape(ls_one_char).length > 4)
			li_byte += 2;
		else
			li_byte++;

		if(li_byte <= li_max)
			li_len = i + 1;
	}
	$('#'+byte_name).html(eval(li_byte));
	//document.getElementById(byte_name).innerHTML = eval(li_byte);

	if(li_byte > li_max) {
		alert( li_max/2 + " 글자를 초과 입력할수 없습니다. ");
		ls_str2 = ls_str.substr(0, li_len);
		area_name.value = ls_str2;
		$('#'+byte_name).html(eval(li_max));
		//document.getElementById(byte_name).innerHTML = eval(li_max);
	}
	area_name.focus(); 
}

function checkSendPhone(sendPhone)
{
	var returnMsg = "";

	if ( sendPhone.length > 12 || sendPhone.length < 3) { // 자리수체크 
	    returnMsg = "발신번호를 입력해주세요.";
	} 
	else if( sendPhone.match(/^(02|03[1-3]|04[1-4]|05[1-5]|06[0-4])(15|16|18)\d{6}$/) != null )	// 대표 번호앞에 지역번호가 포함
	{
		returnMsg = "전국대표번호는 지역번호 입력이 불가합니다. 지역번호 없이 발신번호를 입력해주세요.";
	}
	else if ( sendPhone.match(/^01(0|1|6|7|8|9)\d{7,8}$/) != null )	// 휴대폰 번호
	{
		returnMsg = "";
	}
	else if( sendPhone.match(/^(02|03[1-3]|04[1-4]|05[1-5]|06[0-4])\d{7,8}$/) != null || 
			sendPhone.match(/^(030|070)\d{8}$/) != null || 
			sendPhone.match(/^080\d{7}$/) != null || 
			sendPhone.match(/^(012|015)\d{8}$/) != null || 
			sendPhone.match(/^050[2-8]\d{8}$/) != null || 
			sendPhone.match(/^013\d{9}$/) != null )  
	{
		returnMsg = "";
	}
	else if( sendPhone.match(/^1(3|4|5|6|8)\d{6}$/) != null || sendPhone.match(/^(10|11|12)\d{1}$/) != null ) 
	{
		returnMsg = "";
	}
	else 
	{
		returnMsg = "입력하신 발신번호는 발신번호 세칙에 맞지 않습니다. 관리자에게 문의해주세요.";
	}
	return returnMsg;
}

function isMobileFormat(mobile)
{
	var regx = /^(010|011|016|017|018|019)\d{7,8}$/;
	if( !regx.test(mobile) ) {
		return false;
	}
	return true;
}

function isDestPhoneFormat(destPhone)
{
	var regx = /^(010|011|016|017|018|019|070|0502|0503|0504|0505|0506|0507|0508)\d{7,8}$/;
	if( !regx.test(destPhone) ) {
		return false;
	}
	return true;
}

function isPhoneFormat(phone)
{
	var regx = /^\d{2,3}\d{3,4}\d{4}$/;
	if( !regx.test(phone) ) {
		return false;
	}
	return true;
}

function isValidStdtToEndt(stdt, endt)
{
	if( stdt.length != 8 || endt.length != 8)
		return false;

	var sDate = new Date(stdt.slice(0,4), stdt.slice(4,6), stdt.slice(6,8));
	var eDate = new Date(endt.slice(0,4), endt.slice(4,6), endt.slice(6,8));

	if(sDate > eDate)
		return false;

	return true;
}

function isValidStdtToEndt(stdt, endt, separator)
{
	var arrStdt = stdt.split(separator);
	var arrEndt = endt.split(separator);

	var sDate = new Date(arrStdt[0], arrStdt[1], arrStdt[2]);
	var eDate = new Date(arrEndt[0], arrEndt[1], arrEndt[2]);

	if(sDate > eDate)
		return false;
	
	return true;
}

// 주문번호 생성
function getTimeStamp()
{
	var d = new Date();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var hour = d.getHours();
	var minute = d.getMinutes();
	var second = d.getSeconds();
 
	month = (month < 10 ? "0" : "") + month;
	date = (date < 10 ? "0" : "") + date;
	hour = (hour < 10 ? "0" : "") + hour;
	minute = (minute < 10 ? "0" : "") + minute;
	second = (second < 10 ? "0" : "") + second;
 
	var s = d.getFullYear() + month + date + hour + minute + second;
 
	return s;
}

function getKcpOrderIdxx()
{
    var today = new Date();
    var year  = today.getFullYear();
    var month = today.getMonth() + 1;
    var date  = today.getDate();
    var time  = today.getTime();

    if (parseInt(month) < 10)
      month = "0" + month;

    if (parseInt(date) < 10)
      date  = "0" + date;

    var order_idxx = "DONUT" + year + "" + month + "" + date + "" + time;
    
    return order_idxx;
}

function isJoinUserIdFormatError(userId) {
	if( userId.length < 4 || userId.length > 12 ) {
		return true;
	}
	if(( userId.search(/[^a-z|^A-Z|^0-9]/) != -1) ) {
		return true;
	}
	if( userId.search(/[a-z]/ig) < 0 ) {
		return true;
	}
	return false;
}

function isPasswordFormatError(password) {
	var regx = /.*(((?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[\W])|(?=^.{10,20}$)(?=.*\d)(?=.*[a-zA-Z]))(?!.*[\s].*)).*/; 
	if( !regx.test(password) ) {
		alert("비밀번호는 영대/소문자, 숫자, 특수문자를 포함하여 8~20자로 등록해주시기 바랍니다.");
		return true;
	}
	return false;
}

function isJoinPasswordFormatError(password) {
	var regx = /.*(((?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[\W])|(?=^.{10,20}$)(?=.*\d)(?=.*[a-zA-Z]))(?!.*[\s].*)).*/; 
	if( !regx.test(password) ) {
		return true;
	}
	return false;
}

function isContinuedValue(value) {

	var intCnt1 = 0;
	var intCnt2 = 0;
	var temp0 = "";
	var temp1 = "";
	var temp2 = "";
	var temp3 = "";

	for (var i = 0; i < value.length - 3; i++) {
		temp0 = value.charAt(i);
		temp1 = value.charAt(i + 1);
		temp2 = value.charAt(i + 2);
		temp3 = value.charAt(i + 3);

		if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == 1
			&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == 1
			&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == 1) {
			intCnt1 = intCnt1 + 1;
		}

		if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == -1
			&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == -1
			&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == -1) {
			intCnt2 = intCnt2 + 1;
		}
	}

	return (intCnt1 > 0 || intCnt2 > 0);
}

function isMobileFormatError(mobile) {
	var regx = /^(010|011|016|017|018|019)\d{7,8}$/;
	if( !regx.test(mobile) ) {
		alert("유효하지 않은 휴대폰번호입니다.");
		return true;
	}
	return false;
}

function isDestPhoneFormatError(destPhone)
{
	var regx = /^(010|011|016|017|018|019|070|0502|0503|0504|0505|0506|0507|0508)\d{7,8}$/;
	if( !regx.test(destPhone) ) {
		alert("유효하지 않은 수신번호입니다.");
		return true;
	}
	return false;
}

function isPhoneFormatError(phone) {
	var regx = /^\d{2,3}\d{3,4}\d{4}$/;
	if( !regx.test(phone) ) {
		alert("유효하지 않은 전화번호입니다.");
		return true;
	}
	return false;
}

function isJoinMobileFormatError(mobile) {
	var regx = /^(010|011|016|017|018|019)\d{7,8}$/;
	if( !regx.test(mobile) ) {
		return true;
	}
	return false;
}

function isJoinPhoneFormatError(phone) {
	var regx = /^\d{2,3}\d{3,4}\d{4}$/;
	if( !regx.test(phone) ) {
		return true;
	}
	return false;
}

function isJoinEmailFormatError(email) {
	var regx = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if( !regx.test(email) ) {
		return true;
	}
	return false;
}

function isEmailFormatError(email) {
	var regx = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if( !regx.test(email) ) {
		alert("유효하지 않은 이메일주소입니다.");
		return true;
	}
	return false;
}

function isCompanyNoFormatError(companyNo) {
	if(( companyNo.search(/[^0-9\-]/) != -1) ) {
		 alert("사업자등록번호는 숫자 또는 (-)만 가능합니다.");
		 return true;
	}
	return false;
}

function isCertNumFormatError(certNum) {
	var regx = /^\d{6}$/;
	if( !regx.test(certNum) ) {
		alert("인증번호 6자리 숫자를 정확히 입력해주세요.");
		return true;
	}
	return false;
}

function isGroupNameFormatError(groupName) {
	var regx = /[\"\'|]/;
	if ( regx.test(groupName) ) {
		alert('그룹명에 \' \" | 문자는 포함할 수 없습니다.');
		return true;
	}
	return false;
}

function setCookie(name, value, expires)
{
    document.cookie = name + "=" + escape(value)
            + "; path=/;domain=.donutbook.co.kr"
            + ((expires == null) ? "" : "; expires=" + expires.toUTCString());
}

function delCookie(name)
{
    document.cookie = name + "=; expires=Thu, 01-Jan-70 00:00:01 GMT" +  "; path=/;domain=.donutbook.co.kr";
}

function getCookie(name)
{
    var nameOfCookie = name + "=";
    var x = 0;

    while ( x <= document.cookie.length ){
        var y = (x+nameOfCookie.length);

        if ( document.cookie.substring( x, y ) == nameOfCookie ) {

            if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) {
                endOfCookie = document.cookie.length;
            }
            return unescape( document.cookie.substring( y, endOfCookie ) );
        }
        x = document.cookie.indexOf( " ", x ) + 1;
        if ( x == 0 )
        break;
    }

    return "";
}

function getByteLength(str) 
{
	var l = 0;
    for (var i=0; i<str.length; i++) l += (str.charCodeAt(i) > 128) ? 2 : 1;
    return l;
}

function htmlDecode(input)
{
	var doc = new DOMParser().parseFromString(input, "text/html");
	return doc.documentElement.textContent;
}