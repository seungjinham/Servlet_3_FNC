<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
	
	MemberDAO memberDAO=new MemberDAO();
	int result=memberDAO.delete(memberDTO.getId());
	
	String s="Delete Fail";
	if(result>0) {
		s="Delete Success";
		session.invalidate();
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