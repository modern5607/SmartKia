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
</head>
<body>
<body>

        <div class="container">
            <div class="smart_monitoring">
                <div class="sub_in">
                    <div class="layout">
        
                        <div class="content_wrap">
                            <div id="contents" class="content" style="padding: 70px 10px 20px 10px;">
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

                                <h1 class="tit_1" style="text-align: center; padding-bottom: 50px">작업장 A 접수 현황</h1>

                                <!-- 게시판 -->
                                <div class="board_list">
                                    <table>
                                    	<%-- <caption>약관목록</caption> --%>
                                        <colgroup>
                                            <col style="width: 25%;">
                                            <col style="width: auto;">
                                            <col style="width: 15%;">
                                            <col style="width: 25%;">
                                            <col style="width: 10%;">
                                        </colgroup>
                                        <thead>
                                            <tr style="background: lightblue;">
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
                                            	<%-- <td>
                                            		<div>${result.AUTONUMBER}</div>
                                            	</td>
                                                <td>
                                                	<div class="divDotText" style="width:200px;">${result.REPAIRNOTE}</div>
                                                </td>
                                                <td>
                                                	<div class="divDotText" style="width:70px;">${result.POSITION}</div>
                                                </td>
                                                <td>
                                                	<div class="divDotText" style="width:70px;">${result.ESTIME}</div>
                                                </td>
                                                <td>${result.NOTE}</td> --%>
                                                <td><c:out value="${result.AUTONUMBER}"/></td>
                                                <td><c:out value="${result.REPAIRNOTE}"/></td>
                                                <td><c:out value="${result.POSITION}"/></td>
                                                <td><c:out value="${result.ESTIME}"/></td>
                                                <td><c:out value="${result.NOTE}"/></td>
                                                
                                                
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


</body>
</html>