<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	MemberDTO memberDTO=(MemberDTO)session.getAttribute("member"); 
	memberDTO.setId(((MemberDTO)session.getAttribute("member")).getId());
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	memberDTO.setAge(Integer.parseInt(request.getParameter("age")));
	
	MemberDAO memberDAO= new MemberDAO();
	int result=memberDAO.update(memberDTO);
	
	if(result>0) {
		memberDTO.setJob(((MemberDTO)session.getAttribute("member")).getJob());
		session.setAttribute("member",memberDTO);
	}

	response.sendRedirect("./MemberMyPage.jsp");

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