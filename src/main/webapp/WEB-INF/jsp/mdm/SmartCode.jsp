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
    <link rel="stylesheet" href="<c:url value='/'/>css/component.css" type="text/css">
    <link rel="stylesheet" href="<c:url value='/'/>css/page.css">
    <script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/'/>js/ui.js"></script>
    <title>샘플 포털 > 사이트 소개 > 사이트 소개</title>
    <!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

    <script type="text/javascript">
    function ClickGroupCode(groupcode)
    {
        document.searchform.groupcode.value = groupcode;
        document.searchform.action = "<c:url value='/mdm/SmartCode.do'/>";
        document.searchform.submit();
    }
    
    function UpdateCommonGroupCode(groupcode)
    {
        document.searchform.groupcode.value = groupcode;
        document.searchform.action = "<c:url value='/mdm/UpdateCommonGroupCodeView.do'/>";
        document.searchform.submit();
    }

    function UpdateCommonCode(groupcode,code)
    {
        document.searchform.groupcode.value = groupcode;
        document.searchform.code.value = code;
        document.searchform.action = "<c:url value='/mdm/UpdateCommonCodeView.do'/>";
        document.searchform.submit();
    }
    function DeleteCommonCode(groupcode,code)
    {
    	confirm("정말 삭제하시겠습니까?");
    	
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
                    <div class="layout" style="margin-bottom: 40px;">
                        <!-- Left menu -->
                        <!-- <c:import url="/sym/mms/EgovMenuLeft.do" /> -->
                        <!--// Left menu -->
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                <!-- Location -->
                                <div class="location">
                                    <ul>
                                        <li><a class="home" href="">Home</a></li>
                                        <li><a href="">기준정보</a></li>
                                        <li>공통코드관리</li>
                                    </ul>
                                </div>
                                <!--// Location -->

                                <form name="searchform" id="searchform" action="<c:url value='/mdm/SmartCode.do'/>" method="post">

                                    <!-- 검색조건 -->
                                    <div class="condition" style="text-align: left;">
										
                                        <span class="item f_search">
                                            <input type="hidden" id="groupcode" name="groupcode" value="">
                                            <input type="hidden" id="code" name="code" value="">
                                            <p class="left">
                                                <label for="searchCode">코드</label>
                                                <input class="f_input w_200" name="searchCode" id="searchCode" type="text" value="<c:out value='${comCodeVO.searchCode}'/>" />
                                            </p>
                                            <p class="left">
                                                <label for="searchCodename">코드명</label>
                                                <input class="f_input w_200" name="searchCodename" id="searchCodename" type="text" value="<c:out value='${comCodeVO.searchCodename}'/>" />
                                            </p>
                                            
                                            <button class="btn" type="submit">
                                                <spring:message code="button.inquire" />
                                            </button>조회
                                        </span>
                                        <!-- <a href="" class="btn btn_search_w">등록</a> -->

                                        <!-- <a href="<c:url value='/uss/olp/qri/EgovQustnrRespondInfoRegist.do'/>" class="item btn btn_blue_46 w_100">등록</a>등록 -->
                                    </div>
                                    <!--// 검색조건 -->
                                    <div style="margin-top:10px;">
                                        <div class="w50 left">
 											<a href="<c:url value='/mdm/InsertCommonGroupCodeView.do'/>" class="btn btn_blue_46 w_100 btnmargin" onclick="ClickGroupCode()" style="float: right;"><spring:message code="button.create"/></a>
                                        </div>

                                        <div class="w50 left">
                                            <c:if test="${comCodeVO.groupcode!=''}">
 												<a href="<c:url value='/mdm/InsertCommonCodeView.do?groupcode=${comCodeVO.groupcode}'/>" class="btn btn_blue_46 w_100 btnmargin" onclick=""style="float: right;"><spring:message code="button.create" /></a>
                                            	
                                        	</c:if>
                                        	<c:if test="${comCodeVO.groupcode == ''}">
                                                <div style="height:46px;"></div>
                                            </c:if>
                                        </div>
                                    </div>
                                
                                    <!-- 왼쪽 게시판 -->
                                    <div>
                                        <div class="w50 left" >
                                            <div class="board_list3" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 50px;">
                                                        <col style="width: auto;">
                                                        <col style="width: 90px;">
                                                        <col style="width: 50px;">
                                                        <col style="width: 115px;">
                                                        <col style="width: 115px;">
                                                        <col style="width: 70px;">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">No</th>
                                                            <th scope="col">코드</th>
                                                            <th scope="col">코드명</th>
                                                            <th scope="col">사용유무</th>
                                                            <th scope="col">등록자</th>
                                                            <th scope="col">최근수정</th>
                                                            <th scope="col">비고</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${fn:length(resultList) == 0}">
                                                        <tr>
                                                            <td colspan="6"><spring:message code="common.nodata.msg" /></td>
                                                        </tr>
                                                        </c:if>
                                                        <c:forEach var="result" items="${resultList}" varStatus="status">
                                                        <tr>
                                                            <td><c:out value="${(searchVO.pageIndex-1)*searchVO.pageSize+status.count}"/></td>
                                                            <td><a href="#" onclick="ClickGroupCode('<c:out value='${result.GROUP_CODE}'/>')" class="lnk"><c:out value="${result.GROUP_CODE}"/></a></td>
                                                            <td><c:out value="${result.GROUP_NAME}"/></td>
                                                            <td><c:out value="${result.USE_YN}"/></td>
                                                            <td><c:out value="${result.INSERT_ID}"/></td>
                                                            <td><c:out value="${result.UPDATE_DATE}"/></td>
                                                            <td><a href="#LINK" class="btn btn_blue_30 btnmargin" onclick="UpdateCommonGroupCode('<c:out value='${result.GROUP_CODE}'/>'); return false;" style="width:50px;"><spring:message code="button.update" /></a></td>
                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        
                                        <!-- 오른쪽 게시판 -->
                                        <div class="w50 left">
                                            <div class="board_list3" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;margin-left: 15px;">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 50px;">
                                                        <col style="width: auto;">
                                                        <col style="width: 90px;">
                                                        <col style="width: 50px;">
                                                        <col style="width: 115px;">
                                                        <col style="width: 115px;">
                                                        <col style="width: 130px;">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">No</th>
                                                            <th scope="col">코드</th>
                                                            <th scope="col">코드명</th>
                                                            <th scope="col">사용유무</th>
                                                            <th scope="col">등록자</th>
                                                            <th scope="col">최근수정</th>
                                                            <th scope="col">비고</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${fn:length(resultDetail) == 0}">
                                                        <tr>
                                                            <td colspan="7"><spring:message code="common.nodata.msg" /></td>
                                                        </tr>
                                                        </c:if>
                                                        <c:forEach var="result" items="${resultDetail}" varStatus="status">
                                                        <tr>
                                                            <td><c:out value="${(searchVO.pageIndex-1)*searchVO.pageSize+status.count}"/></td>
                                                            <td><c:out value="${result.CODE}"/></td>
                                                            <td><c:out value="${result.NAME}"/></td>
                                                            <td><c:out value="${result.USE_YN}"/></td>
                                                            <td><c:out value="${result.INSERT_ID}"/></td>
                                                            <td><c:out value="${result.UPDATE_DATE}"/></td>
                                                            <td><a href="#LINK" class="btn btn_blue_30 btnmargin" onclick="UpdateCommonCode('<c:out value='${comCodeVO.groupcode}'/>','<c:out value='${result.CODE}'/>'); return false;" style="width:50px;"><spring:message code="button.update" /></a>
                                                                <!-- <a href="#LINK" class="btn btn_blue_30 btnmargin" onclick="DeleteCommonCode('<c:out value='${result.GROUP_CODE}'/>','<c:out value='${result.CODE}'/>'); return false;" style="width:50px;"><spring:message code="button.delete" /></a></td> -->
                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- 페이징 -->
                                <!-- <div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="linkPage" />
                                        </ul>
                                    </div>
                                </div> -->
                                <!-- // 페이징 끝 -->
                            </div>
                            <!-- <div class="content">
                            <div id="contents" class="tab_contents" style="padding: 44px 10px 20px 20px;">
                                <a href="<c:url value='/kiosk/selectKioskin.do'/>" class="item btn btn_blue_46 w_500 h_400" style="font-size: 70px; padding: 160px 0px 0px 0px;">일반수리</a>
                                <a href="<c:url value='/kiosk/selectKioskinsurance.do'/>" class="item btn btn_blue_46 w_500 h_400" style="font-size: 70px;  padding: 160px 0px 0px 0px;">보증수리</a>
                            </div> -->
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