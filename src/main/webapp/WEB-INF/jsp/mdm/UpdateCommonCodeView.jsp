
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

	<title>목포서비스 KIA AUTO Q</title>
	<script type="text/javascript" src="<c:url value='/validator.do'/>"></script>
	<script type="text/javaScript">

	function fnInsert(){

		document.comCodeVO.submit();

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

							<form name="comCodeVO"	action="${pageContext.request.contextPath}/mdm/UpdateCommonCode.do" method="post">
								<input type="hidden" id="previouscode" name="previouscode" value="<c:out value='${info[0].CODE}'/>" />
								<h2 class="tit_2">공통코드 수정</h2>

								<div class="board_view2">
									<table summary="일반회원 등록정보">
										<colgroup>
											<col style="width: 190px;">
											<col style="width: auto;">
										</colgroup>
										
										<tr>
											<td class="lb"><label for="groupcode">그룹코드</label></td>
											<td><input name="groupcode" id="groupcode" class="f_txt w_350" readonly type="text" value="<c:out value='${info[0].GROUP_CODE}'/>" /></td>
										</tr>
										<tr>
											<td class="lb"><label for="code">코드</label></td>
											<td><input name="code" id="code" class="f_txt w_350" type="text" value="<c:out value='${info[0].CODE}'/>" readonly/></td>
										</tr>
										<tr>
											<td class="lb"><label for="name">코드명</label> <span
												class="req">필수</span></td>
											<td><input name="name" id="name" class="f_txt w_350"  type="text" value="<c:out value='${info[0].NAME}'/>" maxlength="60" /></td>
										</tr>
										<tr>
											<td class="lb"><label for="remark">비고</label></td>
											<td><input name="remark" id="remark" class="f_txt w_350"  type="text" value="<c:out value='${info[0].REMARK}'/>" maxlength="60" /></td>
										</tr>
										<tr>
											<td class="lb"><label for="USE_YN">사용유무</label></td>
											<td>
												<label class="f_select w_350" for="useyn">
													<select name="useyn" id="useyn">
														<option value="Y" <c:if test="${info[0].USE_YN eq 'Y'}">selected</c:if>>사용</option>	
														<option value="N" <c:if test="${info[0].USE_YN eq 'N'}">selected</c:if>>사용안함</option>	
													</select>
												</label>
											</td>
										</tr>
										<tr>
											<td class="lb"><label for="ord">출력순서</label></td>
											<td><input type="number" name="ord" id="ord" class="f_txt w_350" value="<c:out value='${info[0].ORD}'/>" min="0"></td>
										</tr>
										
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
										<a href="<c:url value='/mdm/SmartCode.do'/>"
											class="btn btn_blue_46 w_100"
											onclick="fnListPage(); return false;"><spring:message
												code="button.list" /></a>
										<!-- 목록 -->
									</div>
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