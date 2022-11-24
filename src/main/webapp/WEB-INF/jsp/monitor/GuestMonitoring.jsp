
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/component.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/monitoring.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>


<script type="text/javascript">
	
	$(document).ready(function() {
		var marquee = $('div.marquee');
		console.log(marquee);
			var mar = $(this);
			var indent = mar.width();
		setInterval(() => {
			console.log("interval");
			indent-=1;
			marquee.css('text-indent', indent);
			if(indent <= mar.width()*-1)
				indent = mar.width();
			
		}, 10);
		
		
	});
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
												<th scope="col">점검내용</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="0" end="8" varStatus="status">
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<!-- <td><c:out value="${Guest[status.index].SEQ}" /></td>
													<td><c:out value="${Guest[status.index].CARNUM}" /></td>
													<td><c:out value="${Guest[status.index].CUSTOMER_AUTOKIND}" /></td>
													<td><c:out value="${Guest[status.index].NAME}" /></td> -->
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="layout con_wid50">
							<div class="teamtables">
								<div class="header">
									<h1 class="tit_1 big_tit">작업현황</h2>
								</div>
								<div class="board_list">
									<table id="atable">
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
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<!-- <td><c:out value="${Team[status.index].CARNUM}" /></td>
													<td><c:out value="${Team[status.index].NAME}" /></td>
													<td><c:out value="${Team[status.index].ESTIME}" /></td>
													<td><c:out value="${Team[status.index].POSITION_NAME}" /></td>
													<td style="color:red;"><c:out value="${Team[status.index].TASKSTAT_NAME}" /></td> -->
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="con_box">
						<div class="layout">
							<div class="teamtables">
								<div class="header">
									<h1 class="tit_1 big_tit">작업완료</h2>
								</div>
								<div class="board_list">
									<table id="comtable">
										<colgroup>
											<col style="width: 16.67%;">
											<col style="width: 16.67%;">
											<col style="width: 16.67%;">
											<col style="width: 16.67%;">
											<col style="width: 16.67%;">
											<col style="width: 16.67%;">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">접수번호</th>
												<th scope="col">차량번호</th>
												<th scope="col">차종</th>
												<th scope="col">고객명</th>
												<th scope="col">작업반</th>
												<th scope="col">상태</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="0" end="2" varStatus="status">
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<!-- <td><c:out value="${Complete[status.index].CARNUM}" /></td>
													<td><c:out value="${Complete[status.index].CUSTOMER_AUTOKIND}" /></td>
													<td><c:out value="${Complete[status.index].NAME}" /></td>
													<td><c:out value="${Complete[status.index].POSITION_NAME}" /></td>-->
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class='marquee'>
						<div class='marquee-text'>현장 상황에 따라 수리진행이 변동될수 있습니다. 수리가 완료된 차량은 데스크에서 출고처리 바랍니다.</div>
					</div>
				</div>
				<!-- <div class="sub_in">
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
											<th scope="col">고객명</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="0" end="8" varStatus="status">
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
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
				<div class="sub_in">
					<div class="layout">
						<div class="teamtables">
							<div class="top_line"></div>
							<div class="header">
								<h1 class="tit_1 team_left">작업 현황</h1>
								<div class="logo team_left"><img src="${pageContext.request.contextPath}/images/kia_logo.png" style="width:200px;"></div>
							</div>
							<div class="board_list">
								<table id="atable" style="table-layout: fixed;">
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
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
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
						<div class="logo team_left" style="width: 20%;"><img src="${pageContext.request.contextPath}/images/kia_logo.png" style="width:200px;"></div>
					</div>
					<div class="board_list">
						<table id="comtable">
							<colgroup>
								<col style="width: 16.67%;">
								<col style="width: 16.67%;">
								<col style="width: 16.67%;">
								<col style="width: 16.67%;">
								<col style="width: 16.67%;">
								<col style="width: 16.67%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">접수번호</th>
									<th scope="col">차량번호</th>
									<th scope="col">차종</th>
									<th scope="col">고객명</th>
									<th scope="col">작업반</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach begin="0" end="2" varStatus="status">
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<!-- <td><c:out value="${Complete[status.index].CARNUM}" /></td>
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
	</div>-->
			<!--  <div class='marquee'>
				<div class='marquee-text' style="font-size:40px;">현장 상황에 따라 수리진행이 변동될수 있습니다. 수리가 완료된 차량은 데스크에서 출고처리 바랍니다.</div>
			</div>
		</div>-->
	
	</div>
</body>
</html>
<script type="text/javascript">
	var rcptlist='';
	var teamlist='';
	var completelist='';

	var total_page=0;//총 페이지수
	var total_cnt=0; //총 데이터수
	var current_page=1; //현재 페이지

	var team_total_page=0;//총 페이지수
	var team_total_cnt=0; //총 데이터수
	var team_current_page=1; //현재 페이지

	var complete_total_page=0;//총 페이지수
	var complete_total_cnt=0; //총 데이터수
	var complete_current_page=1; //현재 페이지


	$(document).ready(function () {
		//접수 테이블 리스트
		$.ajax({
			type: "post",
			url: "/SmartKia/monitor/selectRcptmonitor.do",
			success: function (response) {
				rcptlist=response;
				console.log(rcptlist);
				total_cnt = rcptlist.length;
				total_page = Math.ceil(total_cnt / 9);
			}
		});
			
		//현장반 테이블 리스트
		$.ajax({
			type: "post",
			url: "/SmartKia/monitor/selectTeammonitorall.do",
			success: function (response) {
				console.log(response);
				teamlist=response;
				team_total_cnt = teamlist.length;
				team_total_page = Math.ceil(team_total_cnt/9);
			}
		});

		//작업완료 테이블 리스트
		$.ajax({
			type: "post",
			url: "/SmartKia/monitor/selectCompletemonitor.do",
			success: function (response) {
				console.log(response);
				completelist=response;
				team_total_cnt = teamlist.length;
				team_total_page = Math.ceil(team_total_cnt/3);
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
					total_page = Math.ceil(total_cnt / 9);
				}
			});
				
			//현장반 테이블 리스트
			$.ajax({
				type: "post",
				url: "/SmartKia/monitor/selectTeammonitorall.do",
				success: function (response) {
					console.log(response);
					teamlist=response;
					team_total_cnt = teamlist.length;
					team_total_page = Math.ceil(team_total_cnt/9);
				}
			});

			//작업완료 테이블 리스트
			$.ajax({
				type: "post",
				url: "/SmartKia/monitor/selectCompletemonitor.do",
				success: function (response) {
					console.log(response);
					completelist=response;
					team_total_cnt = teamlist.length;
					team_total_page = Math.ceil(team_total_cnt/3);
				}
			});
		},60000);

		var html="";
		setInterval(function(){
			html="";
			for(var i=(current_page-1)*9 ; i < current_page*9 ; i++)
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
		},10000);


		setInterval(function(){
			
			html="";
			for(var j=(team_current_page-1)*9;j<team_current_page*9;j++)
			{
				if(teamlist[j] != null){
					html +="<tr>";
					html +="<td>"+teamlist[j].CARNUM+"</td>";
					html +="<td>"+teamlist[j].NAME+"</td>";
					html +="<td>"+teamlist[j].ESTIME+"</td>";
					html +="<td>"+teamlist[j].POSITION_NAME+"</td>";
					html +="<td style=\"color:red;\">"+teamlist[j].TASKSTAT_NAME+"</td>";
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
			team_current_page++;
			if(team_current_page > team_total_page)
				team_current_page=1;
			
		},10000);


		setInterval(function(){
			
			html="";
			for(var j=(complete_current_page-1)*3;j<complete_current_page*3;j++)
			{
				if(completelist[j] != null){
					html +="<tr>";
					html +="<td>"+completelist[j].SEQ+"</td>";
					html +="<td>"+completelist[j].CARNUM+"</td>";
					html +="<td>"+completelist[j].CUSTOMER_AUTOKIND+"</td>";
					html +="<td>"+completelist[j].NAME+"</td>";
					html +="<td>"+completelist[j].POSITION_NAME+"</td>";
					html +="<td>"+completelist[j].TASKSTAT_NAME+"</td>";
					// html +="<td>"+completelist[j].TASKSTAT_NAME+"</td>";
					html +="</tr>";
				}
				else{
					html +="<tr>";
					html +="<td></td>";
					html +="<td></td>";
					html +="<td></td>";
					html +="<td></td>";
					html +="<td></td>";
					html +="<td></td>";
					html +="</tr>";
				}
			}
			var tbody = $("#comtable tbody");
			tbody.html('');
			tbody.html(html);
			// $(".completetb .tit_1").text((complete_current_complete+1)+"반 작업 현황");
			complete_current_page++;
			if(complete_current_page > complete_total_page)
				complete_current_page=1;
			
		},10000);
	});
</script>
