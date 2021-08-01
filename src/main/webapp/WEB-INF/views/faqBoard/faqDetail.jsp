<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 write-wrap">
				<div class="article-wrapper">
					<span>고객문의</span>
				</div>
				
				<form action="faqModify" method="post">
					<input type="hidden" name='bno' value='${boardVO.bno}'>
					
					<div class="article-header">
						${boardVO.title}
					</div>
				
					<div class="title-toolbar">
						<span class="title-toolbar-left">
							작성자: ${boardVO.writer}
						</span>
						<span class="title-toolbar-right">
							<fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd" />
						</span>
					</div>
					
					<div class="article-content">
						<div>
							<c:out value="${boardVO.content}" escapeXml="false" />
						</div>
					</div>
					
	<%-- 					
						<c:if test="${sessionScope.userVO != null}">
	세션완성후 구현						<button type="submit" class="btn btn-primary">변경</button>
						</c:if> 
	--%>
					<div class="faq-buttons">
						<button type="submit" class="btn btn-primary">변경</button>
						<button type="button" class="btn btn-dark" onclick="location.href='faqList'">목록</button>
					</div>

				</form>

			</div>
		</div>
	</div>
</section>


