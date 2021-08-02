<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>


<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 content-wrap">

				<form action="registForm" method="post" id="registForm" name="registForm">
					<input type="hidden" name="content" id="content">
					<table class="table">
						<tbody class="t-control">
							<tr>
								<td class="t-title">NAME</td>
								<td>
								<!-- 세션완성되면 넣기 -->
								<%-- 	<input class="form-control input-sm" name="writer" required="required" value="${sessionScope.userVO.userID}" readonly="readonly"> --%>
									<input class="form-control input-sm" name="writer" required="required" value="" >
								</td>
							</tr>
							<tr>
								<td class="t-title">TITLE</td>
								<td>
									<input class="form-control input-sm" name="title" required="required">
								</td>
							</tr>
							<tr>
								<td class="t-title">COMMNET</td>
								<td>
	
									
									<div name="content" class="ckeditor5">
									</div>
									
									
									
									
									
									
								</td>
							</tr>
						</tbody>
					</table>




					<div class="faq-buttons">
						<button type="button" class="btn btn-dark" onclick="clickSubmit()">등록</button>
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
		console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
		console.warn( 'Build id: rcgne96ljpix-n47t55vr7911' );
		console.error( error );
	} 
);

function clickSubmit(){
	
	$('.ck-blurred').html()

	const contents = $('.ck-blurred').html();
	$('#content').val(contents);
	var aa = $('#registForm').submit();
	console.log(aa);
}

</script>