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
    <title>목포서비스 KIA AUTO Q</title>
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
    
    function InsertGroupLeadTime()
    {
        document.SmartLeadTimeVO.insertgroupcode.value = document.SmartLeadTimeVO.groupcode.value;
        document.SmartLeadTimeVO.insertgroupname.value = document.SmartLeadTimeVO.groupname.value;
        document.SmartLeadTimeVO.insertgroupord.value = document.SmartLeadTimeVO.groupord.value;

        document.SmartLeadTimeVO.action = "<c:url value='/mdm/InsertGroupLeadTime.do'/>";
        document.SmartLeadTimeVO.submit();
    }

    function UpdateGroupLeadtime(hcode,idx)
    {
        document.SmartLeadTimeVO.updatehcode.value = hcode;
        document.SmartLeadTimeVO.updategroupord.value = $("#updategroupord"+idx).val();
        document.SmartLeadTimeVO.action = "<c:url value='/mdm/UpdateGroupLeadTime.do'/>";
        document.SmartLeadTimeVO.submit();
    }

    function UpdateLeadTime(hcode,code,idx)
    {
        document.SmartLeadTimeVO.updatehcode.value= hcode;
        document.SmartLeadTimeVO.updatecode.value= code;

        document.SmartLeadTimeVO.updateleadtime.value = $("#updtleadtime"+idx).val();
        document.SmartLeadTimeVO.updateuseyn.value = $("#useyn"+idx+" option:selected").val();
        document.SmartLeadTimeVO.updateord.value = $("#updateord"+idx).val();
        
        document.SmartLeadTimeVO.action = "<c:url value='/mdm/UpdateLeadTime.do'/>";
        document.SmartLeadTimeVO.submit();
    }

    function InsertLeadTime()
    {
        document.SmartLeadTimeVO.insertcode.value = document.SmartLeadTimeVO.code.value; 
        document.SmartLeadTimeVO.insertname.value = document.SmartLeadTimeVO.name.value; 
        document.SmartLeadTimeVO.insertord.value = document.SmartLeadTimeVO.ord.value; 
        document.SmartLeadTimeVO.insertleadtime.value = document.SmartLeadTimeVO.leadtime.value; 
        document.SmartLeadTimeVO.main.value = document.SmartLeadTimeVO.main.value; 
        document.SmartLeadTimeVO.middle.value = document.SmartLeadTimeVO.middle.value; 
        if(document.SmartLeadTimeVO.insertname.value == "")
        {
            alert("부품명을 입력해 주세요");
            document.SmartLeadTimeVO.insertname.focus();
            return false;
        }
        


        // $.ajax({
        //     type: "post",
        //     url: "/SmartKia/mdm/InsertLeadTime.do",
        //     data: {
        //         insertcode : document.SmartLeadTimeVO.insertcode.value,
        //         insertname : document.SmartLeadTimeVO.insertname.value,
        //         insertord : document.SmartLeadTimeVO.insertord.value,
        //         insertleadtime : document.SmartLeadTimeVO.insertleadtime.value,
        //         main : document.SmartLeadTimeVO.main.value,
        //         middle : document.SmartLeadTimeVO.middle.value
        //     },
        //     success: function (msg) {
		// 		if(msg==1)
		// 			location.reload();
		// 		else
		// 		{
		// 			alert("등록에 실패하였습니다. 다시 시도해 주세요.");
		// 			location.reload();
		// 		}
        //     }
        // });
        document.SmartLeadTimeVO.action = "<c:url value='/mdm/InsertLeadTime.do'/>";
        document.SmartLeadTimeVO.submit();
    }

    function init()
    {
	if ("<c:out value='${msg}'/>" != "") {
		alert("<c:out value='${msg}'/>");
	}
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
                                    <input type="hidden" id="updategroupcode" name="updategroupcode" value="">
                                    <input type="hidden" id="updategroupord" name="updategroupord" value="">
                                    <input type="hidden" id="insertgroupcode" name="insertgroupcode" value="">
                                    <input type="hidden" id="insertgroupname" name="insertgroupname" value="">
                                    <input type="hidden" id="insertgroupord" name="insertgroupord" value="">
                                    <input type="hidden" id="insertcode" name="insertcode" value="">
                                    <input type="hidden" id="insertname" name="insertname" value="">
                                    <input type="hidden" id="insertord" name="insertord" value="">
                                    <input type="hidden" id="insertleadtime" name="insertleadtime" value="">
                                    <input type="hidden" id="updatehcode" name="updatehcode" value="">
                                    <input type="hidden" id="updatecode" name="updatecode" value="">
                                    <input type="hidden" id="updateleadtime" name="updateleadtime" value="">
                                    <input type="hidden" id="updateuseyn" name="updateuseyn" value="">
                                    <input type="hidden" id="updateord" name="updateord" value="">
                                    
                                    <div>
                                        <!-- 중분류 리스트 -->
                                        <div class="w50 left" style="margin-left:15px;">
                                            <div class="board_list3" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;">
                                                <table>
                                                    <colgroup>
                                                        <col style="width: 50px;">
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">No</th>
                                                            <th scope="col">대분류코드</th>
                                                            <th scope="col">대분류명</th>
                                                            <th scope="col">출력순서</th>
                                                            <th scope="col"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${fn:length(mainlist) == 0}">
                                                        <tr>
                                                            <td colspan="1">데이터가 없습니다. 대분류를 선택해 주세요.</td>
                                                        </tr>
                                                        </c:if>
                                                        <!-- 등록 -->
                                                        <tr>
                                                            <td></td>
                                                            <td>
                                                                <label class="f_input" style="height: 30px;">
                                                                    <input class="w_100" type="text" name="groupcode" id="groupcode">    
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <label class="f_input" style="height: 30px;">
                                                                    <input class="w_200" type="text" name="groupname" id="groupname">    
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <label class="f_input" style="height: 30px;">
                                                                    <input class="w_100" type="number" name="groupord" id="groupord">    
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <a href="#" class="btn btn_blue_30" style="width:50px;" onclick="InsertGroupLeadTime(); return false;">등록</a>
                                                            </td>
                                                        </tr>
                                                        <!-- 데이터 -->
                                                        <c:forEach var="result" items="${mainlist}" varStatus="status">
                                                            <tr>
                                                                <td>${status.count}</td>
                                                                <td>${result.CODE}</td>
                                                                <td><a href="#" class="lnk" onclick="ClickMainCode('${result.CODE}')"><c:out value="${result.NAME}"/></a></td>
                                                                <td>
                                                                    <label class="f_input" style="height: 30px;">
                                                                        <input class="w_100" type="text" name="updategroupord${status.index}" id="updategroupord${status.index}" value="<c:out value='${result.ORD}'/>">    
                                                                    </label>
                                                                </td>
                                                                <td><a href="#" class="btn btn_blue_30" style="width:50px;" onclick="UpdateGroupLeadtime('<c:out value='${result.CODE}'/>','<c:out value='${status.index}'/>'); return false;">수정</a></td>
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
                                                            <th scope="col">부품코드</th>
                                                            <th scope="col">부품명</th>
                                                            <th scope="col">출력순서</th>
                                                            <th scope="col">사용유무</th>
                                                            <th scope="col">소요시간(분)</th>
                                                            <th scope="col"></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:if test="${leadtimeVO.main ne '' and leadtimeVO.main ne null}">
                                                            <tr>
                                                                <td></td>
                                                                <td>
                                                                    <label class="f_input" style="height: 30px;">
                                                                        <input name="code" id="code" class="w_100" type="text">
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <label class="f_input" style="height: 30px;">
                                                                        <input name="name" id="name" class="w_200" type="text">
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <label class="f_input" style="height: 30px;">
                                                                        <input name="ord" id="ord" class="w_100" type="number" style="padding: 0 10px; text-align: right;">
                                                                    </label>
                                                                </td>
                                                                <td></td>
                                                                <td>
                                                                    <label class="f_input" style="height: 30px;">
                                                                        <input name="leadtime" id="leadtime" class="w_100" type="number" style="padding: 0 10px; text-align: right;">
                                                                    </label>
                                                                    <!-- <label for="" class="f_select" style="width:80%; padding-left:10px; height: 30px;">
                                                                        <select name="insertleadtime" id="insertleadtime">
                                                                            <option value="">선택</option>
                                                                            <c:forEach var="leadtime" items="${leadtimelist}" varStatus="status">
                                                                            <option value="<c:out value='${leadtime.CODE}'/>"><c:out value="${leadtime.NAME}"/></option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </label> -->
                                                                </td>
                                                                <td><a href="#LINK" class="btn btn_blue_30" style="width:50px;" onclick="InsertLeadTime()"><spring:message code="button.create" /></a></td>
                                                            </tr>

                                                        </c:if>
                                                    	
                                                        <c:if test="${fn:length(middlelist) == 0}">
                                                        <tr>
                                                            <td colspan="5">데이터가 없습니다. 항목을 추가해 주시거나 다른 중분류를 선택해 주세요.</td>
                                                        </tr>
                                                        </c:if>
                                                        
                                                        <c:forEach var="result" items="${middlelist}" varStatus="status">
                                                            <tr>
                                                            	<td><c:out value="${status.count}"/></td>
                                                                <td><c:out value="${result.CODE}"/></td>
                                                                <td><c:out value="${result.NAME}"/></td>
                                                                <td>
                                                                    <label class="f_input" style="height: 30px;">
                                                                        <input name="updateord${result.IDX}" id="updateord${result.IDX}" class="w_100" type="text" value="<c:out value='${result.ORD}'/>" style="padding: 0 10px; text-align: right;">
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <label class="f_select" style="width:80%; height:30px;">
                                                                        <select name="useyn${result.IDX}" id="useyn${result.IDX}">
                                                                            <c:forEach var="i" items="${useyn}" varStatus="status">
                                                                                <option value="<c:out value='${i.CODE}'/>" ${i.CODE == result.USE_YN ? 'selected':''} >${i.NAME}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <label class="f_input" style="height: 30px;">
                                                                        <input name="updtleadtime${result.IDX}" id="updtleadtime${result.IDX}" class="w_100" type="text" value="<c:out value='${result.LEAD_TIME}'/>" style="padding: 0 10px; text-align: right;">
                                                                    </label>
                                                                    <!-- <label for="" class="f_select" style="width:80%; padding-left:10px; height:30px;">
                                                                        <select name="leadtime<c:out value='${result.IDX}'/>" id="leadtime<c:out value='${result.IDX}'/>">
                                                                            <option value="">선택</option>
                                                                            <c:forEach var="leadtime" items="${leadtimelist}" varStatus="status">
                                                                            <option value="<c:out value='${leadtime.CODE}'/>" <c:if test="${result.LEAD_TIME eq leadtime.CODE}">selected</c:if>><c:out value="${leadtime.NAME}"/></option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </label> -->
                                                                </td>
                                                                <td>
                                                                    <a href="#LINK" class="btn btn_blue_30" style="width:50px;" onclick="UpdateLeadTime('<c:out value='${result.H_CODE}'/>','<c:out value='${result.CODE}'/>','<c:out value='${result.IDX}'/>'); return false;"><spring:message code="button.update" /></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 소분류 리스트 끝-->
                                    </div>
                                </form>
                            </div>
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