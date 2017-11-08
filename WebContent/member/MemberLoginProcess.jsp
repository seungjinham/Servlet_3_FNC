<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO=new MemberDTO();
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setJob(request.getParameter("job"));
	
	MemberDAO memberDAO = new MemberDAO();
	memberDTO=memberDAO.selectOne(memberDTO);
	
	//redirect
	String path="./MemberLoginForm.jsp";
	
	if(memberDTO != null) {
		path="../index.jsp";	
	}
	response.sendRedirect(path);
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