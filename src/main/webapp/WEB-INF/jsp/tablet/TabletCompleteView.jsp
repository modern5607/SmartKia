<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%    
response.setHeader("Cache-Control","no-store");    
response.setHeader("Pragma","no-cache");    
response.setDateHeader("Expires",0);    
if (request.getProtocol().equals("HTTP/1.1"))  
        response.setHeader("Cache-Control", "no-cache");  
%>
<c:set var="ImgUrl" value="/images_old/egovframework/com/uss/olp/qtm/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>모니터링</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
<!-- <link rel="stylesheet" href="<c:url value='/'/>css/layout.css"> -->
<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<link rel="stylesheet" href="<c:url value='/'/>css/tablet.css?after">
<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css?after">
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<script src="<c:url value='/'/>js/jqueryui.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<style>

</style>

<script type="text/javascript">
    function fn_egov_modal_create(){
	
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px;" src="' + "<c:url value='/EgovPageLink.do'/>?" + "link=main/sample_menu/Intro" +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 1400,
        height: 550
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

/**********************************************************
 * 모달 종료 버튼
 ******************************************************** */
function fn_egov_modal_remove() {
	$('#modalPan').remove();
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

    function UpdateAssign()
    {
        //소요시간 공백 검증
        if($("#estime").val() == "")
        {
            alert("소요시간을 입력해 주세요");
            $("#estime").focus();
            return;
        }
        //작업반 선택 검증
        if($("#autoroom option:selected").val()=="")
        {
            alert("작업반을 선택해 주세요");
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

        var array = new Array();
        $('input[name=chk_repair]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#chkrepairlist").val(array);

        //수리항목 repairseq 리스트화
        var array = new Array();
		$('input[name=repairseq]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#repairseqlist").val(array);

        document.Assignform.submit();
    }

    function clickRepair(cusId){

        console.log(cusId);

        var url = "<c:url value='/customer/selectCusRepairInfo.do'/>?";
        var $dialog = $('<div id="modalPan"></div>').html(
                '<iframe style="border: 0px; " src="'
                + "<c:url value='/customer/selectCusRepairInfo.do?cusId="+cusId+"'/>"
                + '" width="100%" height="100%"></iframe>').dialog(
            {
                autoOpen: false,
                modal: true,
                    width : 920,
                    height : 700
            });
        $(".ui-dialog-titlebar").hide();
        $dialog.dialog('open');
    }

    function Complete(takeseq)
    {
        if(!confirm("정비완료 하시겠습니까?"))
            return;
        console.log("정비완료 :"+takeseq);

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

        var array = new Array();
        $('input[name=chk_repair]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#chkrepairlist").val(array);

        //수리항목 repairseq 리스트화
        var array = new Array();
		$('input[name=repairseq]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#repairseqlist").val(array);

        document.Assignform.action="TabletRepairComplete.do"; //경로 넣을것.
        document.Assignform.submit();
    }

    function Cancel(takeseq)
    {
        if(!confirm("배정취소 하시겠습니까?"))
            return;
        console.log("배정취소 :"+takeseq);

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

        var array = new Array();
        $('input[name=chk_repair]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#chkrepairlist").val(array);

        //수리항목 repairseq 리스트화
        var array = new Array();
		$('input[name=repairseq]').each(function(index) {
			array.push($(this).val());
			
		});
		$("#repairseqlist").val(array);

        document.Assignform.action="tabletReceiveCancel.do"; //경로 넣을것.
        document.Assignform.submit();
    }
</script>
</head>
<body>
	<div class="container">
		<div class="teamtables">
			<div class="top_line"></div>
			<div class="header">
                <form name="Assignform" action="" method="post">
                    <input type="hidden" name="seq" id="seq" value="<c:out value='${rcptinfo[0].TAKESEQ}'/>">
                    <input type="hidden" name="repairlist" id="repairlist" value="">
                    <input type="hidden" name="chkrepairlist" id="chkrepairlist" value="">
                    <input type="hidden" name="repairseqlist" id="repairseqlist" value="">
                    <input type="hidden" name="deletelist" id="deletelist">

				<h1 class="tit_1 team_left">차량정보 자세히 보기</h1>
				<div class="menu_btn"><a href="#"><img src="../images/ico_allmenu_2.png"></a></div>
				<div class="logo team_right"><img src="../images/kia_logo.png"></div>
				<div class="menu_bg"></div>
				<div class="sidebar_menu">
					<div class="close_btn"><a href="#"><img src="../images/ico_allmenu_close_2.png"></a></div>
					<ul class="menu_wrap">
						<li><a href="/tablet/TabletAssignGroup.do">접수현황</a></li>
						<li><a href="/tablet/TabletWorkGroup.do">반별입고현황</a></li>
					</ul>
					<div style="position: absolute; bottom: 70px;"><img src="../images/kia_seo.png"></div>
				</div>
			</div>
		</div>

		<strong>차량정보</strong>
		<div class="vehicleinfo_1">
			<div><strong>차량번호</strong><input type="text" value="<c:out value='${rcptinfo[0].AUTONUMBER}'/>" readonly></div>
			<div><strong>주행거리</strong><input type="text" value="<c:out value='${rcptinfo[0].KILRO_TOTAL}'/>" readonly></div>
			<div><strong>차종</strong><input type="text" value="<c:out value='${rcptinfo[0].KIND}'/>" readonly></div>
			<div><strong>고객명</strong><input type="text" value="<c:out value='${rcptinfo[0].CUSTOMER_NAME}'/>" readonly></div>
			<div><strong>연락처</strong><input type="text" value="<c:out value='${rcptinfo[0].CUSTOMER_TEL}'/>" readonly>
                <input type="hidden" name="customerid" value="<c:out value='${rcptinfo[0].CUSTOMER_ID}'/>" />	
            </div>
			<div><strong style="height: 22px;"></strong><a href="#" onclick="clickRepair('<c:out value='${rcptinfo[0].CUSTOMER_ID}'/>');">수리이력 확인하기</a></div>
		</div>

		<strong>정비내역</strong>
		<div class="vehicleinfo_2">
			<div class="repairselect">
				<!-- <strong>정비내용 선택</strong> -->
				<div class="cont">
					<div class="scrollBox01">
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
				
			</div>
			<div class="repairpreview">
				<div class="cont">
					<strong>정비내용 선택사항</strong>
					<div class="scrollBox03 board_view5"style="overflow:scroll;">
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
                                    <!-- <td>
                                        <label class="f_selectsmall">
                                            <select name="chk_repair" id="chk_repair_${istatus.count}">
                                                <c:forEach var="j" items="${autome}" varStatus="jstatus">
                                                    <option value="${j.CODE}" <c:if test="${j.CODE == i.REPAIRMETHOD}">selected</c:if>><c:out value="${j.NAME}"/></option>
                                                </c:forEach>
                                            </select>
                                        </label>
                                    </td> -->
                                    <input type='hidden' name="chk_repair" value="<c:out value='${i.REPAIRMETHOD}'/>">
                                    <input type='hidden' name="repair" value="<c:out value='${i.REPAIRCODE}'/>">
                                    <input type='hidden' name="repairseq" value="<c:out value='${i.REPAIR_SEQ}'/>">
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
					</div>
				</div>
			</div>

			<div class="remark">
				<div class="cont">
					<strong>비고</strong>
					<textarea name="" id="" cols="30" rows="10">${rcptinfo[0].NOTE}</textarea>
				</div>
			</div>
		</div>
		<div class="vehicleinfo_3">
			<div class="info3_1">
				<strong>총 주행거리</strong>
				<div><input type="number"name="newkilro" id="newkilro" placeholder="총주행거리(Km)"><label>km</label></div>
			</div>
			<div class="info3_3">
				<div><strong>담당자 확인사항</strong></div>
				<div>
                    <textarea name="remark" id="remark" cols="30" rows="10"></textarea>
                </div>
			</div>
			
			<div class="complete" ><a href="#" onclick="Complete();" style="float: right;"><strong>정비완료</strong></a></div>
			<div class="cancel" ><a href="#" onclick="Cancel();" style="float: left;"><strong>배정취소</strong></a></div>
		</div>
    </form>
	</div>
</body>
</html>


<script>
$(document).ready(function(){
	$('.menu_btn>a').on('click',function(){
	$('.menu_bg').show();
	$('.sidebar_menu').show().animate({
	right:0
	});
});
});

$("#normal").click(function(){
    console.log("일반");
    $("#reserve").removeClass("active");
    $("#normal").addClass("active");
    $("#tab2").css("display","none");
    $("#tab1").css("display","block");
});

$("#reserve").click(function(){
    console.log("예약");
    $("#normal").removeClass("active");
    $("#reserve").addClass("active");
    $("#tab1").css("display","none");
    $("#tab2").css("display","block");
});

$('.close_btn>a').on('click',function(){
	$('.menu_bg').hide();
	$('.sidebar_menu').animate({
	right:'-'+50+'%'
	},function(){$('.sidebar_menu').hide();});
	});

$("li.box_tit a").click(function(){
    // console.log($(this));
    if($(this).parent().hasClass("active"))
        $(this).parent().removeClass("active");
    else
        $(this).parent().addClass("active");
});

$(".box_tit ul li label").click(function(){
    var $this = $(this);
    $this.css("pointer-events","none");

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
            // html+="<td>";
            // html+="<label class='f_selectsmall'><select id='chk_repair_"+checkbox_idx+"' name='chk_repair' >";
            // html+="<c:forEach var='i' items='${autome}' varStatus='status'><option value='<c:out value='${i.CODE}'/>'><c:out value='${i.NAME}'/></option></c:forEach>";
            // html+="</select></label>";
            // html+="</td>";
            // html+="<td>"+$(this).data("time")+"</td>";
            // html+="<td><input type='text' class='f_txtsmall' name='note' id='note' placeholder='비고' value=''/></td>";
            html+="<input type='hidden' name='repair' id='repair' value='"+checkbox_val+"'/>";
            html+="</tr>";
            repairhtml.append(html);
        }
        $this.css("pointer-events","auto");

    },200)

});

</script>