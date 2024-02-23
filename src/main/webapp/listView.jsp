<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록 보기</title>
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- bootstrap icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<!-- custom script -->
<script src="./js/formCheck.js" defer="defer" ></script>

<!-- custom style -->
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
			<th class="align-middle text-center" colspan="5" style="font-size: 30px;">
				게시판 보기
			</th>
		</tr>
		
		
		<tr>
			<td class="align-middle text-end" colspan="5">
				${freeboardList.totalCount}(${freeboardList.currentPage}/${freeboardList.totalPage})
			</td>
		</tr>
		
		
		<tr class="table">
			<td class="align-middle text-center" style="width: 70px;">글번호</td>
			<td style="width: 100px; text-align: center;">이름</td>
			<td style="width: 600px; text-align: center;">제목</td>
			<td style="width: 160px; text-align: center;">작성일</td>
			<td style="width: 70px; text-align: center;">조회수</td>
		</tr>
		
		<!-- 오늘 날짜를 기억하는 Date 클래스 객체를 useBean으로 만든다. -->
		<jsp:useBean id="date" class="java.util.Date"/>
		<%-- ${date} --%>
		
		<!-- 공지글을 출력한다. -->
		<!-- 공지글이 있으면 공지글의 갯수만큼 반복하며 공지글의 제목을 1페이지에만 출력한다. -->
		<c:if test="${currentPage == 1 }">
			<c:forEach var="vo" items="${notice}">
				
				<!-- 공지글 작성일이 오늘인가 비교하기 위해 오늘 날짜와 작성일에 같은 서식을 지정해서 변수에 저장한다. -->
					<fmt:formatDate var="today" value="${date}" pattern="yyyy.MM.dd"/> <!-- 오늘 날짜에 서식 지정 -->
					<fmt:formatDate var="writeDate" value="${vo.writeDate}" pattern="yyyy.MM.dd"/> <!-- 작성일에 서식 지정 -->
					<tr class="table-primary">
						<td class="align-middle text-center">
						
							<span class="badge bg-success">공지글</span> 
							
						</td>
						<td class="align-middle text-center">
						
							<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"></c:set>
							<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"></c:set>
							${name}
							
						</td>
						<td class="align-middle text-start">
							
							<i class="bi bi-fast-forward-btn"></i>
						
							<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
							<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
							
							<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
								${subject}(${vo.commentCount})
							</a>
							
							<c:if test="${today == writeDate }">
								<span class="badge bg-warning">NEW</span> 
							</c:if>
							
							<c:if test="${vo.hit > 10}">
								<span class="badge bg-danger">hot</span>
							</c:if>
							
							
						</td>
						
						
						<td class="align-middle text-center">
							
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
			</c:forEach>
		</c:if>
		<!-- 메인글을 출력한다. -->
		<!-- list.jsp에서 request 영역에 저장한 freeboardList에서 1페이지 분량의 글을 꺼내온다. -->
		<c:set var="list" value="${freeboardList.list}"/>
		<%-- ${list} --%>
		
		<!-- 메인글이 1건도 없으면 글이 없다고 출력한다. -->
		<c:if test="${list.size() == 0}">
			<tr class="table-danger align-center">
				<td colspan="5">
					<marquee>글이 존재 하지 않습니다.</marquee>
				</td>
			</tr>
		</c:if>
		<!-- 메인글이 있으면 메인글의 갯수만큼 반복하며 메인글의 제목을 출력한다. -->
		<c:if test="${list.size() != 0}">
			<c:forEach var="vo" items="${list}">
			
			<!-- 메인글 작성일이 오늘인가 비교하기 위해 오늘 날짜와 작성일에 같은 서식을 지정해서 변수에 저장한다. -->
				<fmt:formatDate var="today" value="${date}" pattern="yyyy.MM.dd"/> 
				<fmt:formatDate var="writeDate" value="${vo.writeDate}" pattern="yyyy.MM.dd"/> 
				
				<%-- ${vo}<br/> --%>
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
					<td class="align-middle text-start">
						
						<i class="bi bi-fast-forward-btn"></i>
					
						<!-- 제목에 태그를 적용할 수 없게 한다. -->
						<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
						<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
						
						<!-- 제목에 하이퍼링크를 걸어준다. -->
						<!-- 하이퍼링크를 클릭하면 조회수를 증가시키고 클릭한 메인글 내용을 표시한다. -->
						<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
							${subject}(${vo.commentCount})
						</a>
						
						<!-- 오늘 입력된 글에 new 이미지 또는 아이콘을 표시한다. -->
						<c:if test="${today == writeDate }"> <!-- 오늘 입력된 글인가 -->
							<!-- <span class="badge">NEW</span> --> <!-- bootstrap3 -->
							<!-- <span class="badge badge-secondary">NEW</span> --> <!-- bootstrap4 -->
							<span class="badge bg-warning">NEW</span> <!-- bootstrap5 -->
							<img src="./images/new11.png"/>
						</c:if>
						
						<!-- 조회수가 일정 횟수를 넘어가면 hot 아이콘을 표시한다. -->
						<c:if test="${vo.hit > 10}">
							<span class="badge bg-danger">hot</span> <!-- bootstrap5 -->
							<img src="./images/hot.gif"/>
						</c:if>
						
						
					</td>
					<td class="align-middle text-center">
				
						<!-- 오늘 입력된 글은 시간만, 어제 이전에 입력된 글은 날짜만 출력한다. -->
						
						<c:if test="${today == writeDate }">
							<fmt:formatDate value="${date}" pattern="HH:MM:ss"/>
						</c:if>
						<c:if test="${today != writeDate }"> <!-- 어제 이전에 입력된 글인가 -->
							<fmt:formatDate value="${date}" pattern="yyyy.MM.dd(E)"/>
						</c:if>
						
					</td>
					<td class="align-middle text-center">
					
						${vo.hit}
						
					</td>
				</tr>
			</c:forEach>
		</c:if>
		
		<!-- 페이지 이동 버튼 -->
	<tr>
		<td colspan="5" class="align-middle text-center">
			<!-- 처음으로 -->
			<c:if test="${freeboardList.currentPage > 1}">
					<button 
						type="button" 
						class="button button1" 
						title="처음으로 이동" 
						onclick="location.href='?currentPage=1'"
					>첫 페이지로</button>
			</c:if>
			<c:if test="${freeboardList.currentPage <= 1}">
					<button 
						type="button" 
						class="button button2" 
						title="첫 페이지 입니다." 
						disabled="disabled"
					>첫 페이지로</button>
			</c:if>
			<!-- 10페이지 앞으로 -->
			<c:if test="${freeboardList.startPage > 1}">
				<button
					 type="button"
					 class="button button1"
					 title="이전 10페이지로 이동합니다."
					 onclick="location.href='?currentPage=${freeboardList.startPage - 1}'"
					 > < (-10)</button>
			</c:if>
			<c:if test="${freeboardList.startPage <= 1}">
				<button
					type="button"
					class="button button2"
					disabled="disabled"
					title="이미 첫 10페이지 입니다."
					> < (-10)</button>
			</c:if>
			<!-- 페이지 이동 버튼 -->
			<c:forEach var="i" begin="${freeboardList.startPage}" end="${freeboardList.endPage}" step="1">
				<c:if test="${freeboardList.currentPage == i}">
					<button
						class="button button2"
						type="button"
						disabled="disabled"
						>${i}</button>
				</c:if>
				<c:if test="${freeboardList.currentPage != i}">
					<button
						class="button button1"
						type="button"
						onclick="location.href='?currentPage=${i}'">
						${i}</button>
				</c:if>
			
			</c:forEach>
					
			<!-- 10페이지 뒤로 -->
				<c:if test="${freeboardList.endPage < freeboardList.totalPage}">
					<button
						class="button button1"
						type="button"
						title="다음 10페이지로 이동합니다."
						onclick="location.href='?currentPage=${freeboardList.endPage + 1}'"
						> (+10) > </button>
				</c:if>
				<c:if test="${freeboardList.endPage >= freeboardList.totalPage}">
					<button
						class="button button2"
						type="button"
						title="마지막 페이지 입니다."
						disabled="disabled"
						>(+10)</button>
				</c:if>
			
			<!-- 마지막으로 -->
				<c:if test="${freeboardList.currentPage < freeboardList.totalPage}">
					<button
						class="button button1"
						type="button"
						title="마지막 페이지로 이동"
						onclick="location.href='?currentPage=${freeboardList.totalPage}'"
						>마지막 페이지로</button>
				</c:if>
				<c:if test="${freeboardList.currentPage >= freeboardList.totalPage}">
					<button
						class="button button2"
						type="button"
						title="마지막 페이지입니다."
						disabled="disabled"
						>마지막 페이지입니다.</button>
				</c:if>
					
					
					
		</td>
	</tr>
		
		
		
		

		<!-- 글쓰기 버튼 -->
		<tr class="table-secondary">
			<td class="align-middle text-center" colspan="5">
				<input
					class="btn btn-outline-primary btn-sm"
					type="button"
					value="글쓰기"
					style="font-size: 13px;"
					onclick="location.href='insert.jsp'"	
				/>
			</td>
		</tr>
		
	</table>

</div>



</body>
</html>