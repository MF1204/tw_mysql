<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section>
	<div class="container CCC">
		<!--container => 중앙위치 /      container-fluid -->
		<div class="row">
			<div class="col-sm-12" style="float: none; margin: 0 auto;">
				<div class="GigDetailContainer">
					<div class="RightModules" style="width: 100%;">
						<div class="upBox">
							<div class="GigMainGallery"></div>
							<!------------------------------------->

							<div class="GigTitle">

								<h1>${mainBoardVO.title}</h1>

								<div class="gig-detail-price">
									<h3>
										"${mainBoardVO.price}" <span>~</span>
									</h3>
									<h5 class="margin-none1">(VAT 포함가)</h5>
								</div>
							</div>

							<!------------------------------------->
							<div class="GigPackages">
								<div class="gig-detail-pacakage-panel">
									<!-- //////////////////////////////////////////////////////// -->
									<ul class="nav nav-tabs">
										<li class="active"><a href="#home"> 선택한 옵션 </a></li>
									</ul>

									<div class="tab-content">
										<div id="home" class="tab-pane fade in active">
											<div class="package-header">
												<span class="package-price">${ymBoardVO.money}원</span> <span class="package-type">Standard</span>
											</div>
											<div class="package-body">
												<div class="GigPackageOption"></div>
												<div class="map">
													<div class="mapbox">

														<div id="map" style="width: 500px; height: 400px; border: 10px solid black"></div>

													</div>
													<div class="address">
														<span> - 만남장소</span>
														<h1>${ymBoardVO.addrBasic}</h1>
														<h1>${ymBoardVO.addrDetail}</h1>
														<input type="hidden" name="entX" value="${ymBoardVO.entX}"> <input type="hidden" name="entY" value="${ymBoardVO.entY}">

													</div>
												</div>
												<div class="user_info">

													<div class="form-group">
														<label>이름</label> <input class="form-control" name='bno' value="${usersVO.user_ID}" readonly="readonly">
													</div>

													<div class="form-group">
														<label>금액</label> <input class="form-control" name='bno' value="${vo.bno}" readonly>
													</div>
													<div class="form-group" style="width: 40%; float: right;">
														<label>전화번호</label> <input class="form-control" name='PhoneNumber' id="PhoneNumber"  value="${usersVO.userPhoneNumber}">
													</div>

														<label>이메일</label> 
													<div class="form-group" style="width: 40%;">
														<input class="form-control" id='email1' value="${usersVO.userEmail1}" style="width: 40%; float: left">
														<p style=" float: left">&nbsp;@ &nbsp;</p>
														<input class="form-control" id='email2' value="${usersVO.userEmail2}" style="width: 40%; ">
										
													</div>

													<div class="form-group">
														<label>신청자 동의</label>
														<div class="edit_wrap agreement">
															<div class="all_check_area">
																<input type="checkbox" id="all" class="all_check"> <label for="all">신청자 동의</label>
															</div>
															<div class="edit_check">
																<input type="checkbox" id="chk11" class="all_check"> <label for="all">(필수) 개인정보 제3자 제공 동의</label>
																<button type="button" id="btn1" class="closed">내용보기</button>

																<div class="theTBox" style="background-color: white"></div>

															</div>
														</div>
													</div>


												</div>
												<div class="package-direct-order">
													<button type="button" class="btn123"  onclick="requestPay()">
														<span>결제하기</span>
													</button>
												</div>

											</div>
										</div>
										<div id="menu1" class="tab-pane fade"></div>
										<div id="menu2" class="tab-pane fade"></div>
									</div>
									<!-- //////////////////////////////////////////////////////// -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



</section>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c9c2c80f44b7412a52bfb0036f525c9"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	IMP.init("imp39889735"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

	function requestPay() {

		
		console.log($("#PhoneNumber").val()); //폰번호
		console.log("${ymBoardVO.money}");//결제 금액
		console.log($("#email1").val()+"@"+$("#email2").val());//이메일
		console.log("${usersVO.userAdress}");
		console.log("${usersVO.user_ID}");//유저 아이디
		console.log("${ymBoardVO.rno}" + "${usersVO.user_ID}");//결제 이름
		
		
		
		
		
		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : "${mainBoardVO.title}"+"${ymBoardVO.rno}",
			amount : 10, //판매 가격
			//"${ymBoardVO.money}"
			buyer_email : $("#email1").val()+"@"+$("#email2").val(),
			buyer_name : '${usersVO.user_ID}',
			buyer_tel : $("#PhoneNumber").val(),
			buyer_addr : "${usersVO.userAdress}"
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '고유ID타입 : ' + typeof(rsp.imp_uid);
				
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '상점 거래ID 타입 : ' + typeof(rsp.merchant_uid);
				
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '결제 금액 타입: ' + typeof(rsp.paid_amount);
				
				msg += '카드 승인번호 : ' + rsp.apply_num;
				msg += '카드 승인번호 타입: ' + typeof(rsp.apply_num);
				console.log(msg);
				// jQuery로 HTTP 요청

				jQuery.ajax({
					url : "../reply/charge", //cross-domain error가 발생하지 않도록 주의해주세요
					type : "post",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify( {
						"bno" : "${ymBoardVO.rno}",
						"rno" : "${mainBoardVO.bno}",
						"user_ID" : "${usersVO.userAdress}",
						"money" : rsp.paid_amount
					}),
					success : function(data) {
						if (data == 1) {
							alert("저장성공");
							location.href="../detailBoard/detailPage?bno=${mainBoardVO.bno}";
							

						} else {
							alert("비밀번호 오류");
							console.log(data);
						}
					}
				}).done(function(data) { // 응답 처리


				})
			} else {
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
		});

	}
</script>



<script>
	
</script>








<script>
	var entX = "${ymBoardVO.entX}";
	entX = Number(entX);

	var entY = "${ymBoardVO.entY}";
	entY = Number(entY);

	var container = document.getElementById('map');
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(entY, entX), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(entY, entX);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>

<script>
	var strMin = "";
	var strAdd = "";
	strAdd += '<P style="border: 1px solid black; padding: 50px;">'
	strAdd += '<br/>\TIGERWHALE\은 (이하 \회사\'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br/>'
	strAdd += '<br/>'
	strAdd += '<br/>회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.'
	strAdd += '<br/>회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.'
	strAdd += '<br/><br/>'
	strAdd += '<br/>■ 수집하는 개인정보 항목'
	strAdd += '<br/><br/>'
	strAdd += '<br/>회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.'
	strAdd += '<br/><br/>'
	strAdd += '<br/>ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 주민등록번호 , 서비스 이용기록 , 접속 로그 , 접속 IP 정보 , 결제기록'
	strAdd += '<br/>ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식'
	strAdd += '<br/><br/>'
	strAdd += '<br/>■ 개인정보의 수집 및 이용목적'
	strAdd += '<br/><br/>'
	strAdd += '<br/>회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.'
	strAdd += '<br/><br/>'
	strAdd += '<br/>ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송'
	strAdd += '<br/>ο 회원 관리'
	strAdd += '<br/>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 , 고지사항 전달 ο 마케팅 및 광고에 활용'
	strAdd += '접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계'
	strAdd += '<br/><br/>'
	strAdd += '<br/>■ 개인정보의 보유 및 이용기간'
	strAdd += '<br/><br/>'
	strAdd += '<br/>회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.'
	strAdd += '<br/><br/>'
	strAdd += '<br/>■ 개인정보의 파기절차 및 방법'
	strAdd += '<br/><br/>'
	strAdd += '<br/>회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.'
	strAdd += '<br/><br/>'
	strAdd += '<br/>ο 파기절차	'
	strAdd += '<br/>회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.'
	strAdd += '<br/><br/>'
	strAdd += '<br/>별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.'
	strAdd += '<br/><br/>'
	strAdd += ' <br/>ο 파기방법'
	strAdd += '<br/>- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.'
	strAdd += '<br/><br/>'
	strAdd += ' <br/>■ 개인정보 제공'
	strAdd += ' <br/><br/>'
	strAdd += ' <br/>회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.'
	strAdd += ' <br/>- 이용자들이 사전에 동의한 경우'
	strAdd += ' <br/>- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우'
	strAdd += '    <br/><br/>'
	strAdd += ' <br/>■ 수집한 개인정보의 위탁'
	strAdd += ' <br/><br/>'
	strAdd += ' <br/>회사는 고객님의 동의없이 고객님의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 하겠습니다.'
	strAdd += ' <br/><br/>'
	strAdd += ' <br/>■ 이용자 및 법정대리인의 권리와 그 행사방법'
	strAdd += '  <br/>'
	strAdd += '   <br/>이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니 다.'
	strAdd += ' 이용자 혹은 만 14세 미만 아동의 개인정보 조회?수정을 위해서는 ‘개인정보변 경’(또는 ‘회원정보수정’ 등)을 가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭 하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조 치하겠습니다.'
	strAdd += '  귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까 지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자 에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.'
	strAdd += '  oo는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “oo 가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.'
	strAdd += '   <br/>'
	strAdd += '   <br/><br/>■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항'
	strAdd += '   <br/>'
	strAdd += '   <br/>회사는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 oo의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 회사은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.'
	strAdd += '  <br/>'
	strAdd += '  <br/>▶ 쿠키 등 사용 목적'
	strAdd += '    <br/>- 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공'
	strAdd += '   <br/><br/>'
	strAdd += '    <br/>귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.'
	strAdd += '   <br/>'
	strAdd += '   <br/>▶ 쿠키 설정 거부 방법'
	strAdd += '  <br/>예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.'
	strAdd += '   <br/><br/>'
	strAdd += '   <br/>설정방법 예(인터넷 익스플로어의 경우)'
	strAdd += '   <br/>: 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보'
	strAdd += '   <br/><br/>'
	strAdd += '  <br/>단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.'
	strAdd += '  <br/><br/>'
	strAdd += '   <br/>■ 개인정보에 관한 민원서비스'
	strAdd += '  <br/><br/>'
	strAdd += '   <br/>회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.'
	strAdd += '   <br/><br/>'
	strAdd += '    <br/>고객서비스담당 부서 :ORCTOWN'
	strAdd += '   <br/>전화번호 : 02-6402-5946'
	strAdd += '    <br/><br/>'
	strAdd += '    <br/>이메일 : warboss@orctown-store.com'
	strAdd += '    <br/><br/>'
	strAdd += ' 	<br/>개인정보관리책임자 성명 : 김이택      '
	strAdd += '    <br/>전화번호 : 02-6402-5946'
	strAdd += '    <br/>이메일 : warboss@orctown-store.com'
	strAdd += '    <br/><br/>'
	strAdd += '    <br/>귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.'
	strAdd += '  	<br/><br/>'
	strAdd += '    <br/>기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.'
	strAdd += '   <br/>1.개인분쟁조정위원회 (www.1336.or.kr/1336)'
	strAdd += '   <br/>2.정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)'
	strAdd += '   <br/>3.대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)'
	strAdd += '  <br/>4.경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)'
	strAdd += '</P>'

	$("#btn1").click(function() {

		if ($("#btn1").hasClass("open")) {
			$("#btn1").toggleClass("open");
			$("#btn1 ").html("내용보기");
			$(".theTBox").html(strMin);
			$(".theTBox").empty();
		} else {
			$("#btn1").toggleClass("open");

			$(".theTBox").html(strAdd);
			$("#btn1 ").html("내용접기");
		}
	});
</script>


