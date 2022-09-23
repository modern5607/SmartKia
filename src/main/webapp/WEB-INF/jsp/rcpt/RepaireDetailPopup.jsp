<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ID중복확인</title>
<base target="_self" >
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
	<script src="<c:url value='/'/>js/jquery.js"></script>
	<script src="<c:url value='/'/>js/jqueryui.js"></script>
	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

<script type="text/javascript" src="<c:url value='/js/showModalDialogCallee.js'/>" ></script>
<script type="text/javaScript" language="javascript">
$(document).ready(function () {
	console.log("asdf");
    $("#checkcarnum").focus();
});
function fnCheckId(){
    
    if(document.SmartRcptVO.checkcarnum.value==""){
        alert("차량번호를 입력해 주세요");
        document.SmartRcptVO.focus();
        return;
    }
    if(fnCheckNotKorean(document.SmartRcptVO.checkcarnum.value)){
        document.SmartRcptVO.submit();
    }else{
        alert("한글은 사용할 수 없습니다.");
        return;
    }
}

function fnReturnId(id,carnum,name,kind,tel){
    
    parent.returnValue(id,carnum,name,kind,tel);
    fn_egov_cancel_popup();
}


/* ********************************************************
 * 취소처리
 ******************************************************** */
function fn_egov_cancel_popup() {
	
	parent.fn_egov_modal_remove();
}

function fnCheckNotKorean(koreanStr){                  
    for(var i=0;i<koreanStr.length;i++){
        var koreanChar = koreanStr.charCodeAt(i);
        if( !( 0xAC00 <= koreanChar && koreanChar <= 0xD7A3 ) && !( 0x3131 <= koreanChar && koreanChar <= 0x318E ) ) { 
        }else{
            //hangul finding....
            return false;
        }
    }
    return true;
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
        html+="<td><input type='text' class='f_txtsmall' name='repair_note' id='repair_note'></td>";
        html+="<td><input type='radio' name='ant_"+(childCount+1)+"' id='ant' value='Y' checked class='f_rdo '>Y <input type='radio' name='ant_"+(childCount+1)+"' id='ant' value='N' class='f_rdo '>N</td>";
        html+="<td><input type='hidden' name='repair' data-time='"+time+"' value='"+code+"'/><input type='hidden' name='repairseq' value=''><a href='#' class='btn btn_blue_30 w_50' onclick='DeleteRepair("+(childCount+1)+")'><spring:message code='button.delete'/></a></td>";
        html+="</tr>";
        
        repair.append(html);

        // CalculateTime();

    }
    function DeleteRepair(i)
    {
        var deleteSelector = $();
        $("tr#repair_"+i).remove();

        // CalculateTime();
    }

    function SaveRepair(){
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

        //수리항목 repairseq 리스트화
        var array = new Array();
		$('input[name=repairseq]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#repairseqlist").val(array);
        //수리항목 비고 리스트화
        var array = new Array();
		$('input[name=repair_note]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#repair_notelist").val(array);

        // console.log($("#chkrepairlist").val());
        // console.log($("#repairlist").val());
        // console.log($("#notelist").val());
        
        //수리항목 비고 리스트화
        var array = new Array();
		$('input[id=ant]:checked').each(function(index) {
			array.push($(this).val());
			
		});
		$("#repairantlist").val(array);

        
        document.repairform.action = "<c:url value='UpdateRepair.do'/>";
        // document.repairform.submit();

        $.ajax({
            type: "POST",
            url: "UpdateRepair.do",
            data: $("#repairform").serialize(),
            success: function (result) {
                if(result==1)
                {
                    alert("수정되었습니다");
                    fn_egov_cancel_popup();
                    parent.reload();
                }
                else
                {
                    alert("다시 시도해 주세요");
                    fn_egov_cancel_popup();
                }
            },
            
        });
        
    }

    var deleteArr = new Array();
    function DeleteRepair(i,repairseq='')
    {
        if(repairseq != '')
        {
            deleteArr.push(repairseq);
            $("#deletelist").val(deleteArr);
        }
        $("tr#repair_"+i).remove();

    }

</script>
</head>
<body>

    <!-- 아이디중복확인 팝업 -->
    <div class="popup POP_DUPID_CONF" style="background-color: white; text-align: center;">
    
    	<form name="repairform" id="repairform" action ="<c:url value='/rcpt/checkcarinfo.do'/>">
        <input type="hidden" name="seq" id="seq" value="<c:out value='${rcptinfo[0].TAKESEQ}'/>">
        <input type="hidden" name="repairlist" id="repairlist" value="">
        <input type="hidden" name="repairleadtime" id="repairleadtime" value="">
        <input type="hidden" name="chkrepairlist" id="chkrepairlist" value="">
        <input type="hidden" name="repairseqlist" id="repairseqlist" value="">
        <input type="hidden" name="repair_notelist" id="repair_notelist" value="">
        <input type="hidden" name="repairantlist" id="repairantlist" value="">
        <input type="hidden" name="deletelist" id="deletelist">
        <div class="pop_inner" style="width:100%;">
            <div class="pop_header">
                <h1>수리항목 리스트</h1>
                <button type="button" class="close" onclick="fn_egov_cancel_popup(); return false;">닫기</button>
            </div>

            <div class="pop_container">
                <!-- <div class="box_3">
                    <label for="checkcarnum">차량번호</label>
                    <input id="checkcarnum" class="f_txt2 ml15" type="text" name="checkcarnum" value="<c:out value="${checkcarnum}"/>" maxlength="20" />
                    <input type="hidden" name="resultId" value="<c:out value="${checkcarNum}"/>" />
                    
                    <a href="#LINK" class="btn btn_blue_46 w_100" onclick="javascript:fnCheckId(); return false;"><spring:message code="button.inquire" /></a>
                </div> -->
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
                <table class="board_list4" id="repair" style="border-radius:10px; border: 1px solid #dde2e5; padding: 15px;">
                    <colgroup>
                        <col style="width: 150px;">
                        <col style="width: 150px;">
                        <col style="width: 200px;">
                        <col style="width: 200px;">
                        <col style="width: 90px;">
                    </colgroup>
                    <thead>
                        <th>수리사항</th>
                        <th>수리종류</th>
                        <th>수리시간</th>
                        <th>수리항목 비고</th>
                        <th>수리여부</th>
                        <th>비고</th>
                    </thead>
                    <tbody>
                        <c:if test="${fn:length(RepairList) == 0}">
                            <tr>
                                <td colspan="5"><spring:message code="common.nodata.msg" /></td>
                            </tr>
                        </c:if>
                        <c:forEach var="i" items="${RepairList}" varStatus="istatus">
                            <tr id="repair_${istatus.count}">
                                <td><c:out value="${i.REPAIRNAME}"/></td>
                                <td>
                                    <label class="f_selectsmall">
                                        <select name="chk_repair" id="chk_repair_${istatus.count}">
                                            <c:forEach var="j" items="${autome}" varStatus="jstatus">
                                                <option value="${j.CODE}" <c:if test="${j.CODE == i.REPAIRMETHOD}">selected</c:if>><c:out value="${j.NAME}"/></option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                </td>
                                <td><c:out value="${i.LEADTIME}"/></td>
                                <td><input type="text" class="f_txtsmall" name="repair_note" id="repair_note" value="<c:out value='${i.REPAIR_NOTE}'/>"></td>
                                <td><input type="radio" name="ant_${istatus.count}" id="ant" value="Y" <c:if test="${i.REPAIRANT=='Y'}">checked</c:if> class="f_rdo">Y <input type="radio" name="ant_${istatus.count}" id="ant" value="N" <c:if test="${i.REPAIRANT=='N'}">checked</c:if> class="f_rdo">N</td>
                                <td><input type='hidden' name="repair" value="<c:out value='${i.REPAIRCODE}'/>">
                                    <input type='hidden' name="repairseq" value="<c:out value='${i.REPAIR_SEQ}'/>">
                                    <a href='#' class='btn btn_blue_30 w_50' onclick="DeleteRepair(<c:out value='${istatus.count}'/>,'<c:out value='${i.REPAIR_SEQ}'/>')"><spring:message code='button.delete'/></a></td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
                <div class=" al_c pt20">
                    <div class="board_view2">
                        <table>
                            <colgroup>
                                <col style="width:130px;">
                                <col style="width:auto;">
                            </colgroup>
                            <tr>
                                <td class="lb">수리 비고</td>
                                <td><input type="text" class="f_txtsmall w_500" name="repairnote" id="repairnote" placeholder="수리 비고" value="<c:out value='${rcptinfo[0].REPAIRNOTE}'/>"></td>
                            </tr>
                        </table>
                    </div>

                    <a href="#" class="btn btn_blue_46 w_100" onclick="SaveRepair()" style="margin-top: 10px;">저장</a>
                </div>
            </div>
        </div>
        
        </form>
        
    </div>
    <!--// 아이디중복확인 팝업 -->
    
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
</script>