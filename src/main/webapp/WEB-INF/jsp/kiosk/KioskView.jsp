<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- <link rel="stylesheet" href="<c:url value='/'/>css/base.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
		<link rel="stylesheet" href="<c:url value='/'/>css/page.css"> -->
		<link rel="stylesheet" href="/css/kiosk_common.css?after">
		<link rel="stylesheet" href="/css/kiosk_main.css?after">
		<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css?after">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
		<script src="<c:url value='/'/>js/ui.js"></script>
		<script src="<c:url value='/'/>js/jqueryui.js"></script>
		<title>Auto Q 목포서비스센터</title>
		<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->


	</head>

<style>
/* INPUT 가리기 */
.section input[id*="slide"] {display:none;}

/* 슬라이드 영역 - max-width 크기를 조절해주면 됩니다*/
.section .slidewrap {/*max-width:900px;*/overflow:hidden;}
.section .slidelist {white-space:nowrap;font-size:0;padding: 0px;}
.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s; height: 100vh;}
.section .slidelist > li > a {display:block;position:relative;}
.section .slidelist > li > a img {width:100%;}

/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
/* .section .slidelist label {position:absolute;z-index:1;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;} */
/* .section .slidelist .left {left:30px;background:url('./img/left.png') center center / 100% no-repeat;} */
/* .section .slidelist .right {right:30px;background:url('./img/right.png') center center / 100% no-repeat;} */

/* INPUT 체크되면 변화값이 li까지 전달되는 스타일 */
.section input[id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
.section input[id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
.section input[id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
.section input[id="slide04"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-300%);}
.section input[id="slide05"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-400%);}
.section input[id="slide06"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-500%);}

</style>
<script type="text/javascript">
function showModalDialogCallback(retVal) {
	if(retVal) {
        $("#tmp_carkind").val(retVal);
        $("#autoKind").val(retVal);
    }
	fn_egov_modal_remove();
}

function fn_egov_modal_create(){
	
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px;" src="' + "<c:url value='/EgovPageLink.do'/>?" + "link=main/sample_menu/Intro" +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1400,
        height: 550
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}
</script>
	<body>

		<header>
			<div class="line">
				<a href="#"></a>
			</div>
			<div class="inner">
				<a href="#" class="logo">
					<img src="../images/logo_members.png" alt="top_logo">
				</a>

			</div>
		</header>
		<div class="section">
			<input type="radio" name="slide" id="slide01" checked>
			<input type="radio" name="slide" id="slide02">
			<input type="radio" name="slide" id="slide03">
			<input type="radio" name="slide" id="slide04">
			<input type="radio" name="slide" id="slide05">
			<input type="radio" name="slide" id="slide06">
			<form name="kioskform" id="kioskform" action="<c:url value='/kiosk/InsertKioskRcpt.do'/>" method="post">
				<input type="hidden" name="taskstat" value="<c:out value='CB-receipt'/>">
				<input type="hidden" name="mode">
				<input type="hidden" name="customerid">
				<input type="hidden" name="carnum">
				<input type="hidden" name="name">
				<input type="hidden" name="kind">
				<input type="hidden" name="tel">
				<input type="hidden" name="takeseq">
				<input type="hidden" name="repairlist" id="repairlist">
				<input type="hidden" name="chkrepairlist" id="chkrepairlist">
				
			</form>
			<div class="slidewrap">
				<ul class="slidelist">
					<!-- 메인화면 01 -->
					<li>
						<div class="content">
							<div class="main_logo">
								<a href="#" class="main_logo_img">
									<img src="../images/kia_seo.png" alt="main_logo">
								</a>
							</div>
							<div class="bt">
								<!-- <label for="slide02"></label> -->
								<a href="#" onclick="moveTo('slide02','normal')" class="btn btn1 r_btn">일반 접수</a>
								<a href="#" onclick="moveTo('slide02','reserve')" class="btn btn1 r_btn">예약 확인</a>
								<!-- <a href="#" class="btn r_btn">예약 접수</a> -->
							</div>
							<div class="insertmember">
								<a href="#" onclick="MemberPopup()" class="btn btn1 r_btn">고객등록</a>
							</div>
						</div>
					</li>
					<!-- 차량번호 조회 02 -->
					<li>
						<div class="content">
							<div id="s_header">
								<div class="s_title">
									<h1> </h1>
								</div>
								<input type="button" onclick="moveTo('slide01');" value="이전" class="c_button back_num">
							</div>
							<div class="input">
								<h1 class="title">
									고객님의 차량번호와 휴대폰 번호를 입력해 주세요
								</h1>
								<div class="input_form">
									<div style="margin-top: 50px;">
										<div class="label"><label>차량번호</label></div>
										<div>
										<input type="search" class="input_num" name="searchcarnum" id="searchcarnum" onkeypress="javascript:if(event.keyCode==13)clicksearch();"></div>
									</div>
									<br>
									<div style="margin-top: 50px;">
										<div class="label"><label>휴대폰번호</label></div>
										<div>
											<input type="search" class="input_num" name="searchtel" id="searchtel">
										</div>
									</div>
									
								</div>
								<div id="searchcarwarning">

								</div>
								<!-- <span id="searchclear">X</span> -->
								
							</div>
							<!-- <div class="container">
								<a href="#" onclick="clicknum('1');" class="button btnPush btnBlueGreen"><label>1</label></a>
								<a href="#" onclick="clicknum('2');" class="button btnPush btnBlueGreen"><label>2</label></a>
								<a href="#" onclick="clicknum('3');" class="button btnPush btnBlueGreen"><label>3</label></a>
								<a href="#" onclick="clicknum('4');" class="button btnPush btnBlueGreen"><label>4</label></a>
								<a href="#" onclick="clicknum('5');" class="button btnPush btnBlueGreen"><label>5</label></a>
								<a href="#" onclick="clicknum('6');" class="button btnPush btnBlueGreen"><label>6</label></a>
								<a href="#" onclick="clicknum('7');" class="button btnPush btnBlueGreen"><label>7</label></a>
								<a href="#" onclick="clicknum('8');" class="button btnPush btnBlueGreen"><label>8</label></a>
								<a href="#" onclick="clicknum('9');" class="button btnPush btnBlueGreen"><label>9</label></a>
								<a href="#" onclick="clickback();" class="button btnPush btnBlueGreen material-symbols-outlined"><label>arrow_back</label></a>
								<a href="#" onclick="clicknum('0');" class="button btnPush btnBlueGreen"><label>0</label></a>
								<a href="#" onclick="clickdel();" class="button btnPush btnBlueGreen material-symbols-outlined"><label>close</label></a>								
							</div> -->
							<div class="search">
								<a href="#" onclick="clicksearch();" class="btn searchbtn material-symbols-outlined">검색search</a>
							  </div>
						</div>
					</li>
					
					<!-- 차량정보,수리내역보기,수리부분선택 03-->
					<li>
						<div class="content">
							<div id="s_header">
								<div class="s_title">
									<h1> 차량을 선택해주세요.</h1>
								</div>
								<input type="button" onclick="moveTo('slide02');" value="이전" class="c_button back_num">
							</div>
							<div id="left">
								<div class="car_img">
									<img src="../images/seltos.png">
								</div>
							</div>

							<div id=right>
								<div class="r_title">
									<h1>차량정보</h1>
								</div>
								<div id="car_content">
									<ul class="car_info">
										<li><label>차량번호 : </label><label></label></li>
										<li><label>소유주 : </label><label></label></li>
										<li><label>연락처 : </label><label></label></li>
										<li><label>차종 : </label><label></label></li>
									</ul>
									<div class="fix_history">
										<a href="#"  class="btn fix_bt">내 차 수리이력보기</a>
							
										<a href="#" onclick="moveTo('slide05');" class="btn fix_bt">정비사항선택</a>
									</div>
								</div>
							</div>
						</div>

						<!-- <div class="content">
							<div id="s_header">
								<div class="s_title">
									<h1> 차량을 선택해주세요.</h1>
								</div>
								<input type="button" onclick="moveTo('slide02');" value="이전" class="c_button back_num">
							</div>
							<div id="s_content">
								<table>
									<thead>
										<tr>
											<th>차량번호</th>
											<th>연락처</th>
											<th>차종</th>
											<th>성함</th>
											<th>선택</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div class="s_under">
									<h1>차량 정보가 없으면 안내 데스트로 문의해주세요.</h1>
								</div>
							</div>
						</div> -->
					</li>
					<!-- 정비내역보기 04 -->
					<li>
						<div class="content">
							<div id="s_header">
								<div class="s_title">
									<h1>정비내역</h1>
								</div>
								<input type="button" onclick="moveTo('slide03');" value="이전" class="c_button back_num">
							</div>
							<div id="ul">
							</div>
						</div>
					</li>

					<!-- 정비사항 선택 05-->
					<li>
						<div class="content">
							<div id="s_header">
								<div class="s_title">
									<h1>정비내용을 선택해 주세요</h1>
								</div>
								<input type="button" onclick="moveTo('slide03');" value="이전" class="c_button back_num">
							</div>
							<strong>정비내용 선택</strong>
							<div class="cont left">
								<div class="scrollBox01">
									<ul id="rcrListUL">
										<c:forEach var="i" items="${leadtimelist.infolist}" varStatus="istatus">
										<li class="box_tit">
											<a href="#">${i.NAME}</a>
											<ul>
											<c:forEach var="j" items="${i.LIST}" varStatus="jstatus">
												<li>
													<input id="mtn_cont${istatus.count}_${jstatus.count}" type="checkbox" name="mtn_cont" value="<c:out value='${j.CODE}'/>" data-time="<c:out value='${j.LEAD_NAME}'/>" data-idx="${istatus.index}${jstatus.index}" style="width: 0px;height: 0px;">
													<label for="mtn_cont${istatus.count}_${jstatus.count}" id="${j.CODE}">${j.NAME}</label>
												</li>
											</c:forEach>
											</ul>
										</li>
										</c:forEach>
									</ul>
								</div>
							</div>
							<div class="cont left" style="width: 300px;">
								<strong>정비내용 선택사항</strong>
								<div class="scrollBox03 board_view5"style="overflow:scroll;">
									<table id="repair" style="width: 100%;">
										<colgroup>
											<col style="width:220px;">
											<col style="width:auto;">
											<!-- <col style="width:auto;"> -->
										</colgroup>
										<tbody>
										</tbody>
									</table>
								</div>
								<a href="#" onclick="InsertWebRcpt();" class="rcptBtn btn r_btn">접수신청</a>
							</div>
						</div>

					</li>
					<!-- 정비사항 선택 06-->
					<li>
						<div class="content">
							<div class="success" style="display:none;">
								<div id="s_header">
									<div class="s_title">
										<h1>접수가 완료되었습니다</h1>
									</div>
								</div>					
								<div class="e1">
									<p>접수번호:</p>
									<p>성함:</p>
									<p>차종:</p>
									<p style="text-overflow: ellipsis;width: 100%;overflow: hidden;">정비내역:</p>
								</div>
								<div class="e2">
									<p>고객 대기실 모니터링을 통해 <br>접수 현황을 확인해 보실 수 있습니다.</p>
								</div>
							</div>
							<div class="fail" style="display:none;">
								<div id="s_header">
									<div class="s_title">
										<h1>접수가 실패하였습니다</h1>
									</div>
								</div>	
								<div class="e2">
									<p>데스크에 문의해 주세요</p>
								</div>
							</div>
							<div class="footer">
								<a href="#" onclick="clickconfirm();" class="btn">확인</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>	
		<div class="popup_wrap"></div>
		<div class="popup">
			<div class="title">고객 등록</div>
			<button type="button" onclick="closepopup();" class="close_btn"></button>
			<form name="cusMberManageVO" id="cusMberManageVO" method="post">
				<!-- <input type="hidden" name="device" value="kiosk"> -->
				<table>
					<tr>
						<td class="lb">성명<span class="req"></span></td>
						<td><input type="text" name="cusNm" id="cusNm"></td>
					</tr>
					<tr>
						<td class="lb">연락처<span class="req"></span></td>
						<td><input type="text" class="phoneNumber" name="cusTel" id="cusTel"></td>
					</tr>
					<tr>
						<td class="lb">차량번호<span class="req"></span></td>
						<td><input type="text" name="autoNo" id="autoNo"></td>
					</tr>
					<tr>
						<td class="lb">차량종류</td>
						<td><input type="text" id="tmp_carkind" onclick="fnKindCheck();" readonly><input type="hidden" name="autoKind" id="autoKind"><button type="button" class="search_btn" onclick="fnKindCheck();"></button></td>
					</tr>
				</table>
			</form>
			<div class="insert_member_btn"><a href="#" onclick="fnInsert();return false;" class="btn btn1 r_btn">등록</a></div>
			
		</div>
	</body>
	
	
</html>


<script>
$(document).on("keyup", "#searchtel", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});
$(document).ready(function () {
	$(".popup_wrap").css("display","none");
	$(".popup").css("display","none");
});
function openpopup()
{
	initialization_input();
	$(".popup_wrap").css("display","none");
	$(".popup").css("display","none");
}
function closepopup()
{
	initialization_input();
	$(".popup_wrap").css("display","none");
	$(".popup").css("display","none");
}
//팝업 입력창 초기화
function initialization_input()
{
	$("#cusNm").val('');
	$("#cusTel").val('');
	$("#autoNo").val('');
	$("#tmp_carkind").val('');
	$("#autoKind").val('');
}

$(document).on("keyup","#searchcarnum",function () { 
	// console.log($(this).val());
	if($(this).val().length >=8)
	{
		$(this).val($(this).val().slice(0,7));
	}
});

$(document).on("keyup", ".phoneNumber", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});

function fnKindCheck(){
    var url = "<c:url value='/mdm/searchKindPopupView.do'/>?";
    
    // var varParam = new Object();
    // var checkKind = document.CusMberManageVO.autoKind.value;
    // var varParam = "checkKind="+checkKind;
    
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px;" src="' + "<c:url value='/mdm/searchKindPopupView.do'/>?" +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 600,
        height: 400
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

function fnInsert(){
	//고객명 입력 여부
	if($("input[name=cusNm]").val()=="")
	{
		alert("고객명을 입력해주세요");
		$("input[name=cusNm]").focus();
		return;
	}
	if($("input[name=autoNo]").val()=="")
	{
		alert("차량번호를 입력해 주세요");
		$("input[name=autoNo]").focus();
		return;
	}
	if(carNumCheck($("input[name=autoNo]").val()) ==false)
	{
		alert("차량번호 형식이 맞지 않습니다. 다시 확인해 주세요");
		$("input[name=autoNo]").focus();
		return;
	}
	if($("input[name=cusTel]").val()=="")
	{
		alert("연락처를 입력해 주세요");
		$("input[name=cusTel]").focus();
		return;
	}
	var form = $("#cusMberManageVO")[0];
	var formdata = new FormData(form);
	
	$.ajax({
        type: "post",
        url: "/customer/KioskSmartCusMberInsert.do",
		processData:false,
		contentType:false,
        data: formdata,
        success: function (resp) {
			console.log(resp);
			if(resp =="1"||resp ==1)
			{
				$(".insert_member_btn a").text("등록되었습니다. 잠시후 창이 닫힙니다.");
				setTimeout(function(){
					$(".insert_member_btn a").text("등록");
					$(".popup_wrap").css("display","none");
					$(".popup").css("display","none");
				},3000);
			}
			else
			{
				$(".insert_member_btn a").text("오류, 중복된 차량정보가 있습니다. 데스크에 문의해 주세요");
				setTimeout(function(){
					$(".insert_member_btn a").text("등록");
				},5000);
			}
		}
    });


}

function moveTo(num,mode='')
{
	if(num == "slide01")
	{
		$("input[name=mode]").val('');
		carnum ="";
		$("#searchcarnum").val(carnum);
		$("#searchtel").val('');
	}
	if(num=="slide02" && $("input[name=mode]").val() == "" && mode !='')
	{
		$("#searchcarwarning").text("");
		$("input[name=mode]").val(mode);
		setTimeout(function(){
			$("#searchcarnum").focus();
		},1000);
	}

	//정비사항 화면
	if(num == "slide05")
	{
		var checkedlist = $("input[name=mtn_cont]:checked");
		checkedlist.each(function(){
			$(this).prop("checked",false);
		});
		$("#repair tbody").empty();
		$("li.box_tit a").parent().removeClass("active");
	}
	else if(num == "slide02")
	{
		carnum ="";
		$("#searchcarnum").val(carnum);
		$("searchtel").val('');

	}
	else if(num == "slide03" && $("input[name=mode]").val() == "reserve")
	{
		moveTo("slide02");
		return;
	}
	$("input[id="+num+"]").prop("checked",true);
}
var carnum="";
function clicknum(num)
{
	// if((carnum.length+1) >= 5)
	// 	return;
	// carnum += num;

	// $("#carnum").val(carnum);
}
function carNumCheck(str) {
	if (/^\d{2}[가-힣]\d{4}/.exec(str) !== null && str.length === 7) {
		return true;
	}
	if (/^\d{3}[가-힣]\d{4}/.exec(str) !== null && str.length === 8) {
		return true;
	}
	return false;
}

// function clickback()
// {
// 	if(carnum=="")
// 		return;
		
// 	carnum = carnum.slice(0,carnum.length-1)
// 	// console.log(carnum);
// 	$("#carnum").val(carnum);
	
// }

// function clickdel()
// {
// 	carnum='';
// 	$("#carnum").val(carnum);
// }

function clicksearch()
{
	carnum = $("#searchcarnum").val();
	var mode = $("input[name=mode]").val();
	if(carNumCheck(carnum)==false)
	{
		var text = "차량번호 형식이 알맞지 않습니다. 다시 확인해 주세요";
		$("#searchcarwarning").text(text);
		$("#searchcarnum").focus();

		return;
	}
	
	var searchtel = $("#searchtel").val();
	
	if(mode == "normal"){
		$.ajax({
			type: "post",
			url: "/kiosk/SelectCarInfo.do",
			//contentType:"application/json;charset=UTF-8",
			//dataType:"json",
			data: {
				carnum:carnum,
				tel:searchtel,
				mode:mode
			},
			success: function (resp) {
				console.log(resp);
				if(resp ==""|| resp==null)
				{
					var text = "차량 정보가 없습니다. 고객등록을 먼저 진행해 주세요";
					$("#searchcarwarning").text(text);
					// setTimeout(function(){
					// 	moveTo("slide01");
					// },3000)
					return;
				}
				clickCar(resp[0].CUSTOMER_AUTONO,resp[0].CUSTOMER_NAME,resp[0].CUSTOMER_AUTOKIND,resp[0].CUSTOMER_TEL,resp[0].CUSTOMER_ID);
				// var cartbody = $("#s_content table tbody");
				
				// // console.log(cartbody);
				// html="";

				// if(resp==null||resp=="")
				// {
				// 	html+="<tr>";
				// 	html+="<td colspan='5'>차량 정보가 없습니다.</td>";
				// 	 html+="</tr>";
				// }
				// else
				// {
				// 	$.each(resp, function (index, item) { 
				// 		html+="<tr>";
				// 		html+="<td>"+item.CUSTOMER_AUTONO+"</td>";
				// 		html+="<td>"+item.CUSTOMER_TEL+"</td>";
				// 		html+="<td>"+item.CUSTOMER_AUTOKIND+"</td>";
				// 		html+="<td>"+item.CUSTOMER_NAME+"</td>";
				// 		html+="<td><a href='#' class='c_button' onclick=\"clickCar('"+item.CUSTOMER_AUTONO+"','"+item.CUSTOMER_NAME+"','"+item.CUSTOMER_AUTOKIND+"','"+item.CUSTOMER_TEL+"','"+item.CUSTOMER_ID+"');\">선택</a></td>";
				// 		html+="</tr>";
				// 	});
				// }
				// cartbody.html(html);
				
				// moveTo('slide03');
			}
		});
	}
	else if(mode == "reserve")
	{
		$.ajax({
			type: "post",
			url: "/kiosk/SelectReserveCarInfo.do",
			//contentType:"application/json;charset=UTF-8",
			//dataType:"json",
			data: {
				carnum:carnum,
				tel:searchtel
			},
			success: function (resp) {
				console.log(resp);
				//정보 없을시
				if(resp ==""|| resp==null)
				{
					var text = "예약 정보가 없습니다. 데스크에 문의해 주세요";
					$("#searchcarwarning").text(text);
					return;
				}
				clickCar(resp[0][0].CUSTOMER_AUTONO,resp[0][0].CUSTOMER_NAME,resp[0][0].CUSTOMER_AUTOKIND,resp[0][0].CUSTOMER_TEL,resp[0][0].CUSTOMER_ID,resp[2],resp[1][0].TAKESEQ);
				
			}
		});
	}
	
}

function clickCar(carnum,name,kind,tel,id,repairs='',seq=''){
	$(".car_info").children("li:eq(0)").children("label:eq(1)").text(carnum);
	$(".car_info").children("li:eq(1)").children("label:eq(1)").text(name);
	$(".car_info").children("li:eq(2)").children("label:eq(1)").text(tel);
	$(".car_info").children("li:eq(3)").children("label:eq(1)").text(kind);
	$(".fix_history").children("a:eq(0)").attr("onclick","clickRepair('"+id+"');")

	$("input[name=customerid]").val(id);
	$("input[name=carnum]").val(carnum);
	$("input[name=name]").val(name);
	$("input[name=kind]").val(kind);
	$("input[name=tel]").val(tel);
	$("input[name=takeseq]").val(seq);

	if($("input[name=mode]").val()=="normal")
		moveTo('slide03');
	else if($("input[name=mode]").val()=="reserve")
	{
		
		moveTo('slide05');
		console.log("each 체크")
		$.each(repairs,function(index,item){
			var checkbox_idx = $("input[value="+item.REPAIRCODE+"]").data("idx");
			var repairtext = $("label[id="+item.REPAIRCODE+"]").text();
			var checkbox_val = $("input[value="+item.REPAIRCODE+"]").val();
			var repairhtml = $("#repair").children("tbody");    

			// console.log($("input[value="+item.REPAIRCODE+"]"));
			$("input[value="+item.REPAIRCODE+"]").prop("checked",true);

			var html='';
            html+="<tr id='repair_"+(checkbox_idx)+"'>";
            html+="<td>"+repairtext+"</td>";
            html+="<input type='hidden' name='repaircode' id='repaircode' value='"+checkbox_val+"'/>";
            html+="</tr>";
            repairhtml.append(html);			
		});
		
	}
}

function clickRepair(id)
{
	$.ajax({
        type: "post",
        url: "/kiosk/SelectCarRepairInfo.do",
		// contentType:"application/json;charset=UTF-8",
        // dataType:"json",
        data: {
        	id:id
        },
        success: function (resp) {
			console.log(resp);
			if(resp == null)
			{
				
				alert("정보가 없습니다.");
				return;
			}
			else
			{
				var html ="";
				var repair_selector = $("#ul");
				$.each(resp, function (index, item) {
					// var receipt_stamp = item.RECEIPTDATE;
					// var receiptdate = new Date(receipt_stamp);
					html+="<ul>"+item.RECEIPTDATE;
					html+="<label onclick='clickdetail(this)'>+</label>";
					html+="<li style='display:none'>";
					html+="<ul>주행거리 : "+item.KILRO_NOW+"KM</ul>";
					html+="<table>";
					html+="<colgroup>";
					html+="<col width='400px'>"
					html+="<col width='200px'>"
					html+="<col width='300px'>"
					html+="</colgroup>";
					$.each(item.DETAIL, function (jndex, jtem) { 
						html+="<tr>";
						html+="<td>"+jtem.REPAIRNAME+"</td>";
						html+="<td>"+jtem.METHODNAME+"</td>";
						html+="<td>"+(jtem.REPAIR_NOTE=='null')?'':jtem.REPAIR_NOTE+"</td>";
						html+="</tr>";
					});
					html+="</table>";		
					html+="</li>";
					html+="</ul>";
					
				});
				
				
				repair_selector.html(html);
				moveTo("slide04");
			}
			// var cartbody = $("#s_content table tbody");
			
        }
    });
}

function clickdetail(e)
{
	console.log($(e));
	if($(e).parent().children("li").css("display")=="none")
		$(e).parent().children("li").show("0.1");
	else
		$(e).parent().children("li").hide("0.1");
}

$("li.box_tit a").click(function(){
    // console.log($(this));
    if($(this).parent().hasClass("active"))
        $(this).parent().removeClass("active");
    else
        $(this).parent().addClass("active");
});

$(".box_tit ul li label").click(function(){
    var $this = $(this);
	$this.css("pointer-events","none");
    setTimeout(function(){
        var checkbox =$this.parent().find("input");
        // console.log(checkbox);
        var checkbox_val = checkbox.val();
        var checkbox_idx = checkbox.data("idx");
        var repairtext = $this.text();       
        var repairhtml = $("#repair").children("tbody");       

        if(checkbox.is(":checked")==false)
        {
            $("[id=repair_"+checkbox_idx+"]").remove();
			
        }
        else
        {
            var html='';
            html+="<tr id='repair_"+(checkbox_idx)+"'>";
            html+="<td>"+repairtext+"</td>";
            html+="<input type='hidden' name='repaircode' id='repaircode' value='"+checkbox_val+"'/>";
            html+="</tr>";
            repairhtml.append(html);
			
        }
		
		$this.css("pointer-events","auto");

    },200)
});

function InsertWebRcpt()
{
	var mode = $("input[name=mode]").val();
	var takeseq = $("input[name=takeseq]").val();
	if(mode == "reserve")
	{
		$.ajax({
			type: "post",
			url: "/kiosk/KioskReserveConfirm.do",
			data: {takeseq : takeseq},
			success: function (resp) {
				console.log(resp);
				if(resp==null || resp=="")
				{
					moveTo("slide06");
					$(".fail").show();				
				}
				else if(resp != null)
				{
					var infohtml = $(".success").find(".e1").find("p");
					var info = resp[0];
					// console.log(info);
					// console.log(infohtml);
					infohtml.eq(0).text("접수번호 : "+info.SEQ);
					infohtml.eq(1).text("성함 : "+info.CUSTOMER_NAME);
					infohtml.eq(2).text("차종 : "+info.KIND);
					infohtml.eq(3).text("정비내역 : "+info.ENUM);

					moveTo("slide06");
					$(".success").show();

				}
			}
		});
	}
	else if(mode=="normal")
	{
		//수리항목 리스트화
		var chkrepairarray = new Array();
		var array = new Array();
		$('input[name=repaircode]').each(function(index) {
			array.push($(this).val());
			chkrepairarray.push("CB-general");
		});
		$("#repairlist").val(array);
		$("#chkrepairlist").val(chkrepairarray);
		if($("#repairlist").val()==null||$("#repairlist").val()=='')
		{
			alert("추가된 정비사항이 없습니다. 정비사항을 추가해 주세요.");
			return;
		}
		var form = $("#kioskform")[0];
		var formdata = new FormData(form);
		
		$.ajax({
			type: "post",
			url: "/kiosk/InsertKioskRcpt.do",
			processData:false,
			contentType:false,
			data: formdata,
			success: function (resp) {
				
				console.log(resp);
				if(resp==null || resp=="")
				{
					moveTo("slide06");
					$(".fail").show();				
				}
				else if(resp != null)
				{
					var infohtml = $(".success").find(".e1").find("p");
					var info = resp[0];
					console.log(info);
					console.log(infohtml);
					infohtml.eq(0).text("접수번호 : "+info.TAKESEQ);
					infohtml.eq(1).text("성함 : "+info.NAME);
					infohtml.eq(2).text("차종 : "+info.KIND);
					infohtml.eq(3).text("정비내역 : "+info.ENUM);

					moveTo("slide06");
					$(".success").show();

				}
			}
		});
	}


	
}

function clickconfirm()
{
	// clickdel();
	$(".success").hide();
	$(".fail").hide();
	// $("#popup_wrap").css("display","none");
	// $(".success").css("display","none")
	// $(".fail").css("display","none")
	moveTo("slide01");
}


function MemberPopup()
{
	$(".popup_wrap").css("display","block");
	$(".popup").css("display","block");
}

</script>