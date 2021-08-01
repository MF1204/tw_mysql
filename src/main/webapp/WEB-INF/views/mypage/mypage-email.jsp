<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12" style="float: none; margin: 0 auto;">

				<h1 class="main">이메일 수정</h1>
				<section class="item-section">
					<form action="emailForm" method="post">
						<legend class="col-form-label">이메일</legend>
						<div class="email-box">
							<input type="text" name="userEmail1" placeholder="이메일을 입력해주세요."
								class="form-control"> <select name="userEmail2"
								class="email-item" onChange="selectEmail(this)">
								<option value="" selected>선택하세요</option>
								<option value="@naver.com">@naver.com</option>
								<option value="@gmail.com">@gmail.com</option>
								<option value="@hanmail.com">@hanmail.com</option>
								<option value="1">직접입력</option>
							</select>
						</div>
						<div class="button-group">
							<a href="${pageContext.request.contextPath}/mypage/mypageModify"
								class="btn btn-cancel btn-active btn-outline-secondary">취소</a> <input
								type="submit" class="btn btn-primary" value="수정완료">

						</div>
						
						<input type="hidden" name="user_ID" value="${usersVO.user_ID }">
					</form>
				</section>
			</div>
		</div>
	</div>
</section>
<script>
	function selectEmail(ele) {
		var $ele = $(ele);
		var $userEmail2 = $('input[name=userEmail2]');

		if ($ele.val() == "1") {
			$userEmail2.attr('readonly', false);
			$userEmail2.val('');
		} else {
			$userEmail2.attr('readonly', true);
			$userEmail2.val($ele.val());
		}
	}
</script>