
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
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
<script src="<c:url value='/'/>js/jquery.js"></script>
<script src="<c:url value='/'/>js/jqueryui.js"></script>
<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

<title>샘플 포털 > 포털시스템관리 > 사용자관리 > 회원관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false"
	xhtml="true" cdata="false" />
<script type="text/javaScript" language="javascript">

// function fnIdCheck(){
//     var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>?";
    
//     var varParam = new Object();
//     var checkId = document.mberManageVO.mberId.value;
//     var varParam = "checkId="+checkId;
    
//     var $dialog = $('<div id="modalPan"></div>')
// 	.html('<iframe style="border: 0px;" src="' + "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>?" + varParam +'" width="100%" height="100%"></iframe>')
// 	.dialog({
//     	autoOpen: false,
//         modal: true,
//         width: 600,
//         height: 450
// 	});
//     $(".ui-dialog-titlebar").hide();
// 	$dialog.dialog('open');
// }

// function fn_egov_ZipSearch(){
    
//     var $dialog = $('<div id="modalPan"></div>')
// 	.html('<iframe style="border: 0px; " src="' + "<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>" +'" width="100%" height="100%"></iframe>')
// 	.dialog({
//     	autoOpen: false,
//         modal: true,
//         width: 1100,
//         height: 600
// 	});
//     $(".ui-dialog-titlebar").hide();
// 	$dialog.dialog('open');
// }

// function fn_egov_returnValue(retVal){
// 	if (retVal) {
// 		document.getElementById("zip_view").value  = retVal.vZip;
// 		document.getElementById("adres").value  = retVal.sAddr;
// 	}
	
// 	fn_egov_modal_remove();
// }

// /**********************************************************
//  * 모달 종료 버튼
//  ******************************************************** */
// function fn_egov_modal_remove() {
// 	$('#modalPan').remove();
// }

// function showModalDialogCallback(retVal) {
// 	if(retVal) {
//         document.mberManageVO.mberId.value = retVal;
//         document.mberManageVO.id_view.value = retVal;
//     }
// 	fn_egov_modal_remove();
// }

// function fnListPage(){
//     document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberManage.do'/>";
//     document.mberManageVO.submit();
// }
function fnInsert(){
	
    document.comCodeVO.submit();
    
}

</script>
</head>
<body>
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
						<c:import url="/sym/mms/EgovMenuLeft.do" />
						<!--// Left menu -->

						<div class="content_wrap">
							<div id="contents" class="content">
								<!-- Location -->
								<div class="location">
									<ul>
										<li><a class="home" href="">Home</a></li>
										<li><a href="">포털시스템관리</a></li>
										<li><a href="">사용자관리</a></li>
										<li>회원관리</li>
									</ul>
								</div>
								<!--// Location -->

								<form:form modelAttribute="comCodeVO" name="comCodeVO"	action="${pageContext.request.contextPath}/mdm/UpdateCommonGroupCode.do" method="post">
								<c:forEach items="${info}" var="info">
                                    <input type="hidden" id="previousgroupcode" name="previousgroupcode" value="<c:out value='${info.GROUP_CODE}'/>" />
									<h2 class="tit_2">공통코드 수정</h2>

									<div class="board_view2">
										<table summary="일반회원 등록정보">
											<colgroup>
												<col style="width: 190px;">
												<col style="width: auto;">
											</colgroup>
											
											<tr>
												<td class="lb"><label for="groupcode">그룹코드</label> <span class="req">필수</span></td>
												<td><input name="groupcode" id="groupcode" class="f_txt w_350"  type="text" value="<c:out value='${info.GROUP_CODE}'/>" /></td>
											</tr>
											<tr>
												<td class="lb"><label for="groupname">그룹코드명</label> <span
													class="req">필수</span></td>
												<td><input name="groupname" id="groupname" class="f_txt w_350"  type="text" value="<c:out value='${info.GROUP_NAME}'/>" maxlength="60" /></td>
											</tr>
											<tr>
												<td class="lb"><label for="groupremark">비고</label></td>
												<td><input name="groupremark" id="groupremark" class="f_txt w_350"  type="text" value="<c:out value='${info.REMARK}'/>" maxlength="60" /></td>
											</tr>
											<tr>
												<td class="lb"><label for="USE_YN">사용유무</label></td>
												<td>
													<label class="f_select w_350" for="groupuseyn">
														<select name="groupuseyn" id="groupuseyn">
															<option value="Y" <c:if test="${info.USE_YN eq 'Y'}">selected</c:if>>사용</option>	
															<option value="N" <c:if test="${info.USE_YN eq 'N'}">selected</c:if>>사용안함</option>	
														</select>
													</label>
												</td>
											</tr>
											<tr>
												<td class="lb"><label for="groupord">출력순서</label></td>
												<td><input type="number" name="groupord" id="groupord" class="f_txt w_350" value="<c:out value='${info.GROUP_ORD}'/>" min="0"></td>
											</tr>
											
											</c:forEach>
											
										</table>
									</div>

									<!-- 목록/저장버튼  시작-->
									<div class="board_view_bot">
										<div class="left_col btn3">
											<a href="#LINK" class="btn btn_skyblue_h46 w_100"
												onclick="javascript:document.mberManageVO.reset();"><spring:message code="button.reset" /></a>
											<!-- 취소 -->
										</div>

										<div class="right_col btn1">
											<a href="#LINK" class="btn btn_blue_46 w_100"
												onclick="fnInsert(); return false;"><spring:message
													code="button.save" /></a>
											<!-- 저장 -->
											<a href="<c:url value='/uss/umt/mber/EgovMberManage.do'/>"
												class="btn btn_blue_46 w_100"
												onclick="fnListPage(); return false;"><spring:message
													code="button.list" /></a>
											<!-- 목록 -->
										</div>
									</div>
								</form:form>
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