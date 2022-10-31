
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
<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<link rel="stylesheet" href="<c:url value='/'/>css/monitoring.css">
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>
/* tr:nth-child(even){
	 background-color:#9cc0ff; 
	 }*/
div.marquee {
	white-space: no-wrap;
	overflow: hidden;
}

div.marquee>div.marquee-text {
	white-space: nowrap;
	display: inline;
	width: auto;
}
</style>

<script type="text/javascript">
	
	$(document).ready(function() {

		var marquee = $('div.marquee');
		console.log(marquee);
		marquee.each(function() {
			var mar = $(this);
			var indent = mar.width();
			mar.marquee = function() {
				indent--;
				mar.css('text-indent', indent);
				if (indent < -1 * mar.children('div.marquee-text').width()) {
					indent = mar.width();
				}
			};
			mar.data('interval', setInterval(mar.marquee, 300 / 60));
		});
	});
</script>
</head>
<body>

	<div class="container">
		<div id ="test">
			<div class="monitoring content">
				<div class="sub_in" style="float: left;">
					<div class="layout">
						<div class="teamtables">
							<div class="top_line"></div>
							<div class="header">
								<h1 class="tit_1 team_left">접수 현황</h1>
								<div class="logo team_left"></div>
							</div>
							<div class="board_list">
								<table id="guesttable">
									<colgroup>
										<col style="width: 25%;">
										<col style="width: 25%;">
										<col style="width: 25%;">
										<col style="width: 25%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">접수번호</th>
											<th scope="col">차량번호</th>
											<th scope="col">차종</th>
											<th scope="col">고객명</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="8" varStatus="status">
											<tr>
												<td><c:out value="${Guest[status.index].SEQ}" /></td>
												<td><c:out value="${Guest[status.index].CARNUM}" /></td>
												<td><c:out value="${Guest[status.index].CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${Guest[status.index].NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="sub_in" style="float:right;">
					<div class="layout">
						<div class="teamtables">
							<div class="top_line"></div>
							<div class="header">
								<h1 class="tit_1 team_left">작업 현황</h1>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
							</div>
							<div class="board_list">
								<table id="atable" >
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">차량번호</th>
											<th scope="col">고객명</th>
											<th scope="col">예상완료시간</th>
											<th scope="col">작업반</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="8" varStatus="status">
											<tr>
												<td><c:out value="${Team[status.index].CARNUM}" /></td>
												<td><c:out value="${Team[status.index].NAME}" /></td>
												<td><c:out value="${Team[status.index].ESTIME}" /></td>
												<td><c:out value="${Team[status.index].POSITION_NAME}" /></td>
												<td style="color:red;"><c:out value="${Team[status.index].TASKSTAT_NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div>
			<div class="layout">
				<div class="teamtables">
					<div class="top_line"></div>
					<div class="header">
						<h1 class="tit_1 team_left" style="width: 80%;">작업 완료</h1>
						<div class="logo team_left" style="width: 20%;"><img src="../images/kia_logo.png" style="width:200px;"></div>
					</div>
					<div class="board_list">
						<table id="comtable">
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 20%;">
								<col style="width: 20%;">
								<col style="width: 20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">차량번호</th>
									<th scope="col">차종</th>
									<th scope="col">고객명</th>
									<th scope="col">작업반</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach begin="0" end="2" varStatus="status">
									<tr>
										<td><c:out value="${Complete[status.index].CARNUM}" /></td>
										<td><c:out value="${Complete[status.index].CUSTOMER_AUTOKIND}" /></td>
										<td><c:out value="${Complete[status.index].NAME}" /></td>
										<td><c:out value="${Complete[status.index].POSITION_NAME}" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>		
	</div>
</div>
	<div class='marquee'>
		<div class='marquee-text' style="font-size:40px;">현장 상황에 따라 수리진행이 변동될수 있습니다. 수리가 완료된 차량은 데스크에서 출고처리 바랍니다.</div>
	</div>
	</div>
</body>
</html>
<script type="text/javascript">
var auto_refresh = setInterval(function (){$('#test').load(window.location.href + " #test");}, 30000);
</script>
