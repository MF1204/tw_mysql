<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 write-wrap">

				<form action="faqUpdate" method="post" id="faqUpdate" name="faqUpdate">
					<input type="hidden" name="content" id="hidden-content">
					<input type="hidden" name='bno' value='${boardVO.bno}'>
					<table class="table">
						<tbody class="t-control">
							<tr>
								<td class="t-title">NAME</td>
								<td>
								<!-- 세션완성되면 넣기 -->
								<%-- 	<input class="form-control input-sm" name="writer" required="required" value="${sessionScope.userVO.userID}" readonly="readonly"> --%>
									<span  name="writer" required="required">${boardVO.writer}</span>
								</td>
							</tr>
							<tr>
								<td class="t-title">TITLE</td>
								<td>
									<input class="form-control input-sm" name="title" required="required" value="${boardVO.title }">
								</td>
							</tr>
							<tr>
								<td class="t-title">COMMNET</td>
								<td>
	
									
									<div name="content" class="ckeditor5">${boardVO.content}
									</div>
									
									
									
									
									
									
								</td>
							</tr>
						</tbody>
					</table>




					<div class="faq-buttons">
						<button type="button" class="btn btn-dark" onclick="clickSubmit()">수정</button>
						<button type="button" class="btn btn-dark "
						onclick="location.href = 'faqDelete?bno=${boardVO.bno}&${boardVO.writer}'">삭제</button>
						<button type="button" class="btn btn-dark" onclick="location.href='faqList'">목록</button>
					</div>
				</form>
				
				
				
				

			</div>
		</div>
	</div>
</section>




<script src="${pageContext.request.contextPath}/resources/js/ckeditor5.js"></script>
<script>

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



function clickSubmit(){
	
	const contents = $('.ck-blurred').html();	/* 글과 태그뽑아내기. */
	$('#hidden-content').val(contents);
	/* 히든컨텐츠를 받아서 밸류를 뽑아낸다. 안에는 글쓴내용 태그까지 들어있음. */
	$('#faqUpdate').submit();	
	/* 위에 폼(replyForm)을 잡음 잡아서 서브밋해버림 */
}

</script>
