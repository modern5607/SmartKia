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
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<title>목포서비스 KIA AUTO Q</title>
<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

<script type="text/javascript">


function Complete(seq)
{	
		var $dialog = $('<div id="modalPan"></div>').html(
				'<iframe style="border: 0px;" src="'
						+ "<c:url value='/tablet/CompletePOP.do?seq="+seq+"'/>"
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

function reload(){
	location.reload();
}

function ReceiveCansel(seq){
	
	var $dialog = $('<div id="modalPan"></div>').html(
			'<iframe style="border: 0px;" src="'
					+ "<c:url value='/tablet/ReceiveCancelPOP.do?seq="+seq+"'/>"
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
function CancelReceive(seq){
	document.SmartList.seq.value = seq;
	
	document.SmartList.action = "<c:url value='/tablet/ReceiveCancel.do'/>";
	document.SmartList.submit();
}
function fnCheckId(){
	
    document.SmartList.submit();
    return;
}
</script>

<head>
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
										<li><a href="">반 별 입고현황</a></li>
									</ul>
								</div>
								<!--// Location -->
								<form modelAttribute="SmartTabletVO" name="SmartList"
									id="SmartList" action="<c:url value='/tablet/SmartWorkGroup.do'/>"
									method="post">
									<input type="hidden" name="seq" id="seq" >
									<input type="hidden" name="room" id="room" >
									<input type="hidden" name="remark" id="remark" >
									<input type="hidden" name="position" id="position" >
									<input type="hidden" name="taskstat" id="taskstat" >
									<div class="board_list_top" style="margin-top: 20px;">
										<div class="left_col">
										<!-- <h1 class="txt_1">A반 입고처리 사항.</h1> -->
										</div>
										<div class="right_col">
                                            <label class="f_select w_200" for="autoroom">
													<select name="autoroom" id="autoroom">
														<option value="all">전체</option>
														<c:forEach var="i" items="${autorooms}" varStatus="status">
                                                            <option value="<c:out value='${i.CODE}'/>" ${searchVO.autoroom ==i.CODE ? 'selected' : ((logininfo[0].TEAM == i.CODE && searchVO.autoroom =='') ? 'selected' : '')} >${i.NAME}</option> 
                                                        </c:forEach>
													</select>
											</label>
											<a href="#" class="btn btn_blue_46 w_100" onclick="javascript:fnCheckId(); return false;"><spring:message code="button.inquire" /></a>
										</div>
									</div>
									<!--// 검색조건 -->
									<div class="board_list">
										<table style="table-layout: fixed;">
											<caption>게시판목록</caption>
											<colgroup>
												<col style="width: 50px;">
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
													<th scope="col">번호</th>
													<th scope="col">접수번호</th>
													<th scope="col">차량번호</th>
													<th scope="col">차량종류</th>
													<th scope="col">고객명</th>
													<th scope="col">연락처</th>
													<th scope="col">정비내용</th>
													<th scope="col">작업반</th>
													<th scope="col">예상완료시간</th>
													<th scope="col">작업상태</th>
													<th scope="col">비고</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${fn:length(resultList) == 0}">
													<tr>
														<td colspan="11"><spring:message
																code="common.nodata.msg" /></td>
													</tr>
												</c:if>
												<c:forEach var="result" items="${resultList}"
													varStatus="status">
													<tr>
														<td><c:out
																value="${(searchVO.pageIndex-1)*searchVO.pageSize+status.count}" /></td>
														<td><c:out value="${result.TAKESEQ}" /></td>
														<td><c:out value="${result.AUTONUMBER}" /></td>
														<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
														<td><c:out value="${result.CUSTOMER_NAME}" /></td>
														<td><c:out value="${result.CUSTOMER_TEL}" /></td>
														<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis"><c:out value="${result.REPAIRCODE_NAME}" /></td>
														<td><c:out value="${result.POSITION_NAME}" /></td>
														<td><c:out value="${result.ESTIME1}" /></td>
														<td><a href="#" style="text-decoration: underline;" onclick="Complete('${result.TAKESEQ}')"><c:out value="${result.TASKSTAT_NAME}" /></a>
														<td><a href="#LINK" class="btn btn_blue_30 w_100" onclick="ReceiveCansel('${result.TAKESEQ}'); return false;">입고취소</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</form>
								<!-- 페이징 -->
								<div class="board_list_bot" style="margin-top: 20px;">
									<div class="paging" id="paging_div">
										<ul>
											<ui:pagination paginationInfo="${paginationInfo}"
												type="renew" jsFunction="linkPage" />
										</ul>
									</div>
								</div>
								<!-- // 페이징 끝 -->
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