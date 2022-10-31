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
													<input name="sdate" id="sdate" readonly="readonly"class="f_input w_180" title="검색" type="text"value="<c:out value="${SmartCrmVO.sdate}"/>" />
												<label for="edate"> ~ </label> 
													<input name="edate" id="edate" readonly="readonly" class="f_input w_180" title="검색" type="text" value="<c:out value="${SmartCrmVO.edate}"/>" />
												<%-- <label for="searchTeam">작업반</label>
					                        		<input class="f_input w_200" name="POSITION" id="POSITION" type="text" maxlength="20" title="검색" value="<c:out value="${SmartCrmVO.POSITION}"/>"/> --%>
												<button class="btn" type="submit"onclick="fnSearch(); return false;" style="right: -50px;"><spring:message code='button.search' /></button> 
											</p>
										</span>
										<%-- <div class="right_col">
                                            <label class="f_select w_200" for="autoroom">
													<select name="autoroom" id="autoroom">
														<option value="all">전체</option>
														<c:forEach var="k" items="${autorooms}" varStatus="status">
                                                            <option value="<c:out value='${k.CODE}'/>" ${SmartCrmVO.position ==k.CODE ? 'selected' : ((logininfo[0].TEAM == k.CODE && SmartCrmVO.position =='') ? 'selected' : '')} >${k.NAME}</option> 
                                                        </c:forEach>
													</select>
													
														
											</label>
											<a href="#" class="btn btn_blue_46 w_100" onclick="javascript:fnCheckId(); return false;"><spring:message code="button.inquire" /></a>
										</div> --%>
									</div>
                                    <!-- 검색조건 -->
                                    <div>
                                        <!-- 중분류 리스트 -->
                                        <!-- <div class="w50 left" style="margin-left:15px;"> -->
                                            <!-- <div class="right_col" style="margin-top: 10px;">
                                                <a href="<c:url value='/mdm/InsertCommonGroupCodeView.do'/>" class="btn btn_blue_46 w_100 btnmargin" onclick="ClickGroupCode()"><spring:message code="button.create"/></a>
                                                <a href="#LINK" class="btn btn_blue_46 w_100 right btnmargin" onclick="fnDeleteUser(); return false;"><spring:message code="button.delete" /></a>
                                            </div> -->
                                            <div class="board_list3">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 100px;">
                                                        <%-- <col style="width: 50px;"> --%>
                                                        <col style="width: 200px;">
                                                        <col style="width: 50px;">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">대분류</th>
                                                            <!-- <th scope="col">No</th> -->
                                                            <th scope="col">부품명</th>
                                                            <th scope="col">정비횟수</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${fn:length(mainlist) == 0}">
                                                        <tr>
                                                            <td colspan="3">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
                                                        </tr>
                                                        </c:if>
                                                        <c:forEach var="result" items="${mainlist}" varStatus="status">
                                                            <tr>
                                                                <td><c:out value="${result.H_NAME}"/></td>
                                                            	<%-- <td><c:out value="${status.count}"/></td> --%>
                                                            	<td><c:out value="${result.NAME}"/></td>
                                                                <td><c:out value="${result.CNT}"/></td>
                                                            </tr>
                                                        </c:forEach>
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                    <%-- <div>
                                        <!-- 중분류 리스트 -->
                                        <div class="w50 left" style="margin-left:15px;">
                                            <!-- <div class="right_col" style="margin-top: 10px;">
                                                <a href="<c:url value='/mdm/InsertCommonGroupCodeView.do'/>" class="btn btn_blue_46 w_100 btnmargin" onclick="ClickGroupCode()"><spring:message code="button.create"/></a>
                                                <a href="#LINK" class="btn btn_blue_46 w_100 right btnmargin" onclick="fnDeleteUser(); return false;"><spring:message code="button.delete" /></a>
                                            </div> -->
                                            <div class="board_list3" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 50px;">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">대분류</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${fn:length(mainlist) == 0}">
                                                        <tr>
                                                            <td colspan="1">자료가 없습니다. 다른 검색조건을 선택해주세요</td>
                                                        </tr>
                                                        </c:if>
                                                        <c:forEach var="result" items="${mainlist}" varStatus="status">
                                                            <tr>
                                                                <td><a href="#" class="lnk" onclick="ClickMainCode('${result.H_CODE}')"><c:out value="${result.H_NAME}"/></a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 중분류 리스트 끝-->
                                        <!-- 소분류 리스트 -->
                                        <div class="w50 left" style="margin-left:14px;">
                                            <div class="board_list3" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 50px;">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">No</th>
                                                            <th scope="col">부품명</th>
                                                            <th scope="col">정비횟수</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    	
                                                        <c:if test="${fn:length(middlelist) == 0}">
                                                        <tr>
                                                            <td colspan="4">데이터가 없습니다. 기간을 선택해 주세요.</td>
                                                        </tr>
                                                        </c:if>
                                                        
                                                        <c:forEach var="result" items="${middlelist}" varStatus="status">
                                                            <tr>
                                                            	<td><c:out value="${status.count}"/></td>
                                                            	<td><c:out value="${result.NAME}"/></td>
                                                                <td><c:out value="${result.CNT}"/></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        
                                    </div> --%>
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