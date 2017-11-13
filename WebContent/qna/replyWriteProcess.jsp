<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.files.FileDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String save = session.getServletContext().getRealPath("upload");
	int maxSize = 1024*1024*10;
	File f = new File(save);
	if(f.exists()) {
		f.mkdir();
	}
	MultipartRequest multi = new MultipartRequest(request,save,maxSize,"UTF-8",new DefaultFileRenamePolicy());
		
	QnaDTO qnaDTO = new QnaDTO();
	qnaDTO.setNum(Integer.parseInt(multi.getParameter("num")));
	qnaDTO.setWriter(multi.getParameter("writer"));
	qnaDTO.setTitle(multi.getParameter("title"));
	qnaDTO.setContents(multi.getParameter("contents"));
	
	String oName=multi.getOriginalFileName("f1");
	String fName=multi.getFilesystemName("f1");
	
	QnaDAO qnaDAO = new QnaDAO();
	int result = qnaDAO.getNum();
	QnaDTO parent = qnaDAO.selectOne(qnaDTO.getNum());
	//update -> step+1
	qnaDAO.replyUpdate(parent);
	qnaDTO.setNum(result);
	qnaDAO.replyInsert(qnaDTO, parent);
	
	FileDTO fileDTO = new FileDTO();
	fileDTO.setoName(oName);
	fileDTO.setfName(fName);
	fileDTO.setNum(result);
	
	FileDAO fileDAO = new FileDAO();
	result = fileDAO.insert(fileDTO);
	
	String s="Reply Fail";
	if(result>0) {
		s="Reply Success";
	}
	
	request.setAttribute("message", s);
	request.setAttribute("path", "./QnaList.jsp");
	
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
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