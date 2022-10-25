
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

<script type="text/javascript">
</script>
</head>
<body>

	<div class="container">
		<div id ="test">
			<div class="monitoring content">
				<div class="sub_in" style="float: left; min-height: 100vh;">
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
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 40%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">접수번호</th>
											<th scope="col">차량번호</th>
											<th scope="col">차종</th>
											<th scope="col">정비내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="14" varStatus="status">
											<tr>
												<td><c:out value="${Guest[status.index].SEQ}" /></td>
												<td><c:out value="${Guest[status.index].AUTONUMBER}" /></td>
												<td><c:out value="${Guest[status.index].CUSTOMER_AUTOKIND}" /></td>
												<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${Guest[status.index].REPAIRCODE_NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="sub_in" style="float:right; min-height: 100vh;">
					<div class="layout">
						<div class="teamtables teamtb"id="Team_1">
							<div class="top_line"></div>
							<div class="header">
								<h1 class="tit_1 team_left">A반 작업 현황</h1>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
							</div>
							<div class="board_list">
								<table id="atable" style="table-layout: fixed;">
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 40%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">차량번호</th>
											<th scope="col">차종</th>
											<th scope="col">예상완료시간</th>
											<th scope="col">정비내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="14" varStatus="status">
											<tr>
												<td><c:out value="${TeamA[status.index].AUTONUMBER}" /></td>
												<td><c:out value="${TeamA[status.index].CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${TeamA[status.index].ESTIME}" /></td>
												<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${TeamA[status.index].REPAIRCODE_NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="teamtables teamtb"id="Team_2" style="display: none;">
							<div class="top_line"></div>
							<div class="header">
								<h1 class="tit_1 team_left">B반 작업 현황</h1>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
							</div>
							<div class="board_list">
								<table id="atable" style="table-layout: fixed;">
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 40%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">차량번호</th>
											<th scope="col">차종</th>
											<th scope="col">예상완료시간</th>
											<th scope="col">정비내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="14" varStatus="status">
											<tr>
												<td><c:out value="${TeamB[status.index].AUTONUMBER}" /></td>
												<td><c:out value="${TeamB[status.index].CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${TeamB[status.index].ESTIME}" /></td>
												<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${TeamB[status.index].REPAIRCODE_NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="teamtables teamtb"id="Team_3"  style="display: none;">
							<div class="top_line"></div>
							<div class="header">
								<h1 class="tit_1 team_left">C반 작업 현황</h1>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
							</div>
							<div class="board_list">
								<table id="atable" style="table-layout: fixed;">
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 40%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">차량번호</th>
											<th scope="col">차종</th>
											<th scope="col">예상완료시간</th>
											<th scope="col">정비내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="14" varStatus="status">
											<tr>
												<td><c:out value="${TeamC[status.index].AUTONUMBER}" /></td>
												<td><c:out value="${TeamC[status.index].CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${TeamC[status.index].ESTIME}" /></td>
												<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${TeamC[status.index].REPAIRCODE_NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	
$(document).ready(function(){
	var i = 2;
	var auto_refresh = setInterval(function (){
		$('#test').load(window.location.href + " #test");
	}, 15000);
	var auto_refresh = setInterval(function (){
		console.log(i);
		console.log("#Team_"+i);
		$(".teamtb").css("display", "none");
		$("#Team_"+i).css("display", "block");
		i++;
		
		if(i==4){ i=1};

	}, 5000);
});
</script>