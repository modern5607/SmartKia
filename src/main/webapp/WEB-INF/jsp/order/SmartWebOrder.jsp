<%--
  Class Name : EgovAuthorGroupManage.jsp
  Description : EgovAuthorGroupManage List 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.23    lee.m.j          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스개발팀 lee.m.j
    since    : 2009.03.23
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

<title>접수관리 > 접수등록(WEB)</title>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="smartOrderVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fn_inst(){
	if (!validateSmartOrderVO(document.smartOrderVO)){
		return;
	}

	if (confirm('<spring:message code="common.regist.msg" />')) {
		form = document.smartOrderVO;
		form.action = "<c:url value='/order/SmartWebOrderList.do'/>";
		form.submit();
	}
}
function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fncManageChecked() {

    var resultCheck = false;

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var selectAuthor = document.listForm.authorManageCombo;
    var booleanRegYn = document.listForm.regYn;
    var listMberTyCode = document.listForm.mberTyCode;
        
    var returnId = "";
    var returnAuthor = "";
    var returnRegYn = "";
    var returnmberTyCode = "";

    var checkedCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnId == "") {
                        returnId = checkField[i].value;
                        returnAuthor = selectAuthor[i].value;
                        returnRegYn = booleanRegYn[i].value;
                        returnmberTyCode = listMberTyCode[i].value;
                    }
                    else {
                        returnId = returnId + ";" + checkField[i].value;
                        returnAuthor = returnAuthor + ";" + selectAuthor[i].value;
                        returnRegYn = returnRegYn + ";" + booleanRegYn[i].value;
                        returnmberTyCode = returnmberTyCode + ";" + listMberTyCode[i].value;
                        
                    }
                }
            }

            if(checkedCount > 0) 
                resultCheck = true;
            else {
                alert("선택된  항목이 없습니다.");
                resultCheck = false;
            }
            
        } else {
             if(document.listForm.delYn.checked == false) {
                alert("선택 항목이 없습니다.");
                resultCheck = false;
            }
            else {
                returnId = checkId.value;
                returnAuthor = selectAuthor.value;
                returnRegYn = booleanRegYn.value;
                returnmberTyCode = listMberTyCode.value;

                resultCheck = true;
            }
        } 
    } else {
        alert("조회된 결과가 없습니다.");
    }
    
    document.listForm.userIds.value = returnId;
    document.listForm.authorCodes.value = returnAuthor;
    document.listForm.regYns.value = returnRegYn;
    document.listForm.mberTyCodes.value = returnmberTyCode;
    return resultCheck;
}

function fncSelectAuthorGroupList(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
    document.listForm.submit();
}
function fncSelectGroupList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/gmt/EgovGroupList.do'/>";
    document.listForm.submit();
}

function fncSelectOrder() {
    document.listForm.AUTONUMBER.value = AUTONUMBER;
    document.listForm.action = "<c:url value='/order/EgovWebOrderList.do'/>";
    document.listForm.submit();
}

function fncOrderInsert(){
	if(validateSmartOrderVO(document.smartOrderVO)){ 
		
		document.smartOrderVO.submit();
	} 
}

function fncAuthorGroupDeleteList() {
 
	if(!fncManageChecked()) return;

    if(confirm('<spring:message code="common.delete.msg" />')) {
        document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupDelete.do'/>";
        document.listForm.submit(); 
    }
}

function linkPage(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorGroupPop() {

    if(document.listForm.searchCondition.value == '3') {
    	
        var $dialog = $('<div id="modalPan"></div>')
    	.html('<iframe style="border: 0px; " src="' + "<c:url value='/sec/gmt/EgovGroupSearchList.do'/>" +'" width="100%" height="100%"></iframe>')
    	.dialog({
        	autoOpen: false,
            modal: true,
            width: 850,
            height: 700
    	});
        $(".ui-dialog-titlebar").hide();
    	$dialog.dialog('open');
    } else {
        alert("그룹을 선택하세요.");
        return;
    }
    
    /*
    var url = "<c:url value='/sec/gmt/EgovGroupSearchView.do'/>";
    var varParam = new Object();
    var openParam = "dialogWidth:500px;dialogHeight:485px;scroll:no;status:no;center:yes;resizable:yes;";
    var retVal;

    if(document.listForm.searchCondition.value == '3') {
        retVal = window.showModalDialog(url, varParam, openParam);
        if(retVal) {
            document.listForm.searchKeyword.value = retVal;
            alert(document.listForm.searchKeyword.value);
        }
    } else {
        alert("그룹을 선택하세요.");
        return;
    }
    */

}

function fn_egov_returnValue(retVal){
	if(retVal != null){
		
		document.listForm.searchKeyword.value = retVal;
    }
	
	fn_egov_modal_remove();
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
}

function onSearchCondition() {
	document.listForm.searchKeyword.value = "";
	if(document.listForm.searchCondition.value == '3') {
        document.listForm.searchKeyword.readOnly = true;
	} else {
		document.listForm.searchKeyword.readOnly = false;
	}
}

function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorGroupList('1');
    }
}


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
                                        <li><a href="">접수관리</a></li>
                                        <!-- <li><a href="">사용자권한관리</a></li> -->
                                        <li>접수등록(WEB)</li>
                                    </ul>
                                </div>
                                <!--// Location -->
								<form:form modelAttribute="SmartOrderVO" method="post" >

<!--                                 <h1 class="tit_1">포털시스템관리</h1>

                                <p class="txt_1">포털시스템의 사용자 및 권한에 대한 제반사항을 관리합니다.</p>

                                <h2 class="tit_2">사용자권한관리</h2>

                                <h3 class="tit_3">사용자별권한관리</h3>
 -->
                                <!-- 검색조건 -->
       
                                <!--// 검색조건 --> 
	                                <div class="right_col btn1">
		                                <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fn_inst(); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
	                                </div>
								<!-- 게시판 -->
								<div class="board_view2">
								
                                    <table>
<%--                                     	<caption>등록 을 제공한다</caption>
 --%>                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                       	<tr>
                                            <td class="lb">
                                            	<label>수리종류</label><!-- 사용여부 -->
                                                <span class="req">필수</span>
                                            </td>
                                            <td class="rdoSet"><!-- 2개이상 radio 있을때 필요 -->
                                                <label for="rdo1" class="mr30 on">
                                                    <input type="radio" name="repairmethod" id="rdo1" value="COMBO_001" checked="checked">
                                                    일반
                                                </label>
                                                <label for="rdo2" class="">
                                                    <input type="radio" name="repairmethod" id="rdo2" value="COMBO_002">
                                                    보증
                                                </label>
                                                <br/><form:errors path="repairmethod" />
                                            </td>
                                        </tr>
                                        
                                        
                                        <tr>
                                            <td class="lb">
                                                <label for="autonumber">차량번호</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                            	<input path="autonumber" id="autonumber" class="f_txt" type="text" maxLength="50" title="차량번호"/>
                                                <form:errors path="autonumber"/></errors>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="repairnote">수리내용</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input path="repairnote" id="repairnote" class="f_txt" type="text" maxLength="50" title="수리내용"/>
                                                <form:errors path="repairnote"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="estime">예상완료시간</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>                       
                                                <input id="estime" path="estime" rows="10" class="f_txt" type="text" maxLength="10" title="예상완료시간"/></textarea>
                                                <errors path="estime"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="position">위치</label>
                                                <span class="req">필수</span>
                                            </td>
                                            
                                            <td colspan="2">
	                                            <label class="f_select">
		                                            <select path="position" id="position" title="위치">
			                                            <%-- <option value='0' <c:if test="${searchCondition == 'POSITION'}">selected</c:if>>위치</option> --%>
		                                        		<option value='0' <c:if test="${result.position == 'A'}">selected="selected"</c:if>>A</option>
		                                        		<option value='1' <c:if test="${result.position == 'B'}">selected="selected"</c:if>>B</option>
		                                        		<option value='2' <c:if test="${result.position == 'C'}">selected="selected"</c:if>>C</option>
		                                        	</select>
                                            </td>
                                        </tr>
                                         
                                        <!-- <tr>
                                            <td class="lb">
                                                <label for="note">비고=</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input id="note" path="note" size="70" class="f_txt w_full" maxlength="100" title="비고"/>
                                                <errors path="note"/>
                                            </td>
                                        </tr> -->
                                    </table>
                                </div>
                                
                                </form:form>
                                <!-- 게시판2 -->
                                <div class="board_list">
                                    <table>
                                    	<caption>약관목록</caption>
                                        <colgroup>
                                            <col style="width: 20%;">
                                            <col style="width: auto;">
                                            <col style="width: 15%;">
                                            <col style="width: 20%;">
                                            <col style="width: 10%;">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">차량번호</th>
                                                <th scope="col">수리내용</th>
                                                <th scope="col">위치</th>
                                                <th scope="col">예상완료시간</th>
                                                <th scope="col">비고</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:if test="${fn:length(resultList) == 0}">
                                            <tr>
                                                <td colspan="6"><spring:message code="common.nodata.msg" /></td>
                                            </tr>
                                            </c:if>
                                            
                                            <c:forEach items="${resultList}" var="result" varStatus="status">
                                            <tr>
                                            	<td>
                                            		<a href="#LINK" class="lnk" onclick="javascript:fncSelectOrder('<c:out value="${result.AUTONUMBER}"/>')">
                                                		<c:out value="${result.AUTONUMBER}"/>
                                                	</a>
                                            	</td>
                                                <%-- <td>${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}</td> --%>
                                                <td><c:out value="${result.REPAIRNOTE}"/></td>
                                                <td><c:out value="${result.POSITION}"/></td>
                                                <td><c:out value="${result.ESTIME}"/></td>
                                                <td><c:out value="${result.NOTE}"/></td>
                                           	</tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이징 -->
								<c:if test="${!empty authorGroupVO.pageIndex }">
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="linkPage" />
                                        </ul>
                                    </div>
                                    
                                    <%-- 
                                    <div align="right">
								        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
								    </div>
                                     --%>
                                    
                                </div>
                                </c:if>
                                <!-- // 페이징 끝 -->
                                
                                <input type="hidden" name="userId"/>
								<input type="hidden" name="userIds"/>
								<input type="hidden" name="authorCodes"/>
								<input type="hidden" name="regYns"/>
								<input type="hidden" name="mberTyCodes"/>
								<input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>
								
								
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