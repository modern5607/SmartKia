<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" href="<c:url value='/'/>css/component.css?ver=1">
    <link rel="stylesheet" href="<c:url value='/'/>css/page.css">
    <script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/'/>js/ui.js"></script>
    <!-- 캘린더 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="<c:url value='/'/>js/datepicker.js"></script>
	<!-- /캘린더 -->
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
    <title>표준작업관리</title>
    <!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

    <script type="text/javascript">
    function fnSearch() {
 		document.SmartCrmVO.pageIndex.value = 1;
 		document.SmartCrmVO.action = "<c:url value='/crm/SmartRepairStat.do'/>";
 		document.SmartCrmVO.submit();
 	}
    function ClickMainCode(code)
    {
        document.SmartCrmVO.main.value = code;
        console.log(document.SmartCrmVO.main.value);
        document.SmartCrmVO.submit();
    }
     function ClickDetail(code)
    {
        document.SmartLeadTimeVO.middle.value = code;
        console.log(document.SmartLeadTimeVO.middle.value);
        // document.SmartLeadTimeVO.action = "<c:url value='/mdm/SmartCode.do'/>";
        document.SmartLeadTimeVO.submit();
    }
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
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                <!-- Location -->
                                <div class="location">
                                    <ul>
                                        <li><a class="home" href="../cmm/main/mainPage.do">Home</a></li>
                                        <li><a href="/mdm/SmartCode.do">접수관리</a></li>
                                        <li>기간별 정비현황</li>
                                    </ul>
                                </div>
                                <form name="SmartCrmVO" id="SmartCrmVO" action="<c:url value='/crm/SmartRepairStat.do'/>" method="post">
                                <!--// Location -->
                                    <div class="condition" style="text-align: left;">
                                            <span class="item f_search">
                                                <p class="left">
                                                    <label for="sdate">기간 </label> 
                                                        <input name="sdate" id="sdate" readonly class="f_input w_180" type="text"value="<c:out value="${SmartCrmVO.sdate}"/>" />
                                                    <label for="edate"> ~ </label> 
                                                        <input name="edate" id="edate" readonly  class="f_input w_180" type="text"value="<c:out value="${SmartCrmVO.edate}"/>" /> 
                                                    <%-- <label for="searchTeam">작업반</label>
                                                        <input class="f_input w_200" name="POSITION" id="POSITION" type="text" maxlength="20" title="검색" value="<c:out value="${SmartCrmVO.POSITION}"/>"/> --%>
                                                    <button class="btn" type="submit"onclick="fnSearch(); return false;" style="right: -50px;"><spring:message code='button.search' /></button> 
                                                </p>
                                            </span>
                                    </div>
                                    <!-- 검색조건 -->
                                    <div>
                                        <div class="board_list3">
                                            <table>
                                                <colgroup>
                                                    <col style="width: 20%px;">
                                                    <col style="width: 35%px;">
                                                    <col style="width: 15%px;">
                                                    <col style="width: 15%px;">
                                                    <col style="width: 15%px;">
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th scope="col">대분류</th>
                                                        <th scope="col">부품명</th>
                                                        <th scope="col">예약건수</th>
                                                        <th scope="col">일반건수</th>
                                                        <th scope="col">총 건수</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:if test="${fn:length(mainlist) == 0}">
                                                    <tr>
                                                        <td colspan="5">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
                                                    </tr>
                                                    </c:if>
                                                    <c:set var="Rtotal" value="0"/>
                                                    <c:set var="Ntotal" value="0"/>
                                                    <c:set var="Ttotal" value="0"/>
                                                    <!-- <c:set var="cur" value=""/>
                                                    <c:set var="prev" value=""/>
                                                    <c:set var="overlap_cnt" value="0"/>
                                                    <c:forEach var="result" items="${mainlist}" varStatus="status">
                                                        <c:set var="prev" value="${cur}"/>
                                                        <c:set var="cur" value="${result.H_CODE}"/>
                                                        <c:if test="${cur == prev}">
                                                        <c:set var="overlap_cnt" value="${overlap_cnt + 1}"/>
                                                        </c:if>
                                                    </c:forEach> -->
                                                    <c:forEach var="result" items="${mainlist}" varStatus="status">
                                                        
                                                        <c:set var="Rtotal" value="${Rtotal + result.RESERVE_COUNT}"/>
                                                        <c:set var="Ntotal" value="${Ntotal + result.NORMAL_COUNT}"/>
                                                        <c:set var="Ttotal" value="${Ttotal + result.TOTAL_COUNT}"/>
                                                        <tr>
                                                            <td>${result.H_NAME}</td>
                                                            <td>${result.NAME}</td>
                                                            <!-- <td><a href="#" class="lnk" onclick="ClickMainCode('${result.H_CODE}')"><c:out value="${result.H_NAME}"/></a></td> -->
                                                            <td><c:out value="${result.RESERVE_COUNT}"/></td>
                                                            <td><c:out value="${result.NORMAL_COUNT}"/></td>
                                                            <td><c:out value="${result.TOTAL_COUNT}"/></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th colspan="2">합계</th>
                                                        <th><c:out value="${Rtotal}"/></th>
                                                        <th><c:out value="${Ntotal}"/></th>
                                                        <th><c:out value="${Ttotal}"/></th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </form>
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