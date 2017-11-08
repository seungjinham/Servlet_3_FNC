<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String kind=request.getParameter("kind");
	String search=request.getParameter("search");	
	int curPage=1;
	
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){
		e.printStackTrace();
	}
	
	if(kind==null) {
		kind="id";
	}
	if(search==null) {
		search="";
	}
	
	int perPage=10;	
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;	
	
	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> list = memberDAO.selectList(startRow,lastRow,kind,search);
	
	int totalCount=memberDAO.getTotalCount(kind,search);
	
	int totalPage=0;
	
	if(totalCount%perPage==0) {
		totalPage=totalCount/perPage;
	} else {
		totalPage=totalCount/perPage+1;
	}
	
	int perBlock=5;
	int totalBlock=0;
	
	if(totalPage%perBlock==0) {
		totalBlock=totalPage/perBlock;
	} else{
		totalBlock=totalPage/perBlock+1;
	}
	
	int curBlock=0;
	if(curPage%perBlock==0) {
		curBlock=curPage/perBlock;
	} else{
		curBlock=curPage/perBlock+1;
	}
	
	int startNum=(curBlock-1)*perBlock+1;
	int lastNum=curBlock*perBlock;
	
	if(curBlock==totalBlock) {
		lastNum=totalPage;
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>
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
	<%@ include file="../temp/header.jsp" %>
	<section id="main">
		<h1>Member List</h1>
		<article id="list">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>EMAIL</th>
						<th>PHONE</th>
						<th>AGE</th>
					</tr>		
				</thead>
				<tbody>	
					<%for(MemberDTO mDto: list) {%>
						<tr>
							<td><%=mDto.getId() %></td>
							<td><%=mDto.getName() %></td>
							<td><%=mDto.getEmail() %></td>
							<td><%=mDto.getPhone() %></td>
							<td><%=mDto.getAge() %></td>
						</tr>
					<%} %>
				</tbody>	
			</table>
			<div class="container">               
 				<ul class="pagination"> 					
 					<%if(curBlock>1) {%>
 						<li><a href="./MemberList.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[prev]</a></li>
 					<%} %>
    				<%for(int i=startNum; i<=lastNum; i++){ %>
    					<li><a href="./MemberList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i %></a></li>
    				<%} %>
    				<%if(curBlock<totalBlock) {%>
    					<li><a href="./MemberList.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[next]</a></li>
    				<%} %>
  				</ul>
			</div>
			<form action="./MemberList.jsp">
				<input type="hidden" name="curPage">
				<select name="kind">
					<option value="id">ID</option>
					<option value="name">NAME</option>
					<option value="email">E-MAIL</option>
				</select>
			<input type="text" name="search">
			<input type="submit" value="SEARCH">
			</form>
			<a class="btn btn-success" href="./MemberJoinForm.jsp">join</a>
		</article>
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>