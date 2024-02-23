<%@page import="com.tjoeun.freeboard.service.FreeboardCommentService"%>
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
//	contentView.jsp에서 넘어오는 데이터를 받는다.
	int mode = Integer.parseInt(request.getParameter("mode"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

<jsp:useBean id="co" class="com.tjoeun.freeboard.vo.FreeboardCommentVO">
	<jsp:setProperty property="*" name="co"/>
</jsp:useBean>


<%
//	contentView.jsp에서 넘어온 mode에 따라 1은 댓글 저장, 2는 댓글 수정, 3은 댓글 삭제 작업을 한다.
	out.println("<script>");
	switch (mode) {
		case 1 : //	댓글 저장 
			out.println("alert('댓글 입력 " +
					(FreeboardCommentService.getInstance().insertComment(co) ? "성공" : "실패") + "')");
			break;
		case 2 : //	댓글 수정
			out.println("alert('댓글 수정 " +
					(FreeboardCommentService.getInstance().updateComment(co) ? "성공" : "실패") + "')");
			break;
		case 3 : // 댓글 삭제
			out.println("alert('댓글 삭제 " +
					(FreeboardCommentService.getInstance().deleteComment(co) ? "성공" : "실패") + "')");
			break;
	}
	out.println("location.href='selectByIdx.jsp?idx=" +
			co.getGup() + "&currentPage=" + currentPage + "&job=contentView'");
	out.println("</script>");


//	response.sendRedirect("list.jsp?currentPage=" + currentPage);
//	댓글 저장, 수정, 삭제가 완료되면 댓글 작업을 하던 메인글이 화면에 계속 표시되어야하므로
//	화면에 표시할 메인글을 얻어오는 selectByIdx.jsp로 넘겨준다.

//	response.sendRedirect("selectByIdx.jsp?idx=" +
//			co.getGup() + "&currentPage=" + currentPage + "&job=contentView");

	
%>





</body>
</html>