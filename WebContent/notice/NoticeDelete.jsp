<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO noticeDAO=new NoticeDAO();
	int result=noticeDAO.delete(num);
	
	String s="Delete Fail";
	if(result>0) {
		s="Delete Success";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice Delete</title>
<script type="text/javascript">
	alert('<%=s%>');
	location.href="./NoticeList.jsp";
</script>
</head>
<body>
</body>
</html>