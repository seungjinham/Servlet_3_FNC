<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.files.FileDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int maxSize = 1024*1024*10;
	String save = session.getServletContext().getRealPath("upload");
	File f = new File(save);
	if(!f.exists()) {
		f.mkdir();
	}
	MultipartRequest multi= new MultipartRequest(request,save,maxSize,"UTF-8",new DefaultFileRenamePolicy());
	
	//파일 업로드하기
	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setWriter(multi.getParameter("writer"));
	noticeDTO.setTitle(multi.getParameter("title"));
	noticeDTO.setContents(multi.getParameter("contents"));
	
	String oName = multi.getOriginalFileName("f1");
	String fName = multi.getFilesystemName("f1");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.getNum(); //쓰여질 글의 번호 가져와서 result에 저장
	noticeDTO.setNum(result); //받아온 번호를 저장한 result를 noticeDTO에 setNum하기
	noticeDAO.update(noticeDTO); //notice 테이블에 넣기
	
	FileDTO fileDTO = new FileDTO();//fileDTO에 업로드할 파일명과 글번호 실제파일명 set
	fileDTO.setoName(oName);
	fileDTO.setfName(fName);
	fileDTO.setNum(result);
	
	FileDAO fileDAO = new FileDAO();
	result = fileDAO.insert(fileDTO);//files 테이블에 넣기
	
	
	String s="Update Fail";
	if(result>0) {
		s="Update Success";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice Update Process</title>
<script type="text/javascript">
	alert("<%=s%>");
	location.href="./NoticeList.jsp";
</script>
</head>
<body>
</body>
</html>