<%@page import="com.iu.files.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int num=Integer.parseInt(request.getParameter("num"));
	QnaDAO qnaDAO=new QnaDAO();

	int result=qnaDAO.hitUpdate(num);
	QnaDTO qnaDTO=qnaDAO.selectOne(num);
	FileDAO fileDAO = new FileDAO();
	ArrayList<FileDTO> list = fileDAO.selectList(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA View</title>
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
		<h1>QnA View</h1>
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
					<td><%=qnaDTO.getTitle()%></td>
					<td><%=qnaDTO.getWriter()%></td>
					<td><%=qnaDTO.getReg_date()%></td>
					<td><%=qnaDTO.getHit()%></td>
				</tr>
				<tr>
					<td colspan="4"><%=qnaDTO.getContents()%></td>
				</tr>
			</tbody>
		</table>
		
				<div>
			<%for(int i=0; i<list.size(); i++)  {%>
				<p>
					<a href="../upload/<%=list.get(i).getfName() %>"><%=list.get(i).getoName() %></a>
				</p>
			<%} %>
		</div>
		
		<a href="../upload/"></a>		
		
		<%
		try{
			if( memberDTO != null && qnaDTO.getWriter().equals(memberDTO.getId()) ){ %>
				<a class="btn btn-info" href="./QnaDelete.jsp?num=<%=qnaDTO.getNum()%>">Delete</a>
				<a class="btn btn-info" href="./QnaUpdateForm.jsp?num=<%=qnaDTO.getNum()%>">Update</a>
			<%}
			else if(memberDTO != null) {%>
				<a class="btn btn-warning" href="./replyWriteForm.jsp?num=<%=qnaDTO.getNum()%>">Reply</a>
			<%}
		} catch(Exception e) {
			e.printStackTrace();
		} %>
		<a class="btn btn-info" href="./QnaList.jsp">List</a>
	</article>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>