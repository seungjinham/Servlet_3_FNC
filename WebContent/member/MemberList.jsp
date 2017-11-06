<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int curPage=1;
	
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){
		e.printStackTrace();
	}
	
	int perPage=10;	
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;	
	
	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> list = memberDAO.selectList(startRow,lastRow);
	
	int totalCount=memberDAO.getTotalCount();
	
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
		width: 30%;
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
</head>
<body>	
	<section id="main">
		<h1>Member List</h1>
		<article id="list">
			<table class="table table-hover">
				<tr>
					<th>ID</th>
					<th>NAME</th>
					<th>EMAIL</th>
					<th>PHONE</th>
					<th>AGE</th>
				</tr>					
				<%for(MemberDTO memberDTO: list) {%>
					<tr>
						<td><%=memberDTO.getId() %></td>
						<td><%=memberDTO.getName() %></td>
						<td><%=memberDTO.getEmail() %></td>
						<td><%=memberDTO.getPhone() %></td>
						<td><%=memberDTO.getAge() %></td>
					</tr>
				<%} %>
			</table>
			<div class="container">               
 				<ul class="pagination"> 					
 					<%if(curBlock>1) {%>
 						<li><a href="./MemberList.jsp?curPage=<%=startNum-1%>">[prev]</a></li>
 					<%} %>
    				<%for(int i=startNum; i<=lastNum; i++){ %>
    					<li><a href="./MemberList.jsp?curPage=<%=i%>"><%=i %></a></li>
    				<%} %>
    				<%if(curBlock<totalBlock) {%>
    					<li><a href="./MemberList.jsp?curPage=<%=lastNum+1%>">[next]</a></li>
    				<%} %>
  				</ul>
			</div>
		</article>
	</section>
</body>
</html>