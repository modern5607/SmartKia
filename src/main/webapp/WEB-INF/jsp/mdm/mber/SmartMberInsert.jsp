<%--
  Class Name : EgovMberInsert.jsp
  Description : 일반회원등록 JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.02  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스개발팀 JJY
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
<script type="text/javaScript" language="javascript">


function fnIdCheck(){
    var url = "<c:url value='/mdm/SmartIdDplctCnfirmView.do'/>?";
    
    var varParam = new Object();
    var checkId = document.smartMberManageVO.mberId.value;
    var varParam = "checkId="+checkId;
    
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px;" src="' + "<c:url value='/mdm/SmartIdDplctCnfirmView.do'/>?" + varParam +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 600,
        height: 450
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

function fn_egov_ZipSearch(){
    
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px; " src="' + "<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>" +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1100,
        height: 600
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

function fn_egov_returnValue(retVal){
	if (retVal) {
		document.getElementById("zip_view").value  = retVal.vZip;
		document.getElementById("adres").value  = retVal.sAddr;
	}
	
	fn_egov_modal_remove();
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

function showModalDialogCallback(retVal) {
	if(retVal) {
        document.smartMberManageVO.mberId.value = retVal;
        document.smartMberManageVO.id_view.value = retVal;
    }
	fn_egov_modal_remove();
}

function fnListPage(){
    document.smartMberManageVO.action = "<c:url value='/mdm/SmartMberManage.do'/>";
    document.smartMberManageVO.submit();
}

function fnInsert(){
	if(validateSmartMberManageVO(document.smartMberManageVO)){ 
		if(document.smartMberManageVO.password.value != document.smartMberManageVO.password2.value){
    		alert("<spring:message code="fail.user.passwordUpdate2" />");
    		return;
		}
		document.smartMberManageVO.submit();
	} 
}
/* 전화번호 하이폰 자동생성 */
$(document).on("keyup", ".phoneNumber", function() { 
	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
});
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

								<form:form modelAttribute="smartMberManageVO" name="smartMberManageVO" action="${pageContext.request.contextPath}/mdm/SmartMberInsert.do" method="post" >

                                <!-- <h1 class="tit_1">사용자관리</h1>

                                <p class="txt_1">사용자 및 권한에 대한 제반사항을 관리합니다.</p>
 -->
<!--                                 <h2 class="tit_2">사용자관리</h2>

                                <h3 class="tit_3">회원관리</h3> -->

                                <div class="board_view2">
                                    <table summary="일반회원 등록정보">
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
                                                <span class="f_search2 w_350">
                                                    <input id="id_view" type="text" maxlength="20" disabled="disabled" name="id_view" readonly >
                                                    <form:input path="mberId" type="hidden" readonly="true" maxlength="20" />
                                                    <button type="button" class="btn" onclick="javascript:fnIdCheck(); return false;"></button>
                                                </span>
                                                <span class="f_txt_inner ml15">(중복 아이디 검색)</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberNm">사용자이름</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="mberNm" id="mberNm" class="f_txt w_350" title="일반회원이름" type="text" value="" maxlength="60" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="password">비밀번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <form:password path="password" id="password" class="f_txt w_350" title="비밀번호" maxlength="20" />
                                                <form:errors path="password" cssClass="error" />
                                            </td>
                                        </tr>
                                         <tr>
                                            <td class="lb">
                                                <label for="password2">비밀번호확인</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="password2" id="password2" class="f_txt w_350" title="비밀번호확인" type="password" maxlength="20" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                            	반
                                              <!-- <span class="req">필수</span> -->
                                            </td>
                                            <td>
	                                            <label class="f_select w_350" for="team">
		                                          <form:select id="team" name="team" path="team" title="team">
		                                          	<form:option path="team" type="hidden" value='A'>A</form:option>
		                                           	<form:option path="team" type="hidden" value='B'>B</form:option>
		                                          	<form:option path="team" type="hidden" value='C'>C</form:option>
		                                          </form:select>
	                                          	</label>
                                            </td>
                                            <%-- <td>
                                                 <label class="f_select w_350" for="group">
                                                    <form:select path="team" id="team" title="반">
                                                        <form:option value="" label="--선택하세요--"/>
                                                        <form:options items="${team}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                    <form:errors path="team" cssClass="error"/>
                                                </label>
                                            </td> 
                                            <form:select id="bbsTyCode" name="bbsTyCode" path="bbsTyCode" title="게시판유형선택">
                                                    	<form:option value='' label="선택하세요" />
                                                    	<form:options items="${team}" itemValue="code" itemLabel="codeNm" />
                                                    </form:select> --%>
                                            
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
                                          <%--   <td>
                                              <label class="f_select w_350" for="useYn">
                                                    <form:select path="useYn" id="useYn" title="사용여부">
                                                        <form:option value="" label="--선택하세요--"/>
                                                        <form:options items="${mberYn_result}" itemValue="code" itemLabel="codeNm"/>
                                                    </form:select>
                                                    <form:errors path="mberYn" cssClass="error"/>
                                                </label>  
                                            </td> --%>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="areaNo">전화번호</label>
                                            </td>
                                            <td>
                                                <form:input path="areaNo" id="areaNo" class="f_txt w_350 phoneNumber" title="전화번호" maxlength="15" />
                                                <%-- <span class="f_txt_inner mr5 ml5" title="전화번호 첫번째">-</span>
                                                <form:input path="middleTelno" id="middleTelno" class="f_txt w_80" title="전화번호 두번째" maxlength="5" />
                                                <span class="f_txt_inner mr5 ml5">-</span>
                                                <form:input path="endTelno" id="endTelno" class="f_txt w_80" title="전화번호 세번째" maxlength="5" /> --%>
                                                <form:errors path="areaNo" cssClass="error" />
                                                <%-- <form:errors path="middleTelno" cssClass="error" />
                                                <form:errors path="endTelno" cssClass="error" /> --%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">팩스번호</label>
                                            </td>
                                            <td>
                                                <form:input path="mberFxnum" id="mberFxnum" class="f_txt w_350" title="팩스번호" maxlength="15" />
                                                <form:errors path="mberFxnum" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="mberFxnum">핸드폰번호</label>
                                            </td>
                                            <td>
                                                <form:input path="moblphonNo" id="moblphonNo" class="f_txt w_350 phoneNumber" title="핸드폰번호" maxlength="15" />
                                                <%-- <span class="f_txt_inner mr5 ml5" title="핸드폰번호 첫번째">-</span>
                                                <form:input path="middleMoblphonNo" id="middleMoblphonNo" class="f_txt w_80" title="핸드폰번호 두번째" maxlength="4" />
                                                <span class="f_txt_inner mr5 ml5">-</span>      
                                                <form:input path="endMoblphonNo" id="endMoblphonNo" class="f_txt w_80" title="핸드폰번호 세번째" maxlength="4" /> --%>
                                                <form:errors path="moblphonNo" cssClass="error" />
                                                <%-- <form:errors path="middleMoblphonNo" cssClass="error" />
                                                <form:errors path="endMoblphonNo" cssClass="error" /> --%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">이메일주소</label>
                                            </td>
                                            <td>
                                                <form:input path="mberEmailAdres" id="mberEmailAdres" class="f_txt w_350" title="이메일주소" maxlength="50" />
                                                <form:errors path="mberEmailAdres" cssClass="error" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <div class="board_view_bot">
                                    <%-- <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:document.smartMberManageVO.reset();"><spring:message code="button.reset" /></a><!-- 취소 -->
                                    </div> --%>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fnInsert(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/mdm/SmartMberManage.do'/>" class="btn btn_blue_46 w_100" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- 목록/저장버튼  끝-->
                                
                                
                                <input name="checkedIdForDel" type="hidden" />
						        <!-- 검색조건 유지 -->
						        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
						        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
						        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
						        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
						        <!-- 우편번호검색 -->
						        <input type="hidden" name="zip_url" value="<c:url value='/sym/cmm/EgovCcmZipSearchPopup.do'/>" />
						        
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