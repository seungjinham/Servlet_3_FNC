<%@page import="com.iu.qna.QnaDAO"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	QnaDTO qnaDTO=new QnaDTO();
	
	qnaDTO.setNum(Integer.parseInt(request.getParameter("num")));
	qnaDTO.setTitle(request.getParameter("title"));
	qnaDTO.setContents(request.getParameter("contents"));
		
	QnaDAO qnaDAO=new QnaDAO();
	int result=qnaDAO.update(qnaDTO);
	
	String s="Update Fail";
	if(result>0) {
		s="Update Success";
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
<title>QnA Update Process</title>
</head>
<body>

</body>
</html>