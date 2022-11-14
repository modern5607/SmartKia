<%--
  Class Name : EgovMberPasswordUpdt.jsp
  Description : 일반회원암호수정 JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.04.02  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.04.02
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

<title>목포서비스 KIA AUTO Q</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.passwordChgVO.action = "<c:url value='/mdm/SmartMberManage.do'/>";
    document.passwordChgVO.submit();
}
function fnUpdate(){
    if(validatePasswordChgVO(document.passwordChgVO)){
        if(document.passwordChgVO.newPassword.value != document.passwordChgVO.newPassword2.value){
            alert("<spring:message code='fail.user.passwordUpdate2' />");
            return;
        }
        document.passwordChgVO.submit();
    }
}
<c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}' />");</c:if>
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
	                    <c:import url="/sym/mms/EgovMenuLeft.do" />
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

								<form name="passwordChgVO" method="post" action="<c:url value="${'/mdm/SmartMberPasswordUpdt.do'}"/>" >
						        <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
						        <input name="checkedIdForDel" type="hidden" />
						        <!-- 검색조건 유지 -->
						        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
						        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
						        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
						        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
						        <!-- 우편번호검색 -->
						        <input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />

								<h1 class="tit_1" style="padding-bottom:20px">사용자 암호변경페이지</h1>

                                <!-- <p class="txt_1">사용자 및 권한에 대한 제반사항을 관리합니다.</p> -->

                                <div class="board_view2">
                                    <table summary="SUMMARY">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="">사용자아이디</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="mberId" id="mberId" class="f_txt" type="text" value="<c:out value='${smartMberManageVO.mberId}'/>" maxlength="20" readonly />
							                    <input name="uniqId" id="uniqId" type="hidden" value="<c:out value='${smartMberManageVO.uniqId}'/>" />
							                    <input name="userTy" id="userTy" type="hidden" value="<c:out value='${smartMberManageVO.userTy}'/>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">기존 비밀번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="oldPassword" id="oldPassword" class="f_txt" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">비밀번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="newPassword" id="newPassword" class="f_txt" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="">비밀번호 확인</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input name="newPassword2" id="newPassword2" class="f_txt" type="password" value="" maxlength="100" />
                                            </td>
                                        </tr>

                                    </table>
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:document.passwordChgVO.reset();"><spring:message code="button.reset" /></a><!-- 취소 -->
                                    </div>
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fnUpdate(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/mdm/SmartMberManage.do'/>" class="btn btn_blue_46 w_100" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- 목록/저장버튼  끝-->
                                
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