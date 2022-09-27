<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
    function NotReload() {
        if ((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116)) {
            event.keyCode = 0;
            event.cancelBubble = true;
            event.returnValue = false;
        }
    }
    document.onkeydown = NotReload;

    var msg = "<c:out value='${msg}'/>";
    var url = "<c:out value='${url}'/>";
    
    if (url == '')
        window.history.back();
    else
        location.href = url;
        alert(msg);
</script>