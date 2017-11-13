<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int maxSize=1024*1024*10;//파일크기
	String save=session.getServletContext().getRealPath("upload");
	System.out.println(save);
	//MultipartRequest multi = new MultipartRequest(request, "", maxSize, "UTF-8", null);
	
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setWriter(request.getParameter("writer"));
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));
	String name =request.getParameter("f1");
	System.out.println(name);
	NoticeDAO noticeDAO = new NoticeDAO();
	//int result=noticeDAO.insert(noticeDTO);
	int result=0;
	String s ="Fail";
	if(result>0){
		s = "Success";
	}
	
	request.setAttribute("message", s);
	request.setAttribute("path", "noticeList.jsp");
	//1 Foward
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