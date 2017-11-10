<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s = (String)request.getAttribute("message");
	String path=(String)request.getAttribute("path");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=s%>');
	location.href="<%=path%>";
</script>
</head>
<body>

</body>
</html>