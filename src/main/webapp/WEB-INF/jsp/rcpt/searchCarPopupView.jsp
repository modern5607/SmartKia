<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ID중복확인</title>
<base target="_self" >
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

<script type="text/javascript" src="<c:url value='/js/showModalDialogCallee.js'/>" ></script>
<script type="text/javaScript" language="javascript">

function fnCheckId(){
    if(document.SmartRcptVO.checkcarnum.value==""){
        alert("차량번호를 입력해 주세요");
        document.SmartRcptVO.focus();
        return;
    }
    if(fnCheckNotKorean(document.SmartRcptVO.checkcarnum.value)){
        document.SmartRcptVO.submit();
    }else{
        alert("한글은 사용할 수 없습니다.");
        return;
    }
}

function fnReturnId(id,carnum,name,kind,tel){
    
    parent.returnValue(id,carnum,name,kind,tel);
    fn_egov_cancel_popup();
}


/* ********************************************************
 * 취소처리
 ******************************************************** */
function fn_egov_cancel_popup() {
	
	parent.fn_egov_modal_remove();
}

function fnCheckNotKorean(koreanStr){                  
    for(var i=0;i<koreanStr.length;i++){
        var koreanChar = koreanStr.charCodeAt(i);
        if( !( 0xAC00 <= koreanChar && koreanChar <= 0xD7A3 ) && !( 0x3131 <= koreanChar && koreanChar <= 0x318E ) ) { 
        }else{
            //hangul finding....
            return false;
        }
    }
    return true;
}

</script>
</head>
<body>

    <!-- 아이디중복확인 팝업 -->
    <div class="popup POP_DUPID_CONF" style="background-color: white; text-align: center;">
    
    	<form name="SmartRcptVO" action ="<c:url value='/rcpt/checkcarinfo.do'/>">
    
        <div class="pop_inner" style="width:100%;">
            <div class="pop_header">
                <h1>차량 조회</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <div class="box_3">
                    <label for="checkcarnum">차량번호</label>
                    <input id="checkcarnum" class="f_txt2 ml15" type="text" name="checkcarnum" value="<c:out value="${checkcarnum}"/>" maxlength="20" />
                    <input type="hidden" name="resultId" value="<c:out value="${checkcarNum}"/>" />
                    
                    <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fnCheckId(); return false;"><spring:message code="button.inquire" /></a>
                </div>

                    <table class="board_list4" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;">
                        <colgroup>
                            <col style="width: 150px;">
                            <col style="width: 150px;">
                            <col style="width: 200px;">
                            <col style="width: 200px;">
                            <col style="width: auto;">
                        </colgroup>
                        <thead>
                            <th>차량번호</th>
                            <th>성함</th>
                            <th>차종</th>
                            <th>연락처</th>
                            <th>선택</th>
                        </thead>
                        <tbody>
                            <c:if test="${fn:length(CarList) == 0}">
                                <tr>
                                    <td colspan="6"><spring:message code="common.nodata.msg" /></td>
                                </tr>
                            </c:if>
                            <c:forEach var="list" items="${CarList}" varStatus="status">
                                <tr>
                                    <td><c:out value="${list.CUSTOMER_AUTONO}"/></td>
                                    <td><c:out value="${list.CUSTOMER_NAME}"/></td>
                                    <td><c:out value="${list.CUSTOMER_AUTOKIND}"/></td>
                                    <td><c:out value="${list.CUSTOMER_TEL}"/></td>
                                    <td><a href="#LINK" class="btn btn_blue_30 w_50" onclick="javascript:fnReturnId('${list.CUSTOMER_ID}','${list.CUSTOMER_AUTONO}','${list.CUSTOMER_NAME}','${list.CUSTOMER_AUTOKIND}','${list.CUSTOMER_TEL}'); return false;"><spring:message code="button.use" /></a></td>
                                </tr>
    
                            </c:forEach>
                        </tbody>
                    </table>
                

                <div class="btn_area al_c pt20">
                	
                    
                </div>
            </div>
        </div>
        
        </form>
        
    </div>
    <!--// 아이디중복확인 팝업 -->
    
</body>
</html>