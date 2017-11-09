<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member My Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	h1{
		width: 75%;
		margin: 0 auto;
		margin-top: 50px;
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
	<%@include file="../temp/header.jsp" %>
	<section id="main">
		<h1>Member My Page</h1>
		<article id="list">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>EMAIL</th>
						<th>PHONE</th>
						<th>AGE</th>
						<th>JOB</th>
					</tr>		
				</thead>
				<tbody>	
					<tr>
						<td><%=memberDTO.getId() %></td>
						<td><%=memberDTO.getName() %></td>
						<td><%=memberDTO.getEmail() %></td>
						<td><%=memberDTO.getPhone() %></td>
						<td><%=memberDTO.getAge() %></td>
						<td><%=memberDTO.getJob() %></td>
					</tr>
				</tbody>	
			</table>
			<div>
				<a class="btn btn-info" href="./MemberUpdateForm.jsp?id=<%=memberDTO.getId()%>">UPDATE</a>
				<a class="btn btn-danger" href="./MemberDelete.jsp?id=<%=memberDTO.getId()%>">DELETE</a>
				
			</div>
		</article>
	</section>
	<%@include file="../temp/footer.jsp" %>
</body>
</html>