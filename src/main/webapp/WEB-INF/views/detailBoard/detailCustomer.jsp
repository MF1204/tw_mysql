ㅁ<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 write-wrap">

				<div class="titlebox">
					<p>글쓰기</p>
				</div>
				<form action="detailInsert" id="detailInsert" method="post" enctype="multipart/form-data">

					<hr />
					<div class="form-group">
							<c:forEach var="co" items="${categoryBoardVO}" varStatus="option">
								
								<ul class="hostInfo">
							<li class="host_name">
								<div class="host_img_wrap">
									<img src="../resources/img/userIMG/${userIMGBoardVO.img}.jpg">
								</div>
								<div class="host_name_wrap">${usersVO.user_ID}</div>
							</li>
							<li class="host_mail"><span class="host_info_title">이메일</span> <span> : </span> <span class="host_info_txt">${usersVO.userEmail1} @ ${usersVO.userEmail2}</span></li>

							<li class="host_phone"><span class="host_info_title">전화번호</span> <span> : </span> <span class="host_info_txt">${usersVO.userPhoneNumber}</span></li>
							<li class="host_intro">
								<p class="host_intro_2">
									${mainBoardVO.text}<br />
								</p>
							</li>
						</ul>
								
								
							</c:forEach>
						</select>
					</div>
			</div>
		</div>
</section>
