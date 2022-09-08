<%--
  Class Name : EgovUserManage.jsp
  Description : 사용자관리(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.02  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.02
--%>
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
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>

<title>기준정보 > 사용자관리</title>
<script type="text/javaScript" language="javascript" defer="defer">
	/* function fnAddRepairCar(){
	 var $dialog = $('<div id="modalPan"></div>')
	 .html('<iframe style="border: 0px; " src="' + "<c:url value='/crm/SmartAddRepairPopup.do'/>" +'" width="100%" height="100%"></iframe>')
	 .dialog({
	 autoOpen: false,
	 modal: true,
	 width: 600,
	 height: 400
	 });
	 $(".ui-dialog-titlebar").hide();
	 $dialog.dialog('open');
	 }

	 } */
	function TransferGroup() {
		var url = "<c:url value='/crm/SmartAddRepairPopup.do'/>?";

		var $dialog = $('<div id="modalPan"></div>').html(
				'<iframe style="border: 0px;" src="'
						+ "<c:url value='/crm/SmartAddRepairPopup.do'/>?"
						+ '" width="100%" height="100%"></iframe>').dialog({
			autoOpen : false,
			modal : true,
			width : 1500,
			height : 700
		});
		$(".ui-dialog-titlebar").hide();
		$dialog.dialog('open');

	}
	<!--
	function fnDeleteUser() {
		var checkField = document.listForm.checkField;
		var id = document.listForm.checkId;
		var checkedIds = "";
		var checkedCount = 0;
		if (checkField) {
			if (checkField.length > 1) {
				for (var i = 0; i < checkField.length; i++) {
					if (checkField[i].checked) {
						checkedIds += ((checkedCount == 0 ? "" : ",") + id[i].value);
						checkedCount++;
					}
				}
			} else {
				if (checkField.checked) {
					checkedIds = id.value;
				}
			}
		}
		if (checkedIds.length > 0) {
			//alert(checkedIds);
			if (confirm('<spring:message code="common.delete.msg" />')) {
				document.listForm.checkedIdForDel.value = checkedIds;
				document.listForm.action = "<c:url value='/mdm/SmartMberDelete.do'/>";
				document.listForm.submit();
			}
		}
	}
	function fnSelectUser(id) {
		document.listForm.selectedId.value = id;
		array = id.split(":");
		if (array[0] == "") {
		} else {
			userTy = array[0];
			userId = array[1];
		}
		document.listForm.selectedId.value = userId;
		document.listForm.action = "<c:url value='/mdm/SmartMberSelectUpdtView.do'/>";
		document.listForm.submit();
	}
	function fnAddUserView() {
		document.listForm.action = "<c:url value='/mdm/SmartMberInsertView.do'/>";
		document.listForm.submit();
	}
	function fnSearch() {
		document.listForm.pageIndex.value = 1;
		document.listForm.action = "<c:url value='/crm/SmartAddRepairCar.do'/>";
		document.listForm.submit();
	}
	/*********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fnLinkPage(pageNo) {
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/crm/SmartAddRepairCar.do'/>";
		document.listForm.submit();
	}
//-->
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
						<%-- <c:import url="/sym/mms/EgovMenuLeft.do" /> --%>
						<!--// Left menu -->

						<div class="content_wrap">
							<div id="contents" style="margin-bottom:10px">
								<!-- Location -->
								<div class="location">
									<ul>
										<li><a class="home" href="">Home</a></li>
										<li><a href="">고객관리</a></li>
										<li>차량 수리 이력 등록</li>
									</ul>
								</div>
								<!--// Location -->

								<form name="listForm" action="/crm/SmartAddRepaire.do"
									method="post">
									<input name="selectedId" type="hidden" /> <input
										name="checkedIdForDel" type="hidden" /> <input
										name="pageIndex" type="hidden"
										value="<c:out value='${userSearchVO.pageIndex}'/>" />

									<h1 class="tit_1" style="padding-bottom: 20px;">차량 수리 이력
										조회</h1>

									<!-- <p class="txt_1">사용자 및 권한에 대한 제반사항을 관리합니다.</p>  -->

									<!-- <h2 class="tit_2">사용자관리</h2>

                                <h3 class="tit_3">회원관리</h3> -->

									<!-- 검색조건 -->

									<div class="condition" style="text-align: left;">
										<span class="item f_search">
											<p class="left">
												<label for="searchKeyword">차량번호 :</label> <input
													name="searchKeyword" id="searchKeyword"
													class="f_input w_200" title="검색" type="text" maxlength="20"
													value="<c:out value="${userSearchVO.searchKeyword}"/>" />
												<label for="searchKeyword1">고객명 :</label> <input
													name="searchKeyword1" id="searchKeyword1"
													class="f_input w_200" title="검색" type="text"
													value="<c:out value=""/>" /> <label for="searchKeyword2">연락처
													:</label> <input name="searchKeyword2" id="searchKeyword2"
													class="f_input w_200" title="검색" type="text" maxlength="20"
													value="<c:out value="${userSearchVO.searchKeyword}"/>" />
												<label for="searchKeyword3">접수기간 :</label> <input
													name="searchKeyword3" id="searchKeyword3"
													class="f_input w_150" title="검색" type="date"
													value="<c:out value=""/>" />
													<label for="searchKeyword3"> ~ </label> <input
													name="searchKeyword3" id="searchKeyword3"
													class="f_input w_150" title="검색" type="date"
													value="<c:out value=""/>" />
												<button class="btn" type="submit"
													onclick="fnSearch(); return false;" style="right: -50px;">
													<spring:message code="button.search" />
												</button>
											</p>
										</span>
									</div>
							</div>
							<!--// 검색조건 -->

							<!-- 등록 , 목록 -->
							<%-- <div class="board_list_top">
								<div class="right_col">
									<button type="button" class="btn btn_blue_46 w_100"
										onclick="javascript:TransferGroup(); return false;">
										<spring:message code="button.create" />
									</button>
									<a href="<c:url value='/crm/SmartAddRepairCar.do'/>"
										class="btn btn_blue_46 w_100"><spring:message
											code="button.list" /></a>
									<!-- 목록 -->
								</div>
							</div> --%>

							<div class="board_list3">
								<table summary="고객목록">
									<caption>고객목록</caption>
									<colgroup>
										<col style="width: 50px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<%-- <col style="width: 100px;"> --%>
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<%-- <col style="width: 100px;"> --%>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">접수번호</th>
											<th scope="col">고객번호</th>
											<th scope="col">차량번호</th>
											<th scope="col">차량종류</th>
											<th scope="col">고객명</th>
											<th scope="col">연락처</th>
											<!-- <th scope="col">작업상태</th> -->
											<th scope="col">작업반</th>
											<th scope="col">완료시간</th>
											<th scope="col">접수비고</th>
											<th scope="col">출고여부</th>
											<th scope="col">출고일시</th>
											<th scope="col">출고비고</th>
											<!-- <th scope="col">입고/이관</th> -->
										</tr>

									</thead>
									<tbody>
										<c:if test="${fn:length(resultList) == 0}">
											<tr>
												<td colspan="12"><spring:message
														code="common.nodata.msg" /></td>
											</tr>
										</c:if>

										<c:forEach items="${resultList}" var="result"
											varStatus="status">
											<tr>
												<%-- <td><c:out value="${(userSearchVO.pageIndex-1) * userSearchVO.pageSize + status.count}"/></td> --%>
												<td><c:out
														value="${paginationInfo.totalRecordCount+1 - ((userSearchVO.pageIndex-1) * userSearchVO.pageSize + status.count)}" /></td>
												<td><c:out value="${result.cusId}" /></td>
												<td><c:out value="${result.cusAutoNo}" /></td>
												<td><c:out value="${result.cusAutoKind}" /></td>
												<td><c:out value="${result.cusNm}" /></td>
												<td><c:out value="${result.cusTel}" /></td>
												<%-- <td><c:out value="${result.taskStat}" /></td> --%>
												<td><c:out value="${result.positon}" /></td>
												<td><c:out value="${result.compTime}" /></td>
												<td><c:out value="${result.note}" /></td>
												<td><c:out value="${result.turnOver}" /></td>
												<td><c:out value="${result.turnoverTime}" /></td>
												<td><c:out value="${result.turnoverNote}" /></td>
												<%-- <td>
													<button type="button" class="btn btn_blue_46 w_100"
														onclick="javascript:TransferGroup(); return false;">
														<spring:message code="button.create" />
													</button> <a href="<c:url value='/mdm/mber/SmartMberSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>" class="lnk" onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;">
	                                                		<c:out value="${result.userId}"/>
	                                                	</a>
												</td> --%>
												<!-- <td>
	                                                    <a href="#LINK" class="btn btn_blue_30 w_80">
	                                                    	상세보기
	                                                    </a>
	                                                </td> -->
											</tr>
										</c:forEach>
									</tbody>
									</thead>
								</table>
							</div>

							<!-- 페이징 -->
							<div class="board_list_bot">
								<div class="paging" id="paging_div">
									<ul>
										<ui:pagination paginationInfo="${paginationInfo}" type="image"
											jsFunction="fnLinkPage" />
									</ul>
								</div>
							</div>
							<!-- // 페이징 끝 -->

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