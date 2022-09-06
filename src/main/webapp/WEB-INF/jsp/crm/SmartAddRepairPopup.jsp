<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>등록화면</title>
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
    if(document.checkForm.checkId.value==""){
        alert("중복 조회할 아이디를 입력하십시오.");
        document.checkForm.focus();
        return;
    }
    if(fnCheckNotKorean(document.checkForm.checkId.value)){
        document.checkForm.submit();
    }else{
        alert("한글은 사용할 수 없습니다.");
        return;
    }
}
function fnReturnId(){
    var retVal="";
    if (document.checkForm.usedCnt.value == 0){
        retVal = document.checkForm.resultId.value;
		parent.showModalDialogCallback(retVal);
		fn_egov_cancel_popup();
    }else if (document.checkForm.usedCnt.value == 1){
        alert("이미 사용 중인 아이디입니다.");
        return;
    }else{
        alert("먼저 중복 확인을 실행하십시오");
        return;
    }
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
    <div class="popup POP_DUPID_CONF" style="background-color: white;">
    
    	<form name="checkForm" action ="<c:url value='/mdm/SmartAddRepairPopup.do'/>">
    
        <div class="pop_inner">
            <div class="pop_header">
                <h1>차량 수리 이력 등록</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
           
                <div class="box_1" style="padding:12px">
					<table>
	                    <caption>차량 수리 이력 등록</caption>
	                    <colgroup>
	                        <col style="width: 150px;">
	                        <col style="width: 250px;">
	                    </colgroup>
	                    <tr>
	                        <td class="lb">
	                            <label for="bannerId">차량번호</label>
	                            <span class="req">필수</span>
	                        </td>
	                        <td>
	                            <input class="f_txt" type="text">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="lb">
	                            <label for="bannerNm">차량종류</label>
	                            <span class="req">필수</span>
	                        </td>
	                        <td>
	                            <input class="f_txt" type="text">
	                            <form:errors path="bannerNm" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="lb">
	                            <label for="linkUrl">고객이름</label>
	                            <span class="req">필수</span>
	                        </td>
	                        <td>
	                            <input class="f_txt" type="text">
	                            <form:errors path="linkUrl" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="lb">
	                            <label for="egovComFileUploader" class="min">연락처</label>
	                            <span class="req">필수</span>
	                        </td>
	                        <td>
	                            <input class="f_txt" type="text">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td class="lb">
	                            <label for="bannerDc">비고</label>
	                            <span class="req">필수</span>
	                        </td>
	                        <td>
	                            <input class="f_txt" type="text">
	                        </td>
	                    </tr>
	                </table>
            	</div>
                <div class="btn_area al_c pt20">
                	<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fn_egov_cancel_popup(); return false;"><spring:message code="button.create" /></a><!-- 사용 -->
                </div>
        </div>
        
        </form>
        
    </div>
    <!--// 아이디중복확인 팝업 -->
    
</body>
</html>