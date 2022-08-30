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
    <title>샘플 포털 > 사이트 소개 > 사이트 소개</title>
    <!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

    <script type="text/javascript">
    
    function ClickMainCode(code)
    {
        document.searchform.main.value = code;
        console.log(document.searchform.main.value)
        // document.searchform.action = "<c:url value='/mdm/SmartCode.do'/>";
        document.searchform.submit();
    }
    function ClickMiddleCode(code)
    {
        document.searchform.middle.value = code;
        console.log(document.searchform.middle.value)
        // document.searchform.action = "<c:url value='/mdm/SmartCode.do'/>";
        document.searchform.submit();
    }

    function UpdateLeadTime(code)
    {
        document.searchform.auto002code.value= code
        console.log(document.searchform.auto002code.value)
        document.searchform.action = "<c:url value='/mdm/UpdateLeadTime.do'/>";
        document.searchform.submit();
    }
    /*
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
    */
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
                        <c:import url="/sym/mms/EgovMenuLeft.do" />
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

                                
                                    <h1 class="tit_1">표준작업관리</h1>
                                    <p class="txt_1">표준작업관리를 통해 소요시간을 관리합니다.</p>

                                    <!-- 검색조건 -->
                                    <form name="searchform" id="searchform" action="<c:url value='/mdm/SmartLeadTime.do'/>" method="post">
                                    <div class="condition">
                                        <label class="item f_select" for="sel1">
                                            <select id="sel1" name="searchCondition" title="검색조건 선택">
                                                <option value=''>선택하세요</option>
                                                <option value='ETC_ANSWER_CN' <c:if
                                                    test="${searchCondition == 'ETC_ANSWER_CN'}">selected</c:if>
                                                    >기타답변내용</option>
                                                <option value='RESPOND_ANSWER_CN' <c:if
                                                    test="${searchCondition == 'RESPOND_ANSWER_CN'}">selected
                                                    </c:if>>응답자답변내용</option>
                                                <option value='RESPOND_NM' <c:if
                                                    test="${searchCondition == 'RESPOND_NM'}">selected</c:if>
                                                    >응답자명</option>
                                            </select>
                                        </label>

                                        <span class="item f_search">
                                            <input type="hidden" id="main" name="main" value="<c:out value='${comCodeVO.main}'/>">
                                            <input type="hidden" id="middle" name="middle" value="<c:out value='${comCodeVO.middle}'/>">
                                            <input type="hidden" id="sub" name="sub" value="<c:out value='${comCodeVO.sub}'/>">
                                            <input type="hidden" id="auto002code" name="auto002code" value="">
                                            <input class="f_input w_500" name="searchKeyword" type="text"
                                                value="<c:out value='${comCodeVO.searchKeyword}'/>" title="검색어 입력" maxlength="35" />
                                            <button class="btn" type="submit">
                                                <spring:message code="button.inquire" />
                                            </button>조회
                                        </span>
                                        <!-- <a href="" class="btn btn_search_w">등록</a> -->

                                        <!-- <a href="<c:url value='/uss/olp/qri/EgovQustnrRespondInfoRegist.do'/>" class="item btn btn_blue_46 w_100">등록</a>등록 -->
                                    </div>
                                    <!--// 검색조건 -->
                                
                                    
                                    <div >
                                        <!-- 대분류 리스트 -->
                                        <div class="w20 left" >
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
                                                        <c:forEach var="result" items="${mainlist}" varStatus="status">
                                                            <tr>
                                                                <td><a href="#" class="lnk" onclick="ClickMainCode('${result.CODE}')"><c:out value="${result.NAME}"/></a></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 대분류 리스트 끝-->
                                        <!-- 중분류 리스트 -->
                                        <div class="w30 left" style="margin-left:15px;">
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
                                                            <th scope="col">중분류</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="result" items="${middlelist}" varStatus="status">
                                                            <tr>
                                                                <td><a href="#" class="lnk" onclick="ClickMiddleCode('${result.CODE}')"><c:out value="${result.NAME}"/></a></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 중분류 리스트 끝-->
                                        <!-- 소분류 리스트 -->
                                        <div class="w50 left" style="margin-left:14px;">
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
                                                            <th scope="col">No</th>
                                                            <th scope="col">부품</th>
                                                            <th scope="col">소요시간</th>
                                                            <th scope="col"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="result" items="${sublist}" varStatus="status">
                                                            <tr>
                                                            	<td><c:out value="${(searchVO.pageIndex-1)*searchVO.pageSize+status.count}"/></td>
                                                                <td><c:out value="${result.NAME}"/></td>
                                                                <td>
                                                                    <label for="" class="f_select" style="width:80%; padding-left:10px;">
                                                                        <select name="leadtime" id="leadtime">
                                                                            <option value="">선택</option>
                                                                            <c:forEach var="leadtime" items="${leadtimelist}" varStatus="status">
                                                                            <option value="<c:out value='${leadtime.IDX}'/>"><c:out value="${leadtime.LEAD_NAME}"/></option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </label>
                                                                </td>
                                                                <td><a href="#LINK" class="btn btn_blue_30 right btnmargin" style="width:50px;" onclick="UpdateLeadTime('<c:out value='${result.CODE}'/>'); return false;"><spring:message code="button.update" /></a></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 소분류 리스트 끝-->
                                        
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