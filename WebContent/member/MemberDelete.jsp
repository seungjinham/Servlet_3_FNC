<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String id=request.getParameter("id");
	
	MemberDAO memberDAO=new MemberDAO();
	int result=memberDAO.delete(id);
	
	String s="Delete Fail";
	if(result>0) {
		s="Delete Success";
	}
	
	request.setAttribute("message", s);
	request.setAttribute("path", "../index.jsp");
	RequestDispatcher view= request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
	
	//memberDTO를 null로 만들어야됨
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