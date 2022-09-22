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
	<style>
	 /* tr:nth-child(even){
	 background-color:#9cc0ff; 
	 }*/
	</style>
</head>
<body>
<body>

        <div class="container">
            <div class="smart_monitoring">
                <div class="sub_in">
                    <div class="layout">
						
                        <div class="content_wrap" style="grid:">
                            <div id="contents" class="content" style="padding: 70px 10px 20px 10px;">
								<div style="display:grid; grid-template-columns:1f; grid-gap:20px">
									<h1 class="tit_1" style="text-align: center; padding-bottom: 50px">접수 현황</h1>
								</div>
                                
								                                <!-- 게시판 -->
                                <div style="display:grid; grid-template-columns:1fr; grid-gap:20px">
	                               
	                                </div>
	                                <div class="board_list">
	                                    <table>
	                                        <colgroup>
	                                            <col style="width: 25%;">
	                                            <col style="width: 20%;">
	                                            <col style="width: auto%;">
	                                            <col style="width: 20%;">
	                                        </colgroup>
	                                        <thead>
	                                            <tr style="background: #9cc0ff;">
	                                                <th scope="col">차량번호</th>
	                                                <th scope="col">고객명</th>
	                                                <th scope="col">예상완료시간</th>
	                                                <th scope="col">상태</th>
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
	                                                <td><c:out value="${result.REPAIRNOTE}"/></td>
	                                                <td><c:out value="${result.ESTIME}"/></td>
	                                                <td><c:out value="${result.TASKSTAT}"/></td>
	                                                
	                                                
	                                            </tr>
	                                            </c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


</body>
</html>