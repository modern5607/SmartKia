<%--
  Class Name : EgovQustnrTmplatManageList.jsp
  Description : 설문템플릿 목록 페이지
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
     2011.08.31  JJY       경량환경 버전 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="ImgUrl" value="/images_old/egovframework/com/uss/olp/qtm/"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<title>모니터링</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/monitoring.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
</head>
<body>
<body>

        <div class="container">
            <div class="monitoring content">
                <div class="sub_in">
                    <div class="layout">
						
                        <div class="teamtables">
							<div class="top_line"></div>
                            <div class="header">
								<h1 class="tit_1 team_left">A반 작업 현황</h1>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
                            </div>
							<div class="board_list">
								<table >
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">차량번호</th>
											<th scope="col">고객명</th>
											<th scope="col">예상완료시간</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${TeamA}" var="result"
											varStatus="status">
											<tr>
												<td><c:out value="${result.AUTONUMBER}" /></td>
												<td><c:out value="${result.CUSTOMER_NAME}" /></td>
												<td><c:out value="${result.ESTIME}" /></td>
												<td style="color:red;"><c:out value="${result.TASKSTAT_NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
                        </div>
						<div class="teamtables">
							<div class="top_line"></div>
                            <div class="header">
								<h1 class="tit_1 team_left">B반 작업 현황</h1>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
                            </div>
							<div class="board_list">
								<table >
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">차량번호</th>
											<th scope="col">고객명</th>
											<th scope="col">예상완료시간</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${TeamB}" var="result"
											varStatus="status">
											<tr>
												<td><c:out value="${result.AUTONUMBER}" /></td>
												<td><c:out value="${result.CUSTOMER_NAME}" /></td>
												<td><c:out value="${result.ESTIME}" /></td>
												<td style="color:red;"><c:out value="${result.TASKSTAT_NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
                        </div>
						<div class="teamtables">
							<div class="top_line"></div>
                            <div class="header">
								<h1 class="tit_1 team_left">C반 작업 현황</h1>
								<div class="logo team_left"><img src="../images/kia_logo.png" style="width:200px;"></div>
                            </div>
							<div class="board_list">
								<table>
									<colgroup>
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
										<col style="width: 20%;">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">차량번호</th>
											<th scope="col">고객명</th>
											<th scope="col">예상완료시간</th>
											<th scope="col">상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${TeamC}" var="result"
											varStatus="status">
											<tr>
												<td><c:out value="${result.AUTONUMBER}" /></td>
												<td><c:out value="${result.CUSTOMER_NAME}" /></td>
												<td><c:out value="${result.ESTIME}" /></td>
												<td style="color:red;"><c:out value="${result.TASKSTAT_NAME}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


</body>
</html>