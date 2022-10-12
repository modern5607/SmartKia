
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
<link rel="stylesheet" href="<c:url value='/'/>css/tablet.css">
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
		<div id ="test">
			<div class="monitoring content">
				<div class="sub_in">
					<div class="layout">
						<div class="teamtables">
							<div class="top_line"></div>
							<div class="header">
								<h1 class="tit_1 team_left">접수 현황</h1>
                                <div class="tab team_click active" id="normal">일반접수</div>
                                <div class="tab team_click" id="reserve">예약접수</div>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
							</div>
							<div class="board_list" id="tab1">
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
										<c:forEach begin="0" end="11" varStatus="status">
											<tr>
												<!-- <td><c:out value="${Guest[status.index].TAKESEQ}" /></td> -->
												<!-- <td><c:out value="${Guest[status.index].AUTONUMBER}" /></td> -->
												<!-- <td><c:out value="${Guest[status.index].CUSTOMER_AUTOKIND}" /></td> -->
												<!-- <td><c:out value="${Guest[status.index].NAME}" /></td> -->
                                                <td>1</td>
                                                <td>2</td>
                                                <td>3</td>
                                                <td>4</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
                            <div class="board_list" id="tab2" style="display: none;">
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
										<c:forEach begin="0" end="10" varStatus="status">
											<tr>
												<!-- <td><c:out value="${Guest[status.index].TAKESEQ}" /></td> -->
												<!-- <td><c:out value="${Guest[status.index].AUTONUMBER}" /></td> -->
												<!-- <td><c:out value="${Guest[status.index].CUSTOMER_AUTOKIND}" /></td> -->
												<!-- <td><c:out value="${Guest[status.index].NAME}" /></td> -->
                                                <td>5</td>
                                                <td>6</td>
                                                <td>7</td>
                                                <td>8</td>
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