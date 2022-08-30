<%--
  Class Name : EgovQustnrTmplatManageList.jsp
  Description : 설문템플릿 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
     2011.08.31  JJY       경량환경 버전 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images_old/egovframework/com/uss/olp/qtm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>모니터링</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>

<script type="text/javaScript" language="javascript">
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
	                    <c:import url="/sym/mms/EgovMenuLeft.do" />
	                    <!--// Left menu -->
        
                        <div class="content_wrap">
                            <div id="contents" class="content" style="padding: 70px 10px 20px 20px;">
                                 <!-- Location -->
                                <!-- <div class="location">
                                    <ul>
                                        <li><a class="home" href="">Home</a></li>
                                        <li><a href="">포털서비스관리</a></li>
                                        <li><a href="">설문관리</a></li>
                                        <li>설문템플릿</li>
                                    </ul>
                                </div> -->
                                <!--// Location -->

                                <!-- <h1 class="tit_1">포털서비스관리</h1>

                                <p class="txt_1">포털시스템에서 제공되는 서비스들에 대한 컨텐츠를 관리합니다.</p>

                                <h2 class="tit_2">설문관리</h2>

                                <h3 class="tit_3">설문템플릿</h3> -->

                                <!-- 검색조건 -->
                                <div class="condition">
                                	
                                	<form name="listForm" id="listForm" action="<c:url value='${pageContext.request.contextPath}/monitor/SmartMonitoring.do'/>" method="post">
                                	
                                    <label class="item f_select" for="sel1">
                                        <select name="searchCondition" title="검색조건 선택" id="sel1">
                                            <option value='AUTONUMBER' <c:if test="${searchCondition == 'AUTONUMBER'}">selected</c:if>>차량번호</option>
                                            <option value='POSITION' <c:if test="${searchCondition == 'POSITION'}">selected</c:if>>위치</option>
                                        </select>
                                    </label>

                                    <span class="item f_search">
                                        <input class="f_input w_500" name="searchKeyword" type="text" size="30" value="${searchKeyword}" maxlength="35" title="검색어 입력" >
                                        <button class="btn" type="submit" value="<spring:message code="button.inquire" />" onclick="fn_egov_search_QustnrTmplatManage(); return false;">조회</button><!-- 조회 -->
                                    </span>

	                               	<a href="${pageContext.request.contextPath}/monitor/SmartMonitoringInsertView.do" class="item btn btn_blue_46 w_100"><spring:message code="button.create" /></a><!-- 등록 -->

                                    <input name="qestnrTmplatId" type="hidden" value="">
									<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
									</form>
                                    
                                </div>
                                <!--// 검색조건 -->

                                <!-- 게시판 -->
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
                                            	<td><c:out value="${result.AUTONUMBER}"/></td>
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

                                <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="linkPage" />
                                        </ul>
                                    </div>
                                </div>
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