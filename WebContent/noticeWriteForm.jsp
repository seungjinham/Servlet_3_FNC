<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
<script src="https://cdn.ckeditor.com/4.7.3/full/ckeditor.js"></script>	
<link href="../css/header.css" rel="stylesheet">
<script type="text/javascript">
	window.onload=function(){
		CKEDITOR.replace('contents');
	}
</script>

</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<form class="form-horizontal" action="noticeWriteProcess.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="writer">WRITER:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" readonly="readonly" id="writer" name="writer"
						placeholder="Enter Writer" value="<%= memberDTO.getId()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="Title">TITLE:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title"
						placeholder="Enter Title">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Contents">CONTENTS:</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="5" id="contents" name="contents"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="Contents">CONTENTS:</label>
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
	<%@ include file="../temp/footer.jsp"%>

</body>
</html>