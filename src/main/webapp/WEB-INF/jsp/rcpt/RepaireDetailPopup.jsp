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
$(document).ready(function () {
	console.log("asdf");
    $("#checkcarnum").focus();
});
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
                <h1>수리항목 리스트</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <!-- <div class="box_3">
                    <label for="checkcarnum">차량번호</label>
                    <input id="checkcarnum" class="f_txt2 ml15" type="text" name="checkcarnum" value="<c:out value="${checkcarnum}"/>" maxlength="20" />
                    <input type="hidden" name="resultId" value="<c:out value="${checkcarNum}"/>" />
                    
                    <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fnCheckId(); return false;"><spring:message code="button.inquire" /></a>
                </div> -->
                <label class="f_selectsmall">
                    <select name="leadtimemain" id="leadtimemain">
                        <option value="">선택</option>
                        <c:forEach var="i" items="${leadtime}" varStatus="status">
                            <option value="<c:out value='${i.CODE}'/>"><c:out value="${i.NAME}"/></option>
                        </c:forEach>
                    </select>
                </label>
                
                <label class="f_selectsmall">
                    <select name="leadtimemiddle" id="leadtimemiddle">
                    </select>
                </label>
                
                <label class="f_selectsmall">
                    <select name="leadtimesub" id="leadtimesub">
                    </select>

                </label>
                <label>
                    <a href="#" class="btn btn_blue_30 w_50" onclick="AddRepair()"><spring:message code="cop.sms.addRecptn"/></a>
                </label>
                <table class="board_list4" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;">
                    <colgroup>
                        <col style="width: 150px;">
                        <col style="width: 150px;">
                        <col style="width: 200px;">
                        <col style="width: 200px;">
                        <col style="width: 90px;">
                    </colgroup>
                    <thead>
                        <th>수리사항</th>
                        <th>수리종류</th>
                        <th>수리시간</th>
                        <th>수리항목 비고</th>
                        <th>수리여부</th>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(RepairList) == 0}">
                            <tr>
                                <td colspan="5"><spring:message code="common.nodata.msg" /></td>
                            </tr>
                        </c:if>
                        <c:forEach var="i" items="${RepairList}" varStatus="status">
                            <tr>
                                <td><c:out value="${i.REPAIRNAME}"/></td>
                                <td>
                                    <label class="f_selectsmall">
                                        <select name="method" id="method">
                                            <c:forEach var="j" items="${autome}" varStatus="status">
                                                <option value="${j.CODE}" <c:if test="${j.CODE == i.REPAIRMETHOD}">selected</c:if>><c:out value="${j.NAME}"/></option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                </td>
                                <td><c:out value="${i.LEADTIME}"/></td>
                                <td><input type="text" class="f_txtsmall" value="<c:out value='${i.REPAIR_NOTE}'/>"></td>
                                <td><input type="radio" name="finish_${i.REPAIR_SEQ}" class="f_rdo ">Y <input type="radio" name="finish_${i.REPAIR_SEQ}" class="f_rdo ">N</td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
                <div class="btn_area al_c pt20">
                    <div class="board_view2">
                        <table>
                            <colgroup>
                                <col style="width:auto;">
                                <col style="width:auto;">
                            </colgroup>
                            <tr>
                                <td class="lb">수리 비고</td>
                                <td><input type="text" class="f_txtsmall" placeholder="수리 비고" value="<c:out value='${rcptinfo.REPAIRNOTE}여기서부터'/>"></td>
                            </tr>
                        </table>
                    </div>

                    <a href="#" class="btn btn_blue_46 w_100" onclick="SaveRepair()" style="margin-top: 10px;">저장</a>
                </div>
            </div>
        </div>
        
        </form>
        
    </div>
    <!--// 아이디중복확인 팝업 -->
    
</body>
</html>