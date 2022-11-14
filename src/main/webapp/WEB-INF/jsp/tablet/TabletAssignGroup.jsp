
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
<c:set var="ImgUrl" value="/images_old/egovframework/com/uss/olp/qtm/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>접수현황</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/component.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tablet.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<style>

</style>

<script type="text/javascript">
	function refresh(){
		location.reload();
    }

    function detail(takeseq){
        // alert("테스트2");
		document.assignform.takeseq.value= takeseq;
		document.assignform.submit();
    }
</script>
</head>
<body>

	<div class="container">
		<div id ="test">
			<div class="monitoring content">
				<div class="sub_in">
					<div class="layout">
						<div class="teamtables">
							<div class="top_line"></div>
							<div class="header">
								<form name="assignform" action="<c:url value='/tablet/TabletAssignView.do'/>" method="post">
									<input type="hidden" name="takeseq">
								</form>
								<h1 class="tit_1 team_left">접수 현황</h1>
                                <div class="tab team_click active" id="normal">일반접수</div>
                                <div class="tab team_click" id="reserve">예약접수</div>
								
								<div class="menu_btn"><a href="#"><img src="${pageContext.request.contextPath}/images/ico_allmenu_2.png"></a></div>
								<div class="logo team_right"><img src="${pageContext.request.contextPath}/images/kia_logo.png"></div>
								<div class="menu_bg"></div>
								<div class="sidebar_menu">
									<div class="close_btn"><a href="#"><img src="${pageContext.request.contextPath}/images/ico_allmenu_close_2.png"></a></div>
									<ul class="menu_wrap">
										<li><a href="${pageContext.request.contextPath}/tablet/TabletAssignGroup.do">접수현황</a></li>
										<li><a href="${pageContext.request.contextPath}/tablet/TabletWorkGroup.do">반별입고현황</a></li>
									</ul>
									<div style="position: absolute; bottom: 70px;"><img src="${pageContext.request.contextPath}/images/kia_seo.png"></div>
								</div>
							</div>
							<div class="board_list" id="tab1">
								<table id="guesttable" style="table-layout: fixed;">
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 40%;">
                                        <col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">접수번호</th>
											<th scope="col">차량번호</th>
											<th scope="col">차종</th>
											<th scope="col">정비내역</th>
                                            <th scope="col"><img src="${pageContext.request.contextPath}/images/refresh.png" style="width: 30px;" onclick="refresh();"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="result" items="${resultList}"
                                            varStatus="status">
											<tr>
												<td><c:out value="${result.SEQ}" /></td>
												<td><c:out value="${result.AUTONUMBER}" /></td>
												<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
												<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${result.REPAIRCODE_NAME}" /></td>
                                                <td><a href="#" class="btntablet" onclick="detail('${result.TAKESEQ}');">상세정보</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
                            <div class="board_list" id="tab2" style="display: none;">
								<table id="guesttable">
									<colgroup>
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 15%;">
										<col style="width: 40%;">
                                        <col style="width: 15%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">접수번호</th>
											<th scope="col">차량번호</th>
											<th scope="col">차종</th>
											<th scope="col">정비내역</th>
                                            <th scope="col"><img src="${pageContext.request.contextPath}/images/refresh.png" style="width: 30px;" onclick="refresh();"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="result" items="${reserve}"
                                            varStatus="status">
											<tr>
												<td><c:out value="${result.SEQ}" /></td>
												<td><c:out value="${result.AUTONUMBER}" /></td>
												<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
												<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${result.REPAIRCODE_NAME}" /></td>
                                                <td><a href="#LINK" class="btntablet" onclick="detail('${result.TAKESEQ}');">상세정보</a></td>
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


<script>
$("#normal").click(function(){
    $("#reserve").removeClass("active");
    $("#normal").addClass("active");
    $("#tab2").css("display","none");
    $("#tab1").css("display","block");
});

$("#reserve").click(function(){
    $("#normal").removeClass("active");
    $("#reserve").addClass("active");
    $("#tab1").css("display","none");
    $("#tab2").css("display","block");
});
$(document).ready(function(){
	$('.menu_btn>a').on('click',function(){
	$('.menu_bg').show();
	$('.sidebar_menu').show().animate({
	right:0
	});
});

$('.close_btn>a').on('click',function(){
	$('.menu_bg').hide();
	$('.sidebar_menu').animate({
	right:'-'+50+'%'
	},function(){$('.sidebar_menu').hide();});
	});
});

</script>