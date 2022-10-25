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
﻿

<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<title>샘플 포털 > 사이트 소개 > 사이트 소개</title>
<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

<script type="text/javascript">
	function ReceiveGroup(seq) {
		
		console.log(seq);

			var url = "<c:url value='/tablet/ReceiveGroupPOP.do'/>?";

			var $dialog = $('<div id="modalPan"></div>').html(
					'<iframe style="border: 0px;" src="'
							+ "<c:url value='/tablet/ReceiveGroupPOP.do?seq="+seq+"'/>"
							+ '" width="100%" height="100%"></iframe>').dialog(
					{
						autoOpen : false,
						modal : true,
						width : 920,
						height : 700
					});
			$(".ui-dialog-titlebar").hide();
			$dialog.dialog('open');

	}
	
	function reload(){
		location.reload();
	}

	function linkPage(pageNo) {
		document.SmartList.pageIndex.value = pageNo;
		document.SmartList.action = "<c:url value='/tablet/SmartAssignGroup.do'/>";
		document.SmartList.submit();
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
										<li><a href="">현장관리</a></li>
										<li><a href="">작업반배정</a></li>
									</ul>
								</div>
								<!--// Location -->
								<form modelAttribute="SmartTabletVO" name="SmartList"
									id="SmartList"
									action="<c:url value='/tablet/SmartAssignGroup.do'/>"
									method="post">
									<input type="hidden" name="checkboxs" id="checkboxs"> <input
										type="hidden" name="autoroom" id="autoroom"> <input
										type="hidden" name="remark" id="remark">
									<!-- 검색조건 -->
									<div class="condition" style="margin-top: 20px;">
										<span class="item f_search">
											<p class="left">
												<label for="searchtakestat">접수상태</label>
												<label class="f_select w_200" for="searchtakestat">
													<select name="searchtakestat" id="searchtakestat">
														<option value="">전체</option>
														<option value="CB-receipt">현장접수</option>
														<option value="CB-reserveconfirm">예약접수</option>
													</select>
												</label>
											</p>
											<p class="left">
												<label for="searchcarnum">차량번호</label> 
												<input class="f_input w_200" name="searchcarnum" id="searchcarnum" type="text" value="<c:out value='${searchVO.searchcarnum}'/>" />
											</p>
											<p class="left">
												<label for="searchTel">연락처</label> <input
													class="f_input w_200" name="searchTel" id="searchTel"
													type="text" value="<c:out value='${searchVO.searchTel}'/>" />
											<p class="left">
												<label for="searchname">고객명</label> <input
													class="f_input w_200" name="searchname" id="searchname"
													type="text" value="<c:out value='${searchVO.searchname}'/>" />
											</p>
											<button class="btn" type="submit">
												<spring:message code="button.inquire" />
											</button>조회
										</span>
									</div>
									<div class="board_list">
										<table style="table-layout: fixed;">
											<caption>게시판목록</caption>
											<colgroup>
												<col style="width: 20px;">
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
													<th scope="col">번호</th>
													<th scope="col">접수상태</th>
													<th scope="col">접수번호</th>
													<th scope="col">차량번호</th>
													<th scope="col">차량종류</th>
													<th scope="col">고객명</th>
													<th scope="col">연락처</th>
													<th scope="col">정비내용</th>
													<th scope="col">배정</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${fn:length(resultList) == 0}">
													<tr>
														<td colspan="8"><spring:message
																code="common.nodata.msg" /></td>
													</tr>
												</c:if>
												<c:forEach var="result" items="${resultList}"
													varStatus="status">
													<tr>
														<td><c:out value="${(searchVO.pageIndex-1)*searchVO.pageSize+status.count}" /></td>
														<td><c:out value="${result.TASKSTAT_NAME}" /></td>
														<td><c:out value="${result.TAKESEQ}" /></td>
														<td><c:out value="${result.AUTONUMBER}" /></td>
														<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
														<td><c:out value="${result.CUSTOMER_NAME}" /></td>
														<td><c:out value="${result.CUSTOMER_TEL}" /></td>
														<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${result.REPAIRCODE_NAME}" /></td>
														<td><a href="#LINK" class="btn btn_blue_30 w_50" onclick="ReceiveGroup('<c:out value="${result.TAKESEQ}" />'); return false;">상세</a></td>
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
