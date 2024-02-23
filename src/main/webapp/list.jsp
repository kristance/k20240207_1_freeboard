<%@page import="com.tjoeun.freeboard.service.FreeboardCommentService"%>
<%@page import="com.tjoeun.freeboard.vo.FreeboardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tjoeun.freeboard.service.FreeboardService"%>
<%@page import="com.tjoeun.freeboard.vo.FreeboardList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<% 
	request.setCharacterEncoding("UTF-8");

//	이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받는다.
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) {
		
	}
	
//	모든 공지글과 1페이지 분량의 메인글을 얻어온다.
	ArrayList<FreeboardVO> notice = FreeboardService.getInstance().selectNotice(); // 공지글
	FreeboardList freeboardList = FreeboardService.getInstance().selectList(currentPage); // 메인글
	
//	공지글과 메인글의 댓글 갯수를 얻어와서 FreeboardVO 클래스의 commentCount에 저장한다.
	for (FreeboardVO vo : notice) {
		vo.setCommentCount(FreeboardCommentService.getInstance().commentCount(vo.getIdx()));
	}
	
	for (FreeboardVO vo : freeboardList.getList()) {
		vo.setCommentCount(FreeboardCommentService.getInstance().commentCount(vo.getIdx()));
	}
	
	
	
//	공지글과 메인글을 request 영역에 저장해서 메인글을 브라우저에 표시하는 페이지(listView.jsp)로 넘겨준다.
	request.setAttribute("notice", notice); // 공지글을 request 영역에 저장한다.
	request.setAttribute("freeboardList", freeboardList); // 메인글을 request 영역에 저장한다.
	request.setAttribute("currentPage", currentPage);
	pageContext.forward("listView.jsp");

%>

</body>
</html>