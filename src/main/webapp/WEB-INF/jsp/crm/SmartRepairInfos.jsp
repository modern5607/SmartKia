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

    function setSelectBox(arg)
    {
    	// document.SmartLeadTimeVO.main.value = $("#PIDX option:selected").val();
        // document.SmartLeadTimeVO.middle.value = "";
        // document.SmartLeadTimeVO.sub.value = "";
    	// document.SmartLeadTimeVO.callsys.value = 'ajax';
    	
    	$.ajax({
            type: "post",
            url: "/mdm/SmartRepairAjax.do",
            data: $("#SmartCrmVO").serialize(),
            success: function (data) {
                console.log(data);
                if(data == null)
			{
				
				alert("정보가 없습니다.");
				return;
			}
			else
			{
                var html ="";
				var repair_selector = $("#PIDX1");
				    html+="<select>";
                    html+="<option value='all'>전체</option>";
				    $.each(data, function (index, item) {
                        html+="<option value=" + item.CODE + ">" + item.NAME + "</option>";
                    });
                    html+="</select>";
            
            }
                repair_selector.html(html);
            
            }
        });
}
    
    </script>

</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<!-- 캘린더 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="<c:url value='/'/>js/datepicker.js"></script>
<!-- /캘린더 -->
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>

<title>기준정보 > 사용자관리</title>
<script type="text/javaScript" language="javascript" defer="defer">

function fnSearch() {
	document.smartCrmVO.pageIndex.value = 1;
	document.smartCrmVO.action = "<c:url value='/crm/SmartAddRepairCar.do'/>";
	document.smartCrmVO.submit();
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
                                    <input type="hidden" id="main" name="main" value="<c:out value='${SmartCrmVO.main}'/>">
                                    <input type="hidden" id="middle" name="middle" value="<c:out value='${SmartCrmVO.middle}'/>">
                                    <input type="hidden" id="callsys" name="callsys" value="">
									<input name="selectedId" type="hidden" /> 
									<input name="checkedIdForDel" type="hidden" /> 
									<%-- <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>" /> --%>
									<div class="condition">
										<span class="item f_search">
											<p class="left">
														대분류
														<label class="f_select w_200" for="PIDX">
																<select name="PIDX" id="PIDX" onchange="setSelectBox(this.value)">
																	<option value="all">전체</option>
																	<c:forEach var="i" items="${mainlist}" varStatus="status">
			                                                            <option value="<c:out value='${i.CODE}'/>" ${searchVO.autoroom ==i.CODE ? 'selected' : ((logininfo[0].TEAM == i.CODE && searchVO.autoroom =='') ? 'selected' : '')} >${i.NAME}</option> 
			                                                        </c:forEach>
																</select>
														</label>
														중분류
			                                            <label class="f_select w_200" for="PIDX1"> 
																<select name="PIDX1" id="PIDX1">
																	<option value="all">전체</option>
																	<c:forEach var="middlelist" items="${middlelist}" varStatus="status">
			                                                            <option value="<c:out value='${middlelist.CODE}'/>">${middlelist.NAME}</option> 
			                                                        </c:forEach>
																</select>
														</label>
												<label for="sdate"></label> 
													<input name="sdate" id="sdate" readonly="readonly"class="f_input w_180" title="검색" type="text"value="<c:out value="${SmartCrmVO.sdate}"/>" />
												<label for="edate"> ~ </label> 
													<input name="edate" id="edate" readonly="readonly" class="f_input w_180" title="검색" type="text"value="<c:out value="${SmartCrmVO.edate}"/>" /> 
												<button class="btn" type="submit"onclick="fnSearch(); return false;" style="right: -50px;"><spring:message code='button.search' /></button> 
											</p>
										</span>
									</div>
							</div>
														
                                    <!-- 검색조건 -->

							<div class="board_list3">
								<table summary="고객목록">
									<caption>고객목록</caption>
									<colgroup>
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<col style="width: 100px;">
										<%-- <col style="width: 100px;"> --%>
									</colgroup>
									<thead>
										<tr>
											<th scope="col">출고일</th>
											<th scope="col">차량번호</th>
											<th scope="col">고객명</th>
											<th scope="col">차량종류</th>
											<th scope="col">작업반</th>
											<th scope="col">연락처</th>
											<!-- <th scope="col">완료시간</th> -->
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
												<td><c:out value="${result.TURNOVERTIME}" /></td>
												<td><c:out value="${result.AUTONUMBER}" /></td>
												<td><c:out value="${result.CUSTOMER_NAME}" /></td>
												<td><c:out value="${result.CUSTOMER_AUTOKIND}" /></td>
												<td><c:out value="${result.POSITION_NAME}" /></td>
												<td><c:out value="${result.CUSTOMER_TEL}" /></td>
												<%-- <td><c:out value="${result.ETIME}" /></td> --%>
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