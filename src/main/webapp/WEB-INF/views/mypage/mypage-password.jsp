<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">

				<h1 class="main">비밀번호 수정</h1>
				<section class="item-section">
					<form action="passwordForm" method="post">
						<legend class="col-form-label">새로운 비밀번호</legend>
						<input type="password" name="user_PW" class="form-control">
						<legend class="col-form-label">비밀번호 확인</legend>
						<input type="password" name="checkPW" class="form-control">
						<div class="button-group">
							<a href="${pageContext.request.contextPath}/mypage/mypageModify"
								class="btn btn-cancel btn-active btn-outline-secondary">취소</a> <input
								type="submit" class="btn btn-primary" value="수정완료">

						</div>
						<input type="hidden" name="user_ID" value="${usersVO.user_ID }">
					</form>
					<c:if"${msg==false }">
						잘못된 정보입니다.
					</c:if>
				</section>
			</div>
		</div>
	</div>
</section>