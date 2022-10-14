
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images_old/egovframework/com/uss/olp/qtm/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>모니터링</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
<!-- <link rel="stylesheet" href="<c:url value='/'/>css/layout.css"> -->
<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<link rel="stylesheet" href="<c:url value='/'/>css/tablet.css?after">
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>

</style>

<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="container">
		<div class="teamtables">
			<div class="top_line"></div>
			<div class="header">
				<h1 class="tit_1 team_left">차량정보 자세히 보기</h1>
				<div class="logo team_right"><img src="../images/kia_logo.png" style="width:200px;"></div>
			</div>
		</div>

		<strong>차량정보</strong>
		<div class="vehicleinfo_1">
			<div><strong>차량번호</strong><input type="text"></div>
			<div><strong>주행거리</strong><input type="text"></div>
			<div><strong>차종</strong><input type="text"></div>
			<div><strong>고객명</strong><input type="text"></div>
			<div><strong>연락처</strong><input type="text"></div>
			<div><strong style="height: 59px;"></strong><a href="#">수리이력 확인하기</a></div>
		</div>

		<strong>정비내역</strong>
		<div class="vehicleinfo_2">
			<div class="repairselect">
				<!-- <strong>정비내용 선택</strong> -->
				<div class="cont">
					<div class="scrollBox01">
						<ul id="rcrListUL">
							<c:forEach var="i" items="${leadtimelist.infolist}" varStatus="istatus">
								<li class="box_tit">
									<a href="#">${i.NAME}</a>
									<ul>
										<c:forEach var="j" items="${i.LIST}" varStatus="jstatus">
											<li>
												<input id="mtn_cont${istatus.count}_${jstatus.count}" type="checkbox" name="mtn_cont"
													value="<c:out value='${j.CODE}'/>" data-time="<c:out value='${j.LEAD_NAME}'/>"
													data-idx="${istatus.index}${jstatus.index}" style="width: 0px;height: 0px;">
												<label for="mtn_cont${istatus.count}_${jstatus.count}">${j.NAME}</label>
											</li>
										</c:forEach>
									</ul>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
			</div>
			<div class="repairpreview">
				<div class="cont">
					<strong>정비내용 선택사항</strong>
					<div class="scrollBox03 board_view5"style="overflow:scroll;">
						<table id="repair">
							<colgroup>
								<col style="width:220px;">
								<col style="width:auto;">
								<!-- <col style="width:auto;"> -->
							</colgroup>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="remark">
				<div class="cont">
					<strong>비고</strong>
					<textarea name="" id="" cols="30" rows="10"></textarea>
				</div>
			</div>
		</div>
		<div class="vehicleinfo_3">
			<div class="info3_1">
				<strong>총 주행거리</strong>
				<div><input type="text">km</div>
			</div>
			<div class="info3_2">
				<div><strong>예상소요시간</strong></div>
				<div><input type="text">분</div>
			</div>
			<div class="info3_3">
				<div><strong>작업반</strong></div>
				<div><input type="text"></div>
			</div>
			
			<div><a href="" class="assign"><strong>정비 입고</strong></a></div>
		</div>
		
	</div>
</body>
</html>


<script>
$("#normal").click(function(){
    console.log("일반");
    $("#reserve").removeClass("active");
    $("#normal").addClass("active");
    $("#tab2").css("display","none");
    $("#tab1").css("display","block");
});

$("#reserve").click(function(){
    console.log("예약");
    $("#normal").removeClass("active");
    $("#reserve").addClass("active");
    $("#tab1").css("display","none");
    $("#tab2").css("display","block");


});

</script>