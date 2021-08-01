<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 write-wrap">
                        <div class="titlebox">
                            <p>수정하기</p>
                        </div>
                        
                        <form action="faqUpdate">
                            <div>
                                <label>DATE</label>
                            	 <fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd" />
                            </div>   
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" name='bno' value="${boardVO.bno }" readonly>
                            </div>
                            <div class="form-group">
                                <label>작성자</label>
                                <input class="form-control" name='writer' value="${boardVO.writer }" readonly>
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name='title' value="${boardVO.title }" required>
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name='content' required>${boardVO.content }</textarea>
                            </div>

                            <button type="button" class="btn btn-dark" onclick="location.href = 'faqList'">목록</button>    
                            <button type="submit" class="btn btn-primary">변경</button>
                            <button type="button" class="btn btn-info " onclick="location.href = 'faqDelete?bno=${boardVO.bno}&${boardVO.writer}'">삭제</button>
                    </form>
                                    
                </div>
            </div>
        </div>
</section>
      
      