function setting(idx, mode, title, name, content) {
	let frm = document.commentForm; // 댓글 폼을 저장한다.
//	수정 또는 삭제할 댓글 번호를 넣어준다. 댓글 입력 작업시는 0을 넣어준다.
	frm.idx.value = idx;
//	commentOK.jsp에서 사용할 댓글 작업 모드를 넣어준다. 1-> 저장, 2-> 수정, 3-> 삭제
	frm.mode.value = mode;
//	submit 버튼에 표시할 텍스트를 넣어준다.
	frm.commentBtn.value = title;
//	수정 또는 삭제할 댓글 작성자 이름을 댓글 폼의 name 속성이 name인 텍스트 상자에 넣어준다.
	frm.name.value = name;
	
//	수정 또는 삭제할 댓글내용을 댓글 폼의 name 속성이 content인 textarea에 넣어준다.
//	frm.content.value = content;
//	위와 같이 실행해서 처리가 죄면 좋겠지만, enter키(\r\n)때문에 문제가 발생된다.

//	${co.content}를 인수로 넘기면 자바스크립트는 이스케이프 시퀀스(\r\n)가 포함된 데이터를
//	인수로 받을 수 없기때문에 에러가 발생되며 정상적으로 동작하지 않는다.
//	${content}가 content로 전달되면 '\r\n'를 브라우저에서 줄을 바꿔서 출력하기 위해
// <br/>로 바꿔놨기 때문에 textarea에 줄이 변경되지 않고 '<br/>' 태그 자체가 출력되기때문에
//	textarea에 다시 줄이 변경되어 출력되게하려면 '<br/>'태그를 '\r\n'으로 다시 바꿔줘야 한다.

//	java나 jsp의 replace() 메소드는 모든 내용을 일괄적으로 바꾸지만, 자바스크립트의 replace() 함수는
//	맨 앞의 1개만 바꾼다.
//	frm.content.value = content.replace('<br/>', '\r\n');
//	위와 같이 코딩하면 최초의 '<br/>'만 '\r\n'으로 바뀌고, 나머지 '<br/>'은 그대로 출력된다.

//	인수로 넘어온 데이터에서 더이상 '<br/>'이 없을때까지 반복하며, '\r\n'으로 바꾼다.
	while (content.indexOf('<br/>') != -1) {
		content = content.replace('<br/>', '\r\n');
	}	
	frm.content.value = content;

}
































