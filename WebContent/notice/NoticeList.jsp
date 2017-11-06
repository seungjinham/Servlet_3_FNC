<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
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
	} catch(Exception e) {
		e.printStackTrace();
	}

	if(kind==null) {
		kind="title";
	}
	if(search==null) {
		search="";
	}
	
	int perPage=10;
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;
	
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<NoticeDTO> list= noticeDAO.selectList(startRow,lastRow,kind,search);
	///////////////////////////////////////////////////////////////
	int totalCount=noticeDAO.getTotalCount();
	int totalPage=0;
	if(totalCount%perPage==0) {
		totalPage=totalCount/perPage;
	} else {
		totalPage=totalCount/perPage +1;
	}
	
	int perBlock=5;
	int totalBlock=0;
	
	if(totalPage%perBlock==0){
		totalBlock=totalPage/perBlock;
	} else{
		totalBlock=totalPage/perBlock+1;
	}

	//curPage를 이용해서 curBlock구하기
	int curBlock=0;
	
	if(curPage%perBlock==0) {
		curBlock=curPage/perBlock;
	} else{
		curBlock=curPage/perBlock+1;
	}
	
	//curBlock, startNum, lastNum
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
<title>Notice List</title>

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
	<%@ include file= "../temp/header.jsp" %>

	<section id="main">
		<h1>Notice List<%=totalCount %></h1>
		<article id="list">
			<table class="table table-hover">
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
				<%for(NoticeDTO noticeDTO: list) {%>
					<tr>
						<td><%=noticeDTO.getNum() %></td>
						<td><a href="./NoticeView.jsp?num=<%=noticeDTO.getNum() %>"><%=noticeDTO.getTitle() %></a></td>
						<td><%=noticeDTO.getWriter() %></td>
						<td><%=noticeDTO.getReg_date() %></td>
						<td><%=noticeDTO.getHit() %></td>
					</tr>
				<%} %>
			</table>
			<div class="container">               
 				<ul class="pagination"> 					
 					<%if(curBlock>1) {%>
 						<li><a href="./NoticeList.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">[이전]</a></li>
 					<%} %>
    				<%for(int i=startNum; i<=lastNum; i++){ %>
    					<li><a href="./NoticeList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i %></a></li>
    				<%} %>
    				<%if(curBlock<totalBlock) {%>
    					<li><a href="./NoticeList.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">[다음]</a></li>
    				<%} %>
  				</ul>
			</div>
			<form action="./NoticeList.jsp">
				<select name="kind">
					<option value="title">TITLE</option>
					<option value="writer">WRITER</option>
					<option value="contents">CONTENTS</option>
				</select>
			<input type="text" name="search">
			<input type="submit" value="SEARCH">
			</form>
			<a class="btn btn-success" href="./NoticeWriterForm.jsp">write</a>
		</article>
	</section>
	
	<%@ include file="../temp/footer.jsp" %>
	
</body>
</html>