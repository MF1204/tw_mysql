<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="mypage">
	<div class="container">
		<div class="row">
			<div class="col-sm-12" style="float: none; margin: 0 auto;">
				<div class="account-info-container">
					<h1 class="main">계정 설정</h1>
					<div class="profile-image">
						<div class="user-profile-picture">
							<c:choose>
								<c:when test="${usersVO.user_IMG eq null}">
									<img
										id = "fileImg" src="${pageContext.request.contextPath}/resources/img/image/default-profile.svg"
										class="user-picture" alt="기본이미지">
								</c:when>
								<c:otherwise>
									<img id = "fileImg" class="user-picture" src="${pageContext.request.contextPath}/resources/img/userIMG/${usersVO.user_IMG}.jpg">
								</c:otherwise>
							</c:choose>
						</div>
						<label for="file"> <img id="camera-icon"
							src="${pageContext.request.contextPath}/resources/img/image/camera.svg"
							class="camera-icon">
						</label> <input type="file" id="file" name="file" style="display: none;">
						<input type="hidden" name="user_ID" value="${usersVO.user_ID }">
					</div>
					<ul class="account-info">
						<li class="item-container"
							onclick="location.href = '${pageContext.request.contextPath}/mypage/mypage-email'">
							<div class="item">
								<div class="item-title">이메일</div>
								<div class="item-info">${usersVO.userEmail1}${usersVO.userEmail2}</div>
							</div>
							<div class="glyphicon glyphicon-chevron-right"></div>
						</li>
						<li class="item-container"
							onclick="location.href = '${pageContext.request.contextPath}/mypage/mypage-password'">
							<div class="item">
								<div class="item-title">비밀번호</div>
							</div>
							<div class="glyphicon glyphicon-chevron-right"></div>
						</li>
						<li class="item-container"
							onclick="location.href = '${pageContext.request.contextPath}/mypage/mypage-phone'">
							<div class="item">
								<div class="item-title">휴대전화 번호</div>
								<div class="item-info">${usersVO.userPhoneNumber }</div>
							</div>
							<div class="glyphicon glyphicon-chevron-right"></div>
						</li>

					</ul>
					<ul class="account-info">
						<li class="item-container"
							onclick="location.href = '${pageContext.request.contextPath}/mypage/mypageDelete'">
							<div class="item">
								<div class="item-title">계정 탈퇴</div>
							</div>
							<div class="glyphicon glyphicon-chevron-right"></div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>


</section>
<script>
		$(document).ready(function () {
			
			$("#camera-icon").click(function () {
				
				var writer = '${sessionScope.usersVO.user_ID}';
				var file = $("#file").val();
				file = file.slice(file.lastIndexOf(".", file.length), file.length);
				// console.log(file);
				console.log("////////////////////////");
				if (file != '.jpg' && file != '.PNG' && file != '.bmp') {
					alert("이미지 형태만 등록합니다");
					return;
				} else if (writer == false) {

				}

				var formData = new FormData();

				// fromData.append("writer",writer);
				formData.append("file", $("#file")[0].files[0]);
				console.log("file", $("#file")[0].files[0]);
				console.log("#############");
			


				$.ajax({
					type: "post",
					url: "profileUpload",
					processData: false,
					contentType: false,
					data: formData,
					success: function (data) {
						console.log("====");
						console.log(data);



						if (data == "success") {
							$("#file").val("");
							$(".user-profile-picture").css("display", "none");

						}
					},
				})
			});//등록이벤트
		});

	</script>


<script>
		//자바 스크립트 파일 미리보기 기능
		function readURL(input) {
			if (input.files && input.files[0]) {

				var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
				//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
				reader.readAsDataURL(input.files[0]);
				//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
				$(".user-profile-picture").css("display", "block");

				reader.onload = function (event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
					$('#fileImg').attr("src", event.target.result);
					console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
				}
			}
		}
		$("#file").change(function () {
			readURL(this); //this는 #file자신 태그를 의미

		});
	</script>