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

	function clickRepairdetail(seq, repairNote, turnOverTime,totalkm) {
		const element = document.getElementById('remark');
		element.innerHTML = repairNote;
		const elements = document.getElementById('receip');
		elements.innerHTML = turnOverTime.replace(' 수리내역','');

		$("#totalkm").text(totalkm);

		$.ajax({
			type : "post",
			url : "/customer/selectCusRepairDetail.do",
			// contentType:"application/json;charset=UTF-8",
			// dataType:"json",
			data : {
				seq : seq
			},
			success : function(resp) {
				console.log(resp);
				/* console.log(seq); */
				if (resp == null) {

					alert("정보가 없습니다.");
					return;
				} else {
					var html = "";
					var repair_selector = $("#ul");
					html += "<table>";
					$
							.each(
									resp,
									function(jndex, jtem) {
										var class_add1 = '';
										var class_add2 = '';
										var check_add1 = '';
										var check_add2 = '';

										if (jtem.REPAIRMETHOD == 'CB-general') {
											check_add1 = 'checked';
										} else if (jtem.REPAIRMETHOD == 'CB-guaranty') {
											check_add2 = 'checked';
										}
										if (jtem.REPAIRMETHOD == 'CB-general') {
											class_add1 = 'on';
										} else if (jtem.REPAIRMETHOD == 'CB-guaranty') {
											class_add2 = 'on';
										}

										html += "<tr>";
										html += "<td>"
												+ jtem.REPAIRCODE_NAME
												+ "</td>";

										html += "<td>";
										html += "<label for='rdo1' class=' " + class_add1 +"'>";
										html += "<input type='radio' id='rdo"+ jndex +"' name='repairmethod"+ jndex +"'onclick='return false;'  "+ check_add1 +">";
										html += "</label>";
										html += "</td>";
										html += "<td>";
										html += "<label for='rdo1' class=' " + class_add2 +"'>";
										html += "<input type='radio' id='rdo1"+ jndex +"' name='repairmethod"+ jndex +"'onclick='return false;' "+ check_add2 +">";
										html += "</label>";
										html += "</td>";
										html += "</tr>";

									});
					html += "</table>";
					html += "</li>";
					html += "</ul>";
				}

				repair_selector.html(html);
			}
		});
	}
</script>
</head>
<body>

	<!-- 아이디중복확인 팝업 -->
	<div class="popup POP_DUPID_CONF"
		style="background-color: white; text-align: center;">

		<form name="cusMberManageVO" id="cusMberManageVO"
			action="<c:url value='/customer/selectCusRepairInfo.do'/>"
			method="get">
			<input type="hidden" name="cusId" id="cusId" value="">
			<!-- <input type="hidden" name="repairlist" id="repairlist" value="">
            <input type="hidden" name="chkrepairlist" id="chkrepairlist" value="">
            <input type="hidden" name="repairseqlist" id="repairseqlist" value="">
            <input type="hidden" name="deletelist" id="deletelist"> -->
			<div class="pop_inner" style="width: 100%;">
				<div class="pop_header" style="border: 0;">
					<h1>수리내역 상세보기</h1>
					<button type="button" class="close"
						onclick="fn_egov_cancel_popup(); return false;">닫기</button>
				</div>
				<div class="pop_container"
					style="border: 1px solid #dde2e5; border-radius: 10px; padding: 0 10px;">
					<div class="cont left text_left">
						<strong style="margin-left: 0px;"></strong>
						<div
							style="text-align: center; height: 526px; margin-right: 20px; padding: 0 10px; overflow-y: scroll;">
							<ul>
								<c:forEach var="list" items="${cusinfo}" varStatus="status">
									<c:choose>
										<c:when test="${list.takeSeq != null}">
											<li style="font-size: 14px"><c:out
													value="${list.turnOverTime}" /><br> <a href="#"
												style=""
												onclick="clickRepairdetail('<c:out value="${list.takeSeq}"/>', '<c:out value="${list.repairNote}"/>', '<c:out value="${list.turnOverTime}"/>','<c:out value='${list.totalKm}'/>'); return false;">-자세히보기-</a>
											</li>
										</c:when>
										<c:otherwise>
											<li style="padding: 10px 0; font-size: 26px; font-weight: bold;"><c:out
													value="${list.turnOverTime}" /><br></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
							<a href="#"></a>
						</div>
					</div>
					<div class="cont left text" style="width: 400px;">
						<strong style="margin-left: 0px; font-size: 24px">상세수리 내역</strong>
						<div class="f_txt"
							style="padding: 0; margin-left: 0px; margin-right: 20px; height: 454px;">
							<table id="repair">
								<colgroup>
									<col style="width: 200px;">
									<col style="width: auto;">
									<col style="width: auto;">
								</colgroup>
								<thead>
									<th>수리부분</th>
									<th>일반</th>
									<th>보증</th>
								</thead>
								<tbody id="ul">
								</tbody>
							</table>
						</div>

					</div>
					<div class="cont left text" style="width: 190px;">
						<strong style="margin-left: 0px; font-size: 24px">수리 완료일</strong>
						<div id="receip" class="f_txt" style="margin-bottom: 20px; line-height: 44px"></div>

						<strong style="margin-left: 0px; font-size: 24px">총 주행거리</strong>
						<div id="totalkm" class="f_txt" style="margin-bottom: 20px; line-height: 44px"></div>

						<strong style="margin-left: 0px; font-size: 24px">수리비고</strong>
						<div id="remark" class="f_txt" style="margin-left: 0px; margin-right: 0px; height: 250px;"></div>

					</div>
					<table class="board_list4"></table>
					<!--div class="right_col">
                    	<a href="#" class="btn btn_blue_46 w_100" onclick="fn_egov_cancel_popup(); return false;" style="margin-top: 10px; position:relative; top">닫기</a>  
					</div-->
				</div>
			</div>
		</form>
	</div>
</body>
</html>