<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.files.FileDTO"%>
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
	
	String save=session.getServletContext().getRealPath("upload");
	int maxSize=1024*1024*10;//파일크기
	File f = new File(save);
	if(!f.exists()) {
		f.mkdirs();
	}
	
	MultipartRequest multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	//파일 업로드시에는 multi에서 꺼내야함
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setWriter(multi.getParameter("writer"));
	noticeDTO.setTitle(multi.getParameter("title"));
	noticeDTO.setContents(multi.getParameter("contents"));
	
	String oName=multi.getOriginalFileName("f1");
	String fName=multi.getFilesystemName("f1");
	
	NoticeDAO noticeDAO=new NoticeDAO();
	int result=noticeDAO.getNum();
	noticeDTO.setNum(result);
	noticeDAO.insert(noticeDTO);
		
	FileDTO fileDTO = new FileDTO();
	fileDTO.setoName(oName);
	fileDTO.setfName(fName);
	fileDTO.setNum(result);
	
	FileDAO fileDAO = new FileDAO();
	result = fileDAO.insert(fileDTO);
	
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