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

<title>기준정보 > 사용자관리</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cusMberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">

function fnListPage(){
    document.cusMberManageVO.action = "<c:url value='/customer/SmartCusMberManage.do'/>";
    document.cusMberManageVO.submit(); 
}

function fnInsert(){
	/* if(document.checkForm.checkId.value==""){
		alert(document.cusMberManageVO.check.value);
		return; */
		
		
		/* document.cusMberManageVO.submit(); */
	
}
/*
 function fnchecks(){
	$.ajax({ 
	    url: "<c:url value='/mdm/CheckCus.do'/>",          
	    data: { cusNm: "고객이름", autoNo: "차량번호"},  
	    method: "POST",            
	    dataType : "json"         
	})
	.done(function(json) {
	    $("<h1>").text(json.title).appendTo("body");
	   /*  $("<div class=\"content\">).html(json.html).appendTo("body"); 
	})
	.fail(function(xhr, status, errorThrown) {
	    $("#text").html("오류가 발생하였습니다.<br>")
	        .append("오류명: " + errorThrown + "<br>")
	        .append("상태: " + status);
	})
	.always(function(xhr, status) {
	    /* $("#text").html("요청이 완료되었습니다."); 
	    alert("요청이 완료되었습니다.");
	}
} 
*/
function fncheck()
{

    if(document.cusMberManageVO.cusNm.value == "")
    {
        alert("고객이름을 입력해주세요.");
        document.cusMberManageVO.cusNm.focus();
        return false;
    }
    $.ajax({
        type: "post",
        url: "<c:url value='/mdm/CheckCus.do'/>",
        data: {
        	autoNo:document.cusMberManageVO.autoNo.value,
            cusNm:document.cusMberManageVO.cusNm.value
        },
        success: function (result) {
        	
        	result1 = JSON.parse(result)
        	alert(result1);
			if(result == "0") {
				$('#result').text('사용 가능한 아이디입니다.');
	        } else {
	            $('#result').text('이미 사용중인 아이디입니다.');
	        }
        }
    });
    // document.SmartLeadTimeVO.action = "<c:url value='/mdm/InsertLeadTime.do'/>";
    // document.SmartLeadTimeVO.submit();
}

	<c:if test="${!empty resultMsg}">alert("<spring:message code='${resultMsg}' />");</c:if>

	$(document).on("keyup", ".phoneNumber", function() { 
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	});

function fnCheckCus(){
    var url = "<c:url value='/mdm/SmartCheckCusView.do'/>?";
    
    var varParam = new Object();
    var checkCus = document.cusMberManageVO.cusNm.value;
    var varParam = "checkCus="+checkCus;
    
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px;" src="' + "<c:url value='/mdm/SmartCheckCusView.do'/>?" + varParam +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 600,
        height: 450
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
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
	                    <%-- <c:import url="/sym/mms/EgovMenuLeft.do" /> --%>
	                    <!--// Left menu -->
        
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 <!-- Location -->
                                <div class="location">
                                    <ul>
                                        <li><a class="home" href="">Home</a></li>
                                        <li><a href="">기준정보</a></li>
                                        <li>고객관리</li>
                                    </ul>
                                </div>
                                <!--// Location -->

								<form:form modelAttribute="cusMberManageVO" name="cusMberManageVO" action="${pageContext.request.contextPath}/customer/SmartCusMberInsert.do" method="post" >


                                <h1 class="tit_1" style="padding-bottom:20px">고객관리</h1>

                                <div class="board_view2">
                                    <table summary="고객 등록 정보">
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="autoNo">차량번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <!-- <input name="autoNo" id="autoNo" class="f_txt" type="text" value="" maxlength="100" /> -->
                                                <form:input path="autoNo" id="autoNo" name="autoNo" class="f_txt w_350" title="차량번호" maxlength="100" />
                                                <form:errors path="autoNo" cssClass="error" />    
							                    
                                            </td>
                                                 <%-- <td>
                                                <span class="f_search2 w_350">
                                                    <input id="check_view" type="text" maxlength="20" disabled="disabled" name="check_view" readonly >
                                                	<form:input path="autoNo" type="hidden" readonly="true" maxlength="20" />
                                                	<button type="button" class="btn" onclick="javascript:fnCheckCus(); return false;"></button>
                                                </span>
                                                <span class="f_txt_inner ml15">(중복 회원 검색)</span>
                                            </td> --%>
 
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="autoKind">차량종류</label>
                                            </td>
                                            <td>
                                                <!-- <input name="autoKind" id="autoKind" class="f_txt" type="text" value="" maxlength="100" /> -->
                                                <form:input path="autoKind" id="autoKind" class="f_txt w_350" title="차량종류" maxlength="100" />
                                                <form:errors path="autoKind" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="cusNm">고객이름</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <%-- <td>
                                                <span class="f_search2 w_350">
                                                    <input id="nm_view" type="text" maxlength="20" disabled="disabled" name="nm_view" readonly >
                                                	<form:input path="cusNm" id="cusNm" class="f_txt w_350" title="고객이름" maxlength="100" />
                                                    <form:input path="cusNm" type="hidden" readonly="true" maxlength="20" />
                                                </span>
                                            </td> --%>
                                            <td>
                                                <input name="cusNm" id="cusNm" class="f_txt" type="text" value="" maxlength="100" />
                                                <form:errors path="cusNm" cssClass="error" />
                                                
                                                <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fncheck(); return false;">중복체크</a>
                                                <input name="hiddencusNm" id="hiddencusNm" class="f_txt w_350" title="중복체크" maxlength="100" type="hidden" value="ok" />
                                                <span class="f_txt_inner ml15">(중복 고객이름 검색)</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="cusTel">연락처</label>
                                            </td>
                                            <td>
                                                <!-- <input name="cusTel" id="cusTel" class="f_txt" type="text" value="" maxlength="100" /> -->
                                                <form:input path="cusTel" id="cusTel" class="f_txt w_350 phoneNumber" title="연락처" maxlength="100" />
                                                <form:errors path="cusTel" cssClass="error" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for=note>비고</label>
                                            </td>
                                            <td>
                                                <!-- <input name="note" id="note" class="f_txt" type="text" value="" maxlength="100" /> -->
                                                <form:input path="note" id="note" class="f_txt w_350" title="비고" maxlength="100" />
                                                <form:errors path="note" cssClass="error" />
                                            </td>
                                        </tr>
										<tr>
                                            <td class="lb">
                                                <label for=note>총주행거리</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <!-- <input name="note" id="note" class="f_txt" type="text" value="" maxlength="100" /> -->
                                                <form:input path="totalKm" id="totalKm" class="f_txt w_350" title="비고" maxlength="100" />
                                                <form:errors path="totalKm" cssClass="error" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                        <a href="#LINK" class="btn btn_skyblue_h46 w_100" onclick="javascript:document.CusMberManageVO.reset();"><spring:message code="button.reset" /></a><!-- 취소 -->
                                    </div>
                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fnInsert(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/customer/SmartCusMberManage.do'/>" class="btn btn_blue_46 w_100" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
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