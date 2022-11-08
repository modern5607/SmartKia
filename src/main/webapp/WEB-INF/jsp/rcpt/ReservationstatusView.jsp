<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="<c:url value='/'/>css/component.css" type="text/css">

<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<title>샘플 포털 > 사이트 소개 > 사이트 소개</title>
<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->
<script src="<c:url value='/'/>js/datepicker.js"></script>

<script type="text/javascript">
	
</script>

</head>
<body>
	<!-- Skip navigation -->
	<a href="#contents" class="skip_navi">본문 바로가기</a>

	<div class="wrap">
		<!-- header start -->
		<c:import url="/sym/mms/EgovHeader.do" />
		<!-- //header end -->

		<div class="container" style="margin-top: 95px;">
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
										<li><a href="">접수관리</a></li>
										<li><a href="">고객예약현황</a></li>
									</ul>
								</div>
								<!--// Location -->
								<form modelAttribute="ReservationVO" name="SmartList" id="SmartList" action="<c:url value='/rcpt/ReservationstatusView.do'/>" method="post">
									<!-- 검색조건 -->
									<div class="condition" style="margin-top: 20px;">
										<span class="item f_search">
											<p class="left">
												<label for="sdate">예약날짜 :</label> 
													<input class="f_input w_150" name="sdate" id="sdate" readonly type="text"value="<c:out value='${searchVO.sdate}'/>" />
												<label for="edate"> ~ </label> 
													<input class="f_input w_150" name="edate" id="edate" readonly type="text"value="<c:out value='${searchVO.edate}'/>" /> 
											</p>
											<p class="left">
												<label>상태</label>
												<label class="f_select w_200" for="taskstat">
													<select name="taskstat" id="taskstat">
														<option value="">전체</option>
														<option value="CB-reserve" ${(searchVO.taskstat =="CB-reserve")?"selected":""}>예약</option>
														<option value="CB-reserveconfirm" ${(searchVO.taskstat =="CB-reserveconfirm")?"selected":""}>예약확인</option>
														<option value="CB-reservecancel" ${(searchVO.taskstat =="CB-reservecancel")?"selected":""}>예약취소</option>
														<option value="CB-repaired" ${(searchVO.taskstat =="CB-repaired")?"selected":""}>수리중(예약)</option>
														<option value="CB-perfect" ${(searchVO.taskstat =="CB-perfect")?"selected":""}>출고(예약)</option>
	
													</select>
												</label>
											</p>
											
											<p class="left">
												<label for="searchcarnum">차량번호</label> 
													<input class="f_input w_200" name="carnum" id="carnum" type="text" value="<c:out value='${searchVO.carnum}'/>" />
											</p>
											<p class="left">
												<label for="searchTel">연락처</label> 
													<input class="f_input w_200" name="tel" id="tel" type="text" value="<c:out value='${searchVO.tel}'/>" />
											<p class="left">
												<label for="searchname">고객명</label> 
													<input class="f_input w_200" name="custnm" id="custnm" type="text" value="<c:out value='${searchVO.custnm}'/>" />
											</p>
											<button class="btn" type="submit"><spring:message code="button.inquire" /></button>조회
										</span>
									</div>
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
											</colgroup>
											<thead>
												<tr>
													<th scope="col">접수번호</th>
													<th scope="col">예약일자</th>
													<th scope="col">차량번호</th>
													<th scope="col">차량종류</th>
													<th scope="col">수리내용</th>
													<th scope="col">고객명</th>
													<th scope="col">연락처</th>
													<th scope="col">상태</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${fn:length(resultList) == 0}">
													<tr>
														<td colspan="7"><spring:message
																code="common.nodata.msg" /></td>
													</tr>
												</c:if>
												<c:forEach var="result" items="${resultList}" varStatus="status">
													<tr>
														<td><c:out value="${result.TAKESEQ}" /></td>
														<td><c:out value="${result.RECEIPTDATE}" /></td>
														<td><c:out value="${result.AUTONUMBER}" /></td>
														<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
														<td><c:out value="${result.REPAIRCODE_NAME}" /></td>
														<td><c:out value="${result.CUSTOMER_NAME}" /></td>
														<td><c:out value="${result.CUSTOMER_TEL}" /></td>
														<td><c:out value="${result.TASKSTAT_NAME}" /></td>
														<td>비고</td>
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
