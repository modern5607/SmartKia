/*캘린더*/
	$(document).ready(function () {
    $.datepicker.regional['ko'] = {
        prevText: '이전달',
        nextText: '다음달',
        monthNames: ['1월','2월','3월','4월','5월','6월',
        '7월','8월','9월','10월','11월','12월'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
        '7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        weekHeader: 'Wk',
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '',
        showOn: 'both', 
        buttonImage: '/SmartKia/images/ico_calendar.png', 
        buttonImageOnly: true,
        yearRange: 'c-99:c+99',
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);

    $('#sdate').datepicker();
    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#edate").datepicker( "option", "minDate", selectedDate );
    $('img.ui-datepicker-trigger').attr('style','position:relative; right:25px; top:15px; cursor:pointer;');
    });
    

    $('#edate').datepicker();
    $('#edate').datepicker("option", "minDate", $("#sdate").val());
    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#sdate").datepicker( "option", "maxDate", selectedDate );
    $('img.ui-datepicker-trigger').attr('style','position:relative; right:25px; top:15px; cursor:pointer;');
    });
    $('img.ui-datepicker-trigger').attr('style','position:relative; right:25px; top:15px; cursor:pointer;');
});