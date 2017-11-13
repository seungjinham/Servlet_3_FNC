<%@page import="com.iu.notice.NoticeDTO"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num=Integer.parseInt(request.getParameter("num"));
	NoticeDAO noticeDAO=new NoticeDAO();
	NoticeDTO noticeDTO=noticeDAO.selectOne(num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice Update Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/4.7.3/full/ckeditor.js"></script>
<script type="text/javascript">
	window.onload=function(){
		CKEDITOR.replace('contents');
	}
</script>
<link href="../css/header.css" rel="stylesheet">
<style type="text/css">
	h1{
		width: 30%;
		margin: 0 auto;
		text-align: center;
		margin-bottom: 50px;
	}
	#main {
		margin-top: 100px;
		width: 90%;
	}
</style>
</head>
<body>
	<%@ include file= "../temp/header.jsp" %>
	<section id="main">
		<h1>Update Form</h1>
		<form class="form-horizontal" action="NoticeUpdateProcess.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" value=<%=noticeDTO.getNum()%> name="num">
			<input type="hidden" value=<%=noticeDTO.getReg_date()%> name="reg_date">
			<input type="hidden" value=<%=noticeDTO.getHit()%> name="hit">
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="writer">WRITER:</label>
 				<div class="col-sm-10">
 					<input type="text" class="form-control" id="writer" name="writer" value="<%=noticeDTO.getWriter()%>" readonly="readonly">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="title">TITLE:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control" id="title" name="title" value="<%=noticeDTO.getTitle()%>">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="contents">CONTENTS:</label>
 				<div class="col-sm-10"> 
 					<textarea class="form-control" rows="5" id="contents" name="contents"><%=noticeDTO.getContents()%></textarea>
 				</div>
 			</div> 		
 			
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="f1">FILE:</label>
 				<div class="col-sm-10"> 
 					<input type="file" class="form-control" name="f1">
 				</div>
 			</div> 
 				
 			<div class="form-group"> 
 				<div class="col-sm-offset-2 col-sm-10">
 					<button type="submit" class="btn btn-default">Submit</button>
 				</div>
 			</div>
 		</form>
	</section>

	<%@ include file= "../temp/footer.jsp" %>
</body>
</html>