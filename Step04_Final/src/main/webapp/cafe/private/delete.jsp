<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num= Integer.parseInt(request.getParameter("num"));	
	
	boolean isSuccess =CafeDao.getInstance().delete(num);
	//글 목록 보기 리다일렉트 이동 ( 특정 경로로 요청을 다시하기)
	
	//contextPath 경로 를 cPath에 담기
	
	String cPath=request.getContextPath();
	
	//특정 경로로 리다일렉트
	response.sendRedirect(cPath+"/cafe/list.jsp");
%>
