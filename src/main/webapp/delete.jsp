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
<link rel="stylesheet" href="./css/style.css">
</head>
<body>

<form class="m-3" action="deleteOK.jsp" method="post">
	<table 
		class="table table-hover"
		style="width: 1000px; 
		margin-left: auto; 
		margin-right: auto;
	">
	
		<tr class="table-danger">
				<th class="align-middle text-center" colspan="4" style="font-size: 30px;">
					삭제할 글 보기
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
				
				<div class="row g-3 align-items-center">
					<div class="col-auto align-self-center">
						<label for="password">비밀번호</label>
					</div>
					<div class="col-auto">
						<input id="password"
								class="form-control form-control-sm"
								type="password"
								name="password"
								style="font-size: 13px;"
						/>
					</div>
					<div class="col-auto">
					
						<input
							class="btn btn-outline-primary btn-sm"
							type="submit"
							value="삭제하기"
							style="font-size: 13px;"
						/>
						<input
							class="btn btn-outline-danger btn-sm"
							type="reset"
							value="다시쓰기"
							style="font-size: 13px;"
						/>
						<input
							class="btn btn-outline-success btn-sm"
							type="button"
							value="돌아가기"
							style="font-size: 13px;"
							onclick="history.back()"
						/>
						<input
							class="btn btn-outline-dark btn-sm"
							type="button"
							value="목록보기"
							style="font-size: 13px;"
							onclick="location.href='list.jsp?currentPage=${currentPage}'"
						/>
						<!-- currentPage는 selectByIdx.jsp에서 request 영역에 저장했기때문에 vo.을 할 필요가 없다. -->
					
					</div>
				</div>
			</th>
		</tr>
		
		
	</table>
	
	<input type="hidden" name="idx" value="${vo.idx}"/>
	<input type="hidden" name="currentPage" value="${currentPage}"/> <!-- selectByIdx.jsp에서 request영역에 저장시켜 공유됨 -->
	
</form>


</body>
</html>