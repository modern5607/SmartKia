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
    <title>접수등록</title>
    <!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

    <script type="text/javascript">
    function fnIdCheck(){
        var url = "<c:url value='/rcpt/searchCarPopupView.do'/>?";
        
        // var varParam = new Object();
        // var checkId = document.mberManageVO.mberId.value;
        // var varParam = "checkId="+checkId;
        
        var $dialog = $('<div id="modalPan"></div>')
        .html('<iframe style="border: 0px;" src="' + "<c:url value='/rcpt/searchCarPopupView.do'/>?" +'" width="100%" height="100%"></iframe>')
        .dialog({
            autoOpen: false,
            modal: true,
            width: 900,
            height: 700
        });
        $(".ui-dialog-titlebar").hide();
        $dialog.dialog('open');
    }

    function returnValue(id,carnum,name,kind,tel){
        console.log("id :" + id);
        console.log("carnum :" + carnum);
        console.log("name :" + name);
        console.log("kind :" + kind);
        console.log("tel :" + tel);
        
        document.rcptform.id.value = id;
        document.rcptform.name.value = name;
        document.rcptform.carnum.value = carnum;
        document.rcptform.tel.value = tel;
    }

    function InsertWebRcpt(){
        
        if($("input[name=chk_repair]").is(":checked")==false)
        {
            alert("수리종류를 선택해 주세요");
            return;
        }
        if($("input[name=name]").val()=="")
        {
            alert("조회를 통해 차량및 고객을 선택해 주세요");
            return;
        }
        if($("input[name=carnum]").val()=="")
        {
            alert("조회를 통해 차량및 고객을 선택해 주세요");
            return;
        }
        if($("select[name=leadtimemain]").val()=="")
        {
            alert("수리사항을 선택해 주세요");
            return;
        }
        if($("select[name=leadtimemiddle]").val()=="")
        {
            alert("수리사항을 선택해 주세요");
            return;
        }
        if($("select[name=leadtimesub]").val()=="")
        {
            alert("수리사항을 선택해 주세요");
            return;
        }
        

        if($("#urgent").is(":checked"))
            $("#urgent").val("Y");
        else
        {
            $("#urgent").val("N");
            $("#urgent").prop("checked",true);            
        }

        document.rcptform.action = "<c:url value='InsertWebRcpt.do'/>";
        document.rcptform.submit();
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
                                        <li><a class="home" href="">Home</a></li>
                                        <li><a href="">기준정보</a></li>
                                        <li>공통코드관리</li>
                                    </ul>
                                </div>
                                <!--// Location -->
                                <div class="condition" style="height: 64px;padding: 10px; margin-bottom:5px;">
                                    <span class="item">
                                        <a href="#" class="btn btn_blue_46 w_100" onclick="fnIdCheck()" style="float:left;"><spring:message code="button.inquire"/></a>
                                    </span>
                                </div>
                                <form name="rcptform" id="rcptform" action="" method="post">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="taskstat" value="<c:out value='CB-receipt'/>">
                                    <input type="hidden" name="servicesys" value="<c:out value='${servicesys[0].CODE}'/>">
                                    <div class="board_view2">
                                        <table>
                                            <colgroup>
                                                <col style="width: 150px;">
                                                <col style="width: 600px;">
                                                <col style="width: 150px;">
                                                <col style="width: 600px;">
                                            </colgroup>
                                            <tr>
                                                <td class="lb">
                                                    <label for="chk_repair">수리종류</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td>
                                                    <c:forEach var="i" items="${autome}" varStatus="status">
                                                        <input type="radio" name="chk_repair" class="f_rdo" value="<c:out value='${i.CODE}'/>">${i.NAME}
                                                    </c:forEach>
                                                    
                                                    
                                                </td>
                                                <td class="lb">
                                                    <label for="name">고객명</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td>
                                                    <input name="name" id="name" class="f_txtsmall" readonly style="width: 70%;"  />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lb">
                                                    <label for="carnum">차량번호</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td>
                                                    <input name="carnum" id="carnum" class="f_txtsmall" readonly style="width: 70%;" />
                                                </td>
                                                <td class="lb">
                                                    <label for="tel">고객연락처</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td>
                                                    <input name="tel" id="tel" class="f_txtsmall" readonly style="width: 70%;" />
                                                </td>
                                            </tr>
                                             <tr>
                                                <td class="lb">
                                                    <label for="bbsNm">수리사항</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td colspan="3">
                                                    <label class="f_selectsmall">
                                                        <select name="leadtimemain" id="leadtimemain">
                                                            <option value="">선택</option>
                                                            <c:forEach var="i" items="${leadtime}" varStatus="status">
                                                                <option value="<c:out value='${i.CODE}'/>"><c:out value="${i.NAME}"/></option>
                                                            </c:forEach>
                                                        </select>
                                                    </label>
                                                    
                                                    <label class="f_selectsmall">
                                                        <select name="leadtimemiddle" id="leadtimemiddle">
                                                        </select>
                                                    </label>
                                                    
                                                    <label class="f_selectsmall">
                                                        <select name="leadtimesub" id="leadtimesub">
                                                        </select>

                                                    </label>
                                                    
                                                </td>
                                            </tr>
                                             <tr>
                                                <td class="lb">
                                                    <label for="bbsNm">예상 완료 시간</label>
                                                </td>
                                                <td colspan="3">
                                                	<p>
                                                        <label>
                                                            소요시간(분단위) + 추가 소요시간(분단위)
                                                        </label> 
                                                        <input class="f_txtsmall w_100" type="number" name="timerequired" id="timerequired" readonly/> + <input class="f_txtsmall w_100" type="number" value="0" name="addtime" id="addtime"/> = <input class="f_txtsmall w_100" name="totaltime" id="totaltime" readonly/>
                                                	</p>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td class="lb">
                                                    <label>작업반</label>
                                                </td>
                                                <td colspan="2">
                                                    <p>
                                                        <label class="f_selectsmall" style="vertical-align:middle;">
                                                            <select name="position" id="position"> 
                                                                <option value="">미정</option>
                                                                <c:forEach var="i" items="${autorooms}" varStatus="status">
                                                                <option value="<c:out value='${i.CODE}'/>">${i.NAME}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </label>
                                                        <label class="v_middle">긴급여부 <input type="checkbox" name="urgent" id="urgent" value=""></label>
                                                    </p>
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn_blue_46 w_100 btnmargin" onclick="InsertWebRcpt()" style="float: right;"><spring:message code="button.create"/></a>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- 검색조건 -->
                                    <div class="condition" style="text-align: left; padding:10px; margin-top:5px;">										
                                        <span class="item f_search" style="width:100%;">
                                           <span class="left" style="margin-top: 20px;">
                                                <label >접수현황</label>
                                            </span>
                                            <span class="right">

                                                <label class="right">차량번호
                                                    <input class="f_input w_200" type="text"/></label>
                                            </span> 
                                            
                                            <button class="btn" type="submit">
                                                <spring:message code="button.inquire" />
                                            </button>조회
                                        </span>
                                        <!-- <a href="" class="btn btn_search_w">등록</a> -->

                                        <!-- <a href="<c:url value='/uss/olp/qri/EgovQustnrRespondInfoRegist.do'/>" class="item btn btn_blue_46 w_100">등록</a>등록 -->
                                    </div>
                                    <!--// 검색조건 -->
                                    
                                    <div class="board_list4" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;">
                                        <table>
                                            <colgroup>
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <thead style="padding : 3px 0;">
                                                <tr>
                                                    <th scope="col">접수일자</th>
                                                    <th scope="col">차량번호</th>
                                                    <th scope="col">차량종류</th>
                                                    <th scope="col">수리사항</th>
                                                    <th scope="col">고객명</th>
                                                    <th scope="col">연락처</th>
                                                    <th scope="col">작업반</th>
                                                    <th scope="col">예상완료시간</th>
                                                    <th scope="col">작업상태</th>
                                                    <th scope="col">수리종류</th>
                                                    <th scope="col">비고</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${fn:length(rcptlist) == 0}">
                                                <tr>
                                                    <td colspan="11"><spring:message code="common.nodata.msg" /></td>
                                                </tr>
                                                </c:if>
                                                <c:forEach var="result" items="${rcptlist}" varStatus="status">
                                                <tr>
                                                    <td><c:out value="${result.RECEIPTDATE}"/></td>
                                                    <td><c:out value="${result.AUTONUMBER}"/></td>
                                                    <td><c:out value=""/></td>
                                                    <td><c:out value="${result.REPAIR_NAME}"/></td>
                                                    <td><c:out value="${result.CUSTOMER_ID}"/></td>
                                                    <td><c:out value=""/></td>
                                                    <td><c:out value="${result.POSITION}"/></td>
                                                    <td><c:out value="${result.ESTIME}"/></td>
                                                    <td><c:out value="${result.TASKSTAT}"/></td>
                                                    <td><c:out value="${result.REPAIRMETHOD}"/></td>
                                                    <td><a href="#LINK" class="btn btn_blue_30 btnmargin" onclick="UpdateCommonGroupCode('<c:out value='${result.GROUP_CODE}'/>'); return false;" style="width:50px;"><spring:message code="button.update" /></a></td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                </form>
                                <!-- 페이징 -->
                                <!-- div class="board_list_bot">
                                    <div class="paging" id="paging_div">
                                        <ul>
                                            <ui:pagination paginationInfo = "${paginationInfo}" type="renew" jsFunction="linkPage" />
                                        </ul>
                                    </div>
                                </div-->
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

<script>
$("#leadtimemain").change(function(){
    var selectedvar = $(this).val();
    //console.log(selectedvar);
    $.ajax({
        type: "post",
        url: "/rcpt/SelectLeadtime.do",
        //contentType:"application/json;charset=UTF-8",
        //dataType:"json",
        data: {
        	selectedvar:selectedvar
        },
        success: function (resp) {
        	var html="<option value=''>선택</option>";
        	$.each(resp.list,function(index,item){
        		console.log(item);
        		html+="<option value='"+item.CODE+"'>"+item.NAME+"</option>";
        	});
        	$("#leadtimemiddle").html(html);
        }
    });
});

$("#leadtimemiddle").change(function(){
    var selectedvar = $(this).val();
    //console.log(selectedvar);
    $.ajax({
        type: "post",
        url: "/rcpt/SelectLeadtime.do",
        //contentType:"application/json;charset=UTF-8",
        //dataType:"json",
        data: {
        	selectedvar:selectedvar
        },
        success: function (resp) {
        	var html="<option value=''>선택</option>";
        	$.each(resp.list,function(index,item){
        		console.log(item);
        		html+="<option value='"+item.CODE+"' data-time='"+(item.LEADTIME_NM).slice(0,2)+"' data-timenm='"+item.LEADTIME_NM+"'>"+item.NAME+" / "+item.LEADTIME_NM+"</option>";
        	});
        	$("#leadtimesub").html(html);
        }
    });
});

$("#leadtimesub").change(function(){
    var time = $("#leadtimesub option:selected").data("time");
    console.log(time);
    $("#timerequired").val(time);
    updatetotaltime();    
});
function updatetotaltime(){
    var total = Number($("#timerequired").val()) + Number($("#addtime").val());
	console.log(total);
	$("#totaltime").val(total);
}

$("#timerequired").on("change keyup paste", function() {
    updatetotaltime();
});
	
$("#addtime").on("change keyup paste", function() {
	updatetotaltime();
});


</script>