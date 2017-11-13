<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
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
	File f = new File(save);
	if(!f.exists()) {
		f.mkdirs();
	}
	
	MultipartRequest multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	//파일 업로드시에는 multi에서 꺼내야함
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setWriter(multi.getParameter("writer"));
	noticeDTO.setTitle(multi.getParameter("contents"));
	noticeDTO.setContents(multi.getParameter("contents"));
	
	String name=request.getParameter("f1");
	System.out.println(name);
	NoticeDAO noticeDAO=new NoticeDAO();
	//int result=noticeDAO.insert(noticeDTO);
	int result=0;
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