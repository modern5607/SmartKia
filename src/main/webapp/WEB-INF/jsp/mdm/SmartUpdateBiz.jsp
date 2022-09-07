<%--
  Class Name : SmartaddBiz.jsp
  Description : 거래업체 등록 화면
  Modification Information
 
--%>
<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>기준정보 > 거래처관리 > 거래처관리 등록</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>

<validator:javascript formName="qnaManageVO" staticJavascript="false"
	xhtml="true" cdata="false" />
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_initl_qnacn() {

		// 첫 입력란에 포커스..
		SmartBizU.Custnm.focus();
	}
	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_inqire_qnalist() {
		SmartBizU.action = "<c:url value='/mdm/SmartBiz.do'/>";
		SmartBizU.submit();
	};

	/* 수정 */
	function fnUpdate() {

		document.SmartBizU.submit();

	}
</script>

</head>
<body onLoad="fn_egov_initl_qnacn();">

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
						<!--<c:import url="/sym/mms/EgovMenuLeft.do" /> -->
						<!--// Left menu -->

						<div class="content_wrap">
							<div id="contents" class="content">
								<!-- Location -->
								<div class="location">
									<ul>
										<li><a class="home" href="">Home</a></li>
										<li><a href="">기준정보</a></li>
										<li>거래처관리</li>
										<li>거래처관리 수정</li>
									</ul>
								</div>
								<!--// Location -->

								<form:form modelAttribute="SmartMdmBizVO" id="SmartBizU"
									name="SmartBizU"
									action="${pageContext.request.contextPath}/mdm/SmartUpdateBiz.do"
									method="post">
									<c:forEach items="${bizinfo}" var="bizinfo">
										<input type="hidden" id="UdateBiz" name="UdateBiz"
											value="<c:out value='${info.CUST_ID}'/>" />

										<h1 class="tit_1">거래처관리 수정</h1>

										<div class="board_view2" style="margin-top: 15px;">
											<table summary="Q&amp;A에 대한 정보를 등록합니다.">
												<caption>Q&amp;A내용등록</caption>
												<colgroup>
													<col style="width: 190px;">
													<col style="width: auto;">
												</colgroup>
												<tr>
													<td class="lb"><label for="Custnm">업체명</label> <span
														class="req">필수</span></td>
													<td><input id="Custnm" name="Custnm" class="f_txt"
														size="30" maxlength="30"
														value="<c:out value='${bizinfo.CUST_NM}'/>" /></td>
												</tr>
												<tr>
													<td class="lb"><label for="Custid">업체코드</label> <span
														class="req">필수</span></td>
													<td><span class="f_search2 w_300"> <input
															id="Custid" name="Custid" type="text" maxlength="20"
															value="<c:out value='${bizinfo.CUST_ID}'/>" readonly>
													</span> <span class="f_txt_inner ml15">(코드는 수정 불가 합니다.)</span></td>
												</tr>
												<tr>
													<td class="lb"><label for="Address">주소</label></td>
													<td><input id="Address" name="Address" class="f_txt"
														size="35" maxlength="35"
														value="<c:out value='${bizinfo.ADDRESS}'/>" /></td>
												</tr>
												<tr>
													<td class="lb"><label for="Ceo">대표자명</label></td>
													<td><input id="Ceo" name="Ceo" class="f_txt" size="30"
														maxlength="30" value="<c:out value='${bizinfo.CEO}'/>" />

													</td>
												</tr>
												<tr>
													<td class="lb"><label for="Business">사업자번호</label></td>
													<td><input id="Business" name="Business" class="f_txt"
														size="30" maxlength="30"
														value="<c:out value='${bizinfo.BUSINESS}'/>" /></td>
												</tr>
												<tr>
													<td class="lb"><label for="Tel">본사연락처</label></td>
													<td><input id="Tel" name="Tel" class="f_txt" size="30"
														maxlength="30" value="<c:out value='${bizinfo.TEL}'/>" />

													</td>
												</tr>
												<tr>
													<td class="lb"><label for="Custname">담당자</label></td>
													<td><input id="Custname" class="f_txt "
														name="Custname" size="30" maxlength="30"
														value="<c:out value='${bizinfo.CUST_NAME}'/>" /></td>
												</tr>
												<tr>
													<td class="lb"><label for="Custtel">담당자 연락처</label></td>
													<td><input id="Custtel" class="f_txt " name="Custtel"
														size="30" maxlength="30"
														value="<c:out value='${bizinfo.CUST_TEL}'/>" /></td>
												</tr>
												<tr>
													<td class="lb"><label for="Item">주거래품목</label></td>
													<td><label class="f_select w_300" for="Item">
															<select name="Item" id="Item">
																<option value="<c:out value='${bizinfo.ITEM}'/>"><c:out
																		value='${bizinfo.ITEM}' /></option>
																<c:forEach var="info" items="${itemcode}"
																	varStatus="status">
																	<option value="<c:out value='${info.CODE}'/>"><c:out
																			value="${info.NAME}" /></option>
																</c:forEach>
														</select>
													</label></td>
												</tr>
												<tr>
													<td class="lb"><label for="Custtype">거래처구분</label></td>
													<td><label class="f_select w_300" for="Custtype">
															<select name="Custtype" id="Custtype">
																<option value="매입">매입</option>
																<option value="매출">매출</option>
														</select>
													</label></td>
												</tr>
												<tr>
													<td class="lb"><label for="Useyn">사용유무</label></td>
													<td><label class="f_select w_300" for="Useyn">
															<select name="Useyn" id="Useyn">
																<option value="Y">사용</option>
																<option value="N">미사용</option>
														</select>
													</label></td>
												</tr>
												<tr>
													<td class="lb"><label for="Remark">비고</label></td>
													<td><input id="Remark" name="Remark" class="f_txt"
														size="30" maxlength="30"
														value="<c:out value='${info.REMARK}'/>" /></td>
												</tr>
												</c:forEach>
											</table>
										</div>

										<!-- 목록/저장버튼  시작-->
										<div class="board_view_bot">
											<div class="left_col btn3"></div>

											<div class="right_col btn1">
												<a href="#LINK" class="btn btn_blue_46 w_100"
													onclick="fnUpdate(); return false;">수정</a> <a
													href="<c:url value='/uss/olh/qna/QnaListInqire.do'/>"
													class="btn btn_blue_46 w_100"
													onclick="fn_egov_inqire_qnalist(); return false;"><spring:message
														code="button.list" /></a>
												<!-- 목록 -->
											</div>
										</div>
										<!-- 목록/저장버튼  끝-->
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