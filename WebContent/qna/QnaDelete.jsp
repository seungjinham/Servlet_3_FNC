<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	
	QnaDAO qnaDAO=new QnaDAO();
	int result=qnaDAO.delete(num);
	
	String s="Delete Fail";
	if(result>0) {
		s="Delete Success";
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
<title>QnA Delete</title>
</head>
<body>

</body>
</html>