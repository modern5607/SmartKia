
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
<!-- <link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css"> -->
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
				<div class="top_title">
					<div class="top_inner">
						<div class="left">
							<img src="${pageContext.request.contextPath}/images/logo_w.svg">
							<h4 class="b_tit"><span>Domestic</span> KIA AUTO Q service center informaition</h2>
						</div>
						<div class="right">
							<img src="${pageContext.request.contextPath}/images/autoQ_log.png">
							<h2 class="t_tit">KIA MOTORS AUTO Q SERVICE</h2>
						</div>
					</div>
				</div>
				<div class="contant_wrap">
					<div class="con_box">
						<div class="layout con_wid50">
							<div class="teamtables">
								<div class="header">
									<h1 class="tit_1 big_tit">접수현황</h2>
								</div>
								<div class="board_list">
									<table id="guesttable">
										<colgroup>
											<col style="width: 15%;">
											<col style="width: 15%;">
											<col style="width: 20%;">
											<col style="width: 50%;">
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
											<tr>
												
											</tr>
											<c:forEach begin="0" end="14" varStatus="status">
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<!-- <td><c:out value="${Guest[status.index].SEQ}" /></td>
													<td><c:out value="${Guest[status.index].CARNUM}" /></td>
													<td><c:out value="${Guest[status.index].CUSTOMER_AUTOKIND}" /></td>
													<td><c:out value="${Guest[status.index].REPAIRCODE_NAME}" /></td> -->
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="layout con_wid50">
							<div class="teamtables teamtb"id="Team_1"">
								<div class="header">
									<h1 class="tit_1 big_tit">1반 작업 현황</h1>
								</div>
								<div class="board_list">
									<table id="atable">
										<colgroup>
											<col style="width: 15%;">
											<col style="width: 15%;">
											<col style="width: 15%;">
											<col style="width: 15%;">
											<col style="width: auto;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">접수번호</th>
												<th scope="col">차량번호</th>
												<th scope="col">차종</th>
												<th scope="col">예상완료시간</th>
												<th scope="col">정비내용</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="0" end="14" varStatus="status">
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<!-- <td><c:out value="${TeamA[status.index].SEQ}" /></td>
													<td><c:out value="${TeamA[status.index].CARNUM}" /></td>
													<td><c:out value="${TeamA[status.index].CUSTOMER_AUTOKIND}" /></td>
													<td><c:out value="${TeamA[status.index].ESTIME}" /></td>
													<td><c:out value="${TeamA[status.index].REPAIRCODE_NAME}" /></td> -->
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				
				<!-- <div class="sub_in" style="float: left; min-height: 100vh;">
					<div class="layout">
						<div class="teamtables">
							<div class="top_line"></div>
							<div class="header">
								<h1 class="tit_1 team_left">접수 현황</h1>
								<div class="logo team_left"></div>
							</div>
							<div class="board_list">
								<table id="guesttable" style="table-layout: fixed;">
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 20%;">
										<col style="width: 50%;">
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
										<tr>
											
										</tr>
										<c:forEach begin="0" end="14" varStatus="status">
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<!-- <td><c:out value="${Guest[status.index].SEQ}" /></td>
												<td><c:out value="${Guest[status.index].CARNUM}" /></td>
												<td><c:out value="${Guest[status.index].CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${Guest[status.index].REPAIRCODE_NAME}" /></td>
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
								<h1 class="tit_1 team_left">1반 작업 현황</h1>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
							</div>
							<div class="board_list">
								<table id="atable" style="table-layout: fixed;">
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: auto;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">접수번호</th>
											<th scope="col">차량번호</th>
											<th scope="col">차종</th>
											<th scope="col" style="font-size: 25px;">예상완료시간</th>
											<th scope="col">정비내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="14" varStatus="status">
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<!-- <td><c:out value="${TeamA[status.index].SEQ}" /></td>
												<td><c:out value="${TeamA[status.index].CARNUM}" /></td>
												<td><c:out value="${TeamA[status.index].CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${TeamA[status.index].ESTIME}" /></td>
												<td><c:out value="${TeamA[status.index].REPAIRCODE_NAME}" /></td> 
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>-->
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	
	var rcptlist='';
	var teamlist='';
	var total_page=0;//총 페이지수
	var total_cnt=0; //총 데이터수
	var current_page=1; //현재 페이지
	var current_team=0; //0:1반, 1:2반, 2:3반

function init()
{
	
}

$(document).ready(function(){
	
	//접수 테이블 리스트
	$.ajax({
		type: "post",
		url: "/SmartKia/monitor/selectRcptmonitor.do",
		success: function (response) {
			rcptlist=response;
			console.log(rcptlist);
			total_cnt = rcptlist.length;
			total_page = Math.ceil(total_cnt / 15);
		}
	});
		
	//현장반 테이블 리스트
	$.ajax({
		type: "post",
		url: "/SmartKia/monitor/selectTeammonitor.do",
		success: function (response) {
			console.log(response);
			teamlist=response;
		}
	});
	

	setInterval(function(){
		//접수 테이블 리스트
		$.ajax({
			type: "post",
			url: "/SmartKia/monitor/selectRcptmonitor.do",
			success: function (response) {
				rcptlist=response;
				console.log(rcptlist);
				total_cnt = rcptlist.length;
				total_page = Math.ceil(total_cnt / 15);
			}
		});
			
		//현장반 테이블 리스트
		$.ajax({
			type: "post",
			url: "/SmartKia/monitor/selectTeammonitor.do",
			success: function (response) {
				console.log(response);
				teamlist=response;
			}
		});
	},60000);

	
	var html="";
	setInterval(function(){
		html="";
		for(var i=(current_page-1)*15 ; i < current_page*15 ; i++)
		{
			if(rcptlist[i]!=null){
				html +="<tr>";
				html +="<td>"+rcptlist[i].SEQ+"</td>";
				html +="<td>"+rcptlist[i].CARNUM+"</td>";
				html +="<td>"+rcptlist[i].CUSTOMER_AUTOKIND+"</td>";
				html +="<td>"+rcptlist[i].REPAIRCODE_NAME+"</td>";
				html +="</tr>";
			}
			else{
				html +="<tr>";
				html +="<td></td>";
				html +="<td></td>";
				html +="<td></td>";
				html +="<td></td>";
				html +="</tr>";
			}
		}
		tbody = $("#guesttable tbody");
		tbody.html('');
		tbody.html(html);
		current_page++;
		if(current_page > total_page)
			current_page=1;
	},10000)


	setInterval(function(){
		
		html="";
		for(var j=0;j<15;j++)
		{
			if(teamlist[current_team][j] != null){
				html +="<tr>";
				html +="<td>"+teamlist[current_team][j].SEQ+"</td>";
				html +="<td>"+teamlist[current_team][j].CARNUM+"</td>";
				html +="<td>"+teamlist[current_team][j].CUSTOMER_AUTOKIND+"</td>";
				html +="<td>"+teamlist[current_team][j].ESTIME+"</td>";
				html +="<td>"+teamlist[current_team][j].REPAIRCODE_NAME+"</td>";
				html +="</tr>";
			}
			else{
				html +="<tr>";
				html +="<td></td>";
				html +="<td></td>";
				html +="<td></td>";
				html +="<td></td>";
				html +="<td></td>";
				html +="</tr>";
			}
		}
		var tbody = $("#atable tbody");
		tbody.html('');
		tbody.html(html);
		$(".teamtb .tit_1").text((current_team+1)+"반 작업 현황");
		current_team++;
		if(current_team >= 3)
			current_team=0;
		
	},10000)

});
</script>