
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<!-- 캘린더 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="<c:url value='/'/>js/datepicker.js"></script>
<!-- /캘린더 -->
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>

<title>기준정보 > 사용자관리</title>
<script type="text/javaScript" language="javascript" defer="defer">

function fnSearch() {
	document.smartCrmVO.pageIndex.value = 1;
	document.smartCrmVO.action = "<c:url value='/crm/SmartAddRepairCar.do'/>";
	document.smartCrmVO.submit();
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
						<div class="content_wrap">
							<div id="contents">
								<!-- Location -->
								<div class="location">
									<ul>
										<li><a class="home" href="">Home</a></li>
										<li><a href="">고객관리</a></li>
										<li>차량수리이력조회</li>
									</ul>
								</div>
								<!--// Location -->
								<form name="smartCrmVO" action="/crm/SmartAddRepairCar.do" method="post">
									<input name="selectedId" type="hidden" /> 
									<input name="checkedIdForDel" type="hidden" /> 
									<input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>" />
									<div class="condition">
										<span class="item f_search">
											<p class="left">
												<label for="searchAutoNo">차량번호 :</label> 
													<input name="searchAutoNo" id="searchAutoNo" class="f_input w_200" title="검색" type="text" maxlength="20" value="<c:out value="${SmartCrmVO.searchAutoNo}"/>" />
												<label for="searchCusNm">고객명 :</label> 
													<input name="searchCusNm" id="searchCusNm"class="f_input w_200" title="검색" type="text" value="<c:out value="${SmartCrmVO.searchCusNm}"/>" />
												<label for="searchCusTel">연락처:</label> 
													<input name="searchCusTel" id="searchCusTel"class="f_input w_200" title="검색" type="text" maxlength="20"value="<c:out value="${SmartCrmVO.searchCusTel}"/>" />
												<label for="sdate">접수기간 :</label> 
													<input name="sdate" id="sdate" readonly="readonly"class="f_input w_150" title="검색" type="text"value="<c:out value="${SmartCrmVO.sdate}"/>" />
												<label for="edate"> ~ </label> 
													<input name="edate" id="edate" readonly="readonly" class="f_input w_150" title="검색" type="text"value="<c:out value="${SmartCrmVO.edate}"/>" /> 
												<button class="btn" type="submit"onclick="fnSearch(); return false;" style="right: -50px;"><spring:message code='button.search' /></button> 
											</p>
										</span>
									</div>
							</div>
							<div class="board_list3">
								<table summary="고객목록">
									<caption>고객목록</caption>
									<colgroup>
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
											<th scope="col">작업반</th>
											<th scope="col">완료시간</th>
											<th scope="col">출고일시</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(resultList) == 0}">
											<tr>
												<td colspan="8"><spring:message
														code="common.nodata.msg" /></td>
											</tr>
										</c:if>
										<c:forEach items="${resultList}" var="result"
											varStatus="status">
											<tr>
												<td><c:out value="${result.TAKESEQ}" /></td>
												<td><c:out value="${result.AUTONUMBER}" /></td>
												<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${result.CUSTOMER_NAME}" /></td>
												<td><c:out value="${result.CUSTOMER_TEL}" /></td>
												<td><c:out value="${result.POSITION_NAME}" /></td>
												<td><c:out value="${result.ETIME}" /></td>
												<td><c:out value="${result.TURNOVERTIME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								</form>
							</div>
							<div class="board_list_bot">
								<div class="paging" id="paging_div">
									<ul>
										<ui:pagination paginationInfo="${paginationInfo}" type="image"
											jsFunction="fnLinkPage" />
									</ul>
								</div>
							</div>
						</div>						
					</div>
					<br/>
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