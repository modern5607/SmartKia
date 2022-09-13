<%--
  Class Name : EgovMberSelectUpdt.jsp
  Description : 일반회원상세조회, 수정 JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.02  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.02
--%> 
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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
	
<title>기준정보 > 사용자관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="smartMberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.smartMberManageVO.action = "<c:url value='/mdm/SmartMberManage.do'/>";
    document.smartMberManageVO.submit();
}
function fnDeleteMber(checkedIds) {
    if(confirm('<spring:message code="common.delete.msg" />')) {
        document.smartMberManageVO.checkedIdForDel.value=checkedIds;
        document.smartMberManageVO.action = "<c:url value='/mdm/SmartMberDelete.do'/>";
        document.smartMberManageVO.submit(); 
    }
}
function fnPasswordMove(){
    document.smartMberManageVO.action = "<c:url value='/mdm/SmartMberPasswordUpdtView.do'/>";
    document.smartMberManageVO.submit();
}
function fnUpdate(){
	document.smartMberManageVO.action = "<c:url value='/mdm/SmartMberManage.do'/>";
    if(validateSmartMberManageVO(document.smartMberManageVO)){
        document.smartMberManageVO.submit();
    }
}



/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}
/* 전화번호 하이폰 자동생성 */
$(document).on("keyup", ".phoneNumber", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});
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
                            <div id="contents" class="content">
                                 <!-- Location -->
                                <div class="location">
                                    <ul>
                                        <li><a class="home" href="">Home</a></li>
                                        <li><a href="">기준정보</a></li>
                                        <li>사용자관리</li>
                                    </ul>
                                </div>
                                <!--// Location -->

								<form:form modelAttribute="smartMberManageVO" name="smartMberManageVO"  method="post" >
								
								<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
					            <input name="checkedIdForDel" type="hidden" />
					            <!-- 검색조건 유지 -->
					            <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
					            <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
					            <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
					            <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
					            <!-- 우편번호검색 -->
					            <input type="hidden" name="zip_url" value="<c:url value='/sym/cmm/EgovCcmZipSearchPopup.do'/>" />
					            <!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
					            <input type="hidden" name="userTyForPassword" value="<c:out value='${smartMberManageVO.userTy}'/>" />

                                <!-- <h1 class="tit_1">사용자관리</h1>

                                <p class="txt_1">사용자 및 권한에 대한 제반사항을 관리합니다.</p>

								<h2 class="tit_2">사용자관리</h2>

                                <h3 class="tit_3">회원관리</h3> -->

                                <div class="board_view2">
                                    <table summary="일반회원정보 상세조회">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberId">사용자아이디</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input readonly="true" path="mberId" id="mberId" class="f_txt f_select w_350" size="20" maxlength="20"  disabled="disabled"/>
                                                <form:errors path="mberId" cssClass="error" />
                                                <form:hidden path="uniqId" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberNm">사용자이름</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:input path="mberNm" id="mberNm" class="f_txt w_350" maxlength="60" />
                                                <form:errors path="mberNm" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	반
                                              <!-- <span class="req">필수</span> -->
                                            </td>
                                            <td>
	                                            <label class="f_select w_350" for="team">
		                                          <select id="team" name="team">
		                                          	<option value=''>없음</option>
		                                          	<c:forEach var="team" items="${team}" varStatus="status">
		                                          		<option value="<c:out value='${team.CODE}'/>"><c:out value='${team.NAME}'/> </option>
		                                          	</c:forEach>
		                                          </select>
	                                          	</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="useYn">사용여부</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td class="rdoSet"><!-- 2개이상 radio 있을때 필요 -->
                                                <label for="rdo1" class="mr30 <c:if test="${smartMbermanageVO.useYn == 'Y'}"> on</c:if>">
                                                    <input type="radio" id="rdo1" name="useYn" class="radio2" value="Y" <c:if test="${smartMbermanageVO.useYn == 'Y'}"> checked="checked"</c:if>>
                                                    사용
                                                </label>
                                                <label for="rdo2" class="<c:if test="${smartMbermanageVO.useYn == 'N'}"> on</c:if>">
                                                    <input type="radio" id="rdo2" name="useYn" class="radio2" value="N" <c:if test="${smartMbermanageVO.useYn == 'N'}"> checked="checked"</c:if>>
                                                    미사용
                                                </label>
                                                <br/><form:errors path="useYn" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="areaNo">전화번호</label>
                                            </td>
                                            <td>
                                                <form:input path="areaNo" id="areaNo" class="f_txt w_350 phoneNumber" maxlength="15" />
                                                <form:errors path="areaNo" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberFxnum">팩스번호</label>
                                            </td>
                                            <td>
                                                <form:input path="mberFxnum" id="mberFxnum" class="f_txt w_350" maxlength="15" />
                                                <form:errors path="mberFxnum" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="moblphonNo">핸드폰번호</label>
                                            </td>
                                            <td>
                                                <form:input path="moblphonNo" id="moblphonNo" class="f_txt w_350 phoneNumber" title="핸드폰번호" maxlength="15" />
                                                <form:errors path="moblphonNo" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberEmailAdres">이메일주소</label>
                                            </td>
                                            <td>
                                                <form:input path="mberEmailAdres" id="mberEmailAdres" class="f_txt w_350" maxlength="50" />
                                                <form:errors path="mberEmailAdres" cssClass="error" />
                                            </td>
                                        </tr>
                                       
                                        
                                        <%-- <tr>
                                            <td class="lb">
                                            	<label for="groupId">그룹아이디</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_350" for="groupId">
                                                    <form:select path="groupId" id="groupId" name="groupId">
					                                    <form:option value="" label="--선택하세요--"/>
					                                    <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
					                                </form:select>
					                                <form:errors path="groupId" cssClass="error"/>
                                                </label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	<label for="mberSttus">일반회원상태코드</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <label class="f_select w_350" for="mberSttus">
                                                    <form:select path="mberSttus" id="mberSttus" name="mberSttus">
					                                    <form:option value="" label="--선택하세요--"/>
					                                    <form:options items="${mberSttus_result}" itemValue="code" itemLabel="codeNm"/>
					                                </form:select>
					                                <form:errors path="mberSttus" cssClass="error"/>
                                                </label>
                                            </td>
                                        </tr> --%>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <%-- <a href="<c:url value='/mdm/SmartMberManage.do'/>" class="btn btn_skyblue_h46 w_100" onclick="fnDeleteMber('<c:out value='${smartMberManageVO.userTy}'/>:<c:out value='${smartMberManageVO.uniqId}'/>'); return false;"><spring:message code="button.delete" /></a><!-- 삭제 --> --%>
                                        <a href="<c:url value='/mdm/SmartMberPasswordUpdtView.do'/>" class="btn btn_skyblue_h46 w_100" onclick="fnPasswordMove(); return false;"><spring:message code="button.passwordUpdate" /></a><!-- 암호변경 -->
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:document.smartMberManageVO.reset();"><spring:message code="button.reset" /></a><!-- 취소 -->
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fnUpdate(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/mdm/SmartMberManage.do'/>" class="btn btn_blue_46 w_100" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- 목록/저장버튼  끝-->
                                
                                <form:hidden path="password" />
                                </form:form>
                                
                                <!--// 게시판 -->
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