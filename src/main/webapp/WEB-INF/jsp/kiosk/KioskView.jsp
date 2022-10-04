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
		<link rel="stylesheet" href="/css/kiosk_common.css">
		<link rel="stylesheet" href="/css/kiosk_main.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
		<script src="<c:url value='/'/>js/ui.js"></script>
		<title>Auto Q 목포서비스센터</title>
		<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->


	</head>

<style>
/* INPUT 가리기 */
.section input[id*="slide"] {display:none;}

/* 슬라이드 영역 - max-width 크기를 조절해주면 됩니다*/
.section .slidewrap {max-width:900px;overflow:hidden;}
.section .slidelist {white-space:nowrap;font-size:0;padding: 0px;}
.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s; height: 1440px;}
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
.section input[id="slide06"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-400%);}
.section input[id="slide07"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-400%);}

</style>
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
			<input type="radio" name="slide" id="slide07">
	
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
								<a href="#" onclick="nextBtn('slide02')" class="btn btn1 r_btn">일반 접수</a>
								<a href="#" class="btn r_btn">예약 접수</a>
							</div>
						</div>
					</li>
					<!-- 차량번호 조회 02 -->
					<li>
						<div class="content">
							<div class="input">
								<h1 class="title">
									차량번호 4자리를 입력하세요
								</h1>
								<input type="text" class="input_num" name="carnum" id="carnum" value="">
							</div>
							<div class="container">
  
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
							</div>
							<div class="search">
								<a href="#" onclick="clicksearch();" class="btn searchbtn material-symbols-outlined">검색search</a>
							  </div>
						</div>
					</li>
					<!-- 조회 리스트 03-->
					<li>
						<div class="content">
							<div id="s_header">
								<div class="s_title">
									<h1> 차량을 선택해주세요.</h1>
								</div>
								<input type="button" onclick="prevBtn('slide02');" value="이전" class="c_button back_num">
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
						</div>
					</li>
					<!-- 차량정보,수리내역보기,수리부분선택 04-->
					<li>
						<div class="content">

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
										<li><label>차종 : </label><label></label></li>
									</ul>
									<div class="fix_history">
										<a href="#"  class="btn fix_bt">수리내역보기</a>
							
										<a href="../receive_fix/index.html" class="btn fix_bt">수리부분선택</a>
									</div>
								</div>
							</div>
						</div>

					</li>

					<!-- 수리내역보기 05-->
					<li>
						<div class="content">
							<div id="ul">
							</div>

						</div>

					</li>
					<!-- 정비사항 선택 (팝업) 06-->
					<li>


					</li>
				</ul>
			</div>
		</div>
	</body>
</html>


<script>
function nextBtn(aa)
{
	// console.log($("input[id="+aa+"]"));
	$("input[id="+aa+"]").prop("checked",true);
}

function prevBtn(aa)
{
	// console.log($("input[id="+aa+"]"));
	$("input[id="+aa+"]").prop("checked",true);
}
var carnum="";
function clicknum(num)
{
	carnum += num;
	$("#carnum").val(carnum);
}

function clickback()
{
	if(carnum=="")
		return;
		
	carnum = carnum.slice(0,carnum.length-1)
	// console.log(carnum);
	$("#carnum").val(carnum);
	
}

function clickdel()
{
	carnum='';
	$("#carnum").val(carnum);
}

function clicksearch()
{
    $.ajax({
        type: "post",
        url: "/kiosk/SelectCarInfo.do",
        //contentType:"application/json;charset=UTF-8",
        //dataType:"json",
        data: {
        	carnum:carnum
        },
        success: function (resp) {
			var cartbody = $("#s_content table tbody");
			
			// console.log(cartbody);
			console.log(resp);
			html="";

			if(resp==null||resp=="")
			{
				html+="<tr>";
				html+="<td colspan='5'>차량 정보가 없습니다.</td>";
				 html+="</tr>";
			}
			else
			{
				$.each(resp, function (index, item) { 
					html+="<tr>";
					html+="<td>"+item.CUSTOMER_AUTONO+"</td>";
					html+="<td>"+item.CUSTOMER_TEL+"</td>";
					html+="<td>"+item.CUSTOMER_AUTOKIND+"</td>";
					html+="<td>"+item.CUSTOMER_NAME+"</td>";
					html+="<td><a href='#' class='c_button' onclick=\"clickCar('"+item.CUSTOMER_AUTONO+"','"+item.CUSTOMER_NAME+"','"+item.CUSTOMER_AUTOKIND+"','"+item.CUSTOMER_ID+"');\">선택</a></td>";
					html+="</tr>";
				});
			}
			cartbody.html(html);
			
			nextBtn('slide03');
        }
    });
}

function clickCar(carnum,name,kind,id){
	console.log(carnum);
	console.log(name);
	console.log(kind);
	$(".car_info").children("li:eq(0)").children("label:eq(1)").text(carnum);
	$(".car_info").children("li:eq(1)").children("label:eq(1)").text(name);
	$(".car_info").children("li:eq(2)").children("label:eq(1)").text(kind);
	$(".fix_history").children("a:eq(0)").attr("onclick","clickRepair('"+id+"');")

	nextBtn('slide04');
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
					html+="<li>";
					html+="<table>";
					$.each(item.DETAIL, function (jndex, jtem) { 
						html+="<tr>";
						html+="<td>"+jtem.REPAIRNAME+"</td>";
						html+="<td>"+jtem.METHODNAME+"</td>";
						html+="<td>"+jtem.REPAIR_NOTE+"</td>";
						html+="</tr>";			 
					});
					html+="</table>";		
					html+="</li>";
					html+="</ul>";
					
				});
				
				
				repair_selector.html(html);
				nextBtn("slide05");
			}
			// var cartbody = $("#s_content table tbody");
			
        }
    });
}
</script>