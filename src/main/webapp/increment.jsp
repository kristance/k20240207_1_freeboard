<%@page import="com.tjoeun.freeboard.service.FreeboardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회수 증가 페이지</title>
</head>
<body>

<% 
	request.setCharacterEncoding("UTF-8");

//	listView.jsp에서 넘어오는 조회수를 증가시킬 글번호와 돌아갈 페이지 번호를 받는다. 
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
//	조회수를 증가시키는 메소드를 실행한다.
	FreeboardService.getInstance().increment(idx) ;

//	조회수를 증가시킨 메인글 1건을 얻어오는 페이지(selectByIdx.jsp)로 넘겨준다.
//	response.sendRedirect("list.jsp?currentPage=" + currentPage);
	response.sendRedirect("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "&job=contentView");
//	pageContext.forward("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "&job=contentView");

%>





</body>
</html>