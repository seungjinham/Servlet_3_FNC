<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	NoticeDAO noticeDAO=new NoticeDAO();
	
	int result=noticeDAO.hitUpdate(num);
	NoticeDTO noticeDTO=noticeDAO.selectOne(num);	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice View</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">	
	h1{
		width: 30%;
		margin: 0 auto;
		text-align: center;
		margin-bottom: 50px;
	}
	#list {
		width:75%;
		margin:0 auto;
		margin-top: 100px;
	}
</style>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<h1>Notice View</h1>
		<article id="list">
		<table class="table">
			<thead>
				<tr>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=noticeDTO.getTitle()%></td>
					<td><%=noticeDTO.getWriter()%></td>
					<td><%=noticeDTO.getReg_date()%></td>
					<td><%=noticeDTO.getHit()%></td>
				</tr>
				<tr>
					<td colspan="4"><%=noticeDTO.getContents()%></td>
				</tr>
			</tbody>
		</table>
		<a class="btn btn-info" href="./NoticeDelete.jsp?num=<%=noticeDTO.getNum()%>">Delete</a>
		<a class="btn btn-info" href="./NoticeUpdateForm.jsp?num=<%=noticeDTO.getNum()%>">Update</a>
		<a class="btn btn-info" href="./NoticeList.jsp">List</a>
	</article>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>