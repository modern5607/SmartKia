<%--
  Class Name : SmartCusMberManage.jsp
  Description : 사용자관리(조회,삭제) JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.02  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.02
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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

<title>샘플 포털 > 포털시스템관리 > 사용자관리 > 고객관리</title>
<script type="text/javaScript" language="javascript" defer="defer">

function fnCheckAll() {
    var checkField = document.listForm.checkField;
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
/* function fnDeleteUser() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
    	//alert(checkedIds);
        if(confirm('<spring:message code="common.delete.msg" />')) {
        	document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = "<c:url value='/uss/umt/mber/EgovMberDelete.do'/>";
            document.listForm.submit();
        }
    }
} */
function fnSelectUser(cusId) {
	document.listForm.selectedId.value = cusId;
    document.listForm.action = "<c:url value='/customer/SmartCusMberSelectUpdtView.do'/>";
    document.listForm.submit();
} 
function fnAddUserView() {
    document.listForm.action = "<c:url value='/customer/SmartCusMberInsertView.do'/>";
    document.listForm.submit();
}
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/customer/SmartCusMberManage.do'/>";
    document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/customer/SmartCusMberManage.do'/>";
    document.listForm.submit();
}
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>

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
	<!--c:import url="/sym/mms/EgovMenuLeft.do" /-->
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

<form name="listForm" action="/customer/SmartCusMberManage.do"
	method="post">
	<input name="selectedId" type="hidden" /> <input
		name="checkedIdForDel" type="hidden" /> <input
		name="pageIndex" type="hidden"
		value="<c:out value='${userSearchVO.pageIndex}'/>" />

	<h1 class="tit_1">고객관리</h1>

<!-- 	<p class="txt_1">포털시스템의 사용자 및 권한에 대한 제반사항을 관리합니다.</p>

	<h2 class="tit_2">사용자관리</h2>

	<h3 class="tit_3">고객관리</h3> -->

	<!-- 검색조건 -->
<%-- 	<div class="condition">
		<label class="item f_select" for="sbscrbSttus">
		 <select name="sbscrbSttus" id="sbscrbSttus" title="조회조건1">
				<option value="0"
					<c:if test="${empty userSearchVO.sbscrbSttus || userSearchVO.sbscrbSttus == '0'}">selected="selected"</c:if>>상태(전체)</option>
				<option value="A"
					<c:if test="${userSearchVO.sbscrbSttus == 'A'}">selected="selected"</c:if>>가입신청</option>
				<option value="D"
					<c:if test="${userSearchVO.sbscrbSttus == 'D'}">selected="selected"</c:if>>삭제</option>
				<option value="P"
					<c:if test="${userSearchVO.sbscrbSttus == 'P'}">selected="selected"</c:if>>승인</option>
		</select> 
		</label>
		
		<label class="item f_select" for="searchCondition"> 
		<select name="searchCondition" id="searchCondition" title="조회조건1">
			<option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >차량번호</option>
            <option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >연락처</option>
					
		</select>
		</label> <span class="item f_search"> <input name="searchKeyword" id="searchKeyword" class="f_input w_500" title="검색" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>" />
			<button class="btn" type="submit"
				onclick="fnSearch(); return false;">
				<spring:message code="button.search" />
			</button> <!-- 조회 -->
		</span>
	</div> --%>
	
	
    <span class="item f_search">
    <p class="left">
    <label for="searchKeyword">고객번호</label>
        <%-- <input class="f_input w_200" name="searchId" id="searchId" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchcusId}"/>"/>  --%>
    <label for="searchKeyword">고객명</label>
        <%-- <input class="f_input w_200" name="searchNm" id="searchNm" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchcusNm}"/>"/> --%>
    <label for="searchKeyword">차량번호</label>
        <%-- <input class="f_input w_200" name="searchTeam" id="searchTeam" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchcarNum}"/>"/> --%>
    </p>
    <p class="left">
    </p>
        <button class="btn" type="submit" onclick="fnSearch(); return false;"><spring:message code='button.search' /></button><!-- 조회 -->
    </span>
	<!--// 검색조건 -->


	<!-- 게시판 -->
	<div class="board_list_top">
		<div class="left_col">
			<div class="list_count">
				<span>사용자수</span> <strong><c:out
						value="${paginationInfo.totalRecordCount}" /></strong>
			</div>
		</div>

		<div class="right_col">
			<%-- <a href="#LINK" class="btn btn_blue_46 w_100"
				onclick="fnDeleteUser(); return false;"><spring:message
					code="button.delete" /></a> --%>
			<!-- 삭제 -->
			<a href="<c:url value='/customer/SmartCusMberInsertView.do'/>" class="btn btn_blue_46 w_100" onclick="fnAddUserView(); return false;"><spring:message code="button.create" /></a><!-- 등록 -->
			<!-- 
        <a href="<c:url value='/customer/SmartCusMberManage.do'/>" class="btn btn_blue_46 w_100"><spring:message code="button.list" /></a>목록
         -->
		</div>
	</div>

	<div class="board_list">
		<table summary="회원목록">
			<caption>회원목록</caption>
			<colgroup>
				<col style="width: 60px;">
				<col style="width: 60px;">
				<col style="width: 300px;">
				<col style="width: 300px;">
				<col style="width: 300px;">
				<col style="width: 300px;">
				<col style="width: 300px;">
				<col style="width: 300px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No.</th>
					<th scope="col"><span class="f_chk_only chkAll">
							<input name="checkAll" type="checkbox" title="Check All"
							onclick="javascript:fnCheckAll();" />
					</span></th>
					<th scope="col">고객번호</th>
					<th scope="col">차량번호</th>
					<th scope="col">차량종류</th>
					<th scope="col">연락처</th>
					<th scope="col">고객이름</th>
					<th scope="col">비고</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${fn:length(resultList) == 0}">
					<tr>
						<td colspan="8"><spring:message
								code="common.nodata.msg" /></td>
					</tr>
				</c:if>

				<c:forEach var="result" items="${resultList}"
					varStatus="status">
					<tr>
						<td><c:out value="${status.count}" /></td>
						<td><span class="f_chk_only"> <input
								name="checkField"
								title="checkField <c:out value="${status.count}"/>"
								type="checkbox" /> <input name="checkId" type="hidden"
								value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>" />
						</span>
						</td>
						<td>
						<a
							href="<c:url value='/customer/SmartCusMberSelectUpdtView.do'/>?selectedId=<c:out value="${result.cusId}"/>" 
							class="lnk" onclick="javascript:fnSelectUser('<c:out value="${result.cusId}"/>'); return false;">
                            <c:out value="${result.cusId}"/>								
						</a>
						</td>
						<td><c:out value="${result.autoNo}" /></td>
						<td><c:out value="${result.autoKind}" /></td>													
						<td><c:out value="${result.cusTel}" /></td>
						<td><c:out value="${result.cusNm}" /></td>
						<td><c:out value="${result.note}" /></td>
						<%-- <td><c:forEach var="entrprsMberSttus_result"
								items="${entrprsMberSttus_result}" varStatus="status">
								<c:if
									test="${result.sttus == entrprsMberSttus_result.code}">
									<c:out value="${entrprsMberSttus_result.codeNm}" />
								</c:if>
							</c:forEach></td> --%>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<!-- 페이징 -->
	<div class="board_list_bot">
		<div class="paging" id="paging_div">
			<ul>
				<ui:pagination paginationInfo="${paginationInfo}"
					type="renew" jsFunction="fnLinkPage" />
			</ul>
		</div>
	</div>
	<!-- // 페이징 끝 -->

</form>

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