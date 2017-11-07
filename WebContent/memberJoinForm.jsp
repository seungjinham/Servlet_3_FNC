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
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
<style type="text/css">
	
	h1 {
		width: 30%;
		margin: 0 auto;
		text-align: center;
	}
	
</style>
<script type="text/javascript">
	window.onload=function(){
		var btn = document.getElementById("btn");
		btn.addEventListener("click", function(){
		var id = document.frm.id.value;
		window.open("memberIdCheck.jsp?id="+id, "", "top=200, left=300, width=400, height=300");
		});
		
		var result=true;
		var result2=true;
		
		var check = document.getElementById("check");
			check.addEventListener("click", function(){
			var ch = document.getElementsByClassName("ch");
			for(var i=0;i<ch.length;i++){
				if(ch[i].value==""){
					result=false;
				}
			}
			if(ch[0].value != ch[1].value){
				result2=false;
			}
			
			if(result && result2){
				document.frm.submit();
			}else {
				alert("모두 입력 하세요");
			}
			
		});
	}
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	<section id="main">

		<h1>Member Join Form Add GitHUb add Local</h1>
		<form name="frm" class="form-horizontal" action="memberJoinProcess.jsp" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="id" name="id"
						placeholder="Enter ID">
					<input type="button" id="btn" class="btn btn-default" value="중복확인">	
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">PW:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control ch" id="pw" name="pw"
						placeholder="Enter Pw">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pw">PW:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control ch" id="pw2"
						placeholder="Enter Pw">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Name">Name:</label>
				<div class="col-sm-10">
					<input type="text" required="required" class="form-control ch" id="name" name="name"
						placeholder="Enter Name">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Email">Email:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control ch" id="email" name="email"
						placeholder="Enter Email">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Phone">Phone:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control ch" id="phone" name="phone"
						placeholder="Enter Phone">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Age">Age:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control ch" id="age" name="age"
						placeholder="Enter Age">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Job">Job:</label>
				<div class="col-sm-10">
					STUDENT<input type="radio" value="S" checked="checked" class="radio-inline" name="job">
					TEACHER<input type="radio" value="T" class="radio-inline" name="job">
				</div>
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" id="check2" value="JOIN">
				</div>
			</div>
		</form>
		
	</section>
	
	<%@ include file="../temp/footer.jsp" %>


</body>
</html>
