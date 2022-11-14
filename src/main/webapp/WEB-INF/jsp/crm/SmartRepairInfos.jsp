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
    <link rel="stylesheet" href="<c:url value='/'/>css/base.css?after">
    <link rel="stylesheet" href="<c:url value='/'/>css/layout.css?after">
    <link rel="stylesheet" href="<c:url value='/'/>css/component.css?after">
    <link rel="stylesheet" href="<c:url value='/'/>css/page.css">
    <script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
    <script src="<c:url value='/'/>js/ui.js"></script>
    <!-- 캘린더 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script src="<c:url value='/'/>js/datepicker.js"></script>
	<!-- /캘린더 -->
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
	    
	<title>목포서비스 KIA AUTO Q</title>
	    <!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

<script type="text/javascript">

    function setSelectBox()
    {
		//console.log(arg);
    	
    	$.ajax({
            type: "post",
            url: "/crm/SmartRepairAjax.do",
            data: $("#SmartCrmVO").serialize(),
            success: function (data) {
                if(data == null)
			{
				alert("정보가 없습니다.");
				return;
			}
			else
			{
				var reCode = "";
                var html ="";
				var repair_selector = $("#PIDX1");
				    html+="<select>";
                    html+="<option value=''>전체</option>";
                    console.log(data[1]);
				    $.each(data[1], function (index, item) {
				    	console.log(item.CODE);
				    	html+="<option value='"+item.CODE+"'>"+ item.NAME + "</option>";				    	
                    });
                    html+="</select>";
					repair_selector.html('');
					repair_selector.html(html);                    
            }    
            }
        });
	}

	
    function fnSearch() {
		document.SmartCrmVO.pageIndex.value = 1;
		document.SmartCrmVO.action = "<c:url value='/crm/SmartRepairInfos.do'/>";
		document.SmartCrmVO.submit();
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
							<div id="contents">
								<!-- Location -->
								<div class="location">
									<ul>
										<li><a class="home" href="">Home</a></li>
										<li><a href="">고객관리</a></li>
										<li>차량 정비내역 조회</li>
									</ul>
								</div>
								<!--// Location -->
								<form name="SmartCrmVO" id="SmartCrmVO" action="<c:url value='/crm/SmartRepairInfos.do'/>" method="post">
                                    <%-- <input id="main" name="main" value="<c:out value='${SmartCrmVO.main}'/>">
                                    <input id="middle" name="middle" value="<c:out value='${SmartCrmVO.middle}'/>">
                                    <input id="searchrepairname" name="searchrepairname" value="<c:out value='${SmartCrmVO.searchrepairname}'/>"> --%>
                                    <input type="hidden" id="callsys" name="callsys" value="">
									<input name="selectedId" type="hidden" /> 
									<input name="checkedIdForDel" type="hidden" />
									<%-- <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>" /> --%>
									<div class="condition">
										<span class="item f_search">
											<p class="left">
												<label for="PIDX">분류</label>
												<label class="f_select w_200" for="PIDX">
														<select name="PIDX" id="PIDX" onchange="setSelectBox();">
															<option value="">전체</option>
															<c:forEach var="i" items="${mainlist}" varStatus="status">
																<option value="<c:out value='${i.CODE}'/>" ${SmartCrmVO.PIDX ==i.CODE ? 'selected' : ''} >${i.NAME}</option> 
															</c:forEach>
														</select>
												</label>
												<label for="PIDX1"></label>
												<label class="f_select w_200" for="PIDX1"> 
														<select name="PIDX1" id="PIDX1">
															<option value="">전체</option>
															<c:forEach var="middlelist" items="${middlelist}" varStatus="status">
																<option value="<c:out value='${middlelist.CODE}'/>" ${SmartCrmVO.PIDX1 == middlelist.CODE?'selected':''} >${middlelist.NAME}</option> 
															</c:forEach>
														</select>
												</label>
												<label for="sdate">기간 </label> 
													<input name="sdate" id="sdate" readonly class="f_input w_180" type="text" value="<c:out value='${SmartCrmVO.sdate}'/>" />
												<label for="edate"> ~ </label> 
													<input name="edate" id="edate" readonly class="f_input w_180" type="text" value="<c:out value='${SmartCrmVO.edate}'/>" /> 
												<label for="searchTeam">작업반</label>
					                        		
													 <label class="f_select w_200" for="POSITION">
															<select name="POSITION" id="POSITION">
																<option value="">전체</option>
																<c:forEach var="j" items="${autorooms}" varStatus="status">
		                                                            <option value="<c:out value='${j.CODE}'/>" ${SmartCrmVO.POSITION == j.CODE?'selected':''} >${j.NAME}</option> 
		                                                        </c:forEach>
															</select>
													</label>
												<button class="btn" type="submit"onclick="fnSearch(); return false;" style="right: -50px;"><spring:message code='button.search' /></button> 
											</p>
										</span>
										<%-- <div class="right_col">
                                            <label class="f_select w_200" for="autoroom">
													<select name="autoroom" id="autoroom">
														<option value="all">전체</option>
														<c:forEach var="k" items="${autorooms}" varStatus="status">
                                                            <option value="<c:out value='${k.CODE}'/>" ${SmartCrmVO.position ==k.CODE ? 'selected' : ((logininfo[0].TEAM == k.CODE && SmartCrmVO.position =='') ? 'selected' : '')} >${k.NAME}</option> 
                                                        </c:forEach>
													</select>
													
														
											</label>
											<a href="#" class="btn btn_blue_46 w_100" onclick="javascript:fnCheckId(); return false;"><spring:message code="button.inquire" /></a>
										</div> --%>
									</div>
							</div>
														
                                    <!-- 검색조건 -->

							<div class="board_list3">
								<table style="table-layout: fixed;">
									<colgroup>
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
										<col style="width: 10%;">
										<col style="width: 5%;">
										<col style="width: 5%;">
										<col style="width: auto;">
										<col style="width: 10%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">접수일자</th>
											<th scope="col">완료일자</th>
											<th scope="col">접수번호</th>
											<th scope="col">차량번호</th>
											<th scope="col">고객명</th>
											<th scope="col">차량종류</th>
											<th scope="col">작업반</th>
											<th scope="col">수리사항</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${fn:length(resultList) == 0}">
											<tr>
												<td colspan="8"><spring:message
														code="common.nodata.msg" /></td>
											</tr>
										</c:if>
										<c:forEach items="${resultList}" var="result"
											varStatus="status">
											<tr>
												<td><c:out value="${result.RECEIPTDATE}" /></td>
												<td><c:out value="${result.ETIME}" /></td>
												<td><c:out value="${result.TAKESEQ}" /></td>
												<td><c:out value="${result.CUSTOMER_AUTONO}" /></td>
												<td><c:out value="${result.CUSTOMER_NAME}" /></td>
												<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${result.POSITION}" /></td>
												<td style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><c:out value="${result.REPAIR_NAME}" /></td>
												<td><c:out value="${result.CUSTOMER_TEL}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								</form>
							</div>
							<div class="board_list_bot">
								<div class="paging" id="paging_div">
									<ul>
										<ui:pagination paginationInfo="${paginationInfo}" type="image"
											jsFunction="fnLinkPage" />
									</ul>
								</div>
							</div>
						</div>						
					</div>
					<br/>
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
</body>

</html>