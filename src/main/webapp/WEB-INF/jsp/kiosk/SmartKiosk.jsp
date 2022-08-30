<%--
  Class Name : EgovAboutSite.jsp
  Description : 샘플화면 - 사이트소개(sample)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
<title>샘플 포털 > 사이트 소개 > 사이트 소개</title>
<!-- <link href="css_old/default.css" rel="stylesheet" type="text/css" > -->

<script type="text/javascript">

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
	                    <c:import url="/sym/mms/EgovMenuLeft.do" />
	                    <!--// Left menu -->
        				
        				<div class="content">
        						<!-- 검색조건 -->
		                        <div id="contents" class="tab_contents" style="padding: 44px 10px 20px 20px;">
		                            <a href="<c:url value='/kiosk/selectKioskin.do'/>" class="item btn btn_blue_46 w_500 h_400" style="font-size: 70px; padding: 160px 0px 0px 0px;">일반수리</a><!-- 등록 -->
		                            <a href="<c:url value='/kiosk/selectKioskinsurance.do'/>" class="item btn btn_blue_46 w_500 h_400" style="font-size: 70px;  padding: 160px 0px 0px 0px;">보증수리</a><!-- 등록 -->
		                        </div>
	                        	<!--// 검색조건 -->
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