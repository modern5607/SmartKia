<%--
  Class Name : EgovUserManage.jsp
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

    <title>목포서비스 KIA AUTO Q</title>
    <script type="text/javaScript" language="javascript" defer="defer">

/* function ReceiveAuthor() {
	if ($('input:checkbox[name=check]').is(":checked") == true) {

		var url = "<c:url value='/mdm/mber/ReceiveAuthorPOP.do'/>?";

		var $dialog = $('<div id="modalPan"></div>').html(
				'<iframe style="border: 0px;" src="'
						+ "<c:url value='/mdm/mber/ReceiveAuthorPOP.do'/>?"
						+ '" width="100%" height="100%"></iframe>').dialog(
				{
					autoOpen : false,
					modal : true,
					width : 600,
					height : 300
				});
		$(".ui-dialog-titlebar").hide();
		$dialog.dialog('open');
	} else {
		alert("변경할 사용자를 체크하여 주세요.");
	}
} */
<!--

function fnDeleteUser() {
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
            document.listForm.action = "<c:url value='/mdm/SmartMberDelete.do'/>";
            document.listForm.submit();
        }
    }
}
function fnSelectUser(id) {
	document.listForm.selectedId.value = id;
	array = id.split(":");
	if(array[0] == "") {
	} else {
	    userTy = array[0];
	    userId = array[1];    
	}
	document.listForm.selectedId.value = userId;
    document.listForm.action = "<c:url value='/mdm/SmartMberSelectUpdtView.do'/>";
    document.listForm.submit();
}
function fnAddUserView() {
    document.listForm.action = "<c:url value='/mdm/SmartMberInsertView.do'/>";
    document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/mdm/SmartMberManage.do'/>";
    document.listForm.submit();
}
/*********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/mdm/SmartMberManage.do'/>";
    document.listForm.submit();
}
function init()
{
	if ("<c:out value='${msg}'/>" != "") {
		alert("<c:out value='${msg}'/>")
	}
}
//-->

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
	                    <%-- <c:import url="/sym/mms/EgovMenuLeft.do" /> --%>
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

								<form name="listForm" action="/mdm/SmarMberManage.do" method="post">
								<input name="selectedId" type="hidden" />
								<input name="checkedIdForDel" type="hidden" />
								<input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>

                                <!-- <h1 class="tit_1">사용자관리</h1> -->

                               <!--  <p class="txt_1">사용자 및 권한에 대한 제반사항을 관리합니다.</p>
 -->
                                <!-- <h2 class="tit_2">사용자관리</h2>

                                <h3 class="tit_3">회원관리</h3> -->
                                
                                <!-- 검색조건 -->
                                <div class="condition" style="text-align: left;">
				                    <span class="item f_search">
					                    <p class="left">
					                    <label for="searchId">아이디</label>
					                        <input class="f_input w_200" name="searchId" id="searchId" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchId}"/>"/>
					                    <label for="searchNm">사용자이름</label>
					                        <input class="f_input w_200" name="searchNm" id="searchNm" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchNm}"/>"/>
					                    <label for="searchYn">사용여부</label>
				                        <label class="f_select w_200" for="searchYn">
											<select name="searchYn" id="searchYn">
		                                        <option value=''></option>
												<option value="Y" <c:if test="${info.useyn eq 'Y'}">selected</c:if>>사용</option>	
												<option value="N" <c:if test="${info.useyn eq 'N'}">selected</c:if>>사용중지</option>	
											</select>
										</label>
					                    <label for="searchTeam">작업반</label>
					                        <input class="f_input w_200" name="searchTeam" id="searchTeam" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchTeam}"/>"/>
				                        <%-- <label for="searchYn">사용여부</label>
					                        <input class="f_input w_200" name="searchYn" id="searchYn" type="text" maxlength="20" title="검색" value="<c:out value="${userSearchVO.searchYn}"/>"/> --%>
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
                                            <span>사용자수</span>
                                            <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong>
                                        </div>
                                    </div> 

                                    <div class="right_col">
                                    	<!-- <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncAddAuthorInsert()" style="selector-dummy:expression(this.hideFocus=false);">사용</a>
										<a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fncAuthorDelete()" style="selector-dummy:expression(this.hideFocus=false);">사용중지</a> -->
										<!-- <a href="#" onclick="ReceiveAuthor()" class="item btn btn_blue_46 w_100">사용여부</a> -->
                                        <%-- <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fnDeleteUser(); return false;"><spring:message code="button.delete" /></a><!-- 삭제 --> --%>
                                        <!-- 
                                        <a href="<c:url value='/uss/umt/mber/EgovMberManage.do'/>" class="btn btn_blue_46 w_100"><spring:message code="button.list" /></a>목록
                                         -->                     
                                         <%-- <a href="<c:url value='/mdm/SmartMberInsertView.do'/>" class="btn btn_blue_46 w_100" onclick="fnAddUserView(); return false;"><spring:message code="button.create" /></a><!-- 등록 --> --%>
                                    </div>
                                </div>

                                <div class="board_list">
                                    <table summary="회원목록">
                                    	<caption>회원목록</caption>
                                        <colgroup>
                                            <col style="width: 60px;">
                                            <col style="width: 100px;">
                                            <col style="width: 100px;">
                                            <col style="width: 60px;">
                                            <col style="width: 100px;">
                                            <col style="width: 60px;">
                                            <%-- <col style="width: 20px;"> --%>
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col">No.</th>
                                                <th scope="col">아이디</th>
                                                <th scope="col">사용자이름</th>
                                                <th scope="col">작업반</th>
                                                <th scope="col">전화번호</th>
                                                <!-- <th scope="col">등록일</th> -->
                                                <th scope="col">사용여부</th>
                                                <!-- <th scope="col">
                                                    <span class="f_chk_only chkAll">
                                                        <input type="checkbox" name="checkAll" title="선택여부" onclick="javascript:fncCheckAll()">
                                                    </span>
                                                </th> -->
                                            </tr>
                                            
                                        </thead>
                                        <tbody>
                                        	<c:if test="${fn:length(resultList) == 0}">
							                <tr>
							                	<td colspan="8"><spring:message code="common.nodata.msg" /></td>
							                </tr>
							                </c:if>
                                        	
                                        	<c:forEach items="${resultList}" var="result"  varStatus="status">
                                            <tr>
                                            <td><c:out value="${(userSearchVO.pageIndex-1) * userSearchVO.pageSize + status.count}"/></td>
                                            <%-- <td><c:out value="${paginationInfo.totalRecordCount+1 - ((userSearchVO.pageIndex-1) * userSearchVO.pageSize + status.count)}"/></td> --%>
                                                
                                                <td style="text-decoration: underline;">
                                                	<a href="<c:url value='/mdm/mber/SmartMberSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>" class="lnk" onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;">
                                                		<c:out value="${result.userId}"/>
                                                	</a>
                                                </td>
                                                <td><c:out value="${result.userNm}"/></td>
		                                          	
                                                <td><c:out value="${result.positionName}"/></td>
                                                <td><c:out value="${result.moblphonNo}"/></td>
                                                <%-- <td><c:out value="${result.sbscrbDe}"/></td> --%>
                                                
                                                <td>
                                                	<c:if test="${result.useyn == 'N'}"><spring:message code="button.notUsed" /></c:if>
                                                	<c:if test="${result.useyn == 'Y'}"><spring:message code="button.use" /></c:if>

                                                	<!-- <input type="radio" name="useYn" value="Y">사용
                                                	<input type="radio" name="useYn" value="N">미사용 -->
                                                </td>
                                                <%-- <td>
                                                    <span class="f_chk_only">
                                                        <input name="checkField" title="checkField <c:out value="${status.count}"/>" type="checkbox"/>
                                                        <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
                                                    </span>
                                                </td> --%>
                                            </tr>
                                            
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

								<!-- 페이징 -->
                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="fnLinkPage" />
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