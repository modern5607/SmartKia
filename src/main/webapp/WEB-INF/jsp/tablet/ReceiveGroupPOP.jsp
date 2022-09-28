<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ID중복확인</title>
<base target="_self">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<script src="<c:url value='/'/>js/jquery.js"></script>
<script src="<c:url value='/'/>js/jqueryui.js"></script>
<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

<script type="text/javascript"
	src="<c:url value='/js/showModalDialogCallee.js'/>"></script>
<script type="text/javaScript" language="javascript">
	$(document).ready(function() {
		console.log("asdf");
		$("#checkcarnum").focus();
	});
	function fnCheckId() {

		if (document.SmartRcptVO.checkcarnum.value == "") {
			alert("차량번호를 입력해 주세요");
			document.SmartRcptVO.focus();
			return;
		}
		if (fnCheckNotKorean(document.SmartRcptVO.checkcarnum.value)) {
			document.SmartRcptVO.submit();
		} else {
			alert("한글은 사용할 수 없습니다.");
			return;
		}
	}

	function fnReturnId(id, carnum, name, kind, tel) {

		parent.returnValue(id, carnum, name, kind, tel);
		fn_egov_cancel_popup();
	}

	/* ********************************************************
	 * 취소처리
	 ******************************************************** */
	function fn_egov_cancel_popup() {

		parent.fn_egov_modal_remove();
	}

	function fnCheckNotKorean(koreanStr) {
		for (var i = 0; i < koreanStr.length; i++) {
			var koreanChar = koreanStr.charCodeAt(i);
			if (!(0xAC00 <= koreanChar && koreanChar <= 0xD7A3)
					&& !(0x3131 <= koreanChar && koreanChar <= 0x318E)) {
			} else {
				//hangul finding....
				return false;
			}
		}
		return true;
	}
</script>
</head>
<body>

	<!-- 아이디중복확인 팝업 -->
	<div class="popup POP_DUPID_CONF"
		style="background-color: white; text-align: center;">

		<form name="SmartRcptVO"
			action="<c:url value='/rcpt/checkcarinfo.do'/>">

			<div class="pop_inner" style="width: 100%;">
				<div class="pop_header">
					<h1>차량 상세 내역</h1>
					<button type="button" class="close"
						onclick="fn_egov_cancel_popup(); return false;">닫기</button>
				</div>

				<div class="pop_container">
					<!-- <div class="box_3">
                    <label for="checkcarnum">차량번호</label>
                    <input id="checkcarnum" class="f_txt2 ml15" type="text" name="checkcarnum" value="<c:out value="${checkcarnum}"/>" maxlength="20" />
                    <input type="hidden" name="resultId" value="<c:out value="${checkcarNum}"/>" />
                    
                    <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fnCheckId(); return false;"><spring:message code="button.inquire" /></a>
                </div> -->

					<table class="board_list4"
						style="border-radius: 10px; border: 1px solid #dde2e5; padding: 15px;">
						<colgroup>
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
						</colgroup>
						<thead>
							<th>차량번호</th>
							<th>차종</th>
							<th>고객명</th>
							<th>연락처</th>
							<th>총주행거리</th>
						</thead>
						<tbody>
							<c:if test="${fn:length(carlist) == 0}">
								<tr>
									<td colspan="5"><spring:message code="common.nodata.msg" /></td>
								</tr>
							</c:if>
							<c:forEach var="list" items="${carlist}" varStatus="status">
								<tr>
									<td><c:out value="${list.AUTONUMBER}" /></td>
									<td><c:out value="${list.CUSTOMER_AUTOKIND}" /></td>
									<td><c:out value="${list.CUSTOMER_NAME}" /></td>
									<td><c:out value="${list.CUSTOMER_TEL}" /></td>
									<td><c:out value="${list.KILRO_TOTAL}" />km</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>

					<div class="cont left">
						<strong>정비내용 선택</strong>
						<div class="scrollBox01">
							<ul id="rcrListUL">
								<c:forEach var="i" items="${leadtimelist.infolist}"
									varStatus="istatus">
									<li class="box_tit"><a href="#">${i.NAME}</a>
										<ul>
											<c:forEach var="j" items="${i.LIST}" varStatus="jstatus">
												<li><input
													id="mtn_cont${istatus.count}_${jstatus.count}"
													type="checkbox" name="mtn_cont"
													value="<c:out value='${j.CODE}'/>"
													data-time="<c:out value='${j.LEAD_NAME}'/>"
													style="width: 0px; height: 0px;"> <label
													for="mtn_cont${istatus.count}_${jstatus.count}">${j.NAME}</label>
												</li>
											</c:forEach>
										</ul></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="cont left" style="width: 600px;">
						<strong>정비내용 선택사항</strong>
						<div class="scrollBox03 board_view5" style="overflow: scroll;">
							<table id="repair">
								<colgroup>
									<col style="width: auto;">
									<col style="width: auto;">
									<col style="width: auto;">
								</colgroup>
								<tbody>

								</tbody>


							</table>
							<!-- <textarea name="" id="rcptSbc" readonly cols="30" rows="10" title="정비내용 선택사항" placeholder="정비내용선택 시 텍스트 자동 입력"></textarea> -->

						</div>
						<div class=" al_c pt20">
							<!-- div class="board_view2">
								<table>
									<colgroup>
										<col style="width: 130px;">
										<col style="width: auto;">
									</colgroup>
									<tr>
										<td class="lb">수리 비고</td>
										<td><input type="text" class="f_txtsmall w_500"
											name="repairnote" id="repairnote" placeholder="수리 비고"
											value="<c:out value='${rcptinfo[0].REPAIRNOTE}'/>"></td>
									</tr>
								</table>
							</div-->

							<a href="#" class="btn btn_blue_46 w_100" onclick="SaveRepair()"
								style="margin-top: 10px;">저장</a>
						</div>
					</div>
				</div>
		</form>

	</div>
	<!--// 아이디중복확인 팝업 -->

</body>
</html>