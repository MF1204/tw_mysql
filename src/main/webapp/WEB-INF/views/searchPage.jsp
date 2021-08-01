<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <div class="whole-searchpage">
        <div class="inner-searchpage container">
            <div class="main-searchpage row">
                <nav class="side-title col-lg-2 col-md-2.5 col-sm-3">
                    
                    <div class="title-content">
                        <h1 class="title-head-content">${bigTitle}</h1>
                        <div class="title-content1">
                            <!-- big카테고리에 속하는 middle카테고리 리스트 -->
                            <c:forEach var="vo" items="${middleList}">
                        	<div class="content-list">
                        		<a href="searchPage?searchType=middleCategory&typeValue=${vo.middleCategory}" class="list-link">${vo.middleCategory}</a>
                                <button class="side-list-btn">
                                    <span role="img" rotate="0" class="ebpz7lm2">
                                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n">
                                            <path xmlns="http://www.w3.org/2000/svg" d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"></path>
                                        </svg>
                                    </span>
                                </button>
                        	</div>
                            <c:choose>
                                
                                <c:when test = "${cri.searchType eq 'bigCategory'}">
                                    <div class="css-1n9null ebpz7lm1">
                                        <c:forEach var="smallVO" items="${smallList}">
                                            <c:set var="mid" value="${vo.middleCategory}"/>
                                            <c:set var="small" value="${smallVO.middleCategory}"/>
                                            <c:if test = "${ mid eq small }">
                                                <a href="searchPage?searchType=c_code&typeValue=${smallVO.c_code}" class="ebpz7lm0 css-1rtqxy6 e1lsgt8r0">${smallVO.smallCategory}</a>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:when>
                                
                                <c:when test = "${cri.searchType eq 'middleCategory'}">
                                    <c:set var = "midd" value = "${vo.middleCategory}"/>
                                    
                                    <c:choose>

                                        <c:when test = "${cri.typeValue eq midd}">

                                            <div class="css-1n9hull ebpz7lm1">
                                                <c:forEach var="smallVO" items="${smallList}">
                                                    <c:set var="mid" value="${vo.middleCategory}"/>
                                                    <c:set var="small" value="${smallVO.middleCategory}"/>
                                                    <c:if test = "${ mid eq small }">
                                                        <a href="searchPage?searchType=c_code&typeValue=${smallVO.c_code}" class="ebpz7lm0 css-1rtqxy7 e1lsgt8r0">${smallVO.smallCategory}</a>
                                                    </c:if>
                                                </c:forEach>
                                            </div>

                                        </c:when>

                                        <c:when test = "${cri.typeValue ne midd }">

                                            <div class="css-1n9null ebpz7lm1">
                                                <c:forEach var="smallVO" items="${smallList}">
                                                    <c:set var="mid" value="${vo.middleCategory}"/>
                                                    <c:set var="small" value="${smallVO.middleCategory}"/>
                                                    <c:if test = "${ mid eq small }">
                                                        <a href="searchPage?searchType=c_code&typeValue=${smallVO.c_code}" class="ebpz7lm0 css-1rtqxy6 e1lsgt8r0">${smallVO.smallCategory}</a>
                                                    </c:if>
                                                </c:forEach>
                                            </div>

                                        </c:when>
                                    </c:choose>
                                </c:when>

                                <c:when test="${cri.searchType eq 'c_code'}">
                                    <c:set var = "cc" value = "${path.middleCategory}"/>
                                    <c:set var = "midd" value = "${vo.middleCategory}"/>
                                    <c:choose>
                                        <c:when test="${cc eq midd}">
                                            <div class="css-1n9hull ebpz7lm1">
                                                <c:forEach var="smallVO" items="${smallList}">
                                                    <c:set var="mid" value="${vo.middleCategory}"/>
                                                    <c:set var="small" value="${smallVO.middleCategory}"/>
                                                    <c:if test = "${ mid eq small }">
                                                        <a href="searchPage?searchType=c_code&typeValue=${smallVO.c_code}" class="ebpz7lm0 css-1rtqxy7 e1lsgt8r0">${smallVO.smallCategory}</a>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </c:when>
                                        <c:when test="${cc ne midd}">
                                            <div class="css-1n9null ebpz7lm1">
                                                <c:forEach var="smallVO" items="${smallList}">
                                                    <c:set var="mid" value="${vo.middleCategory}"/>
                                                    <c:set var="small" value="${smallVO.middleCategory}"/>
                                                    <c:if test = "${ mid eq small }">
                                                        <a href="searchPage?searchType=c_code&typeValue=${smallVO.c_code}" class="ebpz7lm0 css-1rtqxy6 e1lsgt8r0">${smallVO.smallCategory}</a>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </c:when>
                                
                            </c:choose>
                        	</c:forEach>
                        </div>
                    </div>
                </nav>

                <div class="main-board-searchpage col-lg-10 col-md-9.5 col-sm-9">
                    <!-- search path -->
                    <section class="css-1wyl56j">
                        <div class="css-1hdh32i e1rp7ga01"></div>
                        <a href="/" class="css-mz86x3 e1rp7ga00">${bigTitle}</a>
                        <c:choose>
                            <c:when test = "${cri.searchType eq 'middleCategory'}">
                                <div class="css-1hdh32i e1rp7ga01">&gt;</div>
                                <a href="/category/6" class="css-mz86x3 e1rp7ga00">${cri.typeValue}</a>
                            </c:when>
                            <c:when test = "${cri.searchType eq 'c_code'}">
                                <div class="css-1hdh32i e1rp7ga01">&gt;</div>
                                <a href="/category/6" class="css-mz86x3 e1rp7ga00">${path.middleCategory}</a>
                            </c:when>
                        </c:choose>
                        
                        <c:if test = "${cri.searchType eq 'c_code'}">
                            <div class="css-1hdh32i e1rp7ga01">&gt;</div>
                            <a href="/category/603" class="css-mz86x3 e1rp7ga00">${path.smallCategory}</a>
                        </c:if>
                    </section>
                    <!-- 검색조건 -->
                    <div class="css-pxo25g">
                        
                        <!-- 카테고리 내에서 검색 -->
                        <form action="searchPage" method="get">
                            <!-- 체크박스 -->
                            <!-- <div class="css-zjik7">
                                <div class="css-zjik7 e1t4yfrj2">
                                    <div class="css-0 e1t4yfrj1">
                                        <label color="#ffd400" class="css-2k98vs">
                                            <span class="css-19ldx4e">
                                                <input type="checkbox" class="css-r5ggoa elgfge2" style="margin-top: 0px;">
                                                <span class="css-1wreaqz elgfge1">삽니다</span>
                                            </span>
                                        </label>
                                    </div>
                                    <div class="css-0 e1t4yfrj1">
                                        <label color="#ffd400" class="css-2k98vs elgfge0">
                                            <span class="css-19ldx4e elgfge3">
                                                <input type="checkbox" class="css-r5ggoa elgfge2" style="margin-top: 0px;">
                                                <span class="css-1wreaqz elgfge1">팝니다</span>
                                            </span>
                                        </label>
                                    </div>
                                </div>
                            </div> -->
                            <!-- 검색 -->
                            <span class="btn_img" style="width: 140px;">
                                <input type="text" class="inner-search" id="inner-search" name="searchName" value="">
                                <button type="submit" class="btn-search"><span class="glyphicon glyphicon-search"></span></button>
                            </span>
                            <span class="btn_img search-select">
                                <select name="searchType2">
                                    <option value="title_content">제목+내용</option>
                                    <option value="title">제목</option>
                                    <option value="content`">내용</option>
                                    <option value="user_id">작성자</option>
                                </select>
                            </span>
                            <input type="hidden" name="pageNum" value="1">
	            			<input type="hidden" name="amount" value="${pageVO.cri.amount}">
	            			<input type="hidden" name="searchType" value="${pageVO.cri.searchType}">
	            			<input type="hidden" name="typeValue" value="${pageVO.cri.typeValue}">
                        </form>
                    

                        
                    </div>
                    <!-- 검색조건에 맞는 게시물 목록 -->
                    <div class="css-1thgtsb elz42uf6 container" style="padding-left: 5px; padding-right: 5px;">
                        <div class="row">
							
							<c:if test = "${thumbnailList eq null }">
								<div class="nullp">
									<p>아직 게시글이 없습니다.</p>
								</div>
							</c:if>
								<c:if test = "${thumbnailList ne null}">
	                            <c:forEach var = "thumbnail" items="${thumbnailList}">
	                                <article class="css-1c4kgrp elz42uf4 col-lg-3 col-md-4 col-sm-6 col-xs-6">
	                                    <div class="css-1d3w5wq ezeyqpv18">
	                                        <a href="${pageContext.request.contextPath}/detailBoard/detailPage?bno=${thumbnail.bno}" class="css-1mr8hr4 ezeyqpv17">
	                                            
                                                <div class="css-1ohlt9r">
                                                    <c:if test="${thumbnail.img ne null}">
                                                    <img title="${thumbnail.title}"
                                                        alt="${thumbnail.title}"
                                                        src="resources/img/userIMG/${thumbnail.img}.jpg" loading="lazy"
                                                        class="css-d1mg3o ejobblq0">
                                                    </c:if>
                                                </div>
	                                            
	                                            <div class="css-gxq4i8 ezeyqpv13">
	                                                <h3 data-testid="title" class="css-abfrks ezeyqpv9">${thumbnail.title}</h3>
	                                                <div class="css-1eoy87d ezeyqpv6">
	                                                    <div class="css-s5xdrg ezeyqpv5">
	                                                        <div data-testid="price" class="css-1848xfl ezeyqpv4">
	                                                            <span>${thumbnail.price}</span><strong>원~</strong></div>
	                                                    </div>
	                                                </div>
	                                                <div class="css-mkpab3 ezeyqpv2"><span role="img" rotate="0" data-testid="rating-icon"
	                                                        class="ezeyqpv3 css-1mrr0sj e181xm9y1"><svg width="18" height="18" viewBox="0 0 24 24"
	                                                            fill="currentColor" aria-hidden="true" focusable="false"
	                                                            preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
	                                                            <path
	                                                                d="M14.43,10l-1.47-4.84c-0.29-0.95-1.63-0.95-1.91,0L9.57,10H5.12c-0.97,0-1.37,1.25-0.58,1.81l3.64,2.6l-1.43,4.61 c-0.29,0.93,0.79,1.68,1.56,1.09L12,17.31l3.69,2.81c0.77,0.59,1.85-0.16,1.56-1.09l-1.43-4.61l3.64-2.6 c0.79-0.57,0.39-1.81-0.58-1.81H14.43z">
	                                                            </path>
	                                                        </svg></span><span class="css-p9bq5v ezeyqpv0"></span>
                                                            <div class="css-0 ezeyqpv1">${thumbnail.recnum}</div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </article>
                                    </c:forEach>
                            	</c:if>
                                
                            </div>
                            
                            <!-- 페이지네이션 -->
                        <div class="gow">
                            <form action="searchPage" name="pageForm" method="GET">
                                <div class="css-1wnowod">
                                    <hr/>
                                    <ul class="css-awz0iq">
                                        <c:if test="${pageVO.prev}">
                                            <li class="css-1lv1yo7">
                                                <a href="#" data-pagenum="${pageVO.startPage-1}" class="css-liu8ox">
                                                    <span role="img" rotate="0">
                                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
                                                            <path xmlns="http://www.w3.org/2000/svg" d="M15.41 16.59L10.83 12l4.58-4.59L14 6l-6 6 6 6 1.41-1.41z"></path>
                                                        </svg>
                                                    </span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:forEach var="num" begin="${pageVO.startPage}" end="${pageVO.endPage}">
                                            <li class="${pageVO.pageNum eq num ? 'page-active' : 'css-1lv1yo7'}">
                                                <a href="#" data-pagenum="${num}" class="css-liu8ox">${num}</a>
                                            </li>
                                        </c:forEach>

                                        <c:if test="${pageVO.next}">
                                            <li class="css-1lv1yo7">
                                                <a href="#" data-pagenum="${pageVO.endPage+1}" class="css-liu8ox">
                                                    <span role="img" rotate="0">
                                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
                                                            <path xmlns="http://www.w3.org/2000/svg" d="M15.41 16.59L10.83 12l4.58-4.59L14 6l-6 6 6 6 1.41-1.41z"></path>
                                                        </svg>
                                                    </span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>                            
                                <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}">
                                <input type="hidden" name="amount" value="${pageVO.cri.amount}">
                                <input type="hidden" name="searchType" value="${pageVO.cri.searchType}">
                                <input type="hidden" name="searchType2" value="${pageVO.cri.searchType2}">
                                <input type="hidden" name="typeValue" value="${pageVO.cri.typeValue}">
                                <input type="hidden" name="searchName" value="${pageVO.cri.searchName}">
                            </form>
                        
                        <!-- 글 작성 -->
                            <c:if test="${sessionScope.userVO != null}">
                                <div class="goWrite">
                                    <a class="btn_img" href="#">
                                        <i class="glyphicon glyphicon-pencil"></i> 쓰기
                                    </a>
                                </div>
                            </c:if>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(".content-list").click(function (node) {

            var hidden = event.currentTarget;
            if ($(hidden).next().hasClass("content-list")) return;

            if ($(hidden).next().hasClass("css-1n9null")) {
                $(".css-1n9hull").removeClass("css-1n9hull");
                $(hidden).next().removeClass("css-1n9null");
                $(hidden).next().addClass("css-1n9hull");

                $(".css-1rtqxy7").addClass("css-1rtqxy6");
                $(".css-1rtqxy7").removeClass("css-1rtqxy7");
                $(hidden).next().children("a").removeClass("css-1rtqxy6");
                $(hidden).next().children("a").addClass("css-1rtqxy7");
            } else {
                $(".css-1rtqxy7").addClass("css-1rtqxy6");
                $(".css-1rtqxy7").removeClass("css-1rtqxy7");
                
                $(".css-1n9hull").addClass("css-1n9null");
                $(".css-1n9hull").removeClass("css-1n9hull");
            }
        });

        var pagination = $(".css-awz0iq");
        pagination.click(function() {
            event.preventDefault();
            console.log($(event.target).prop('tagName'));
            if($(event.target).prop('tagName') != 'A') return;

            document.pageForm.pageNum.value = event.target.dataset.pagenum;
            document.pageForm.submit();
        });


    </script>
