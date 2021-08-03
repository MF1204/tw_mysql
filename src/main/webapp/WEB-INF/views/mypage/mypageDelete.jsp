<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">

				<h1 class="main">회원탈퇴</h1>
				<section class="item-section">
					<form action="deleteForm" method="post">
						<legend class="col-form-label">비밀번호 확인</legend>
						<input type="password" name="user_PW" id="user_PW"
							class="form-control">
						<div class="button-group">
							<a href="${pageContext.request.contextPath}/mypage/mypageModify"
								class="btn btn-cancel btn-active btn-outline-secondary">취소</a> <input
								type="submit" class="btn btn-primary" value="삭제">

						</div>
						<input type="hidden" name="user_ID" value="${usersVO.user_ID }">
					</form>
				</section>
			</div>
		</div>
	</div>
</section>
