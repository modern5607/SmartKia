<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>고객상담표</title>
<base target="_self" >
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<c:url value='/'/>css/base.css">
	<link rel="stylesheet" href="<c:url value='/'/>css/layout.css">
	<!-- <link rel="stylesheet" href="<c:url value='/'/>css/component.css"> -->
	<!-- <link rel="stylesheet" href="<c:url value='/'/>css/page.css"> -->
	<!-- <link rel="stylesheet" href="<c:url value='/'/>css/print.css"> -->
	<script src="<c:url value='/'/>js/jquery-1.11.2.min.js"></script>
	<script src="<c:url value='/'/>js/ui.js"></script>
	<script src="<c:url value='/'/>js/jquery.js"></script>
	<script src="<c:url value='/'/>js/jqueryui.js"></script>
	<link rel="stylesheet" href="<c:url value='/'/>css/jqueryui.css">

<!-- <script type="text/javascript" src="<c:url value='/js/showModalDialogCallee.js'/>" ></script> -->
<script type="text/javaScript" language="javascript">
</script>
<style>
    *{
    word-break: keep-all;
    word-wrap: break-word;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
}
   html, body, div, span, applet, object, iframe, h4, h2, h4, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, em, font, img, ins, q, s, small, strike, strong, sub, sup, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, thead, tbody, tfoot, tr, th, td, input {
    margin: 0;
    padding: 0;
}

body{
    width: 100%;
     height: 100%;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 16px;
}
.page {
     width: 210mm;
     min-height: 297mm;
     /* padding: 20mm; */
     margin: 10mm auto;
     border: 1px #D3D3D3 solid;
     border-radius: 5px;
     background: white;
     box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
 }
 .subpage {
     padding: 0.6cm;
     /* border: 5px red solid; */
     height: 257mm;
     /* outline: 2cm #FFEAEA solid; */
 }

 @page {
     size: A4;
     margin: 0;
 }
 @media print {
     html, body {
         width: 210mm;
         height: 297mm;        
     }
     .page {
         margin: 0;
         border: initial;
         border-radius: initial;
         width: initial;
         min-height: initial;
         box-shadow: initial;
         background: initial;
         page-break-after: always;
     }
 }

 input{
    background: #dddddd !important; 
    -webkit-print-color-adjust:exact;
    width: 150px; 
    height: 25px;
    border: none;
 }

img {
    border: 0;
    vertical-align: top;
}
table{
    border-collapse: collapse;
}
.txt_left{
    text-align: left;
}
.txt_cen{
    text-align: center;
}
.txt_right{
    text-align: right;
}
.print_wrap{
    /* width: 50%;
    position: absolute;
    transform: translate(-50%, -50%);
    left: 50%;
    top: 70%; */
}
.print_header{
    height: 1.3cm;
}
.print_header h4{
    text-align: center;
    position: relative;
    display: block;
    top: -50px;
    font-size: 34px;
}
.print_header .takeseq{
    display: inline-block;
    width: 30%;
    /* float: left; */
    border: 1px solid black;
    height: 1.3cm;
}
.print_header .takeseq td:nth-child(1){
    letter-spacing: 1.2px;
    padding: 0.8mm 2.1mm;
}
.print_header .takeseq td:nth-child(2){
    border-left: 1px solid black;
    width: 100%;
    text-align: center;
}

.print_content{
    /* height: 90vh; */
    border: 2px solid black;
    margin-top: 3px;
}
.print_content .kia1{
    margin: 5px;
    width: -webkit-fill-available;
}

.print_content .kia1 th{
    border: 1px solid;
    height: 0.8cm;
    font-size: 0.8em;
    padding: 0 7px;
    background: #dddddd !important;
    -webkit-print-color-adjust:exact;
    text-align: center;
    /* text-align-last: justify; */
}

.print_content .kia1 td{
    
    border: 1px solid;
    font-size: 15px;
    padding: 0 5px;
    text-align: center;
    /* text-align-last: justify; */
}
/* .print_content .kia1 td:nth-child(odd){
    background-color: #dddddd !important;
    -webkit-print-color-adjust:exact;
    text-align: center;
    height: 0.8cm;
    font-size: 0.8em;
} */
/* .print_content .kia2{
    margin: 5px;
    width: -webkit-fill-available;
} */
/* .print_content .kia2 th{
    border: 1px solid;
    height: 0.8cm;
    font-size: 0.8em;
    padding: 0 7px;
    background: #dddddd !important;
    -webkit-print-color-adjust:exact;
    text-align: center;
    // text-align-last: justify;
} */

/* .print_content .kia2 td{
    border: 1px solid;
    padding: 0 5px;
    font-size: 0.8em;

} */
/* .print_content .kia2 td:nth-child(odd){
    background-color: #dddddd !important;
    -webkit-print-color-adjust:exact;
    text-align: center;
    height: 0.8cm;
    font-size: 0.8em;
} */

.print_content .kia3{
    margin: 5px;
    width: -webkit-fill-available;
}
.print_content .kia3 th{
    border: 1px solid;
    text-align: center;
    background: #dddddd !important;
    -webkit-print-color-adjust:exact;
    text-align: center;
    height: 0.8cm;
    font-size: 0.8em;
}
.print_content .kia3 td{
    border: 1px solid;
    height: 0.8cm;
    font-size: 0.8em;
}
.print_content .kia3 tfoot tr td:nth-child(1){
    text-align: center;
    background: #dddddd !important;
    -webkit-print-color-adjust:exact;
    height: 0.8cm;
    font-size: 0.8em;
}
.print_content .kia3 tfoot tr td:nth-child(2){

}

.print_content .kia4{
    margin: 5px;
    width: -webkit-fill-available;
}
.print_content .kia4 th{
    border: 1px solid;
    text-align: center;
    background: #dddddd !important;
    -webkit-print-color-adjust:exact;
    text-align: center;
    height: 0.8cm;
    font-size: 0.8em;
}
.print_content .kia4 td{
    border: 1px solid;
    font-size: 0.8em;
}
.print_content .kia4 tr:nth-child(1) td:nth-child(1){
    text-align: center;
    background: #dddddd !important;
    -webkit-print-color-adjust:exact;
    font-size: 1em;
}
.print_content .kia4 tr:nth-child(1) td:nth-child(2) img{
    width: 120px;
    display: block;
    margin: 10px 50px;
}
.print_content .kia4 td:nth-child(3){
    height: 45px;
    padding: 10px;
    vertical-align: top;
}
.print_content .kia4 tr:nth-child(2) td:nth-child(1){
    padding: 10px;
    vertical-align: top;
}

.print_content .kia5{
    font-size: 10px;
    width: 100%;
}

.print_content .kia5 td:nth-child(1){
    vertical-align: top;
    text-align: -webkit-center;
    word-break: break-all;
}

.hr{
    display: flex;
   align-items: center;
   
}
.hr hr{
    flex: auto;
border: none;
position: initial;
left: 0;
right: 0;
    border-top: 3px dotted;
}
.hr .hr_txt{
    padding: 0 10px;
    font-size: 11px;
}


.print_content .kia6{
    margin: 5px;
    width: -webkit-fill-available;
    text-align: center;
}
.print_content .kia6 th{
    border: 1px solid;
    height: 0.8cm;
    font-size: 0.8em;
    background: #dddddd !important;
    -webkit-print-color-adjust:exact;
}
.print_content .kia6 td{
    border: 1px solid;
    height: 0.7cm;
    font-size: 0.8em;
    padding: 0 5px;
}
/* .print_content .kia6 td:nth-child(1){
    background:#dddddd;
} */

.print_footer{
    margin: 10px;
    height: 4vh;
}
</style>
</head>
<body>
        <!-- header start -->
        <c:import url="/sym/mms/EgovHeader.do" />

        <!-- //header end -->

        <div class="page" style="margin-top: 130px;">
            <div class="subpage">
                <div class="print_wrap">
                    <div class="print_header">
                        <table class="takeseq">
                            <td>접수<br>번호</td>
                            <td>${info.TAKESEQ}</td>
                        </table>
                        <h4>고 객 상 담 표</h4>
                    </div>
                    <div class="print_content">
                        <h4>■ 기아용</h4>
                        <table class="kia1">
                            <colgroup>
                                <col style="width:2.5cm;">
                                <col style="width:3cm;">
                                <col style="width:1.5cm;">
                                <col style="width:3cm;">
                                <col style="width:1.5cm;">
                                <col style="width:3cm;">
                            </colgroup>
                            <tr>
                                <th>접수시간</th>
                                <td><fmt:formatDate value="${info.RECEIPTDATE}" pattern="HH:mm"/></td>
                                <th>착수시간</th>
                                <td><fmt:formatDate value="${info.REPAIRDATE}" pattern="HH:mm"/></td>
                                <th>완료예정시간</th>
                                <td><fmt:formatDate value="${info.ESTIME}" pattern="HH:mm"/></td>
                            </tr>
                            <tr>
                                <th>입고구분</th>
                                <td colspan="5"> □1년2만Km이내 신차&nbsp;&nbsp;&nbsp;&nbsp;□보증&nbsp;&nbsp;&nbsp;&nbsp;□정기점검&nbsp;&nbsp;&nbsp;&nbsp;□일반&nbsp;&nbsp;&nbsp;&nbsp;□사고(기타)</td>
                            </tr>
                            <tr>
                                <td style="border-left: none; border-right: none;height: 5px;"></td>
                                <td style="border-left: none; border-right: none;height: 5px;"></td>
                                <td style="border-left: none; border-right: none;height: 5px;"></td>
                                <td style="border-left: none; border-right: none;height: 5px;"></td>
                                <td style="border-left: none; border-right: none;height: 5px;"></td>
                                <td style="border-left: none; border-right: none;height: 5px;"></td>
                            </tr>
                            <tr>
                                <th>차량번호</th>
                                <td colspan="5" style="text-align: left;">${info.AUTONUMBER}</td>
                            </tr>
                            <tr>
                                <th>차종</th>
                                <td colspan="2" style="text-align: left;">${info.KIND}</td>
                                <th>주행거리</th>
                                <td colspan="2" style="text-align: right;">${info.KILRO_TOTAL}km</td>
                            </tr>
                        </table>
                        <!-- <table class="kia2">
                           <colgroup>
                            <col style="width:2.5cm;">
                            <col style="width:3cm;">
                            <col style="width:1.5cm;">
                            <col style="width:3cm;">
                            <col style="width:1.5cm;">
                            <col style="width:3cm;">
                            </colgroup>
                            
                        </table> -->
                        <h4>『고객상담 및 요청내용』</h4>
                        <table class="kia3">
                            <colgroup>
                                <col style="width: 8%;">
                                <col style="width: auto;">
                                <col style="width: auto;">
                                <col style="width: 17%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>고객 요청 사항</th>
                                    <th>점검정비필요사항(상담자의견)</th>
                                    <th>예상금액</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach begin="0" end="6" varStatus="status">
                                        <tr>
                                            <td style="text-align: center;">${status.count}</td>
                                            <td style="padding: 0 5px;">${repairs[status.index].REPAIRNAME}</td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="3">합계 금액 (공임 / 부품 합계, VAT 포함)</th>
                                    <td>￦</td>
                                </tr>
                            </tfoot>
                        </table>
                        <label style="font-size: 13px;">※상기 수리 내용 및 예상 금액은 실제 작업 과정 중 차이가 발생할 수 있습니다.</label>
                        <table class="kia4">
                            <colgroup>
                                <col style="width: 10%;height: 40px;">
                                <col style="width: 30%;">
                                <col style="width: 60%;">
                            </colgroup>
                            <tr>
                                <th rowspan="2">차량<br>상태<br>확인</th>
                                <td rowspan="2"> <img src="/images/car_disassemble.jpg"></td>
                                <td>■귀중품 보관여부 :</td>
                            </tr>
                            <tr>
                                <td>■기타 특이사항 :</td>
                            </tr>
                        </table>
                        <table class="kia5">
                            <tbody>
                                <tr>
                                    <td style="width: 3%;">※</td>
                                    <td colspan="2">상기 입력된 개인정보(차량종류, 차량번호, 주행거리 등) 및 기타 성명, 생년월일, 성별, 주소, 전화번호는 차량수리 시 고객관리 및 차량 관리서비스에 이용되며 정비내역과 함께 5년간 보유 후 파기됩니다. <br></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>본 정보는 수집, 이용을 거부하실 수 있으나 거부 시 서비스 제공에 제한이 있을 수 있습니다.</td>
                                    <td style="white-space: nowrap; text-align: right; padding-right: 3px;">□동의 □미동의</td>
                                </tr>
                                <tr>
                                    <td style="width: 3%;">※</td>
                                    <td>본인은 위 차량의 소유자(의뢰자)로서 귀사에 상기와 같이 수리를 의뢰하며 설명내용에 동의합니다.</td>
                                    <td style="white-space: nowrap; text-align: right; padding-right: 3px;">□동의 □미동의</td>
                                </tr>
                                <tr>
                                    <td style="width: 3%;">※</td>
                                    <td>유상수리로 교환된 부품은 직접수거 가능하며 미수거시 당사의 폐기물 처리규정에 의거 처리됩니다.</td>
                                    <td style="white-space: nowrap; text-align: right; padding-right: 3px;">□동의 □미동의</td>
                                </tr>
                                <tr>
                                    <td style="width: 3%;">※</td>
                                    <td colspan="2">당사에 보관 요청하지 않은 귀중품 분실에 대해서는 책임지지 않습니다. 고객님께서 직접 보관하여 주시기 바랍니다.</td>
                                </tr>
                                <tr>
                                    <td style="width: 3%;">※</td>
                                    <td colspan="2">정확한 진단 및 보안을 위해 차량용 블랙박스 전원은 OFF 합니다.</td>
                                </tr>
                                <tr>
                                    <td style="width: 3%;">※</td>
                                    <td colspan="2">차량관리를 위하여 소유자 및 소유자가 승인한 자에게 정비정보를 제공할 수 있습니다.</td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: left;padding-left: 6px;font-size: 13px;">본 차량의 상담 내용에 대하여 확인하며 작업을 요청합니다.</td>
                                </tr>
                                <tr>
                                    <c:set var="now" value="<%=new java.util.Date()%>"/>
                                    <c:set var="year"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
                                    <c:set var="month"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
                                    <c:set var="day"><fmt:formatDate value="${now}" pattern="dd" /></c:set> 
                                    <td colspan="3" style="text-align: right;font-size: 15px; padding-right: 5px;">${year}년 ${month}월 ${day}일</td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="text-align: right;font-size: 13px; padding-right: 5px;">상 담 자 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 고 객 명 <input type="text"> (서 명) <input type="text"></td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="hr">
                            <hr>
                            <span class="hr_txt">[ 절취선 ]</span>
                            <hr>
                        </div>

                        <h4>■ 고객용</h4>
                        <table class="kia6">
                            <colgroup>
                                <col style="width: 2.5cm;">
                                <col style="width: 2cm;">
                                <col style="width: 1.3cm;">
                                <col style="width: 2cm;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>소유자</th>
                                    <th style=" width: 45px;">성 명</th>
                                    <td colspan="2" class="txt_left">${info.CUSTOMER_NAME}</td>
                                    <th style=" width: 130px;">휴 대 폰 번 호</th>
                                    <td class="txt_left">${info.CUSTOMER_TEL}</td>
                                </tr>
                                <tr>
                                    <th rowspan="2">정 비 의 뢰 자</th>
                                    <th>성 명</th>
                                    <td colspan="2"></td>
                                    <th>휴 대 폰 번 호</th>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th colspan="2">소유자와의 관계</th>
                                    <td colspan="3" style="text-align-last: justify;padding: 0 5px;">가족/친척, 회사직원, KMC직원, 친구, 기타(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;)</td>
                                </tr>

                            </tbody>
                        </table>
                        <label style="font-size: 11px;">※ 정확한 진단 및 보안을 위해 차량용 블랙박스의 전원을 OFF하오니 양해 바랍니다.</label>
                        
                    </div>
                    <div class="print_footer">
                        <img src="/images/gray_logo.png">
                    </div>
                </div>

            </div>
        </div>
</body>
</html>

<script>
    // $(document).ready(function () {
    //     // $(".subpage").print();
    //     window.print();
    // });
    
    $(document).ready(function () {
		let $container = $(".page").clone() // 프린트 할 특정 영역 복사
		//  container.print();
		let cssText = "" // 스타일 복사
		for (const node of $("style")) {
			cssText += node.innerHTML
		}
		console.log($container[1]);
		// 팝업 
		let innerHtml = $container[0].innerHTML
		let popupWindow = window.open("", "_blank", 'width=840px,height=1000px')
		popupWindow.document.write("<!DOCTYPE html>" +
			"<html>" +
			"<head>" +
			"<style>" + cssText + "</style>" +
			"</head>" +
			"<body>" + innerHtml + "</body>" +
			"</html>")

		popupWindow.document.close()
		popupWindow.focus()

		// 1초 지연 
		setTimeout(() => {
			popupWindow.print() // 팝업의 프린트 도구 시작
			// popupWindow.close() // 프린트 도구 닫혔을 경우 팝업 닫기
		}, 1000)
    });
    
    
</script>