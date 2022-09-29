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

function fnReturnId() {
	var retVal = "";
	var chk1 = $('input[type="radio"][id="radio1"]:checked').val();
	var chk2 = $('input[type="radio"][id="radio2"]:checked').val();
	if (chk1) {
		retVal = document.cusMberManageVO.kind1.value;
		console.log(retVal);
		parent.showModalDialogCallback(retVal);
		fn_egov_cancel_popup();
	} else if (chk2) {
		retVal = document.cusMberManageVO.kind2.value;
		console.log(retVal);
		parent.showModalDialogCallback(retVal);
		fn_egov_cancel_popup();
	} else {
		alert("보유여부를 체크해 주세요.");
		return;
	}
}




/*
$(function (){
	 
	$('input[type="radio"][id="radio1"]').on('click', function(){
	  var chkValue = $('input[type=radio][id="radio1"]:checked').val();
	  
	  if(chkValue){
          $('#kind1').css('display','block');
          $('#kind2').css('display','none');
}else{
          $('#kind1').css('display','none');
          $('#kind2').css('display','block');
}

	});
	 
});
$(function (){
	 
	$('input[type="radio"][id="radio2"]').on('click', function(){
	  var chkValue = $('input[type=radio][id="radio2"]:checked').val();
	  if(chkValue){
          $('#kind1').css('display','none');
          $('#kind2').css('display','block');
}else{
          $('#kind1').css('display','block');
          $('#kind2').css('display','none');
}
	});
	 
});

*/
	 
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
    
    	<form name="cusMberManageVO" action ="<c:url value='/mdm/searchKindPopupView.do'/>">
    
        <div class="pop_inner" style="width:100%;">
            <div class="pop_header">
                <h1>차량종류 등록</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container" style="text-aling:center">
                	<table class="board_list3" style="border-radius:10px; padding: 15px;">
                	<div>
                	<span class="rdoSet">
	                	<label for="radio1">
	                		<input type="radio" id="radio1" name="radio" value="Y" checked>기아 자동차 보유
	               		</label>
	                	<label for="radio2">
	                		<input type="radio" id="radio2" name="radio" value="N" >타사 자동차 보유
	                	</label>
	                	</div>
                	</span>
                	<!-- 
		                <span class="rdoSet">
		                    <label for="radio1" class="mr30 <c:if test="${cusMberManageVO.useYN == 'Y'}"> on</c:if>">
		                        <input type="radio" id="radio1" name="kind" class="radio1" value="Y" checked="checked"<c:if test="${cusMberManageVO.useYN == 'Y'}"> checked="checked"</c:if>>
		                        기아 자동차 보유
		                    </label>
		                    <label for="radio2" class="<c:if test="${cusMberManageVO.useYN == 'N'}"> on</c:if>">
		                        <input type="radio" id="radio2" name="kind" class="radio2" value="N" <c:if test="${cusMberManageVO.useYN == 'N'}"> checked="checked"</c:if>>
		                        타사 자동차 보유
		                    </label>
		                    <br/>
		                </span-->
		                 
		                <tr>
	                        <td class="lb">
	                        	차종
	                          <!-- <span class="req">필수</span> -->
	                        </td>
	                        <td>
	                         <label class="f_select w_350" for="kind">
	                        <select id="kind1" class="kind" name="kind1">
	                        	<option value=''>없음</option>
	                        	<c:forEach var="kind" items="${kind}" varStatus="status">
	                        		<option value="<c:out value='${kind.NAME}'/>"><c:out value='${kind.NAME}'/> </option>
	                        	</c:forEach>
	                        	
	                        </select>
	                        <input type="text" id="kind2" class="kind f_txt w_350" name="kind2" style="display:none">
	                        
	                       	</label>
	                       	</td>
                        </tr>
                    </table> 
                    <div class="board_view_bot" style="padding-top:50px">
	                   <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fnReturnId(); return false;"><spring:message code="button.save"/></a><!-- 저장 -->
                    </div>
                

                <div class="btn_area al_c pt20">
                	
                </div>
            </div>
        </div>
        
        </form>
        
    </div>
    <!--// 아이디중복확인 팝업 -->
    
</body>
</html>
<Script>

$('input[type=radio][name=radio]').on('change', function() {
	var	reset = '';
	  switch ($(this).val()) {
	    case 'Y':
	    	 $('#kind1').css('display','block');
	         $('#kind2').css('display','none');
	      break;
	    case 'N':
	    	$('#kind1').css('display','none');
	        $('#kind2').css('display','block');
	      break;
	  }
	});

</Script>