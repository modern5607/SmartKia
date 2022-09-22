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
        document.rcptform.carkind.value = kind;
        document.rcptform.carnum.value = carnum;
        document.rcptform.tel.value = tel;
    }

    function AddRepair()
    {
    	console.log($("#repair").children("tbody").length);
        var main = $("#leadtimemain option:selected");
        var middle = $("#leadtimemiddle option:selected");
        var sub = $("#leadtimesub option:selected");
        
        if(main.val()==""||middle.val()==""||sub.val()=="")
        {
            alert("수리사항을 선택해 주세요");
            return;
        }
        
        var splits = sub.text().split('/');
        var code = sub.val();
        var code_nm = splits[0];
        var time_nm = splits[1];
        var time = sub.data("time");
        var repair = $("#repair").children("tbody");
        console.log(repair);
        var childCount = repair.children().length;
        var html="";
        html+="<tr id='repair_"+(childCount+1)+"'>";
        // html+="<td>"+(childCount+1)+"</td>";
        html+="<td>"+code_nm+"</td>";
        html+="<td>";
        html+="<label class='f_selectsmall'><select id='chk_repair_"+(childCount+1)+"' name='chk_repair' >";
        html+="<c:forEach var='i' items='${autome}' varStatus='status'><option value='<c:out value='${i.CODE}'/>'><c:out value='${i.NAME}'/></option></c:forEach>";
        html+="</select></label>";
        html+="</td>";
        html+="<td>"+time_nm+"</td>";
        // html+="<td><input type='text' name='note' id='note' placeholder='비고' value=''/></td>";
        html+="<td><input type='hidden' name='repair' data-time='"+time+"' value='"+code+"'/><a href='#' class='btn btn_blue_30 w_50' onclick='DeleteRepair("+(childCount+1)+")'><spring:message code='button.delete'/></a></td>";
        html+="</tr>";
        
        repair.append(html);

        CalculateTime();

    }

    function DeleteRepair(i)
    {
        var deleteSelector = $();
        $("tr#repair_"+i).remove();

        CalculateTime();
    }

    function CalculateTime()
    {
        var repair = $("#repair").children("tbody").children();
        var totalTime=0;
        for(var i=0;i<repair.length;i++)
        {
        	totalTime += Number($("input[name=repair]").eq(i).data("time"));
        }
        // console.log(totalTime);
        $("#timerequired").val(totalTime);
        updatetotaltime();
    }

    function InsertWebRcpt(){
        
        // if($("input[name=chk_repair]").is(":checked")==false)
        // {
        //     alert("수리종류를 선택해 주세요");
        //     return;
        // }

        
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
        

        if($("#urgent").is(":checked"))
            $("#urgent").val("Y");
        else
        {
            $("#urgent").val("N");
            $("#urgent").prop("checked",true);            
        }

        //수리항목 리스트화
        var array = new Array();
		$('input[name=repair]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#repairlist").val(array);
        if($("#repairlist").val()==null||$("#repairlist").val()=='')
        {
            alert("추가된 수리사항이 없습니다. 수리사항을 추가해 주세요.");
            return;
        }

        //수리 리드타임 리스트화
        var array = new Array();
		$('input[name=repair]').each(function(index) {
			array.push($(this).data("time"));
			
		});
		$("#repairleadtime").val(array);

        //수리종류 리스트화
        var array = new Array();
		$('select[name=chk_repair]').find("option:selected").each(function(index) {
			array.push($(this).val());
			
		});
		$("#chkrepairlist").val(array);
        if($("#chkrepairlist").val()==null||$("#chkrepairlist").val()=='')
        {
            alert("추가된 수리사항이 없습니다. 수리사항을 추가해 주세요.");
            return;
        }

        //수리항목 비고 리스트화
        // var array = new Array();
		// $('input[name=note]').each(function(index) {
		// 	array.push($(this).val());
			
		// });
		// $("#notelist").val(array);

        console.log($("#chkrepairlist").val());
        console.log($("#repairlist").val());
        // console.log($("#notelist").val());
        
        document.rcptform.action = "<c:url value='InsertWebRcpt.do'/>";
        document.rcptform.submit();
        
    }

    function RepairDetail(seq)
    {
        console.log(seq);
        var url = "<c:url value='/rcpt/RepaireDetailPopup.do'/>?";
        
        // var varParam = new Object();
        // var checkId = document.mberManageVO.mberId.value;
        // var varParam = "checkId="+checkId;
        
        var $dialog = $('<div id="modalPan"></div>')
        .html('<iframe style="border: 0px;" src="' + "<c:url value='/rcpt/RepaireDetailPopup.do?seq="+seq+"'/>" +'" width="100%" height="100%"></iframe>')
        .dialog({
            autoOpen: false,
            modal: true,
            width: 900,
            height: 700
        });
        $(".ui-dialog-titlebar").hide();
        $dialog.dialog('open');
    }

    function DeleteRcpt(takeseq)
    {
        console.log(takeseq);
        if(takeseq==''){
            alert("해당 접수정보가 조회되지 않습니다. 새로고침후 다시 시도해 주세요");
            return;
        }
        $("#deletetakeseq").val(takeseq);
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
                                <form name="rcptform" id="rcptform" action="<c:url value='/rcpt/SmartWebRcptView.do'/>" method="post">
                                    <input type="hidden" name="id" value="">
                                    <input type="hidden" name="taskstat" value="<c:out value='CB-receipt'/>">
                                    <input type="hidden" name="servicesys" value="<c:out value='${servicesys[0].CODE}'/>">
                                    <input type="hidden" name="repairlist" id="repairlist" value="">
                                    <input type="hidden" name="repairleadtime" id="repairleadtime" value="">
                                    <input type="hidden" name="chkrepairlist" id="chkrepairlist" value="">
                                    <!-- <input type="hidden" name="notelist" id="notelist" value=""> -->
                                    <input type="hidden" name="deletetakeseq" id="deletetakeseq" value="">
                                    <div class="board_view2">
                                        <table>
                                            <colgroup>
                                                <col style="width:auto;">
                                                <col style="width:auto;">
                                                <col style="width:auto;">
                                                <col style="width:auto;">
                                                <col style="width:auto;">
                                                <col style="width:auto;">
                                                <col style="width:auto;">
                                                <col style="width:auto;">
                                            </colgroup>
                                            <tr>
                                                <td class="lb">
                                                    <label for="name">고객명</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td>
                                                    <input name="name" id="name" class="f_txtsmall" readonly />
                                                </td>
                                                <td class="lb">
                                                    <label for="carkind">차종</label>
                                                </td>
                                                <td>
                                                    <input name="carkind" id="carkind" class="f_txtsmall" readonly/>
                                                </td>
                                                <td class="lb">
                                                    <label for="carnum">차량번호</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td>
                                                    <input name="carnum" id="carnum" class="f_txtsmall" readonly/>
                                                </td>
                                                <td class="lb">
                                                    <label for="tel">고객연락처</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td>
                                                    <input name="tel" id="tel" class="f_txtsmall" readonly/>
                                                </td>
                                                <!-- <td class="lb">
                                                    <label for="chk_repair">수리종류</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td>
                                                    <c:forEach var="i" items="${autome}" varStatus="status">
                                                        <input type="radio" name="chk_repair" class="f_rdo" value="<c:out value='${i.CODE}'/>">${i.NAME}
                                                    </c:forEach>
                                                </td> -->
                                                
                                            </tr>
                                            <tr>
                                                <td class="lb">
                                                    <label for="bbsNm">수리사항</label>
                                                    <span class="req">필수</span>
                                                </td>
                                                <td colspan="7">
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
                                                    <label>
                                                        <a href="#" class="btn btn_blue_30 w_50" onclick="AddRepair()"><spring:message code="cop.sms.addRecptn"/></a>
                                                    </label>
                                                    <input name="repairnote" id="repairnote" class="f_txtsmall" placeholder="수리 비고"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lb">
                                                    <label for="bbsNm">수리사항 목록</label>
                                                </td>
                                                <td colspan="5">
                                                    <table id="repair">
                                                        <colgroup>
                                                            <col style="width: auto;">
                                                            <col style="width: 200px;">
                                                            <col style="width: 200px;">
                                                            <col style="width: 70px;">
                                                        </colgroup>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                             <tr>
                                                <td class="lb">
                                                    <label for="bbsNm">예상 완료 시간</label>
                                                </td>
                                                <td colspan="7">
                                                	<p>
                                                        <label>
                                                            소요시간(분단위) + 추가 소요시간(분단위)
                                                        </label> 
                                                        <input class="f_txtsmall w_100" type="number" name="timerequired" id="timerequired" readonly/> + <input class="f_txtsmall w_100" type="number" value="0" name="addtime" id="addtime"/> = <input class="f_txtsmall w_100" name="totaltime" id="totaltime" readonly/>
                                                        <input type="text" class="f_txtsmall" name="estime" id="estime" readonly>
                                                	</p>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td class="lb">
                                                    <label>작업반</label>
                                                </td>
                                                <td>
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
                                                <td class="lb">
                                                    <label>비고</label>
                                                </td>
                                                <td colspan="3">
                                                    <input name="note" id="note" class="f_txtsmall w_500" placeholder="접수 비고"/>
                                                </td>
                                                <td colspan="2">
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
                                                    <input class="f_input w_200" name="searchcarnum" id="searchcarnum" type="text" value="<c:out value='${smartrcptVO.searchcarnum}'/>"/>
                                                </label>
                                            </span> 
                                            
                                            <button class="btn" type="submit"><spring:message code="button.inquire"/><button>
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
                                                    <td><c:out value="${result.CUSTOMER_AUTOKIND}"/></td>
                                                    <td><a href="#" class="lnk" style="text-decoration: underline;" onclick="RepairDetail('<c:out value='${result.TAKESEQ}'/>'); return false;"><c:out value="${result.REPAIR_NAME}"/></a></td>
                                                    <td><c:out value="${result.CUSTOMER_NAME}"/></td>
                                                    <td><c:out value="${result.CUSTOMER_TEL}"/></td>
                                                    <td><c:out value="${result.POSITION}"/></td>
                                                    <td><c:out value="${result.ESTIME}"/></td>
                                                    <td><c:out value="${result.TASKSTAT_NM}"/></td>
                                                    <td><c:out value="${result.REPAIRMETHOD}"/></td>
                                                    <td>
                                                        <c:if test="${result.TASKSTAT== 'CB-receipt'}">
                                                        <a href="#LINK" class="btn btn_blue_30 w_80" onclick="DeleteRcpt('<c:out value='${result.TAKESEQ}'/>'); return false;">접수취소</a>
                                                        </c:if>
                                                    </td>
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

// $("#leadtimesub").change(function(){
//     var time = $("#leadtimesub option:selected").data("time");
//     console.log(time);
//     $("#timerequired").val(time);
//     updatetotaltime();    
// });

$("#timerequired").on("change keyup paste", function() {
    updatetotaltime();
});
	
$("#addtime").on("change keyup paste", function() {
	updatetotaltime();
});

function updatetotaltime(){
    var total = Number($("#timerequired").val()) + Number($("#addtime").val());
    var now = new Date();
    var estime = new Date(now.setMinutes(now.getMinutes() + total));
    var converttime = estime.getFullYear()+'-'+(estime.getMonth()+1)+"-"+estime.getDate()+" "+estime.getHours()+":"+estime.getMinutes()+":"+estime.getSeconds();
	console.log(converttime);
	$("#totaltime").val(total);
    $("#estime").val(converttime);
}




</script>