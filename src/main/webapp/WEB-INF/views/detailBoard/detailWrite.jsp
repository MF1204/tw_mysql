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
						<label>카테고리1</label> <select name="bigCategory" id="bigCategory">
							<c:forEach var="co" items="${categoryBoardVO}" varStatus="option">
								<option value="${co.bigCategory}">${co.bigCategory}</option>
							</c:forEach>
						</select>
					</div>


					<div class="form-group">
						<label>카테고리2</label> <select name="middleCategory" id="middleCategory">
							<!-- 여기 -->
						</select>
					</div>


					<div class="form-group">
						<label>카테고리3</label> <select name="smallCategory" id="smallCategory">
						</select>
					</div>

					<hr />
					<div id="fileUpload"></div>
					<button type="button" class="right btn btn-default btn_option" id="fileUploadBtn">파일 추가하기</button>


					<hr />
					<div class="form-group">
						<label>멘토/멘티 구분</label> <input class="form-control" name="boardType" value="멘토" readonly="readonly">
					</div>


					<hr />

					<div class="form-group">
						<label>작성자</label>
						<c:choose>

							<c:when test="${usersVO == null}">
								<input class="form-control" name='user_ID' value="사용자" readonly="readonly">

							</c:when>

							<c:otherwise>
								<input class="form-control" name='user_ID' value="${usersVO.user_ID}" readonly="readonly">
							</c:otherwise>

						</c:choose>
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" id="title" name='title' value="제목" required>
					</div>
					<div class="form-group">
						<label>간략 소개</label> <input class="form-control" name='text' value="간략 소개" required>
					</div>
					<div class="form-group">
						<label>대표 금액</label> <input class="form-control" id='money' name='money' value="1000" type="text" required>
					</div>

					<hr />
					<div id="addoption"></div>
					<button type="button" class="right btn btn-default btn_option" id="replyRegis">옵션 추가하기</button>
					<hr />
					<div class="form-group">
						<label>설명1</label>
						<textarea class="form-control" rows="10" name='text1' required>설명1</textarea>
					</div>


					<div class="form-group">
						<label>설명2</label>
						<textarea class="form-control" rows="10" name='text2' required>설명2</textarea>
					</div>

					<div class="form-group">
						<label>설명3</label>
						<textarea class="form-control" rows="10" name='text3' required>설명3</textarea>
					</div>
					<br />
					<button type="button" class="btn btn-dark" onclick="location.href = 'freeList'">목록</button>
					<div id="submitHere">
						<button type="button" class="btn btn-dark" id="okBtn">확인</button>
					</div>
					<hr />
				</form>
			</div>
		</div>
</section>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js"></script>
<script>
	//폼검증
	$("#okBtn").click(function() {
		console.log("123");
		console.log(($("#fileinsert").val()));
		if ($("#smallCategoryON").length < 1) { //중복검사를 하지 않은 경우
			alert("관심 카테고리 선택은 필수 입니다.");
			$("#smallCategory").focus();
			return; //함수종료
		} else if ($("#title").val() == '') {
			alert("제목 작성은 필수입니다.");
			$("#title").focus();
			return;
		} else if ($("#fileinsert").length < 1 || $("#fileinsert").val() == '') {
			alert("파일 입력은 필수입니다.");
			$("#fileinsert").focus();
			return;
		} else if ($("#option").length < 1) {
			alert("하나의 옵션입력은 필수입니다.");
			$("#addoption").focus();
			return;
		} else {
			console.log($("#smallCategory").length);
			var submitAdd = "";
			submitAdd = '<button type="submit" class="btn btn-primary"  id="okBtn">저장</button>'
			$("#okBtn").remove();
			$("#submitHere").append(submitAdd);
			f++;
		}

	})
</script>

<script>
	//주소팝업
	var addCount = 0;

	function goPopup(i) {
		addCount = i;
		// var pop = window.open("${pageContext.request.contextPath}/resources/pop/jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
		var pop = window.open("${pageContext.request.contextPath}/resources/pop/jsp_xy/jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo, entX, entY) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

		proj4.defs["EPSG:5179"] = "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units= m +no_defs";//제공되는 좌표 
		var grs80 = proj4.Proj(proj4.defs["EPSG:5179"]);
		var wgs84 = proj4.Proj(proj4.defs["EPSG:4326"]); //경위도 +

		document.querySelectorAll("#addrBasic")[addCount].value = roadAddrPart1;
		document.querySelectorAll("#addrDetail")[addCount].value = addrDetail;
		console.log(entX);
		console.log(entY);
		console.log("########################");
		console.log(typeof entX);
		console.log(typeof entY);
		console.log("########################");
		entX = Number(entX);
		entY = Number(entY);
		console.log(typeof entX);
		console.log(typeof entY);
		console.log("########################");
		var p = proj4.Point(entX, entY);//한국지역정보개발원 좌표 
		console.log("########################");
		console.log(p);
		console.log("########################");
		p = proj4.transform(grs80, wgs84, p);
		console.log(p);
		console.log("########################");
		document.querySelectorAll("#entX")[addCount].value = p.x;
		document.querySelectorAll("#entY")[addCount].value = p.y;
		console.log(p.x);
		console.log(p.y);

	}

	var fileBtn = document.getElementById("fileUploadBtn");
	var f = 0;
	fileBtn.onclick = function() {
		var fileAdd = "";
		fileAdd += '파일선택:<input type="file" id="fileinsert" name="imguploadList[' + f+ '].file"><br/>'

		$("#fileUpload").append(fileAdd);
		f++;

	}

	var btn = document.getElementById("replyRegis");
	var i = 0;
	btn.onclick = function() {
		var strAdd = "";
		strAdd += '<div class="option" id="option">'
		strAdd += '<div class="form-group">'
		strAdd += '		<label>세부 금액</label>'
		strAdd += '		<input class="form-control" name="list[' + i + '].Money"  type="number"  value="123">'
		strAdd += '</div>'
		strAdd += '<br/>'
		strAdd += '<div class="form-group">'
		strAdd += '<label>옵션 간단 설명</label>'
		strAdd += '<input type="text" class="form-control" name="list[' + i + '].exText"  placeholder="간단 설명">'
		strAdd += '</div>'
		strAdd += '<hr/>'
		strAdd += '	<h1>자세한 일정은 상호합의하에 변경하여도 무관합니다.</h1>'
		strAdd += '<hr/>'
		strAdd += ' <div style="margin-right: 50px; display: inline-block">'
		strAdd += '    <input type="date"  name="list[' + i + '].day1" >'

		strAdd += '  </div>'
		strAdd += '    ~'
		strAdd += '    <div style="margin-left: 50px;  display: inline-block">'
		strAdd += '       <input type="date"  name="list[' + i + '].day2">'
		strAdd += '   </div>'

		strAdd += '	<div class="form-group">'
		strAdd += '<div class="form-group">'
		strAdd += '<hr/>'
		strAdd += '	<label>시간</label>'
		strAdd += '	<label for="from">From</label>'
		strAdd += '    <select  name="list[' + i + '].M_time1">'
		strAdd += '       <option value="09">오전 09시</option>'
		strAdd += '       <option value="10">오전 10시</option>'
		strAdd += '       <option value="11">오전 11시</option>'
		strAdd += '       <option value="12">오후 12시</option>'
		strAdd += '       <option value="13">오후 1시</option>'
		strAdd += '       <option value="14">오후 2시</option>'
		strAdd += '       <option value="15">오후 3시</option>'
		strAdd += '       <option value="16">오후 4시</option>'
		strAdd += '       <option value="17">오후 5시</option>'
		strAdd += '       <option value="18">오후 6시</option>'
		strAdd += '       <option value="19">오후 7시</option>'
		strAdd += '       <option value="20">오후 8시</option>'
		strAdd += '       <option value="21">오후 9시</option>'
		strAdd += '       <option value="22">오후 10시</option>'
		strAdd += '       <option value="23">오후 11시</option>'
		strAdd += '       <option value="24">오후 12시</option>'
		strAdd += '       <option value="01">오전 01시</option>'
		strAdd += '       <option value="02">오전 02시</option>'
		strAdd += '    </select>'

		strAdd += '	<label for="to">to</label>'
		strAdd += '    <select  name="list[' + i + '].M_time2">'
		strAdd += '       <option value="09">오전 09시</option>'
		strAdd += '       <option value="10">오전 10시</option>'
		strAdd += '       <option value="11">오전 11시</option>'
		strAdd += '       <option value="12">오후 12시</option>'
		strAdd += '       <option value="13">오후 1시</option>'
		strAdd += '       <option value="14">오후 2시</option>'
		strAdd += '       <option value="15">오후 3시</option>'
		strAdd += '       <option value="16">오후 4시</option>'
		strAdd += '       <option value="17">오후 5시</option>'
		strAdd += '       <option value="18">오후 6시</option>'
		strAdd += '       <option value="19">오후 7시</option>'
		strAdd += '       <option value="20">오후 8시</option>'
		strAdd += '       <option value="21">오후 9시</option>'
		strAdd += '       <option value="22">오후 10시</option>'
		strAdd += '       <option value="23">오후 11시</option>'
		strAdd += '       <option value="24">오후 12시</option>'
		strAdd += '       <option value="01">오전 01시</option>'
		strAdd += '       <option value="02">오전 02시</option>'
		strAdd += '    </select>'
		strAdd += '<hr/>'
		strAdd += '</div>'

		strAdd += '   <div class="day">'
		strAdd += '       <input type="checkbox"  name="list[' + i + '].DTlist[0]" value="월"> 월'
		strAdd += '       <input type="checkbox"  name="list[' + i + '].DTlist[1]" value="화"> 화'
		strAdd += '       <input type="checkbox"  name="list[' + i + '].DTlist[2]" value="수"> 수'
		strAdd += '       <input type="checkbox"  name="list[' + i + '].DTlist[3]" value="목"> 목'
		strAdd += '       <input type="checkbox"  name="list[' + i + '].DTlist[4]" value="금"> 금'
		strAdd += '       <input type="checkbox"  name="list[' + i + '].DTlist[5]" value="토"> 토'
		strAdd += '       <input type="checkbox"  name="list[' + i + '].DTlist[6]" value="일"> 일'
		strAdd += '   </div>'
		strAdd += '  </div>'

		strAdd += '<div class="form-group underSize">'
		strAdd += '	<label for="addr-num">주소</label>'
		strAdd += '		<div class="input-group">'
		strAdd += '		<div class="input-group-addon">'
		strAdd += '			<button type="button" class="btn btn-primary"'
		strAdd += '			onclick="goPopup(' + i + ')">주소찾기</button>'
		strAdd += '		</div>'
		strAdd += '	</div>'
		strAdd += '</div>'

		strAdd += '<div class="form-group">'
		strAdd += '<input type="text" class="form-control" name="list[' + i + '].addrBasic" id="addrBasic" placeholder="기본주소">'
		strAdd += '</div>'

		strAdd += '<div class="form-group">'
		strAdd += '<input type="text" class="form-control" name="list[' + i + '].addrDetail" id="addrDetail" placeholder="상세주소">'
		strAdd += '</div>'

		strAdd += '<div class="form-group">'
		strAdd += '<input type="hidden" class="form-control" name="list[' + i + '].entX" id="entX" placeholder="x좌표">'
		strAdd += '<input type="hidden" class="form-control" name="list[' + i + '].entY" id="entY" placeholder="y좌표">'
		strAdd += '</div>'

		strAdd += '   </div>'

		strAdd += '</div>'
		$("#addoption").append(strAdd);
		i++;

	}
</script>

<script>
	$("#bigCategory").change(function() {
		var bigCategory = $("#bigCategory").val();
		console.log(bigCategory);
		middleAdd = "";
		$.ajax({
			type : "post",
			url : "../detailBoard/detailWriteUpdate",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify({
				"bigCategory" : bigCategory
			}),
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					middleAdd += '<option value="' + data[i].middleCategory + '">' + data[i].middleCategory + '</option>'
				}
				$("#middleCategory").html(middleAdd); //추가
			},
			error : function(status, error) {
				console.log(error);
			}
		})

	});
</script>
<script>
	$("#middleCategory").change(function() {
		var middleCategory = $("#middleCategory").val();
		console.log(middleCategory);
		smallAdd = "";
		$.ajax({
			type : "post",
			url : "../detailBoard/detailWriteUpdate",
			contentType : "application/json; charset=UTF-8",
			data : JSON.stringify({
				"middleCategory" : middleCategory
			}),
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					smallAdd += '<option id="smallCategoryON" value="' + data[i].smallCategory + '">' + data[i].smallCategory + '</option>'
				}
				$("#smallCategory").html(smallAdd); //추가
			},
			error : function(status, error) {
				console.log(error);
				alert("수정에 실패했습니다. 관리자에게 문의하세요");
			}
		})

	});
</script>