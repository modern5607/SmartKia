<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>업체코드 중복확인</title>
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
	function fnCheckId() {
		document.checkForm.checkId.value = document.checkForm.checkId.value
				.toUpperCase();
		if (document.checkForm.checkId.value == "") {
			alert("중복 조회할 아이디를 입력하십시오.");
			document.checkForm.focus();
			return;
		}
		if (fnCheckNotKorean(document.checkForm.checkId.value)) {
			document.checkForm.submit();
		} else {
			alert("한글은 사용할 수 없습니다.");
			return;
		}
	}
	function fnReturnId() {
		var retVal = "";
		if (document.checkForm.usedCnt.value == 0) {
			retVal = document.checkForm.resultId.value;
			//console.log(retVal);
			parent.showModalDialogCallback(retVal);
			fn_egov_cancel_popup();
		} else if (document.checkForm.usedCnt.value == 1) {
			alert("이미 사용 중인 아이디입니다.");
			return;
		} else {
			alert("먼저 중복 확인을 실행하십시오");
			return;
		}
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
	<div class="popup POP_DUPID_CONF" style="background-color: white;">

		<form name="checkForm" action="<c:url value='/mdm/SmartChkcode.do'/>">

			<div class="pop_inner">
				<div class="pop_header">
					<h1>업체코드 중복확인</h1>
					<button type="button" class="close"
						onclick="fn_egov_cancel_popup(); return false;">닫기</button>
				</div>

				<div class="pop_container">
					<div class="box_1">
						<label for="mid">사용할 업체코드</label> <input id="mid"
							class="f_txt2 ml15" type="text" name="checkId" title="선택여부"
							value="<c:out value="${checkId}"/>" maxlength="20" /> <input
							type="hidden" name="resultId" value="<c:out value="${checkId}"/>" />
						<input type="hidden" name="usedCnt"
							value="<c:out value="${usedCnt}"/>" />
					</div>

					<p class="result">
						<c:choose>
							<c:when test="${usedCnt eq -1}">
	                     	중복확인을 실행하십시오.
	                </c:when>
							<c:when test="${usedCnt eq 0}">
								<span>${checkId}</span> 는 사용가능한 업체코드입니다.
	                </c:when>
							<c:otherwise>
								<span>${checkId}</span> 는 사용할수 없는 업체코드입니다.
	                </c:otherwise>
						</c:choose>
					</p>

					<div class="btn_area al_c pt20">
						<a href="#LINK" class="btn btn_blue_46 w_100"
							onclick="javascript:fnCheckId(); return false;"><spring:message
								code="button.inquire" /></a>
						<!-- 조회 -->
						<a href="#LINK" class="btn btn_blue_46 w_100"
							onclick="javascript:fnReturnId(); return false;"><spring:message
								code="button.use" /></a>
						<!-- 사용 -->
					</div>
				</div>
			</div>

		</form>

	</div>
	<!--// 아이디중복확인 팝업 -->

</body>
</html>