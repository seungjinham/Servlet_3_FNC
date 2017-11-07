<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDTO noticeDTO=new NoticeDTO();
	noticeDTO.setWriter(request.getParameter("writer"));
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));
	
	NoticeDAO noticeDAO=new NoticeDAO();
	int result=noticeDAO.insert(noticeDTO);
	
	String s="Write Fail";
	if(result>0) {
		s="Write Success";
	}
	request.setAttribute("message", s);
	request.setAttribute("path","../index.jsp");
	
	//1. Foward
	
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
	
	
	//2. redirect
	//response.sendRedirect("../common/result.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>