
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
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
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
	setInterval(function() {
		$.ajax({
			type : "post",
			url : "<c:url value='/monitor/SelectSmartMonitoring.do'/>",
			dataType : "json",
			success : function(resp) {
				var html = "";
				$.each(resp.list.resultList, function(index, item) {
					//console.log(item);
					html += "<tr>";
					html += "<td>" + item.AUTONUMBER + "</td>";
					html += "<td>"
							+ (item.REPAIRCODE_NAME == null ? ""
									: item.REPAIRCODE_NAME) + "</td>";
					html += "<td>"
							+ (item.POSITION_NAME == null ? ""
									: item.POSITION_NAME) + "</td>";
					html += "<td>" + (item.ESTIME == null ? "" : item.ESTIME)
							+ "</td>";
					html += "<td>" + item.TASKSTAT_NAME + "</td>";
					html += "</tr>";
				});
				var tbody = $("div.board_list").find("table").find("tbody");
				tbody.html(html);

			}
		});

	}, 3000);

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
<body>

	<div class="container" id="list">
		<div class="smart_monitoring">
			<div class="sub_in">
				<div class="layout">

					<div class="content_wrap" style="grid:">
						<div id="contents" class="content"
							style="padding: 70px 10px 20px 10px;">
							<div
								style="display: grid; grid-template-columns: 1f; grid-gap: 20px">
								<h1 class="tit_1"
									style="text-align: center; padding-bottom: 50px">접수 현황</h1>
							</div>

							<!-- 게시판 -->
							<div
								style="display: grid; grid-template-columns: 1fr; grid-gap: 20px">

							</div>
							<div class="board_list">
								<table>
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
									</colgroup>
									<thead>
										<tr style="background: #9cc0ff;">
											<th scope="col">차량번호</th>
											<th scope="col">수리내용</th>
											<th scope="col">작업반</th>
											<th scope="col">예상완료시간</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(resultList) == 0}">
											<tr>
												<td colspan="5"><spring:message
														code="common.nodata.msg" /></td>
											</tr>
										</c:if>

										<c:forEach items="${resultList}" var="result"
											varStatus="status">
											<tr>
												<td><c:out value="${result.AUTONUMBER}" /></td>
												<td><c:out value="${result.REPAIRCODE_NAME}" /></td>
												<td><c:out value="${result.POSITION_NAME}" /></td>
												<td><c:out value="${result.ESTIME}" /></td>
												<td><c:out value="${result.TASKSTAT_NAME}" /></td>
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
	<div class='marquee'>
		<div class='marquee-text' style="font-size:20px;">현장 상황에 따라 수리진행이 변동될수 있습니다.</div>
	</div>
	</div>


</body>
</html>