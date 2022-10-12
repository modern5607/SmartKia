<%--
  Class Name : EgovCcmZipSearchList.jsp
  Description : EgovCcmZipSearchList 화면(include)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.04.01   이중호              최초 생성
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이중호
    since    : 2009.04.01
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

<title>우편번호 찾기</title>
<script type="text/javaScript" language="JavaScript">

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fn_egov_pageview(pageNo){
	document.listForm.pageIndex.value = pageNo;
	document.listForm.action = "<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>";
   	document.listForm.submit();
}
/* ********************************************************
 * 조회 처리 
 ******************************************************** */
function fn_egov_search_Zip(){
	document.listForm.pageIndex.value = 1;
   	document.listForm.submit();
}
/* ********************************************************
 * 결과 우편번호,주소 반환 
 ******************************************************** */
function fn_egov_return_Zip(zip,addr){
	var retVal   = new Object();
	var sZip     = zip;
	var vZip     = zip.substring(0,5);
	var sAddr    = addr.replace("/^\s+|\s+$/g","");
	retVal.sZip  = sZip;
	retVal.vZip  = vZip;
	retVal.sAddr = sAddr;
	
	parent.parent.fn_egov_returnValue(retVal);
}

/* ********************************************************
 * 취소처리
 ******************************************************** */
function fn_egov_cancel_popup() {
	parent.parent.fn_egov_modal_remove();
}
function searchdetail(){
    var sido = $('#sido').val();
    
    $.ajax({
        type: "post",
        url: "/sym/cmm/detailList.do",
        data: {
        	sido:sido
        },
        success: function (resp) {
        	var html="<option value=''>선택</option>";
        	$.each(resp.list,function(index,item){
        		console.log(item);
        		html+="<option value='"+item.SIGUNGU+"'>"+item.SIGUNGU+"</option>";
        	});
        	$("#sigungu").html(html);
        }
    });
    
}

function adress(adress){
    parent.callbackadress(adress);
    fn_egov_cancel_popup();
}

function check(){
    if (document.listForm.sido.value == "") {
			alert("시도를 선택해주세요.");
			document.listForm.focus();
			return;
		}
    if (document.listForm.sigungu.value == "") {
		    alert("시군구를 선택해주세요.");
			document.listForm.focus();
			return;
		}
}

</script>
</head>

<body>
<!-- 자바스크립트 경고 태그  -->
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>

	<form name="listForm" action="<c:url value='/sym/cmm/EgovCcmZipSearchList.do'/>" method="post">
    
    <input name="searchCondition" type="hidden" size="35" value="4" />

	<!-- 우편번호 찾기 팝업 -->
    <div class="popup POP_POST_SEARCH">
        <div class="pop_inner">
            <div class="pop_header">
                <h1>우편번호</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <!-- 검색조건 -->
                <div class="condition2">
                    <label for="" class="lb mr10">시도</label>
                    <label class="f_select w_200" for="sido">
                        <select name="sido" id="sido" onchange="searchdetail(this);">
                            <option value="all">전체</option>
                            <c:forEach var="i" items="${sido}" varStatus="status">
                                <option value="<c:out value='${i.SIDO}'/>">${i.SIDO}</option> 
                            </c:forEach>
                        </select>
                </label>
                <label for="" class="lb mr10">시군구</label>
                <label class="f_select w_200" for="sigungu">
                    <select name="sigungu" id="sigungu">
                        <option value="all">전체</option>
                        <c:forEach var="i" items="${sigungu}" varStatus="status">
                            <option value="<c:out value='${i.SIGUNGU}'/>" >${i.SIGUNGU}</option> 
                        </c:forEach>
                    </select>
                </label>
                    <label for="" class="lb mr10">도로명</label>
                    <span class="item f_search">
                        <input class="f_txtsmall w_200" name="searchKeyword" type="text" value="${searchVO.searchKeyword}" maxlength="20" title="동명"/>
                        <button class="btn" type="submit" onclick="check();"><spring:message code='button.inquire' /></button><!-- 조회 -->
                    </span>
                </div>
                <!--// 검색조건 -->

                <!-- 게시판 -->
                <div class="board_list">
                    <table>
                        <colgroup>
                            <col style="width: 30%;">
                            <col style="width: 70%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">우편번호</th>
                                <th scope="col">도로명주소</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${fn:length(resultList) == 0}">
								<tr>
                                    <td colspan="2"><spring:message code="common.nodata.msg" /></td>
                                </tr>
							</c:if>
                        	<c:forEach  var="result" items="${resultList}" varStatus="status">
                            <tr>
                                <td><c:out value='${result.POST_CD}'/></td>
                                <td><a href="#"onclick="adress('${result.ADRESS}')"><c:out value='${result.ADRESS}'/></a></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--// 우편번호 찾기 팝업 -->
    
    <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
    
	</form>
    
</body>
</html>