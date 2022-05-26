<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 파일을 webapp/upload 폴더에 저장한다.
	String realPath=application.getRealPath("/upload");
	//해당 경로를 access 할 수 있는 파일 객체 생성
	File f = new File(realPath);
	if(!f.exists()){
		f.mkdir();
	}
	
	MultipartRequest mr = new MultipartRequest(request,
			realPath,
			1024*1024*50,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
	//2. 폼 전송된 title을 읽어온다.
	String title=mr.getParameter("title");
;	
	//3. 파일의 작성자(업로더)는 HttpSession 객체에서 읽어온다.
	String writer=(String)session.getAttribute("id");
	//4. 추가로 원본파일명, 저장된파일명, 파일사이즈도 얻어내서 FileDto 객체에 담아서
	String orgFileName=mr.getOriginalFileName("myFile");
	String saveFileName=mr.getFilesystemName("myFile");
	
	//파일 사이즈 알아내기 -> 다운로드 할 때 필요
	long fileSize=mr.getFile("myFile").length();
	

	//5. FileDao 객체를 이용해서 DB에 저장하고
	FileDto dto = new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	boolean isSuccess=FileDao.getInstance().insert(dto);
	//응답한다.
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%if(isSuccess){ %>
      <p>
         <%=writer %> 님이 업로드한 <%=orgFileName %> 파일을 저장했습니다.
         <a href="${pageContext.request.contextPath }/file/list.jsp">목록보기</a>
         <div>경로보기</div>: <%=realPath %>
      </p>
   <%}else{ %>
      <p>
         업로드 실패!
         <a href="upload_form.jsp">다시 시도</a>
      </p>
   <%} %>
</body>
</html>