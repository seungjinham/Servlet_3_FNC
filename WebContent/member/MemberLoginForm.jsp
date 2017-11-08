<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] ar=request.getCookies();
	String cId="";
	
	for(int i=0; i<ar.length; i++) {
		if(ar[i].getName().equals("id")){
			cId=ar[i].getValue();
			break;
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Login Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="../css/header.css" rel="stylesheet">
<style type="text/css">
	h1{
		width: 50%;
		margin: 0 auto;
		text-align: center;
		margin-top: 100px;
		margin-bottom: 50px;
	}
	#main {
		margin: 0 auto;
		width: 25%;
	}
</style>
</head>
<body>
<%@ include file= "../temp/header.jsp" %>
	<section id="main">
	<h1>Member Join</h1>
		<form name="frm" class="form-horizontal" action="MemberLoginProcess.jsp" method="post">
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="job">JOB:</label>
 				<div class="col-sm-10"> 
 					<input type="radio" value="S" class="radio-inline" id="job" name="job" checked="checked">STUDENT
 					<input type="radio" value="T" class="radio-inline" id="job" name="job">TEACHER
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="id">ID:</label>
 				<div class="col-sm-10">
 					<input type="text" class="form-control" value="<%= cId %>" id="id" placeholder="Enter id" name="id">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="job">ID저장하기:</label>
 				<div class="col-sm-10"> 
 					<input type="checkbox" value="save" class="checkbox-inline" name="save">

 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="pw">PW:</label>
 				<div class="col-sm-10"> 
 					<input type="password" class="form-control member" id="pw" placeholder="Enter pw" name="pw">
 				</div>
 			</div>

 			<div class="form-group"> 
 				<div class="col-sm-offset-2 col-sm-10">
 					<input type="submit" id="check" value="LOGIN">
 				</div>
 			</div>
 		</form>
	</section>

	<%@ include file= "../temp/footer.jsp" %>
</body>
</html>