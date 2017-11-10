<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	QnaDTO qnaDTO=new QnaDTO();
	qnaDTO.setTitle(request.getParameter("title"));
	qnaDTO.setContents(request.getParameter("contents"));
	qnaDTO.setWriter(request.getParameter("writer"));
	
	QnaDAO qnaDAO=new QnaDAO();
	int result=qnaDAO.insert(qnaDTO);
	
	String s="QnA Write Fail";
	if(result>0) {
		s="QnA Write Success";
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
<title>QnA Write Process</title>
</head>
<body>

</body>
</html>