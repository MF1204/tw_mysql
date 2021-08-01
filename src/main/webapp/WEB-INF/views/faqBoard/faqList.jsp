<!-- 어드민 아닌 일반유저의 경우
전체문의내역 탭 보여야할지? 안보여야할지? 정책필요 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<br>
<section>
	<div class="container-fluid" style="padding: 0; margin: 0;">
		<dic class="row">
		<div class="col-xs-12" style="padding: 0; margin: 0;">
			<div id="faqlist-top">
				<section>
					<div class="faqlist-bg"></div>
					<h1>고객 문의</h1>
				</section>
			</div>
		</div>
		</dic>
	</div>
	
	<div class="container">
		<div class="row">

			<div class="col-sm-12">
				<section>

					<div class="container-fluid">
						<div class="row">
							<!--lg에서 9그리드, xs에서 전체그리드-->
							<div class="col-lg-9 col-xs-12 board-table">
								<!--1.검색부분을 폼으로 넘기는데 컨트롤러에서 필요한 값을 hidden으로 처리해서 넘겨줍니다-->
								
								<form action="faqList">
									<div class="search-wrap">
										<button type="submit" class="btn btn-info search-btn">검색</button>
										<input type="text" class="form-control search-input"
											name="searchName" value="${pageVO.cri.searchName }">
										<select class="form-control search-select" name="searchType">
											<!-- 키워드 타입 -->
											<option value="title"
												${pageVO.cri.searchType eq 'title' ? 'selected': '' }>
												제목
											</option>
											<option value="content"
												${pageVO.cri.searchType eq 'content'? 'selected' : '' }>
												내용
											</option>
											<option value="writer"
												${pageVO.cri.searchType eq 'writer' ? 'selected': '' }>
												작성자
											</option>
											<option value="titcont"
												${pageVO.cri.searchType eq 'titcont'? 'selected' : '' }>
												제목+내용
											</option>
										</select>
									</div>
									<input type="hidden" name="pageNum" value="1"> <input
										type="hidden" name="amount" value="10">
								</form>
								
								<div class="faqTable">

									<ul class="nav nav-tabs tabsCenter">
										<li class="active"><a href="#home">전체 문의 내역</a></li>
										<li><a href="#menu1">내 문의 내역</a></li>
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>번호</th>
														<th class="board-title">제목</th>
														<th>작성자</th>
														<th>등록일</th>
														<th>수정일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="vo" items="${list }">
														<tr>
															<td>${vo.bno }</td>
															<td><a href="faqDetail?bno=${vo.bno }">${vo.title }</a></td>
															<td>${vo.writer }</td>
															<td>
																${vo.timetotext}
															</td>
															<td>
																${vo.timetotext2}
															</td>
														</tr>
													</c:forEach>
												</tbody>

											</table>
										</div>
										<div id="menu1" class="tab-pane fade">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>번호</th>
														<th class="board-title">제목</th>
														<th>작성자</th>
														<th>등록일</th>
														<th>수정일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="vo" items="${list }">
														<tr>
															<td>${vo.bno }</td>
															<td><a href="faqDetail?bno=${vo.bno }">${vo.title }</a>
															</td>
															<td>${vo.writer }</td>
															<td>
																${vo.timetotext}
															</td>
															<td>
																${vo.timetotext2}
															</td>
														</tr>
													</c:forEach>
												</tbody>

											</table>
										</div>

									</div>
								</div>

								<form action="faqList" name="pageForm">
									<div class="text-center">
										<hr>
										<ul class="pagination pagination-sm">

											<c:if test="${pageVO.prev }">
												<li><a href="#" data-pagenum="${pageVO.startPage -1 }">이전</a></li>
											</c:if>
											<c:forEach var="num" begin="${pageVO.startPage }"
												end="${pageVO.endPage }">
												<li class="${pageVO.pageNum eq num ? 'active' : '' }">
													<a href="#" data-pagenum="${num }">${num }</a>
												</li>
											</c:forEach>

											<c:if test="${pageVO.next }">
												<li><a href="#" data-pagenum="${pageVO.endPage + 1 }">다음</a></li>
											</c:if>

										</ul>

										<%-- 세션 완성   후 구현
                                            <c:if test="${sessionScope.userVO != null}">
                                                <button type="button" class="btn btn-info"
                                                    onclick="location.href ='faqRegist' ">글쓰기</button>
                                            </c:if>
                                            
--%>


										<div class="faq-buttons">
											<button type="button" class="btn btn-info"
												onclick="location.href ='faqRegist' ">글쓰기</button>
										</div>


										</div>
										<input type="hidden" name="pageNum"
											value="${pageVO.cri.pageNum }"> <input type="hidden"
											name="amount" value="${pageVO.cri.amount }"> <input
											type="hidden" name="searchType"
											value="${pageVO.cri.searchType }"> <input
											type="hidden" name="searchName"
											value="${pageVO.cri.searchName }">
								</form>

							</div>

						</div>
					</div>

				</section>
			</div>
		</div>
	</div>
</section>




<script>

		//???누구글보기내역 이런건가
        $(document).ready(function () {
            $(".nav-tabs a").click(function () {
                $(this).tab('show');
            });
        });
        
        
        
        
		//페이지처리 -
		//모든 a버튼을 눌렀을 때 a가 가지고 있는 pageNum값을 가지고 form태그로 이동하도록 처리
		//동적쿼리 이용해서 sql문 변경
		//화면에 검색키워드가 미리 남겨지도록 처리.
		var pagination = document.querySelector(".pagination");
		pagination.onclick = function() {
			event.preventDefault(); //고유이벤트 속성 중지
			if(event.target.tagName != 'A') return; //A가 아니라면 종료
			
			//사용자가 클릭한 페이지 번호를 form에 넣고 서브밋을 보냅니다.
			document.pageForm.pageNum.value = event.target.dataset.pagenum;
			document.pageForm.submit(); //서브밋		
		}
	
	
        
        
        
</script>