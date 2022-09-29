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

function ReceiveCancel() {
	var seq = $("#seq").val();
	parent.CancelReceive(seq);
	fn_egov_cancel_popup();
}
function fn_egov_cancel_popup() {
	parent.fn_egov_modal_remove();
}

</script>
</head>
<body>
	<div class="popup POP_DUPID_CONF" style="background-color: white;">
		<form name="checkForm" action="<c:url value='/tablet/ReceiveCancel.do'/>">
			<div class="pop_inner">
				<div class="pop_header">
					<h1>입고 취소</h1>
					<button type="button" class="close"
						onclick="fn_egov_cancel_popup(); return false;">닫기</button>
					<input type="hidden" name="seq" id="seq" value ="${seq}" >
				</div>
				<div class="pop_container">
					<p class="result"> 접수번호 <c:out value="${seq}" /> 의 입고를 취소하시겠습니까?</p>
					<div class="btn_area al_c pt20">
						<a href="#LINK" class="btn btn_blue_46 w_100"
							onclick="ReceiveCancel(); return false;">예</a>
							<a href="#LINK" class="btn btn_blue_46 w_100"
							onclick= "fn_egov_cancel_popup(); return false;">아니요</a>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>