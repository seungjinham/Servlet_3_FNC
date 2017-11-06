<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.NoticeDAO"%>
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
	if(kind==null){
		kind="title";
	}
	if(search==null){
		search="";
	}
	
	int perPage=10;
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;
	NoticeDAO noticeDAO = new NoticeDAO();
	ArrayList<NoticeDTO> ar = noticeDAO.selectList(startRow,lastRow,kind,search);
	///////////////////////////////////////////
	//pageing
	int totalCount = noticeDAO.getTotalCount();
	int totalPage=0;
	if(totalCount%perPage==0){
		totalPage=totalCount/perPage;
	}else {
		totalPage=totalCount/perPage+1;
	}
	
	//totalBlock
	int perBlock=5;
	int totalBlock=0;
	if(totalPage%perBlock==0){
		totalBlock=totalPage/perBlock;
	}else {
		totalBlock=totalPage/perBlock+1;
	}
	//curPage를 이용해서 curBlock 구하기
	int curBlock=0;
	if(curPage%perBlock==0){
		curBlock=curPage/perBlock;
	}else {
		curBlock=curPage/perBlock+1;
	}
	
	//curBlock , startNum, lastNum
	int startNum=(curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	
	if(curBlock==totalBlock){
		lastNum=totalPage;
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	
	h1 {
		width: 30%;
		margin: 0 auto;
		text-align: center;
	}
	#list {
		width: 75%;
		margin: 0 auto;
		margin-top: 100px;
	}
</style>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	<section id="main">
		<h1>Notice List <%= totalCount%></h1>
		<article id="list">
			<table class="table table-hover">
				<tr>
					<th>NO</th>
					<td>TITLE</td>
					<td>WRITER</td>
					<td>DATE</td>
					<td>HIT</td>
				</tr>
				<% for(NoticeDTO noticeDTO: ar){ %>
				<tr>
					<td><%=noticeDTO.getNum()%> </td>
					<td><a href="noticeView.jsp?num=<%=noticeDTO.getNum()%>"><%=noticeDTO.getTitle()%></a> </td>
					<td><%=noticeDTO.getWriter()%></td>
					<td><%=noticeDTO.getReg_date()%> </td>
					<td><%=noticeDTO.getHit()%> </td>	
				</tr>
				<%} %>
			</table>
			
			<!-- pageing -->
			<div class="container">
  
  <ul class="pagination">
  	<% if(curBlock>1){ %>
  	 <li><a href="./noticeList.jsp?curPage=<%=startNum-1%>">[이전]</a></li>
  	 <%} %>
  
    <%	for(int i=startNum;i<=lastNum;i++){ %>
    
    <li><a href="./noticeList.jsp?curPage=<%=i%>"><%=i %></a></li>
    
    <%} %>
    
    <%if(curBlock < totalBlock){ %>
    <li><a href="./noticeList.jsp?curPage=<%=lastNum+1%>">[다음]</a></li>
    <%} %>
  </ul>
</div>
	<!-- end -->
	<!-- search 제목, 작성자, 내용 -->
	<form action="./noticeList.jsp">
		<select name="kind">
			<option value="title">Title</option>
			<option value="writer">Writer</option>
			<option value="contents">Contents</option>
		</select>
		<input type="text" name="search">
		<input type="submit" value="SEARCH">
	</form>
	<!-- search -->		
			
			<a class="btn btn-success" href="./noticeWriteForm.jsp">WRITE</a>
		</article>
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>