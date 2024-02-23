<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="./js/setting.js" defer="defer" ></script>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>

<div class="m-3">
	<table 
		class="table table-hover"
		style="width: 1000px; 
		margin-left: auto; 
		margin-right: auto;
	">
	
		<tr class="table-danger">
				<th class="align-middle text-center" colspan="4" style="font-size: 30px;">
					게시글 보기
				</th>
		</tr>
		
		<tr class="table">
			<td class="align-middle text-center" style="width: 100px;">글번호</td>
			<td style="width: 340px; text-align: center;">이름</td>
			<td style="width: 160px; text-align: center;">작성일</td>
			<td style="width: 100px; text-align: center;">조회수</td>
		</tr>
		<tr>
			<td class="align-middle text-center">
					
				${vo.idx}
						
			</td>
			<td class="align-middle text-center">
					
				<!-- 이틈에 태그를 적용할 수 없게 한다. -->
				<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"></c:set>
				<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"></c:set>
				${name}
						
			</td>
			<td class="align-middle text-center">
			
				<jsp:useBean id="date" class="java.util.Date"/>
				<fmt:formatDate var="today" value="${date}" pattern="yyyy.MM.dd"/> 
				<fmt:formatDate var="writeDate" value="${vo.writeDate}" pattern="yyyy.MM.dd"/>
				
				<c:if test="${today == writeDate }">
					<fmt:formatDate value="${date}" pattern="HH:MM:ss"/>
				</c:if>
				<c:if test="${today != writeDate }"> 
					<fmt:formatDate value="${date}" pattern="yyyy.MM.dd(E)"/>
				</c:if>
						
			</td>
			<td class="align-middle text-center">
					
				${vo.hit}
						
			</td>
		
		</tr>
		<tr>
			<td class="align-middle text-center table-danger">제목</td>
			<td class="align-middle text-start" colspan="3">
				<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
				${subject}
			</td>
		</tr>
		
		
		<tr>
			<td class="align-middle text-center table-danger">내용</td>
			<td class="align-middle text-start" colspan="3">
				<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"></c:set>
				${content}
			</td>
		</tr>
		
		<tr class="table-secondary">
			<th colspan="4" class="align-middle text-center">
				<input
					class="btn btn-outline-primary btn-sm"
					type="button"
					value="수정하기"
					style="font-size: 13px;"
					onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=update'"
				/>
				<input
					class="btn btn-outline-danger btn-sm"
					type="button"
					value="삭제하기"
					style="font-size: 13px;"
					onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=delete'"
				/>
					<!--
						history.back() 또는 history.go(-1)를 사용하면 단순히 전 화면으로 돌아가기때문에
						증가된 조회수가 반영되지 않은 상태가 브라우저에 보여진다.
						이 문제를 해결하려면 list.jsp를 요청해서 변경된 내용을 다시 얻어와서 출력해야한다. 
					 -->
				<input
					class="btn btn-outline-dark btn-sm"
					type="button"
					value="돌아가기"
					style="font-size: 13px;"
					onclick="location.href='list.jsp?currentPage=${currentPage}'"
				/>
				<!-- currentPage는 selectByIdx.jsp에서 request 영역에 저장해서 공유했기 때문에 vo.을 할 필요가 없다. -->
			</th>
		</tr>
		
		
	</table>
</div>

<hr style="color: crimson; width: 700px; margin-left: auto; margin-right: auto;"/>

<!-- 댓글을 입력, 수정, 삭제하는 폼 -->

<form class="m-3" name="commentForm" action="commentOK.jsp" method="post">
	<table 
		class="table table-hover"
		style="width: 1000px; 
		margin-left: auto; 
		margin-right: auto;
	">
	
		<tr class="table-danger">
			<th class="align-middle text-center" colspan="4" style="font-size: 30px;">
				댓글 보기
			</th>
		</tr>
		
		<!-- 이 줄은 원래 보이면 안되는 줄로 테스트가 완료된 후 화면에 보이지 않게 한다. -->
		<tr>
			<td colspan="4">
				<!-- 수정 또는 삭제할 댓글의 글번호 -->
				idx : <input type="text" name="idx" value="${vo.idx}" size="1"/>
				<!-- 현재 댓글이 어떤 메인글의 댓글인가 -->
				gup : <input type="text" name="gup" value="${vo.idx}" size="1"/>
				<!-- 작업 모드, 1 -> 댓글 저장, 2 -> 댓글 수정, 3 -> 댓글 삭제 -->
				mode : <input type="text" name="mode" value="1" size="1"/>
				<!-- 메인글이 표시되던 페이지 번호  -->
				curretPage : <input type="text" name="currentPage" value="${currentPage}" size="1"/>
				<!-- 댓글 작성자 ip 주소 -->
				ip :  <input type="text" name="ip" value="${pageContext.request.remoteAddr}"/>
			</td>		
		</tr>
		
		<!-- 이 줄부터 댓글 입력, 수정, 삭제에 사용한다. -->
		<tr>
			<th class="align-middle text-center" style="width: 100px;">
				<label for="name">이름</label>
			</th>
			<td style="width: 250px;">
				<input 
					id="name" 
					class="form-control form-control-sm" 
					type="text"
					name="name"
			/>
			</td>
			
			<th class="align-middle text-center" style="width: 100px;">
				<label for="password">비밀번호</label>
			</th>
			<td style="width: 250px;">
				<input 
					id="password" 
					class="form-control form-control-sm" 
					type="password"
					name="password"
			/>
			</td>
		</tr>
		<tr>
			<th class="align-middle text-center" style="width: 100px;">
				<label for="content">내용</label>
			</th>
			<td colspan="3" style="width: 600px;">
				<textarea 
					id="content"
					name="content"
					class="form-control form-control-sm" 
					rows="5"
					style="resize: none;"
				></textarea>
			</td>
		</tr>
		
		<tr class="table-seconary ">
			<td class="align-middle text-center" colspan="4" >
				<input 
					class="btn btn-outline-primary btn-sm"
					name="commentBtn"
					type="submit"
					value="댓글 저장"
					style="font-size: 13px;"
				/>
				<input 
					class="btn btn-outline-danger btn-sm"
					type="button"
					value="다시쓰기"
					style="font-size: 13px;"
					onclick="setting(0, 1, '댓글 저장', '', '')"
				/>
			</td>
		</tr>

		<!-- 댓글을 출력한다. -->
		<c:set var="comment" value="${freeboardCommentList.list}"/>
		<%-- ${comment} --%>
		
		<!-- 댓글이 없는 경우 -->
		<c:if test="${comment.size() == 0}">
			<tr>
				<td colspan="4">
					<marquee>작성된 댓글이 없습니다.</marquee>
				</td> 
			</tr>
		</c:if>
		
		<!-- 댓글이 있는 경우 -->
		<c:if test="${comment.size() != 0}">
			<c:forEach var="co" items="${comment}">
				<tr class="table-dark">
					<td colspan="4">
						${co.idx}
						<c:set var="name" value="${fn:replace(co.name, '<', '&lt;')}"></c:set>
						<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"></c:set>
						${name} 님이
						<fmt:formatDate value="${co.writeDate}" pattern="yyyy.MM.dd(E) HH:mm:ss"/>에 남긴글<br/>
						<c:set var="content" value="${fn:replace(co.content, '<', '&lt;')}"></c:set>
						<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"></c:set>
						<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"></c:set>
						${content}<br/>
						<div align="right">
						<!-- 자바스크립트 함수의 인수로 문자열을 전달할 경우 반드시 따옴표로 묶어야한다. -->
							<input 
								class="btn btn-outline-warning btn-sm"
								type="button"
								value="댓글 수정"
								style="font-size: 13px;"
								onclick="setting(${co.idx}, 2, '댓글 수정', '${name}', '${content}')"
							/>
							<input 
								class="btn btn-outline-danger btn-sm"
								type="button"
								value="댓글 삭제"
								style="font-size: 13px;"
								onclick="setting(${co.idx}, 3, '댓글 삭제', '${name}', '${content}')"
							/>
						</div>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		


	</table>
</form>



</body>
</html>