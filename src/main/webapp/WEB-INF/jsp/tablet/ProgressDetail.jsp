<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link rel="stylesheet" href="<c:url value='/'/>css/component.css"
	type="text/css">
<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
<script src="<c:url value='/'/>js/ui.js"></script>
<title>샘플 포털 > 사이트 소개 > 사이트 소개</title>
<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

<script type="text/javascript">
            <!-- 거래처 등록 페이지 호출-->
            function fn_egov_regist_Smartbiz(){

            	//document.QnaListForm.action = "<c:url value='/mdm/SmartaddBiz.do'/>";
            	//document.QnaListForm.submit();
            		
            }
            
            function fn_egov_select_biz(){

		        document.SmartBizList.action = "<c:url value='/mdm/SmartBiz.do'/>";
		        document.SmartBizList.submit();	
	        }
            
            function UpdateBiz(Custid)
        	{
           		document.SmartBizList.Custid.value = Custid;
            	document.SmartBizList.action = "<c:url value='/mdm/SmartUpdateBizView.do'/>";
            	document.SmartBizList.submit();
        	}
            function linkPage(pageNo){
                document.SmartBizList.pageIndex.value = pageNo;
                document.SmartBizList.action = "<c:url value='/mdm/SmartBiz.do'/>";
                document.SmartBizList.submit();
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
						<!-- Left menu -->
						<!-- <c:import url="/sym/mms/EgovMenuLeft.do" /> -->
						<!--// Left menu -->

						<div class="content_wrap">
							<div id="contents" class="content">
								<!-- Location -->
								<div class="location">
									<ul>
										<li><a class="home" href="">Home</a></li>
										<li><a href="">현장관리</a></li>
										<li><a href="">반별 진행 내역 조회</a></li>
									</ul>
								</div>
								<!--// Location -->
								<form modelAttribute="SmartMdmBizVO" name="SmartBizList"
									id="SmartBizList" action="<c:url value='/mdm/SmartBiz.do'/>"
									method="post">

									<h1 class="tit_1">반별 진행 내역 조회</h1>

									<!-- <p class="txt_1">거래처 관리 TEST 화면입니다.</p> -->

									<!-- 검색조건 -->
									<div class="condition" style="margin-top: 20px;">

										<span class="item f_search">
                                            <input type="hidden" id="groupcode" name="groupcode" value="">
                                            <input type="hidden" id="code" name="code" value="">
                                            <p class="left">
                                                <label for="searchCode">차량번호</label>
                                                <input class="f_input w_200" name="searchCode" id="searchCode" type="text" value="<c:out value='${comCodeVO.searchCode}'/>" />
                                            </p>
                                            <p class="left">
                                                <label for="searchCode">연락처</label>
                                                <input class="f_input w_200" name="searchCode" id="searchCode" type="text" value="<c:out value='${comCodeVO.searchCode}'/>" />
                                            </p>
                                            <p class="left">
                                                <label for="searchCodename">접수일자</label>
                                                <input class="f_input w_200" name="searchCodename" id="searchCodename" type="text" value="<c:out value='${comCodeVO.searchCodename}'/>" />
                                            </p>
                                            
                                            <button class="btn" type="submit">
                                                <spring:message code="button.inquire" />
                                            </button>조회
                                        </span>

									</div>
									<div class="board_list_top" style="margin-top: 20px;">
										<!-- <div class="left_col">
											<h1 class="txt_1">업체코드 클릭시 수정화면으로 이동됩니다.</h1>
										</div>
										 -->
										<div class="right_col">
											<a href="<c:url value='/mdm/SmartaddBiz.do'/>"
												class="item btn btn_blue_46 w_100"><spring:message
													code="button.create" /></a>
											<!--　등록 -->
										</div>
									</div>
									<!--// 검색조건 -->

									<div class="board_list">
										<table>
											<caption>게시판목록</caption>
											<colgroup>
												<col style="width: 50px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
												<col style="width: 100px;">
											</colgroup>
											<thead>
												<tr>
													<th scope="col">번호</th>
													<th scope="col">차량번호</th>
													<th scope="col">차량종류</th>
													<th scope="col">고객명</th>
													<th scope="col">연락처</th>
													<th scope="col">수리내용</th>
													<th scope="col">작업장(반)</th>
													<th scope="col">접수일자</th>
													<th scope="col">예상완료시간</th>
													<th scope="col">작업상태</th>
													<th scope="col">수리종류</th>
												</tr>
											</thead>
											<tbody>
												<c:if test="${fn:length(resultList) == 0}">
													<tr>
														<td colspan="8"><spring:message
																code="common.nodata.msg" /></td>
													</tr>
												</c:if>
												<c:forEach var="result" items="${resultList}"
													varStatus="status">
													<tr>
														<td><c:out
																value="${(searchVO.pageIndex-1)*searchVO.pageSize+status.count}" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
														<td><c:out value="" /></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</form>
							
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
