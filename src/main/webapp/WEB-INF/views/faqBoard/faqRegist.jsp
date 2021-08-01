<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>


<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 content-wrap">
				<div class="titlebox">
					<p>자유게시판</p>
				</div>
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




					<div class="titlefoot">
						<button type="button" class="btn" onclick="clickSubmit()">등록</button>
						<button type="button" class="btn" onclick="location.href='faqList'">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>


<script src="${pageContext.request.contextPath}/resources/js/ckeditor5.js"></script>
<script>

const form = new FormData($('#registForm')[0]);

class UploadAdapter {
	constructor(loader) {
		this.loader = loader;
	}

	upload() {
		return this.loader.file.then(file => new Promise(((resolve, reject) => {
			this._initRequest();
/* 			this._initListeners(resolve, reject, file);
			this._sendRequest(file); */
			this._sendRequest(file);
		})))
	}

	
	_initRequest() {
		const xhr = this.xhr = new XMLHttpRequest();
		xhr.open('POST', 'http://localhost:8787/project/faqBoard/upload', true);
		//xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		//xhr.setRequestHeader('Content-type', 'multipart/form-data');
		xhr.responseType = 'json';
	}

	_initListeners(resolve, reject, file) {
		const xhr = this.xhr;
		const loader = this.loader;
		const genericErrorText = '파일을 업로드 할 수 없습니다.'

		xhr.addEventListener('error', () => { reject(genericErrorText) })
		xhr.addEventListener('abort', () => reject())
		xhr.addEventListener('load', () => {
			const response = xhr.response
			
			/* if (!response || response.error) {
				return reject(response && response.error ? response.error.message : genericErrorText);
			} */

			/* resolve({
				default: response.url //업로드된 파일 주소
			}) */
		})
	}

	_sendRequest(file) {
		const data = new FormData()
		data.append('upload', file)
		//this.xhr.send(data)
		debugger;
		for(var pair of data.entries()) {
   		console.log(pair[0]+ ', '+ pair[1]);
		}
		
		form.append('upload', file);
	}
}




ClassicEditor.create( document.querySelector( '.ckeditor5' ), {
		extraPlugins: [MyCustomUploadAdapterPlugin],
		toolbar: {
			items: [
				'undo',
				'redo',
				'imageUpload',
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

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new UploadAdapter(loader)
    }
}




function clickSubmit(){
	
	
	
	$('.ck-blurred').html()
	
	const contents = $('.ck-blurred').html();
	$('#content').val(contents);
	var aa = $('#registForm').submit();
	console.log(aa);
}



</script>