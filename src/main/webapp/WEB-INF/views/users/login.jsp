<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
  <div class="login-container">
    <div class="login-body">
      <div class="login-form">
        <form action="loginForm" method="post">
          <input type="text" name="user_ID" class="text-field" placeholder="아이디">
          <input type="password" name="user_PW" class="text-field" placeholder="비밀번호">
          <input type="submit" value="로그인" class="submit-btn">
        </form>
        <form action="kakaoLogin" method="post" id="kakao_submit">
          <button type="button" value="카카오톡" class="katok" id="kakao" style="box-sizing: border-box; border: 0px;">
            <img src="${pageContext.request.contextPath}/resources/img/userIMG/kakao_login_medium_wide.png" width="260px">
          </button>
          <input type="hidden" id="kakao_ID" name="kakao_ID" value="">
        </form>
     
        <div class="links">
            <a href="#">회원가입</a>  
          <a href="#">비밀번호를 잊어버리셨나요?</a>
        </div>
      </div>
    </div>
  </div>
</section>

<script>

  $(document).ready(Kakao.init('4fe53d1368d8a86143368648d70683ab'));
  
  $("#kakao").click(loginWithKakao);


  function loginWithKakao() {
      //로그인 시도
      Kakao.Auth.login({
          success : function(response) {
              console.log(response);
              //로그인 성공시 API 호출
              Kakao.API.request({
                  url : '/v2/user/me',
                  success : function(res) {
                    var id = res.id;
                    console.log(id);
                    alert("로그인 성공");
                    
                    var hidden = document.getElementById("kakao_ID");
                    hidden.value = id;
                    document.getElementById("kakao_submit").submit();
                  }
              });
          },
          fail : function(error) {
              console.log(error);
          }
      });
  }
  function sending() {
    document.frm.action = "users/kakaoLogin";
    document.frm.method = "post";
    document.frm.submit();
  }
</script>