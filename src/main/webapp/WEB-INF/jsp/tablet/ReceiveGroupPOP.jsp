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
	
	function fnReturnId() {
		var autoroom = $("#autoroom option:selected").val();
		var remark = $("#remark").val();
		console.log(autoroom, remark);
		parent.ReceiveAutoRoom(autoroom,remark);
		fn_egov_cancel_popup();
	}

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

		<form name="checkForm" action="<c:url value='/tablet/ReceiveGroupPOP.do'/>">

			<div class="pop_inner">
				<div class="pop_header">
					<h1>입고 처리</h1>
					<button type="button" class="close"
						onclick="fn_egov_cancel_popup(); return false;">닫기</button>
				</div>

				<div class="pop_container">
					<div class="box_1">
						<label for="" >목적지 작업반</label> 
						<input type="text" readonly name="autoroom" value="<c:out value='${logininfo.TEAM}'/>">
                        <!-- label class="f_select w_300" for="autoroom" style="margin-top:-10px;">
                            < select name="autoroom" id="autoroom">
								<option value="">선택</option>
								<c:forEach var="info" items="${positions}" varStatus="status">
									<option value="<c:out value='${info.CODE}'/>"><c:out value="${info.NAME}" /></option>
								</c:forEach>
                            </select >
                        </label-->
                        <label for="">입고 비고</label> 
                        <input id="remark" class="f_select w_300" type="text" name="remark" value="" maxlength="50" style="margin-left: 30px; margin-top: 5px;"/>
					</div>
					<div class="btn_area al_c pt20">
						<a href="#LINK" class="btn btn_blue_46 w_100"
							onclick="javascript:fnReturnId(); return false;">배정</a>
						<!-- 조회 -->
					</div>
				</div>
			</div>

		</form>

	</div>
	<!--// 아이디중복확인 팝업 -->

</body>
</html>