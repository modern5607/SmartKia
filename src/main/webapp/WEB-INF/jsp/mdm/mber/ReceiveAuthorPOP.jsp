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
	


	function fncAddAuthorInsert() {

/* 		if(!fncManageChecked()) return; */
		
	    if(confirm('<spring:message code="common.regist.msg" />')) {
	        /* document.listForm.action = "<c:url value='/mdm/mber/SmartAuthorInsert.do'/>"; */
	        document.listForm.submit();
	    }
	}

	function fncAuthorDelete() {
	 
/* 		if(!fncManageChecked()) return; */

	    if(confirm('<spring:message code="common.delete.msg" />')) {
	        /* document.listForm.action = "<c:url value='/mdm/mber/SmartAuthorDelete.do'/>"; */
	        document.listForm.submit(); 
	    }
	}
	
</script>
</head>
<body>

	<!-- 아이디중복확인 팝업 -->
	<div class="popup POP_DUPID_CONF" style="background-color: white;">

		<form name="checkForm" action="<c:url value='/tablet/ReceiveAuthorPOP.do'/>">

			<div class="pop_inner">
				 <div class="pop_header">
					<h1>사용여부</h1>
					<button type="button" class="close"
						onclick="fn_egov_cancel_popup(); return false;">닫기</button>
				</div>

				<div class="pop_container">
					<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncAddAuthorInsert()" style="selector-dummy:expression(this.hideFocus=false);">사용</a><!-- 등록 -->
					<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncAuthorDelete()" style="selector-dummy:expression(this.hideFocus=false);">사용중지</a><!-- 삭제 -->
				</div>
			</div>

		</form>

	</div>
	<!--// 아이디중복확인 팝업 -->

</body>
</html>