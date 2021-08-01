<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<section>
		<div class="container">
			<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-8 join-form">
			<div class="titlebox"></div>
			<form action="joinPage" id="joinPage" method="post">
				<input type="hidden" id="userAdress" name="userAdress" value="주소">
				<div class="form-group">
				<label for="id">아이디</label>
					<c:if test="${kakao_ID eq null}">
						<input type="text" class="form-control" placeholder="아이디는 영문(4~12글자)" name="user_ID" id="user_ID">
					</c:if>
					<c:if test="${kakao_ID ne null}">
						<input type="text" class="form-control" name="user_ID" id="user_ID" value="${kakao_ID}" readonly>
					</c:if>
					<div class="input-group-addon">
						<button type="button" class="btn btn-primary" id="idCheck1">아이디중복체크</button>
					</div>
				</div>
			<span id="msgId"></span>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="비밀번호(영/대 소문자, 숫자조합 8~16)11" name="user_PW" id="user_PW">
				<span id="msgPw"></span>
			</div>
			
			<div class="form-group">
				<input type="password" class="form-control" placeholder="비밀번호를 확인하세요" name="pwConfirm"  id="pwConfirm">
				<span id="msgPw-c"></span>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" placeholder="이름을 입력하세요" name="userName" id="userName">
			</div>
			
			<div class="form-group email-form">
				<label for="email">이메일</label><br>
				<input type="text" class="form-control" id="userEmail1" name="userEmail1" placeholder="이메일">
				<select class="form-control" id="userEmail2"  name="userEmail2">
					<option>@naver.com</option>
					<option>@daum.net</option>
					<option>@gmail.com</option>
					<option>@hanmail.com</option>
					<option>@yahoo.co.kr</option>
				</select>
			</div>
			<!--readonly 속성 추가시 자동으로 블락-->
			<div class="form-group">
				<div class="input-group">
					<input type="text" class="form-control" name="addrZipNum" id="addrZipNum" placeholder="우편번호" readonly>
					<div class="input-group-addon">
						<button type="button" class="btn btn-primary" onclick="goPopup()">주소찾기</button>
					</div>
				</div>
			</div>
			
					<div class="form-group">
						<input type="text" class="form-control" name="addrBasic" id="addrBasic" placeholder="기본주소">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소">
					</div>
					 
					 
		            <div class="from-group">
		               	<input type="text" class="form-control" placeholder="성별을 입력하세요" name="userGender" id="userGender" >
		            </div>

		            <div class="from-group">
		               	<input type="text" class="form-control" placeholder="번호를 입력하세요" name="userPhoneNumber" id="userPhoneNumber" >
		            </div>
                        <!--input2탭의 input-addon을 가져온다 
                        <div class="form-group">
                            <label for="hp">휴대폰번호</label>
                            <div class="input-group">
				<select class="form-control phone1" id="userPhone1">
					<option>010</option>
					<option>011</option>
					<option>017</option>
					<option>018</option>
				</select> 
				<input type="text" class="form-control phone2" id="userPhone2" placeholder="휴대폰번호를 입력하세요.">
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary">본인인증</button>
                                </div>
                            </div>
                        </div>-->
					<input type="hidden" class="ma" name="ma" id="id" value="숨길 내용">
					<input type="hidden" class="la" name="la" id="id" value="숨길 내용">
					<!--button탭에 들어가서 버튼종류를 확인한다-->
					<div class="form-group">
						<button type="button" class="btn btn-lg btn-success btn-block" id="joinBtn">회원가입</button>
					</div>
					
					<div class="form-group">
						<button type="button" class="btn btn-lg btn-info btn-block" onclick="location.href='userLogin' " >로그인</button>
					</div>

				</form>
			</div>
		</div>
	</div>
</section>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9cdd93761c8771defa3902f488e93711&libraries=services"></script><!-- 추가구문 -->
	<script>
		
	
		//아이디 중복체크
		$("#idCheck1").click(function(){
			
			var user_ID = $("#user_ID").val();
			
			if( user_ID == '' || user_ID.length < 4 ){
				$("#user_ID").focus(); //포커싱 함수
				alert("아이디 형식을 확인하세요");
				return; //함수종료
			}
			
			
			//비동기처리.
			$.ajax({
				type: "post",
				url : "idCheck1",
				contentType: "application/json",
				data : JSON.stringify({"user_ID" : user_ID}),
				success : function(data) {
					
					console.log(data);
					if(data == 0) 
					{ //사용가능
						$("#user_ID").attr("readonly", true); //리드온리 속성지정
						$("#msgId").html("사용가능한 아이디 입니다");
					} 
					else { //중복
						$("#msgId").html("중복된 아이디입니다");
					}
					
				},
				error : function(status, error) {
					alert("서버문제가 발생했습니다. 관리자에게 문의하세요.");
				}
				
			})
		})

	
		//폼검증
		$("#joinBtn").click(function(){
			
			var x;
			var y;
			
			console.log( $("#user_ID").attr("readonly") );
			
			//주소값 가공. 별도의 유효성은 추가하면서 잘 녹이실 것.
			//주소값 필수로 입력되었다는 전제입니다.
			mainAddr = $('#addrBasic').val();
			subAddr = $('#addrDetail').val();
			
			$('#userAdress').val(mainAddr);
			
			 var geocoder = new kakao.maps.services.Geocoder();
	            geocoder.addressSearch(mainAddr, function (result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                	y = result[0].y;
	                	x = result[0].x;
	                }
	            });
			
	            
	        
	        setTimeout(function(){
				//중복검사를 하지 않은 경우
				if($("#user_ID").attr("readonly") != 'readonly') {
					alert("아이디 중복검사는 필수 입니다.");
					$("#user_ID").focus();
					return; //함수종료
					
				} else if($("#user_PW").val() =='' || $("#user_PW").val()  != $("#pwConfirm").val()){
			        console.log($("#user_PW").val());
			        console.log("///////////////////////////////");
			        console.log($("#pwConfirm").val());
					$("#pwConfirm").focus(); alert("비밀번호를 확인하세요");
					
				} else if ($("#userName").val() == ''){
					$("#userName").focus();
					alert("이름은 필수 입니다");
					
				//유효성 체크후 submit -> 서버호출
				} else {
					
					$('.ma').val(y);
			        $('.la').val(x);	
					console.log($('.ma').val());
					console.log($('.ma').val() != '숨길 내용');
					$("#joinPage").submit();
				}
			//엔터값 처리 (form태그에 keyup이벤트, 엔터값이 아니라면 처리x)
			$("#joinPage").keyup(function(event) {
				if(event.keyCode != 13) {//엔터의 키값
					return; //함수 종료
				
				}
				$("#joinBtn").click(); //폼검증 함수 호출
			});
	        },500);
		})
	
	</script>
	

	<script>
		//주소 팝업
		function goPopup() {
			var pop = window.open("${pageContext.request.contextPath}/resources/pop/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}

		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
				document.getElementById("addrBasic").value = roadAddrPart1;
	
				document.getElementById("addrDetail").value = addrDetail;
	
				document.getElementById("addrZipNum").value = zipNo;
		}
	</script>







	
    <script>
        /*아이디 형식 검사 스크립트*/
        var id = document.getElementById("user_ID");
        id.onkeyup = function() {
            /*자바스크립트의 정규표현식 입니다*/
            /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
            var regex = /^[A-Za-z0-9+]{4,12}$/; 
            if(regex.test(document.getElementById("user_ID").value )) {
                document.getElementById("user_ID").style.borderColor = "green";
                document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다";

            } else {
                document.getElementById("user_ID").style.borderColor = "red";
                document.getElementById("msgId").innerHTML = "아이디가 중복입니다.";
            }
        }
        /*비밀번호 형식 검사 스크립트*/
        var pw = document.getElementById("user_PW");
        pw.onkeyup = function(){
            var regex = /^[A-Za-z0-9+]{8,16}$/;
             if(regex.test(document.getElementById("user_PW").value )) {
                document.getElementById("user_PW").style.borderColor = "green";
                document.getElementById("msgPw").innerHTML = "사용가능합니다";
            } else {
                document.getElementById("user_PW").style.borderColor = "red";
                document.getElementById("msgPw").innerHTML = "다시 시도해 주세요.";
            }
        }
        /*비밀번호 확인검사*/
        var pwConfirm = document.getElementById("pwConfirm");
        pwConfirm.onkeyup = function() {
            var regex = /^[A-Za-z0-9+]{8,16}$/;
            if(document.getElementById("pwConfirm").value == document.getElementById("user_PW").value ) {
                document.getElementById("pwConfirm").style.borderColor = "green";
                document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
            } else {
                document.getElementById("pwConfirm").style.borderColor = "red";
                document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
            }
        }        
    </script>
