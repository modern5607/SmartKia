<%--
  Class Name : SmartaddBiz.jsp
  Description : 거래업체 등록 화면
  Modification Information
 
--%>
<%@ page contentType="text/html; charset=utf-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>기준정보 > 거래처관리 > 거래처관리 등록</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/component.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/page.css">
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>

<validator:javascript formName="qnaManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script type="text/javaScript" language="javascript">

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_initl_qnacn(){

	// 첫 입력란에 포커스..
	SmartMdmBizVO.Custnm.focus();
}

/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_qnacn(form){

	form.submit();
		
}

function fnIdCheck(){
    var url = "<c:url value='/mdm/SmartChkcodeview.do'/>?";
    
    var varParam = new Object();
    var checkId = SmartMdmBizVO.Custid.value;
    var varParam = "Custid="+checkId;
    
    var $dialog = $('<div id="modalPan"></div>')
	.html('<iframe style="border: 0px;" src="' + "<c:url value='/mdm/SmartChkcodeview.do'/>?" + varParam +'" width="100%" height="100%"></iframe>')
	.dialog({
    	autoOpen: false,
        modal: true,
        width: 600,
        height: 450
	});
    $(".ui-dialog-titlebar").hide();
	$dialog.dialog('open');
}

/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_qnalist() {
	SmartMdmBizVO.action = "<c:url value='/mdm/SmartBiz.do'/>";
	SmartMdmBizVO.submit();
};

//중복체크 기능 매핑
function showModalDialogCallback(retVal) {
	if(retVal) {
        document.SmartMdmBizVO.Custid.value = retVal;
        //document.SmartMdmBizVO.id_view.value = retVal;
    }
	fn_egov_modal_remove();
};

</script>

</head>
<body onLoad="fn_egov_initl_qnacn();">

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
        
                        <div class="content_wrap">
                            <div id="contents" class="content">
                                 <!-- Location -->
                                <div class="location">
                                    <ul>
                                        <li><a class="home" href="">Home</a></li>
                                        <li><a href="">기준정보</a></li>
                                        <li>거래처관리</li>
                                        <li>거래처관리 등록</li>
                                    </ul>
                                </div>
                                <!--// Location -->

								<form modelAttribute="SmartMdmBizVO" id="SmartMdmBizVO" name="SmartMdmBizVO" action="${pageContext.request.contextPath}/mdm/InsertSmartaddBiz.do" method="post" >
								<input name="answerCn" type="hidden" value="Testing...">

                                <h1 class="tit_1">거래처관리 등록</h1>

                                <p class="txt_1">거래처관리 TEST 등록화면.</p>

                                <h2 class="tit_2">업체 등록</h2>

                                <div class="board_view2">
                                    <table summary="Q&amp;A에 대한 정보를 등록합니다.">
                                    	<caption>Q&amp;A내용등록</caption>
                                        <colgroup>
                                            <col style="width: 190px;">
                                            <col style="width: auto;">
                                        </colgroup>
                                        <tr>
                                            <td class="lb">
                                                <label for="Custnm">업체명</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input id="Custnm" name="Custnm" class="f_txt" size="20" maxlength="20" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="Custid">업체코드</label>s
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <span class="f_search2 w_350">
                                                    <input id="Custid" type="text" maxlength="20"  name="Custid" readonly >
                                                    <button type="button" class="btn" onclick="javascript:fnIdCheck(); return false;"></button>
                                                </span>
                                                <span class="f_txt_inner ml15">(중복 코드 검색)</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="Address">주소</label>
                                            </td>
                                            <td>
                                                <input id="Address" name="Address" class="f_txt" size="30" maxlength="30"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="Tel">연락처</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input id="Tel" name="Tel" class="f_txt" size="20" maxlength="20" />
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="Custname">담당자</label>
                                            </td>
                                            <td>
                                                <input id="Custname" class="f_txt w_half" name="Custname" size="10"  maxlength="30" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="Item">주거래품목</label>
                                                <span class="req">필수</span>
                                            </td>
                                            <td>
                                                <input id="Item" name="Item" class="f_txt w_full" size="10" maxlength="10" />
                                            </td>
                                        </tr>
                                        <tr>
											<td class="lb"><label for="Custtype">거래처구분</label></td>
											<td>
												<label class="f_select w_350" for="Custtype">
													<select name="Custtype" id="Custtype">
														<option value="수입">수입</option>	
														<option value="수출">수출</option>	
													</select>
												</label>
											</td>
										</tr>
                                        <tr>
											<td class="lb"><label for="Useyn">사용유무</label></td>
											<td>
												<label class="f_select w_350" for="Useyn">
													<select name="Useyn" id="Useyn">
														<option value="Y">사용</option>	
														<option value="N">미사용</option>	
													</select>
												</label>
											</td>
										</tr>
                                        <tr>
                                            <td class="lb">
                                                <label for="Remark">비고</label>
                                            </td>
                                            <td>
                                                <textarea id="Remark" name="Remark" class="f_txtar w_full h_200" cols="30" rows="10" ></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

								<!-- 목록/저장버튼  시작-->
                                <div class="board_view_bot">
                                    <div class="left_col btn3">
                                    </div>

                                    <div class="right_col btn1">
                                        <a href="#LINK" class="btn btn_blue_46 w_100" onclick="fn_egov_regist_qnacn(document.SmartMdmBizVO); return false;"><spring:message code="button.save" /></a><!-- 저장 -->
                                        <a href="<c:url value='/uss/olh/qna/QnaListInqire.do'/>" class="btn btn_blue_46 w_100" onclick="fn_egov_inqire_qnalist(); return false;"><spring:message code="button.list" /></a><!-- 목록 -->
                                    </div>
                                </div>
                                <!-- 목록/저장버튼  끝-->
                                
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