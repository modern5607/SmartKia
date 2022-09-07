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
    <title>표준작업관리</title>
    <!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

    <script type="text/javascript">
    
    function ClickMainCode(code)
    {
        document.SmartLeadTimeVO.main.value = code;
        document.SmartLeadTimeVO.middle.value = "";
        document.SmartLeadTimeVO.sub.value = "";
        console.log(document.SmartLeadTimeVO.main.value);
        // document.SmartLeadTimeVO.action = "<c:url value='/mdm/SmartCode.do'/>";
        document.SmartLeadTimeVO.submit();
    }
    function ClickMiddleCode(code)
    {
        document.SmartLeadTimeVO.middle.value = code;
        console.log(document.SmartLeadTimeVO.middle.value);
        // document.SmartLeadTimeVO.action = "<c:url value='/mdm/SmartCode.do'/>";
        document.SmartLeadTimeVO.submit();
    }

    function UpdateLeadTime(hcode,code,selectidx)
    {
        document.SmartLeadTimeVO.updatehcode.value= hcode;
        document.SmartLeadTimeVO.updatecode.value= code;
        document.SmartLeadTimeVO.updateleadtime.value = $("#leadtime"+selectidx+" option:selected").val();
        console.log(document.SmartLeadTimeVO.updatehcode.value);
        console.log(document.SmartLeadTimeVO.updatecode.value);
        console.log(document.SmartLeadTimeVO.updateleadtime.value);
        
        document.SmartLeadTimeVO.action = "<c:url value='/mdm/UpdateLeadTime.do'/>";
        document.SmartLeadTimeVO.submit();
    }

    function InsertLeadTime()
    {
        if(document.SmartLeadTimeVO.insertname.value == "")
        {
            alert("부품명을 입력해 주세요");
            document.SmartLeadTimeVO.insertname.focus();
            return false;
        }
        $.ajax({
            type: "post",
            url: "/mdm/InsertLeadTime.do",
            data: {
                insertleadtime:document.SmartLeadTimeVO.insertleadtime.value,
                insertname:document.SmartLeadTimeVO.insertname.value,
                main:document.SmartLeadTimeVO.main.value,
                middle:document.SmartLeadTimeVO.middle.value
            },
            success: function (msg) {
				if(msg==1)
					location.reload();
				else
				{
					alert("등록에 실패하였습니다. 다시 시도해 주세요.");
					location.reload();
				}
            }
        });
        // document.SmartLeadTimeVO.action = "<c:url value='/mdm/InsertLeadTime.do'/>";
        // document.SmartLeadTimeVO.submit();
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
                                        <li><a href="/mdm/SmartCode.do">기준정보</a></li>
                                        <li>표준작업관리</li>
                                    </ul>
                                </div>
                                <!--// Location -->
                                    <!-- 검색조건 -->
                                    <form name="SmartLeadTimeVO" id="SmartLeadTimeVO" action="<c:url value='/mdm/SmartLeadTime.do'/>" method="post">
                                    <input type="hidden" id="main" name="main" value="<c:out value='${leadtimeVO.main}'/>">
                                    <input type="hidden" id="middle" name="middle" value="<c:out value='${leadtimeVO.middle}'/>">
                                    <input type="hidden" id="sub" name="sub" value="<c:out value='${leadtimeVO.sub}'/>">
                                    <input type="hidden" id="updatehcode" name="updatehcode" value="">
                                    <input type="hidden" id="updatecode" name="updatecode" value="">
                                    <input type="hidden" id="updateleadtime" name="updateleadtime" value="">
                                    <!-- <div class="condition">
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
                                            
                                            <input class="f_input w_500" name="searchKeyword" type="text"
                                                value="<c:out value='${leadtimeVO.searchKeyword}'/>" title="검색어 입력" maxlength="35" />
                                            <button class="btn" type="submit">
                                                <spring:message code="button.inquire" />
                                            </button>조회
                                        </span>
                                        < <a href="" class="btn btn_search_w">등록</a> >

                                        < <a href="<c:url value='/uss/olp/qri/EgovQustnrRespondInfoRegist.do'/>" class="item btn btn_blue_46 w_100">등록</a>등록 >
                                    </div> -->
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
                                                        <c:if test="${fn:length(middlelist) == 0}">
                                                        <tr>
                                                            <td colspan="1">데이터가 없습니다. 대분류를 선택해 주세요.</td>
                                                        </tr>
                                                        </c:if>
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
                                                            <th scope="col">부품명</th>
                                                            <th scope="col">소요시간</th>
                                                            <th scope="col"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${leadtimeVO.main ne '' and leadtimeVO.main ne null and leadtimeVO.middle ne '' and leadtimeVO.middle ne null}">
                                                            <tr>
                                                                <td></td>
                                                                <td>
                                                                    <label class="f_input" style="height: 30px;">
                                                                        <input name="insertname" class="w_200" type="text">
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <label for="" class="f_select" style="width:80%; padding-left:10px; height: 30px;">
                                                                        <select name="insertleadtime" id="insertleadtime">
                                                                            <option value="">선택</option>
                                                                            <c:forEach var="leadtime" items="${leadtimelist}" varStatus="status">
                                                                            <option value="<c:out value='${leadtime.CODE}'/>"><c:out value="${leadtime.NAME}"/></option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </label>
                                                                </td>
                                                                <td><a href="#LINK" class="btn btn_blue_30" style="width:50px;" onclick="InsertLeadTime()"><spring:message code="button.create" /></a></td>
                                                            </tr>

                                                        </c:if>
                                                    	
                                                        <c:if test="${fn:length(sublist) == 0}">
                                                        <tr>
                                                            <td colspan="4">데이터가 없습니다. 항목을 추가해 주시거나 다른 중분류를 선택해 주세요.</td>
                                                        </tr>
                                                        </c:if>
                                                        
                                                        <c:forEach var="result" items="${sublist}" varStatus="status">
                                                            <tr>
                                                            	<td><c:out value="${status.count}"/></td>
                                                                <td><c:out value="${result.NAME}"/></td>
                                                                <td>
                                                                <label for="" class="f_select" style="width:80%; padding-left:10px; height:30px;">
                                                                    <select name="leadtime<c:out value='${result.IDX}'/>" id="leadtime<c:out value='${result.IDX}'/>">
                                                                        <option value="">선택</option>
                                                                        <c:forEach var="leadtime" items="${leadtimelist}" varStatus="status">
                                                                        <option value="<c:out value='${leadtime.CODE}'/>" <c:if test="${result.LEAD_TIME eq leadtime.CODE}">selected</c:if>><c:out value="${leadtime.NAME}"/></option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </label>
                                                                </td>
                                                                <td><a href="#LINK" class="btn btn_blue_30" style="width:50px;" onclick="UpdateLeadTime('<c:out value='${result.H_CODE}'/>','<c:out value='${result.CODE}'/>','<c:out value='${result.IDX}'/>'); return false;"><spring:message code="button.update" /></a></td>
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