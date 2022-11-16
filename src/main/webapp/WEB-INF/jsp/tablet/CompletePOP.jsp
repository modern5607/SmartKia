<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ID중복확인</title>
<base target="_self">
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

<script type="text/javascript"
	src="<c:url value='/js/showModalDialogCallee.js'/>"></script>
<script type="text/javaScript" language="javascript">
	

	/* ********************************************************
	 * 취소처리
	 ******************************************************** */
	function fn_egov_cancel_popup() {

		parent.fn_egov_modal_remove();
	}
	
	function RepairComplete(){

        if($("#newkilro").val() == "")
        {
            alert("주행거리를 입력해주세요.");
            $("#newkilro").focus();
            return;
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

        // console.log($("#chkrepairlist").val());
        // console.log($("#repairlist").val());
        // console.log($("#notelist").val());
        



		 document.SmartTabletVo.action = "<c:url value='/tablet/RepairComplete.do'/>";
		 //document.SmartTabletVo.submit();
		 
		 $.ajax({
	            type: "POST",
	            url: "RepairComplete.do",
	            data: $("#SmartTabletVo").serialize(),
	            success: function (result) {
	                if(result==1)
	                {
	                    alert("정비가 완료되었습니다.");
						parent.reload();
						fn_egov_cancel_popup();
						 
	                    
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
    function DeleteRepair(repairseq='')
    {
        if(repairseq != '')
        {
            deleteArr.push(repairseq);
            $("#deletelist").val(deleteArr);
        }
        // $("tr#repair_"+i).remove();

    }
    
    
	$(document).ready(function () {
		$('input[name=newkilro]').change(function(){
			var prevkilro =$('input[name=kilro]').val();
			var newkilro = $(this).val();
			if (prevkilro>newkilro) {
				alert("총주행거리는 주행거리보다 작을수 없습니다.");
				$(this).val(prevkilro);
				$(this).focus();
			}
		});
	});
</script>
</head>
<body>

	<!-- 아이디중복확인 팝업 -->
	<div class="popup POP_DUPID_CONF"
		style="background-color: white; text-align: center;">
		<form name="SmartTabletVo" id="SmartTabletVo" action="<c:url value='/tablet/CompletePOP.do'/>" method="post" >
            <input type="hidden" name="seq" id="seq" value="<c:out value='${carlist[0].TAKESEQ}'/>">
            <input type="hidden" name="repairlist" id="repairlist" value="">
            <input type="hidden" name="chkrepairlist" id="chkrepairlist" value="">
            <input type="hidden" name="repairseqlist" id="repairseqlist" value="">
            <input type="hidden" name="deletelist" id="deletelist">
			<div class="pop_inner" style="width: 100%;">
				<div class="pop_header">
					<h1>차량 정비 완료 처리</h1>
					<button type="button" class="close"
						onclick="fn_egov_cancel_popup(); return false;">닫기</button>
				</div>
				<div class="pop_container">
					<table class="board_list4"
						style="border-radius: 10px; border: 1px solid #dde2e5; padding: 15px; margin-bottom: 12px;">
						<colgroup>
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
							<col style="width: 100px;">
						</colgroup>
						<thead>
							<th>차량번호</th>
							<th>차종</th>
							<th>고객명</th>
							<th>연락처</th>
							<th>총주행거리</th>
						</thead>
						<tbody>
							<c:if test="${fn:length(carlist) == 0}">
								<tr>
									<td colspan="5"><spring:message code="common.nodata.msg" /></td>
								</tr>
							</c:if>
							<c:forEach var="list" items="${carlist}" varStatus="status">
								<tr>
									<td><c:out value="${list.AUTONUMBER}" /></td>
									<td><c:out value="${list.CUSTOMER_AUTOKIND}" /></td>
									<td><c:out value="${list.CUSTOMER_NAME}" /></td>
									<td><c:out value="${list.CUSTOMER_TEL}" /></td>
									<td><c:out value="${list.KILRO_TOTAL}" />km
										<input type="hidden" name="kilro" value="<c:out value='${list.KILRO_TOTAL}'/>" />
                                        <input type="hidden" name="customerid" value="<c:out value='${list.CUSTOMER_ID}'/>" />	
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="cont left text_left">
                    <strong style="margin-left:0px;">정비내용 선택</strong>
                    <div class="scrollBox01" style="margin-left:0px;">
                        <ul id="rcrListUL">
                            <c:forEach var="i" items="${leadtimelist.infolist}" varStatus="istatus">
                            <li class="box_tit">
                                <a href="#">${i.NAME}</a>
                                <ul>
                                <c:forEach var="j" items="${i.LIST}" varStatus="jstatus">
                                    <li>
                                        <input id="mtn_cont${istatus.count}_${jstatus.count}" type="checkbox" name="mtn_cont" value="<c:out value='${j.CODE}'/>" data-time="<c:out value='${j.LEAD_NAME}'/>" data-idx="${istatus.index}${jstatus.index}" 
                                        <c:forEach var="k" items="${RepairList}" varStatus="kstatus">${(k.REPAIRCODE eq j.CODE)?"checked":""}</c:forEach>
                                        style="width: 0px;height: 0px;">
                                        <label for="mtn_cont${istatus.count}_${jstatus.count}">${j.NAME}</label>
                                    </li>
                                </c:forEach>
                                </ul>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="cont left text_left" style="width: 520px;">
                    <strong style="margin-left:0px;">정비내용 선택사항</strong>
                    <div class="scrollBox03 board_view5"style="overflow:scroll; margin-left:0px; margin-right: 0px;">
                        <table id="repair">
                            <colgroup>
                                <col style="width:220px;">
                                <col style="width:auto;">
                                <col style="width:auto;">
                            </colgroup>
                            <tbody>
                            <c:forEach var="i" items="${RepairList}" varStatus="istatus">
                                <tr>
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
                                    <input type='hidden' name="repair" value="<c:out value='${i.REPAIRCODE}'/>">
                                    <input type='hidden' name="repairseq" value="<c:out value='${i.REPAIR_SEQ}'/>">
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="board_view2" style="border-top: none;">
                    <table>
                        <colgroup>
                            <col style="width:130px;">
                            <col style="width:auto;">
                            <col style="width:auto;">
                            <col style="width:auto;">
                        </colgroup>
                        <tr>
                            <td class="lb">주행 거리</td>
                            <td><input type="number" class="f_txtsmall w_200" name="newkilro" id="newkilro" placeholder="총주행거리(Km)"></td>
                            <td class="lb">비고</td>
							<td><input type="text"  class="f_txtsmall w_200" name="remark" id="remark" placeholder="수리비고사항"></td>
                        </tr>
                    </table>
                </div>
                <div class="right_col"> 
                    <a href="#" class="btn btn_blue_46 w_100" onclick="RepairComplete()" style="margin-top: 10px;">정비완료</a>
				</div>
				</div>
		</form>
	</div>
</body>
</html>
<script>
    $("li.box_tit a").click(function(){
    // console.log($(this));
    if($(this).parent().hasClass("active"))
        $(this).parent().removeClass("active");
    else
        $(this).parent().addClass("active");
});

$(".box_tit ul li label").click(function(){
    var $this = $(this);
    setTimeout(function(){
        var checkbox =$this.parent().find("input");
        // console.log(checkbox);
        var checkbox_val = checkbox.val();
        var checkbox_idx = checkbox.data("idx");
        var repairtext = $this.text();
        var textarea=''
        var totalleadtime=0;
        var textlist = new Array();
        var vallist = new Array();
        var notelist = new Array();
        var leadtimelist = new Array();
        var repairhtml = $("#repair").children("tbody");
        

        if(checkbox.is(":checked")==false)
        {
            var repairvallist = $("input[name=repair]");
            repairvallist.each(function(){
                console.log("checkbox_val:"+checkbox.val()+" / "+ $(this).val());
                var repairseq = $(this).parent().find("input[name=repairseq]");
                if($(this).val() == checkbox.val())
                {
                    // console.log("SEQ :"+$(this).parent().find("input[name=repairseq]").val());
                    $(this).parent().remove();
                    if(repairseq.val()!="")
                            DeleteRepair(repairseq.val());
                }
                
            });
        }
        else
        {
            var html='';
            // var childCount = repair.children().length;
            html+="<tr id='repair_"+(checkbox_idx)+"'>";
            html+="<td>"+repairtext+"</td>";
            html+="<td>";
            html+="<label class='f_selectsmall'><select id='chk_repair_"+checkbox_idx+"' name='chk_repair' >";
            html+="<c:forEach var='i' items='${autome}' varStatus='status'><option value='<c:out value='${i.CODE}'/>'><c:out value='${i.NAME}'/></option></c:forEach>";
            html+="</select></label>";
            html+="</td>";
            // html+="<td>"+$(this).data("time")+"</td>";
            // html+="<td><input type='text' class='f_txtsmall' name='note' id='note' placeholder='비고' value=''/></td>";
            html+="<input type='hidden' name='repair' id='repair' value='"+checkbox_val+"'/>";
            html+="</tr>";
            repairhtml.append(html);
        }
    },200)

});
</script>