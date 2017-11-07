<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Join Form</title>
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
<script type="text/javascript">
	window.onload=function() {
		var btn=document.getElementById("btn");
		btn.addEventListener("click",function(){
			var id=document.frm.id.value;
			window.open("MemberIdCheck.jsp?id="+id, "", "top=200, left=300, width=400, height=300");
		});
		
		var pw=document.frm.pw.value;
		var pw2=document.frm.pw2.value;
		var name=document.frm.name.value;
		var email=document.frm.email.value;
		var phone=document.frm.phone.value;
		var age=document.frm.phone.value;
		var pwC=true;
		var pw2C=true;
		var nameC=true;
		var emailC=true;
		var phoneC=true;
		var ageC=true;
		
		if(pw==null) {
			pwC=false;
		}else {
			
		}
		
		
		
	}
</script>
</head>
<body>
	<%@ include file= "../temp/header.jsp" %>
	<section id="main">
	<h1>Member Join Add GitHub</h1>
		<form name="frm" class="form-horizontal" action="MemberJoinProcess.jsp" method="post">
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="id">ID:</label>
 				<div class="col-sm-10">
 					<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
 					<input type="button" id="btn" class="btn btn-default" value="중복확인">	
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="pw">PW:</label>
 				<div class="col-sm-10"> 
 					<input type="password" class="form-control" id="pw" placeholder="Enter pw" name="pw">
 				</div>
 			</div>
 			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">PW CHECK:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pw2" placeholder="Enter Pw">
				</div>
			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="name">NAME:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
 				</div>
 			</div> 		
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="email">E-MAIL:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="phone">PHONE:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control" id="phone" placeholder="Enter phone" name="phone">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="age">AGE:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control" id="age" placeholder="Enter age" name="age">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="job">JOB:</label>
 				<div class="col-sm-10"> 
 					<input type="radio" value="S" class="radio-inline" id="age" name="age" checked="checked">STUDENT
 					<input type="radio" value="T" class="radio-inline" id="age" name="age">TEACHER
 				</div>
 			</div>

 			<div class="form-group"> 
 				<div class="col-sm-offset-2 col-sm-10">
 					<button type="submit" class="btn btn-default" name="submit">Submit</button>
 				</div>
 			</div>
 		</form>
	</section>

	<%@ include file= "../temp/footer.jsp" %>
</body>
</html>
