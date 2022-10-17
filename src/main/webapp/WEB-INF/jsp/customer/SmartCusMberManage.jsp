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

function init()
{
	if ("<c:out value='${msg}'/>" != "") {
		alert("<c:out value='${msg}'/>");
	}
}
function clickRepair(cusId){

	console.log(cusId);

	var url = "<c:url value='/customer/selectCusRepairInfo.do'/>?";
   	var $dialog = $('<div id="modalPan"></div>').html(
		   	'<iframe style="border: 0px; " src="'
		   	+ "<c:url value='/customer/selectCusRepairInfo.do?cusId="+cusId+"'/>"
			+ '" width="100%" height="100%"></iframe>').dialog(
					{
					   	autoOpen: false,
					       modal: true,
							width : 920,
							height : 700
					});
	   	$(".ui-dialog-titlebar").hide();
		$dialog.dialog('open');
	}

</script>
</head>
<body onload="init()">
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
		<li>이용고객관리</li>
	</ul>
</div>
<!--// Location -->

<form modelAttribute="CusMberManageVO" id="listForm" name="listForm" action="/customer/SmartCusMberManage.do"
	method="post">
	<input name="cusId" type="hidden" />
	<input name="selectedId" type="hidden" /> <input
		name="checkedIdForDel" type="hidden" /> <input
		name="pageIndex" type="hidden"
		value="<c:out value='${userSearchVO.pageIndex}'/>" />

	<!-- <h1 class="tit_1">이용고객관리</h1 >-->

	
	<div class="condition" style="text-align: left;">
	    <span class="item f_search">
			<p class="left">
		    	<label for="searchKeyword">차량번호</label>
			        <input class="f_input w_200" name="searchcarNum" id="searchcarNum" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchcarNum}"/>"/>
			    <label for="searchKeyword">연락처</label>
			        <input class="f_input w_200" name="searchTel" id="searchTel" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchTel}"/>"/>
					<%--<label for="searchKeyword">차량번호</label>
			        <input class="f_input w_200" name="searchTeam" id="searchTeam" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO}"/>"/>--%>	
			</p>
	        <button class="btn" type="submit" onclick="fnSearch(); return false;"><spring:message code='button.search' /></button><!-- 조회 -->
	    </span>
        <p class="right">
       		<a href="<c:url value='/mdm/SmartMberInsertView.do'/>" class="btn btn_blue_46 w_100" onclick="fnAddUserView(); return false;"><spring:message code="button.create" /></a><!-- 등록 -->
        </p>
    </div>
	<!--// 검색조건 -->


	<!-- 게시판 -->
	<div class="board_list_top" style="margin-top:0">
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
			<%-- <a href="<c:url value='/customer/SmartCusMberInsertView.do'/>" class="btn btn_blue_46 w_100" onclick="fnAddUserView(); return false;"><spring:message code="button.create" /></a><!-- 등록 --> --%>
			<!-- 
        <a href="<c:url value='/customer/SmartCusMberManage.do'/>" class="btn btn_blue_46 w_100"><spring:message code="button.list" /></a>목록
         -->
		</div>
	</div>

	<div class="board_list3">
		<table summary="회원목록">
			<caption>회원목록</caption>
			<colgroup>
				<col style="width: 60px;">
				<%-- <col style="width: 60px;"> --%>
				<col style="width: 100px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 100px;">
				<col style="width: 100px;">
				<%-- <col style="width: 100px;"> --%>
				<col style="width: 80px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">No.</th>
					<!-- <th scope="col"><span class="f_chk_only chkAll">
							<input name="checkAll" type="checkbox" title="Check All"
							onclick="javascript:fnCheckAll();" />
					</span></th> -->
					<th scope="col">고객번호</th>
					<th scope="col">차량번호</th>
					<th scope="col">차량종류</th>
					<th scope="col">고객이름</th>
					<th scope="col">연락처</th>
					<th scope="col">총주행거리(km)</th>
					<!-- <th scope="col">차량뒷번호</th> -->
					<th scope="col">수리내역</th>
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
						<td><c:out value="${(userSearchVO.pageIndex-1) * userSearchVO.pageSize + status.count}"/></td>
						<%-- <td><c:out value="${paginationInfo.totalRecordCount+1 - ((userSearchVO.pageIndex-1) * userSearchVO.pageSize + status.count)}"/></td> --%>
						<td><c:out value="${result.cusId}" /></td>
						<td><a href="#" style="text-decoration: underline;" onclick="fnSelectUser('<c:out value="${result.cusId}"/>')" class="lnk"><c:out value="${result.autoNo}" /></a>
                       	</td>
						<td><c:out value="${result.autoKind}" /></td>
						<td><c:out value="${result.cusNm}" /></td>													
						<td><c:out value="${result.cusTel}" /></td>
						<td><c:out value="${result.totalKm}" /></td>
						<%-- <td><c:out value="${result.autoInt}" /></td> --%>
						
						<td> 
							<c:if test="${result.repaircnt ne 0}">
								<a href="#LINK" class="btn btn_blue_30 w_80" onclick="clickRepair('<c:out value="${result.cusId}"/>'); return false;">조회</a>
							</c:if>
						</td>
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