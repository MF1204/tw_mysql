<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 write-wrap">
					
					<div class="article-header">
						${boardVO.title}
					</div>
				
					<div class="title-toolbar">
						<span class="title-toolbar-left">
							작성자: ${boardVO.writer}
						</span>
						<span class="title-toolbar-right">
							질문 작성일: <fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd" />
						</span>
					</div>
					
					<div class="article-content">
						<div>
							<c:out value="${boardVO.content}" escapeXml="false" />
						</div>
					</div>
					
	<%-- 					
						<c:if test="${sessionScope.userVO != null}">
	세션완성후 구현						<button type="submit" class="btn btn-primary">변경</button>
						</c:if> 
	--%>
	
					<c:if test="${boardVO.reply != null}">
						<br><br>
						<div class="title-toolbar">
							<span class="title-toolbar-left">
								관리자가 답변드립니다 
							</span>
							<span class="title-toolbar-right">
								답글 작성일: <fmt:formatDate value="${boardVO.replydate}" pattern="yyyy-MM-dd" />
							</span>
						</div>
						<div class="article-content" id="reply">
							${boardVO.reply}
						</div>
						<br>
					</c:if>
					
					<c:if test="${boardVO.reply == null}">
						<form action="replyForm" method="post" id="replyForm">
						<!-- 아래 스크립트에서 replyForm을 잡아서  -->
							<input type="hidden" name='reply' id="hidden-content">
							<input type="hidden" name='bno' value='${boardVO.bno}'>
							<div name="replycontent" class="ckeditor5">
							</div>
							<button type="button" class="btn btn-primary" onclick="clickSubmit()">답글달기</button>
						</form>
						<br>
					</c:if>
	
	
	
	
	
				<form action="faqModify" method="post">
					<div class="faq-buttons">
						<input type="hidden" name='bno' value='${boardVO.bno}'>
						<button type="submit" class="btn btn-primary">변경</button>
						<button type="button" class="btn btn-dark" onclick="location.href='faqList'">목록</button>
					</div>

				</form>

			</div>
		</div>
	</div>
</section>





<script src="${pageContext.request.contextPath}/resources/js/ckeditor5.js"></script>
<script>

var a = $('#reply').val(); //reply값 여부 확인후 ck에디터 동작여부 설정
if (a == null){	
	ClassicEditor.create( document.querySelector( '.ckeditor5' ), {
			
			toolbar: {
				items: [
					'undo',
					'redo',
					//'imageUpload',
					'bold'
				]
			},
			language: 'ko',
			image: {
				toolbar: [
					'imageTextAlternative',
					'imageStyle:inline',
					'imageStyle:block',
					'imageStyle:side'
				]
			},
			licenseKey: '',
		} )
		.then( editor => {
			window.editor = editor;
		} )
		.catch( error => {
			console.error( 'Oops, something went wrong!' );
			console.error( error );
		} 
	);
}


function clickSubmit(){
	
	const contents = $('.ck-blurred').html();	/* 글과 태그뽑아내기. */
	$('#hidden-content').val(contents);
	/* 히든컨텐츠를 받아서 밸류를 뽑아낸다. 안에는 글쓴내용 태그까지 들어있음. */
/* 	$('#replycontent').val(contents); */
	$('#replyForm').submit();	
	/* 위에 폼(replyForm)을 잡음 잡아서 서브밋해버림 */
}

</script>
