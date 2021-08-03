<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 write-wrap">

				<div class="titlebox">
					<p>구매한 수업</p>
				</div>
				<form action="detailInsert" id="detailInsert" method="post" enctype="multipart/form-data">
					<hr />
					<div class="form-group">
						<c:forEach var="co" items="${customerBoardVO}" varStatus="option">
							<div style="border: 1px solid black; padding-top: 10px; margin: 10px; width: 50%; padding-left: 50px">


								<ul class="hostInfo">
									<li class="host_name"><span class="host_info_title">금액</span> <span> : </span>${co.money} 원</li>
									<li class="host_mail"><a href="../detailBoard/detailPage?bno=${co.bno}" class="content-title">${co.bno}번 글</a></li>
									<li class="host_mail"><span class="host_info_txt">${co.rno}</span><span class="host_info_title"> 번 옵션</span></li>
								</ul>

							</div>


						</c:forEach>
						<hr />

						<div class="titlebox">
							<p>내가 작성한 수업</p>
						</div>

						<c:forEach var="vo" items="${mainBoardVOs}" varStatus="option">
							<div style="border: 1px solid black; padding-top: 10px; margin: 10px; width: 50%; padding-left: 50px">


								<ul class="hostInfo">
									<li class="host_name"><a href="../detailBoard/detailPage?bno=${vo.bno}" class="content-title"><h1>${vo.title}</a></h1></li>
									<li class="host_mail">${vo.bno}번 글</li>
									<li class="host_mail"><span class="host_info_txt">${vo.text}</span><span class="host_info_title"> 번 옵션</span></li>

								</ul>

							</div>


						</c:forEach>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
