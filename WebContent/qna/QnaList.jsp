<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
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
	
	int perPage=5;
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;
	
	QnaDAO qnaDAO = new QnaDAO();
	ArrayList<QnaDTO> list = qnaDAO.selectList(startRow, lastRow);
	
	int totalCount=qnaDAO.getTotalCount();
	int totalPage=0;
	
	if(totalCount%perPage==0) {
		totalPage=totalCount/perPage;
	}else{
		totalPage=totalCount/perPage+1;
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
						<td><a href="./QnaView.jsp?num=<%=qnaDTO.getNum()%>"><%=qnaDTO.getTitle() %></a></td>
						<td><%=qnaDTO.getWriter() %></td>
						<td><%=qnaDTO.getReg_date() %></td>
						<td><%=qnaDTO.getHit() %></td>
					</tr>
				<%} %>
			</table>
			<div class="container">               
 				<ul class="pagination">	
 					<%if(curBlock>1){ %>
 						<li><a href="./QnaList.jsp?curPage=<%=startNum-1%>">[이전]</a></li>
 					<%} %>
 					<%for(int i=startNum; i<=lastNum; i++) {%>
 						<li><a href="./QnaList.jsp?curPage=<%=i%>"><%=i %></a></li>
 					<%} %>
 					<%if(curBlock < totalBlock) {%>
 						<li><a href="./QnaList.jsp?curPage=<%=lastNum+1%>">[다음]</a></li>
 					<%} %>
 				</ul>
 			</div>
			<%if(memberDTO != null) {%>
				<a class="btn btn-success" href="./QnaWriteForm.jsp">write</a>
			<%} %>
		</article>	
	</section>
	
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>