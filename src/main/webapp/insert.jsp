<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인글 쓰기</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

<form class="m-3" action="insertOK.jsp" method="post">
	
	<table class="table table-hover" style="width: 700px; margin-left: auto; margin-right: auto;">
		<tr class="table-danger">
			<th class="align-middle text-center" colspan="3" style="font-size: 30px;">
				Main 글쓰기
			</th>
		</tr>
		
		<tr>
			<th class="align-middle" width="100px">
				<label for="name">이름</label>
			</th>
			<td width="500px">
				<input 
					id="name"
					class="form-control form-control-sm"
					type="text"
					name="name"
					style="width: 200px;"
				/>
			</td>	
			<th class="align-middle" width="100px" style="text-align: center;">
				공지글 <input class="form-check-input" type="checkbox" name="notice"/>
			</th>
		</tr>
		
		<tr>
			<th class="align-middle">
				<label for="password">비밀번호</label>
			</th>
			<td colspan="2">
				<input 
					id="password" 
					class="form-control form-control-sm" 
					type="password" 
					name="password" 
					style="width: 200px;"
				/>
			</td>
			
		</tr>
		
		<tr>
			<th class="align-middle">
				<label for="subject">제목</label>
			</th>
			<td colspan="2">
				<input 
					id="subject" 
					class="form-control form-control-sm" 
					type="text" 
					name="subject" 
				/>
			</td>
			
		</tr>
		
		<tr>
			<th class="align-middle">
				<label for="content">내용</label>
			</th>
			<td colspan="2">
				<textarea 
					id="content"
					class="form-control form-control-sm" 
					name="content"
					rows="10"
					style="resize: none;"
				>
				</textarea>
			</td>
			
		</tr>
		
		<tr class="table-secondary">
			<th colspan="3" class="align-middle text-center">
				<input
					class="btn btn-outline-primary btn-sm"
					type="submit"
					value="저장하기"
					style="font-size: 13px;"
				/>
				<input
					class="btn btn-outline-danger btn-sm"
					type="reset"
					value="다시쓰기"
					style="font-size: 13px;"
				/>
				<input
					class="btn btn-outline-dark btn-sm"
					type="button"
					value="돌아가기"
					style="font-size: 13px;"
					onclick="history.back()"
				/>
			</th>
		</tr>
		
		
	</table>

	<!-- 작성자 ip 주소는 hidden으로 insertOK.jsp로 넘긴다. -->
	<input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>

</form>



</body>
</html>