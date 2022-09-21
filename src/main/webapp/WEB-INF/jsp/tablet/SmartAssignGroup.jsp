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
<title>샘플 포털 > 사이트 소개 > 사이트 소개</title>
<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

<script type="text/javascript">
	function ReceiveGroup() {
		if ($('input:checkbox[name=check]').is(":checked") == true) {

			var url = "<c:url value='/tablet/ReceiveGroupPOP.do'/>?";

			var $dialog = $('<div id="modalPan"></div>').html(
					'<iframe style="border: 0px;" src="'
							+ "<c:url value='/tablet/ReceiveGroupPOP.do'/>?"
							+ '" width="100%" height="100%"></iframe>').dialog(
					{
						autoOpen : false,
						modal : true,
						width : 600,
						height : 400
					});
			$(".ui-dialog-titlebar").hide();
			$dialog.dialog('open');
		} else {
			alert("배정을 체크하여 주세요.");
		}
	}

	function linkPage(pageNo) {
		document.SmartBizList.pageIndex.value = pageNo;
		document.SmartBizList.action = "<c:url value='/mdm/SmartBiz.do'/>";
		document.SmartBizList.submit();
	}

	function ReceiveAutoRoom(autoroom, remark) {
		console.log(autoroom, remark);
		document.SmartList.autoroom.value = autoroom;
		document.SmartList.remark.value = remark;
		UpdateAssign();

	}

	//작업반배정 프로세스 실행
	function UpdateAssign() {
		var array = new Array();
		$('input:checkbox[name=check]').each(function(index) {
			if ($(this).is(":checked") == true) {
				array.push($(this).data("seq"));
			}
		});
		$("#checkboxs").val(array);

		document.SmartList.action = "<c:url value='/tablet/UpdateAssignGroup.do'/>";
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
									<h1 class="tit_1">작업반배정</h1>

									<!-- <p class="txt_1">거래처 관리 TEST 화면입니다.</p> -->

									<!-- 검색조건 -->
									<div class="condition" style="margin-top: 20px;">

										<span class="item f_search">
											<p class="left">
												<label for="searchcarnum">차량번호</label> <input
													class="f_input w_200" name="searchcarnum" id="searchcarnum"
													type="text"
													value="<c:out value='${searchVO.searchcarnum}'/>" />
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
									<div class="board_list_top" style="margin-top: 20px;">
										<!-- <div class="left_col">
											<h1 class="txt_1">업체코드 클릭시 수정화면으로 이동됩니다.</h1>
										</div>
										 -->
										<div class="right_col">
											<a href="#" onclick="ReceiveGroup()"
												class="item btn btn_blue_46 w_100">배정</a>
										</div>
									</div>
									<!--// 검색조건 -->

									<div class="board_list">
										<table>
											<caption>게시판목록</caption>
											<colgroup>
												<col style="width: 20px;">
												<col style="width: 20px;">
												<col style="width: 50px;">
												<col style="width: 50px;">
												<col style="width: 50px;">
												<col style="width: 50px;">
												<col style="width: 50px;">
												<col style="width: 50px;">
												<col style="width: 50px;">
												<col style="width: 50px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">배정</th>
													<th scope="col">번호</th>
													<th scope="col">접수일자</th>
													<th scope="col">차량번호</th>
													<th scope="col">차량종류</th>
													<th scope="col">고객명</th>
													<th scope="col">연락처</th>
													<th scope="col">수리내용</th>
													<th scope="col">소요시간</th>
													<th scope="col">수리종류</th>
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
														<td><span class="f_chk_only"> <input
																type="checkbox" name="check"
																data-seq="<c:out value='${result.TAKESEQ}'/>"> <input
																type="hidden" name="checkId"
																value="<c:out value='${result.TAKESEQ}'/>" />
														</span></td>
														<td><c:out
																value="${(searchVO.pageIndex-1)*searchVO.pageSize+status.count}" /></td>
														<td><c:out value="${result.RECEIPTDATE}" /></td>
														<td><c:out value="${result.AUTONUMBER}" /></td>
														<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
														<td><c:out value="${result.CUSTOMER_NAME}" /></td>
														<td><c:out value="${result.CUSTOMER_TEL}" /></td>
														<td><c:out value="${result.REPAIRCODE_NAME}" /></td>
														<td><c:out value="${result.LEADTIME_NM}" /></td>
														<td><c:out value="${result.REPAIRMETHOD_NAME}" /></td>
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
