<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA Write Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	<%@ include file="../temp/header.jsp" %>
	<section id="main">
	<h1>QnA Write Form</h1>
		<form class="form-horizontal" action="QnaWriteProcess.jsp" method="post">
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="writer">WRITER:</label>
 				<div class="col-sm-10">
 					<input type="text" class="form-control" id="writer" value="<%=memberDTO.getId() %>" name="writer">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="title">TITLE:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="contents">CONTENTS:</label>
 				<div class="col-sm-10"> 
 					<textarea class="form-control" rows="5" id="contents" placeholder="Enter contents" name="contents"></textarea>
 				</div>
 			</div> 			
 			<div class="form-group"> 
 				<div class="col-sm-offset-2 col-sm-10">
 					<button type="submit" class="btn btn-success">Submit</button>
 				</div>
 			</div>
 		</form>
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>