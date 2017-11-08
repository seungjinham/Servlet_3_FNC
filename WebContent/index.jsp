<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="./css/main.css" rel="stylesheet">
</head>
<body>
	<!-- header 시작 -->
	<%@ include file= "./temp/header.jsp" %>
	<!-- header 끝 -->
	
	<!-- main 시작 -->
	<section id="main">
		<div id="mcontents">
			<article id="mImage">
				<img src = "./images/main/main.jpg">
			</article>
			<section id="mBoard">
				<article class="mPost">
					<img src="./images/main/mpost_1.PNG">
				</article>
				<article class="mPost">
					<img src="./images/main/mpost_2.PNG">
				</article>
				<article class="mPost">
					<div><img src="./images/main/mpost_3.PNG"></div>
					<div><img src="./images/main/mpost_4.PNG"></div>
				</article>
			</section>
		</div>
	</section>
	
	
	<!-- Main 끝 -->
	
	<!-- footer 시작 -->
	<%@ include file="../temp/footer.jsp" %>
	<!-- footer 끝 -->
</body>
</html>