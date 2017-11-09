<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String kind=request.getParameter("kind");
	String search=request.getParameter("search");
	int curPage=1;	
	
	QnaDAO qnaDAO = new QnaDAO();
	ArrayList<QnaDTO> list = qnaDAO.selectList();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA LIST</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	h1{
		width: 30%;
		margin: 0 auto;
		text-align: center;
	}
	#list {
		width:75%;
		margin:0 auto;
		margin-top: 100px;
		margin-bottom: 100px;
	}
	.container .pagination {
		margin: 0 auto;
	}
</style>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	<section id="main">
		<h1>QnA List</h1>
		<article id="list">
			<table class="table table-hover">
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
				<%for(QnaDTO qnaDTO:list){ %>
					<tr>
						<td><%=qnaDTO.getNum() %></td>
						<td><%=qnaDTO.getTitle() %></td>
						<td><%=qnaDTO.getWriter() %></td>
						<td><%=qnaDTO.getReg_date() %></td>
						<td><%=qnaDTO.getHit() %></td>
					</tr>
				<%} %>
			</table>
			<div class="container">               
 				<ul class="pagination">	
 				
 				</ul>
 			</div>
			<a class="btn btn-primary" href="./QnaWriteForm.jsp">WRITE</a>
		</article>	
	</section>
	
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>