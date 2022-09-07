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
	

	/* ********************************************************
	 * 취소처리
	 ******************************************************** */
	function fn_egov_cancel_popup() {

		parent.fn_egov_modal_remove();
	}

	
</script>
</head>
<body>

	<!-- 아이디중복확인 팝업 -->
	<div class="popup POP_DUPID_CONF" style="background-color: white;">

		<form name="checkForm" action="<c:url value='/tablet/OTWGroupPOP.do'/>">

			<div class="pop_inner">
				<div class="pop_header">
					<h1>시간 변경</h1>
					<button type="button" class="close"
						onclick="fn_egov_cancel_popup(); return false;">닫기</button>
				</div>

				<div class="pop_container">
					<div class="box_1">
						<label for="mid">시분초 추가</label> <input id="mid"
							class="f_txt2 ml15" type="text" name="checkId" title="선택여부"
							value="<c:out value="${checkId}"/>" maxlength="20" /> <input
							type="hidden" name="resultId" value="<c:out value="${checkId}"/>" />
							<a href="#LINK" class="btn btn_blue_46 w_50"
							onclick="javascript:fnReturnId(); return false;">계산</a>
					</div>

					<p class="result">
						<c:choose>
							<c:when test="${usedCnt eq -1}">
	                     	예상 완료 시간 00:00
	                </c:when>
							<c:when test="${usedCnt eq 0}">
								<span>${checkId}</span> 예상 완료 시간 00:00
	                </c:when>
							<c:otherwise>
								<span>${checkId}</span> 예상 완료 시간 00:00
	                </c:otherwise>
						</c:choose>
					</p>

					<div class="btn_area al_c pt20">
						<a href="#LINK" class="btn btn_blue_46 w_100"
							onclick="javascript:fnCheckId(); return false;">저장</a>
						<!-- 조회 -->
					</div>
				</div>
			</div>

		</form>

	</div>
	<!--// 아이디중복확인 팝업 -->

</body>
</html>