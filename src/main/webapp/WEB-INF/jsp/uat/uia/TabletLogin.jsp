
<%@ page contentType="text/html; charset=utf-8"%>
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
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
    <link rel="stylesheet" href="<c:url value='/'/>css/tablet.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
<%-- <link href="<c:url value='/'/>css_old/default.css" rel="stylesheet" type="text/css" > --%>

<title>로그인</title>
<script type="text/javascript">

function actionLogin() {

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
    } else {
        document.loginForm.action="<c:url value='/uat/uia/actionSecurityLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
}

function fnInit() {
    var message = document.loginForm.message.value;
    if (message != "") {
        alert(message);
    }
    
    getid(document.loginForm);
}
//-->
</script>
</head>

<body style="min-width: 0;">
<div class="container">
    <div class="sub_in">
        <div class="layout">
            <div class="loginmain">
                <div class="logoimg"><img src="../../../../images/kia_seo.png"></div>
                <div class="loginbox">
                    <form name="loginForm" action ="<c:url value='/uat/uia/actionSecurityLogin.do'/>" method="post">
                    <div style="visibility:hidden;display:none;">
		                <input name="iptSubmit1" type="submit" value="전송" title="전송" />
		            </div> 
		            <input type="hidden" name="message" value="${message}" />
                        <fieldset>
                            <legend>로그인</legend>
                            <dl>
                                <!--<dt><label for="memid">아이디</label></dt>-->
                                <dd><input type="text" name="id" id="id" title="아이디" maxlength="10"/></dd>
                            </dl>
                            <dl>
                                <!--<dt><label for="pwd">비밀번호</label></dt>-->
                                <dd>
                                    <input type="password" name="password" id="password" title="비밀번호" onKeyDown="javascript:if (event.keyCode == 13) { actionLogin(); }"/>
                                </dd>
                            </dl>
                            <div class="btn_a">
                                <a href="#LINK" class="btn" onClick="actionLogin()">로그인</a>
                            </div>
                        </fieldset>
                        <input name="userSe" type="hidden" value="GNR"/>
	            		<input name="j_username" type="hidden"/>
                    </form>
                </div>
            </div>
            <div class="mainimg"><img src="../../../../images/login_back.png"></div>
        </div>
    </div>
</div>

</body>












<!--
<body onLoad="fnInit();">
        <div class="container">
            <div class="p_login">
                <div class="loginbox">
                    <form name="loginForm" action ="<c:url value='/uat/uia/actionSecurityLogin.do'/>" method="post">
                    <div style="visibility:hidden;display:none;">
		                <input name="iptSubmit1" type="submit" value="전송" title="전송" />
		            </div> 
		            <input type="hidden" name="message" value="${message}" />
                        <fieldset>
                            <legend>로그인</legend>
                            <dl>
                                <dt><label for="memid">아이디</label></dt>
                                <dd><input type="text" name="id" id="id" title="아이디" maxlength="10"/></dd>
                            </dl>
                            <dl>
                                <dt><label for="pwd">비밀번호</label></dt>
                                <dd>
                                    <input type="password" name="password" id="password" title="비밀번호" onKeyDown="javascript:if (event.keyCode == 13) { actionLogin(); }"/>
                                    <label for="chk" class="f_chk">
                                        <input type="checkbox" name="checkId" id="chk" title="ID 저장" checked="checked" onClick="javascript:saveid(document.loginForm);" />
                                        <span>ID 저장</span>
                                    </label>
                                </dd>
                            </dl>
                            <div class="btn_a">
                                <a href="#LINK" class="btn" onClick="actionLogin()">로그인</a>
                                <a href="#LINK" class="btn" onClick="goRegiUsr();">회원가입</a>
                            </div>
                        </fieldset>
                        <input name="userSe" type="hidden" value="GNR"/>
	            		<input name="j_username" type="hidden"/>
                    </form>
                </div>
            </div>
        </div>    
</body>
-->
</html>


