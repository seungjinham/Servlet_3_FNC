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
		
		var result=true;
		var result2=true;
		
		var check = document.getElementById("check");
			check.addEventListener("click", function(){
			var idCheck=document.frm.idCheck.value;
			var member = document.getElementsByClassName("member");
			
			for(var i=0;i<member.length;i++){
				if(member[i].value==""){
					result=false;
				}
			}
			
			if(member[0].value != member[1].value){
				result2=false;
			}
			
			if(result && result2 && idCheck=="1"){
				document.frm.submit();
			}else {
				alert("모두 입력하세요");
			}
			
		});
			
		var id=document.getElementById("id");
		id.addEventListener("change",function(){
			document.frm.idCheck.value="0";
		});
	}
</script>
</head>
<body>
	<%@ include file= "../temp/header.jsp" %>
	<section id="main">
	<h1>Member Join</h1>
		<form name="frm" class="form-horizontal" action="MemberJoinProcess.jsp" method="post">
			<input type="hidden" name="idCheck" value="0">
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="id">ID:</label>
 				<div class="col-sm-10">
 					<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
 					<input type="button" id="btn" class="btn btn-default" value="중복확인">	
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="pw1">PW:</label>
 				<div class="col-sm-10"> 
 					<input type="password" class="form-control member" id="pw1" placeholder="Enter pw" name="pw1">
 				</div>
 			</div>
 			<div class="form-group">
				<label class="control-label col-sm-2" for="pw2">PW CHECK:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control member" id="pw2" placeholder="Enter pwcheck" name="pw2">
				</div>
			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="name">NAME:</label>
 				<div class="col-sm-10"> 
 					<input type="text" required="required" class="form-control member" id="name" placeholder="Enter name" name="name">
 				</div>
 			</div> 		
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="email">E-MAIL:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control member" id="email" placeholder="Enter e-mail" name="email">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="phone">PHONE:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control member" id="phone" placeholder="Enter phone" name="phone">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="age">AGE:</label>
 				<div class="col-sm-10"> 
 					<input type="text" class="form-control member" id="age" placeholder="Enter age" name="age">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="job">JOB:</label>
 				<div class="col-sm-10"> 
 					<input type="radio" value="S" class="radio-inline" id="age" name="job" checked="checked">STUDENT
 					<input type="radio" value="T" class="radio-inline" id="age" name="job">TEACHER
 				</div>
 			</div>

 			<div class="form-group"> 
 				<div class="col-sm-offset-2 col-sm-10">
 					<input type="button" id="check" value="JOIN">
 				</div>
 			</div>
 		</form>
	</section>

	<%@ include file= "../temp/footer.jsp" %>
</body>
</html>
