<%@page import="com.iu.member.MemberDAO"%>
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
<title>Member Update Form</title>
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
	<%@ include file= "../temp/header.jsp"%>
	<section id="main">
	<h1>Member Update</h1>
		<form name="frm" class="form-horizontal" action="MemberUpdateProcess.jsp" method="post">
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="pw">PW:</label>
 				<div class="col-sm-10"> 
 					<input type="password" value=<%=memberDTO.getPw() %> class="form-control member" id="pw" name="pw">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="pw2">PW CHECK:</label>
 				<div class="col-sm-10"> 
 					<input type="password" value=<%=memberDTO.getPw() %> class="form-control member" id="pw2">
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="name">NAME:</label>
 				<div class="col-sm-10"> 
 					<input type="text" value=<%=memberDTO.getName() %> required="required" class="form-control member" id="name" name="name" >
 				</div>
 			</div> 		
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="email">E-MAIL:</label>
 				<div class="col-sm-10"> 
 					<input type="text" value=<%=memberDTO.getEmail() %> class="form-control member" id="email" name="email" >
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="phone">PHONE:</label>
 				<div class="col-sm-10"> 
 					<input type="text" value=<%=memberDTO.getPhone() %> class="form-control member" id="phone" name="phone" >
 				</div>
 			</div>
 			<div class="form-group">
 				<label class="control-label col-sm-2" for="age">AGE:</label>
 				<div class="col-sm-10"> 
 					<input type="text" value=<%=memberDTO.getAge() %> class="form-control member" id="age" name="age">
 				</div>
 			</div>

 			<div class="form-group"> 
 				<div class="col-sm-offset-2 col-sm-10">
 					<input type="submit" id="check" value="UPDATE">
 				</div>
 			</div>
 		</form>
	</section>
	<%@ include file= "../temp/footer.jsp" %>
</body>
</html>