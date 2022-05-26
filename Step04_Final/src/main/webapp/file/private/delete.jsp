<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.삭제할 파일 번호를 읽어온다
	int num =Integer.parseInt(request.getParameter("num"));
	//2.해당 파일의 정보를 DB에서 읽어온다.
	FileDto dto=FileDao.getInstance().getData(num);
	//3. 파일 시스템에서 삭제한다.(weabapp/upload 폴더에서 해당 파일을 삭제)
	
	//String realPath=application.getRealPath("/upload");
	//File file=new File(realPath+File.separator+dto.getSaveFileName());
	
	String path=request.getServletContext().getRealPath("/upload")+
               File.separator+dto.getSaveFileName();
	File file=new File(path);
	file.delete();
	//4. DB에서도 해당 파일의 정보를 삭제 한다.
	FileDao.getInstance().delete(num);
	//5. 응답하기 (리다일렉트)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp"); //파일 목록보기로 다시 리다일레트 이동 시킨다.
%>
