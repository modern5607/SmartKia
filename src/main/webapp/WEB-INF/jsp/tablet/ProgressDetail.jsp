<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
<link rel="stylesheet" href="<c:url value='/'/>css/component.css"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<!-- 캘린더 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="<c:url value='/'/>js/datepicker.js"></script>
<!-- /캘린더 -->
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<title>목포서비스 KIA AUTO Q</title>
<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

<script type="text/javascript">          

function releasePOP(seq)
{
	var $dialog = $('<div id="modalPan"></div>').html(
		'<iframe style="border: 0px;" src="'
			+ "<c:url value='/tablet/ReleasePOP.do?seq="+seq+"'/>"
			+ '" width="100%" height="100%"></iframe>')
			.dialog({
				autoOpen : false,
				modal : true,
				width : 910,
				height : 700
			});
		$(".ui-dialog-titlebar").hide();
		$dialog.dialog('open');
	
}    
function CallGuestView(seq){
	
	var $dialog = $('<div id="modalPan"></div>').html(
			'<iframe style="border: 0px;" src="'
					+ "<c:url value='/tablet/CallGuestView.do?seq="+seq+"'/>"
					+ '" width="100%" height="100%"></iframe>')
			.dialog({
				autoOpen : false,
				modal : true,
				width : 600,
				height : 400
			});
		$(".ui-dialog-titlebar").hide();
		$dialog.dialog('open');
}

function CallGuest(seq){
	document.ProgressDetail.seq.value = seq;
	
	document.ProgressDetail.action = "<c:url value='/tablet/CallGuest.do'/>";
	document.ProgressDetail.submit();
}
function reload(){
	location.reload();
}

</script>

</head>
<body>
	<!-- Skip navigation -->
	<a href="#contents" class="skip_navi">본문 바로가기</a>

	<div class="wrap">
		<!-- header start -->
		<c:import url="/sym/mms/EgovHeader.do" />
		<!-- //header end -->

		<div class="container">
			<div class="sub_layout">
				<div class="sub_in">
					<div class="layout">
						<!-- Left menu -->
						<!-- <c:import url="/sym/mms/EgovMenuLeft.do" /> -->
						<!--// Left menu -->

						<div class="content_wrap">
							<div id="contents" class="content">
								<!-- Location -->
								<div class="location">
									<ul>
										<li><a class="home" href="">Home</a></li>
										<li><a href="">현장관리</a></li>
										<li><a href="">반별 진행 내역 조회</a></li>
									</ul>
								</div>
								<!--// Location -->
								<form modelAttribute="SmartTabletVO" name="ProgressDetail" id="ProgressDetail" action="<c:url value='/tablet/ProgressDetail.do'/>" method="post">
									<input type="hidden" id="groupcode" name="groupcode" value="">
									<input type="hidden" id="code" name="code" value="">
									<input type="hidden" id="seq" name="seq" value="">
									<div class="condition" style="margin-top: 20px;">
										<span class="item f_search">
											<p class="left">
                                                <label>작업반</label>
                                                <label class="f_select w_200" for="autoroom" style="vertical-align: unset;">
													<select name="autoroom" id="autoroom">
														<option value="">전체</option>
														<c:forEach var="i" items="${autorooms}" varStatus="status">
                                                            <option value="<c:out value='${i.CODE}'/>"><c:out value="${i.NAME}" /></option>
                                                        </c:forEach>
													</select>
											</label>
											</p>
                                            <p class="left">
                                                <label for="searchtel">연락처</label>
                                                <input class="f_input w_200" name="searchTel" id="searchTel" type="text" value="<c:out value='${searchVO.searchTel}'/>" />
                                            </p>
											<p class="left">
                                                <label for="searchcarnum">차량번호</label>
                                                <input class="f_input w_200" name="searchcarnum" id="searchcarnum" type="text" value="<c:out value='${comCodeVO.searchcarnum}'/>" />
                                            </p>
											<!--p class="left">
                                                <label for="searchdate">접수일자</label>
                                                <input class="f_input w_150" name="sdate" id="sdate" type="text" readonly value="<c:out value='${searchVO.sdate}'/>" />
                                                <label >~</label>
                                                <input class="f_input w_150" name="edate" id="edate" type="text" readonly value="<c:out value='${searchVO.edate}'/>" />
                                            <p-->
												<button class="btn" type="submit"><spring:message code="button.inquire"/><button>
                                        </span>

									</div>
									<!--// 검색조건 -->

									<div class="board_list">
										<table style="table-layout: fixed;">
											<caption>게시판목록</caption>
											<colgroup>
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">접수번호</th>
													<th scope="col">차량번호</th>
													<th scope="col">차량종류</th>
													<th scope="col">고객명</th>
													<th scope="col">연락처</th>
													<th scope="col">정비내용</th>
													<th scope="col">작업반</th>
													<th scope="col">완료시간</th>
													<th scope="col">작업상태</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${fn:length(resultList) == 0}">
													<tr>
														<td colspan="10"><spring:message
																code="common.nodata.msg" /></td>
													</tr>
												</c:if>
												<c:forEach var="result" items="${resultList}"
													varStatus="status">
													<tr>
														<td><c:out value="${result.TAKESEQ}" /></td>
														<td><c:out value="${result.AUTONUMBER}" /></td>
														<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
														<td><c:out value="${result.CUSTOMER_NAME}" /></td>
														<td><c:out value="${result.CUSTOMER_TEL}" /></td>
														<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${result.REPAIRCODE_NAME}" /></td>
														<td><c:out value="${result.POSITION_NAME}" /></td>
														<td><c:out value="${result.ETIME}" /></td>
														<td><c:out value="${result.TASKSTAT_NAME}" /></td>
														<td>
															<c:if test="${result.TASKSTAT eq 'CB-standby'}">
																<a href="#"onclick="CallGuestView('${result.TAKESEQ}');" class="btn btn_blue_46 w_80" >호출</a> 
															</c:if>
															<c:if test="${result.TASKSTAT ne 'CB-standby'}">
																<a href="#"onclick="releasePOP('${result.TAKESEQ}');" class="btn btn_blue_46 w_80" >출고처리</a> 
															</c:if>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</form>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- footer 시작 -->
		<c:import url="/sym/mms/EgovFooter.do" />
		<!-- //footer 끝 -->
	</div>
</body>
</html>
