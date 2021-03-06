
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section>
	<section>
		<div class="container-fluid AllBox">
			<div class="main-img">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ul>

					<!-- Wrapper for slides. -->
					<div class="carousel-inner">

						<div class="item active">
							<a href="detailBoard/detailPage?bno=28"><img src=" ${pageContext.request.contextPath }/resources/img/detailPageImg/28/6a6641fd47124a808f3fd59382816faa.jpg" alt="CSS"
								style="width: 735px; height: 485px;"></a>
							<div class="carousel-caption">
								<h3></h3>
								<p></p>
							</div>
						</div>

						<div class="item">
							<a href="detailBoard/detailPage?bno=24"><img src="${pageContext.request.contextPath }/resources/img/detailPageImg/24/a8142871a5434305959b449f12036334.jpg" alt="HTML"
								style="width: 735px; height: 485px;"></a>
							<div class="carousel-caption">
								<h3></h3>
								<p></p>
							</div>
						</div>

						<div class="item">
							<a href="detailBoard/detailPage?bno=28"><img src="${pageContext.request.contextPath }/resources/img/detailPageImg/27/50db70f7d80047e09b629c9e36cb7e0a.jpg"
								alt="jquery" style="width: 735px; height: 485px;"></a>	
							<div class="carousel-caption">
								<h3></h3>
								<p></p>
							</div>
						</div>
						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>


				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-9" style="padding: 0;">
				
				</div>
			</div>
		</div>
	</section>

<section>
	<div class="container main2 recentDiv">

		
		<div class="main2-title">
			<hr />
			<span class="title-para userId">${usersId }</span>
			<span class="title-para">?????? ?????? ??????</span>
			<button class="writeBtn">?????????</button>
			<hr />
		</div>
		
		<div>
			<select class = "nearBigCategory " >
			</select>
			<select class = "hidden nearMiddleCategory">
			</select>
			<select class = "hidden nearSmallCategory">
			</select>
			<span class = categoryBtnText></span>
			<button class = "categoryBtn">??????</button>
		</div>
		
		<ul class="row recommand-list">
			<div class="address">
				<span></span>
				<p></p>
			</div>
			<li class="col-xs-6 col-sm-4 col-md-3 col-lg-5 lecture-ad">
				<div class="map">
					<div class="recommand-lecture">
						<div id="map" style="height: 400px; width: 700px;"></div>

					</div>
				</div>
			</li>
			<div class="flozt_left nearLocalAdd" style="float: left;">
				<!-- ???????????? -->
			</div>
			<div class="nearDiv" style="display: flex">
			</div>
			<div class="btnGroup">
				<button class="nearBtn boardBtn">??????</button>
				<button class="nearBtn boardBtn">??????</button>
			</div>
		</ul>

	</div>
	
	<div class="container main3">
				<hr />
					<span class="main2-title">Best ?????????</span>
				<hr />
				<div class="recentClass bestAdd">

					<!-- ???????????? -->
				</div>
			</div>
			
		<div class="btnGroup">
			<button class="bestBtn boardBtn">??????</button>
			<button class="bestBtn boardBtn">??????</button>
		</div>
		</ul>
	</div>
	
	<div class="container main2">
		<ul class="row recommand-list">
			<hr />
				<span class="main2-title">?????? ?????????</span>
			<hr />
			<div class="newAdd">
				<!-- ???????????? -->
			</div>
		</ul>
			<div class = "recentBtn">
				<button class="recentBtn boardBtn">??????</button>
				<button class="recentBtn boardBtn">??????</button>
			</div>
	</div>
	
	
	
	<div class="container main2 hidden">
		<div class="main2-title">
			<hr />
			<span class="title-para">??????????????? ?????????</span>
			<hr />
		</div>
		<ul class="row recommand-list popularAdd">
			<!-- ???????????? -->
		</ul>
		
		<div class="btnGroup">
			<button class="popularBtn boardBtn">??????</button>
			<button class="popularBtn boardBtn">??????</button>
		</div>
	</div>
		
			

</section>


<aside class="quick-area">
	<ul class="quick-list">
		<li>
			<a href="faqBoard/faqList">
				<h3>FAQ</h3>
			</a></li>
		<li class="kakaoCounselling">
		</li>
	</ul>
</aside>

<div class="hiddenLa">${usersLa }</div>
<div class="hiddenMa">${usersMa }</div>



<form action="detailBoard/detailPaage" class ="detailPageAction">
	<input type="hidden" name="bno" value="">
</form>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>

        Kakao.init('9cdd93761c8771defa3902f488e93711');
        
        Kakao.Channel.createAddChannelButton({
            container: document.querySelector(".kakaoCounselling"),
            channelPublicId: '_xixkkis' // ???????????? ?????? ??? URL??? ????????? id??? ???????????????.
        });
        
    </script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9cdd93761c8771defa3902f488e93711"></script>
<script>
			var la = parseFloat(document.querySelector(".hiddenLa").innerHTML);
			var ma = parseFloat(document.querySelector(".hiddenMa").innerHTML);

			var mapContainer = document.getElementById('map'), // ????????? ????????? div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(ma, la), // ????????? ????????????
		        level: 3 // ????????? ?????? ??????
		    };

			// ????????? ????????? div???  ?????? ????????????  ????????? ???????????????
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			
</script>


	<script>
		
		document.querySelector(".writeBtn").onclick = function(){
			location.href = "detailBoard/detailselectWrite";
		}

		var bigCategory = document.querySelector(".nearBigCategory");
		var middleCategory = document.querySelector(".nearMiddleCategory");
		var smallCategory = document.querySelector(".nearSmallCategory");
		var categoryCode = null;
		
		var categoryBtn = document.querySelector(".categoryBtn");
		var categoryBtnText = document.querySelector(".categoryBtnText");
		
		var markers = new Array();
		var infowindosws = new Array();
		
		$(document).ready(function() {
			
			bigCategory.onchange = function()
			{
				if(bigCategory.value == '????????? ??????' && !(middleCategory.classList.contains("hidden")))
				{
					middleCategory.classList.toggle('hidden');
					middleCategory.value = "";
					if(!(smallCategory.classList.contains("hidden")))
					{
						smallCategory.classList.toggle('hidden');
						smallCategory.value = "";
					}
				}
				else if(bigCategory.value != '' && middleCategory.classList.contains("hidden"))
				{
					middleCategory.classList.toggle('hidden');
				}
				else
				{
					middleCategory.value = "";
					if(!(smallCategory.classList.contains("hidden")))
					{
						smallCategory.classList.toggle('hidden');
						smallCategory.value = "";
					}
				}
				
				nearCategory();
			}
			
			middleCategory.onchange = function()
			{
				console.log(middleCategory.value == '????????? ??????' && !(smallCategory.classList.contains("hidden")))
				if(middleCategory.value == '????????? ??????' && !(smallCategory.classList.contains("hidden")))
				{
					smallCategory.classList.toggle('hidden');
					smallCategory.value = "";
				}
				else if(middleCategory.value != '' && smallCategory.classList.contains("hidden"))
				{
					smallCategory.classList.toggle('hidden');
					smallCategory.value = "";
				}
				else
				{
					smallCategory.value = "";
				}
				
				nearCategory();
			}
			
			smallCategory.onchange = function()
			{
				if(!(bigCategory.value=="????????? ??????" || middleCategory.value =="????????? ??????" || smallCategory.value =="????????? ??????"))
    			{
    				categoryBtnText.innerHTML = "";
    			}
				nearCategory();
			}
			
			
			
			
			
			function nearCategory()
			{
				
				bigValue = bigCategory.value;
				middleValue = middleCategory.value;
				smallValue = smallCategory.value;
				
				
				$.ajax({
					type: "post",
					url : "nearCategory",
					dataType: "json",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({"bigCategory":bigValue , "middleCategory":middleValue, "smallCategory":smallValue}),
					success : function(data)
					{
						categoryCode = data[0].c_code;
						
						if(bigValue == "")
						{
							var strAdd = "<option>????????? ??????</option>";
							
							for(var i=0; i<data.length; i++)
							{
								strAdd += '<option>'+data[i].bigCategory+'</option>';
							}
							$(".nearBigCategory").html(strAdd);
						}
					   else if(middleValue == "")
						{
						   var strAdd = "<option>????????? ??????</option>";
						   
						   for(var i=0; i<data.length; i++)
						   {
								strAdd += '<option>'+data[i].middleCategory+'</option>';
						   }
							$(".nearMiddleCategory").html(strAdd);
						}
					   else if(smallValue == "")
						{
						   var strAdd = "<option>????????? ??????</option>";
						   
						   for(var i=0; i<data.length; i++)
						   {
							   console.log(data[i].smallCategory);
								strAdd += '<option>'+data[i].smallCategory+'</option>';
						   }
							$(".nearSmallCategory").html(strAdd);
						}
						
					},
					error :function (status, error)
					{
						console.log("??????????????????");
					}
				});
				
			}
			
			
			
			var loginCheck =document.querySelector(".userId").innerHTML;
			if(loginCheck == "")
			{
				$(".subscribeDiv").css("display","none");
				$(".recentDiv").css("display","none");
			}
			
			var nearIndex = 8;
			var popluarIndex = 8;
			var recentIndex = 8;
			var bestIndex = 2;
			
			sessionStorage.setItem("popluarIndex",popluarIndex);
			sessionStorage.setItem("recentIndex",recentIndex);
			sessionStorage.setItem("bestIndex",bestIndex);
			sessionStorage.setItem("nearIndex",nearIndex);
			
			
			var boardBtn = document.querySelectorAll(".boardBtn");
			 
			for(var i=0; i<boardBtn.length; i++)
			{
				boardBtn[i].onclick = function(e)
				 {
					if(e.target.classList.contains("popularBtn") )
					{
						if(e.target.innerHTML == "??????"){
							popluarIndex += 8;
							if( popluarIndex > sessionStorage.getItem("popluarData")) popluarIndex = (sessionStorage.getItem("popluarData")-7);
							sessionStorage.setItem("popluarIndex",popluarIndex);
							getPopularPage();
						}
						else if(e.target.innerHTML == "??????"){
								popluarIndex -= 8;
								if(popluarIndex < 8) popluarIndex = 8;
								sessionStorage.setItem("popluarIndex",popluarIndex);
								getPopularPage();
						}
					}
					else if(e.target.classList.contains("recentBtn") )
					{
						if(e.target.innerHTML == "??????"){
							recentIndex += 8;
							if( recentIndex > sessionStorage.getItem("recentData")) recentIndex = (sessionStorage.getItem("recentData"));
							sessionStorage.setItem("recentIndex",recentIndex);
							getRecentBoard();
						}
						else if (recentIndex != 8){
							recentIndex -= 8;
							if(recentIndex < 8) recentIndex = 8;
							sessionStorage.setItem("recentIndex",recentIndex);
							getRecentBoard();
						}
					}
					else if(e.target.classList.contains("bestBtn") )
					{
						if(e.target.innerHTML == "??????"){
							bestIndex += 2;
							if( bestIndex > sessionStorage.getItem("bestData")) bestIndex = (sessionStorage.getItem("bestData")-1);
							sessionStorage.setItem("bestIndex",bestIndex);
							getBestBoard();
						}
						else if (bestIndex != 2){
							bestIndex -= 2;
							if(bestIndex < 2) bestIndex = 2;
							sessionStorage.setItem("bestIndex",bestIndex);
							getBestBoard();
						}
					}
					else if(e.target.classList.contains("nearBtn") )
					{
						if(e.target.innerHTML == "??????"){
							nearIndex += 8;
							if( nearIndex > sessionStorage.getItem("nearData")) nearIndex = (sessionStorage.getItem("nearData"));
							sessionStorage.setItem("nearIndex",nearIndex);
							getNearBoard();
						}
						else if (bestIndex != 8){
							nearIndex -= 8;
							if(nearIndex < 8) nearIndex = 8;
							sessionStorage.setItem("nearIndex",nearIndex);
							getNearBoard();
						}
					}
				 }
			}
			 
			/* ????????? ?????? ?????? */
        	function getNearBoard()
			{
				$.ajax({
					type: "post",
					url : "getNearBoard",
					dataType: "json",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({"la":la , "ma":ma , "c_code":categoryCode}),
					success : function(data)
					{
						
						
						var nearIndex = sessionStorage.getItem("nearIndex");
						sessionStorage.setItem("nearData" , data.length);	
						
						if(data.length < 8)
						{
							
							var nearDiv ="";
				            var nearLocalAdd ="";
				            for(var i = 0; i < data.length; i++) 
				            {
				                nearLocalAdd += '<li class="col-xs-6 col-sm-4 col-md-3 col-lg-3 lecture-ad">'
								nearLocalAdd += '<div class="recommand-lecture " >'
								nearLocalAdd += '<img src="${pageContext.request.contextPath }/resources/img/detailPageImg/'+data[i].bno+'/'+data[i].imgBoardList[0].img+'" alt="es6" style= width="167; height=167;" >'
								nearLocalAdd += '<div class="lecture-content">'
								nearLocalAdd += '<p>'+data[i].title+'</p>'
								nearLocalAdd += '</div>'
								nearLocalAdd += '<div class="lecture-hover detailBtn">'
								nearLocalAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'"></a>'
								nearLocalAdd += '</div>'
								nearLocalAdd += '</div>'
							    nearLocalAdd += '</li>'
							    
							    var markerPosition  = new kakao.maps.LatLng(parseFloat(data[i].ma), parseFloat(data[i].la)); 
				                var marker = new kakao.maps.Marker({
				                    position: markerPosition
				                });
				                
				                markers[i] = marker;
				                
				                var iwContent = '<div style="padding:5px;"> ???????????? : '+data[i].title+' <br> <a href="https://map.kakao.com/link/to/Hello World!,'+parseFloat(data[i].ma)+','+parseFloat(data[i].la)+'" style="color:blue" target="_blank">?????????</a></div>', // ?????????????????? ????????? ???????????? HTML ??????????????? document element??? ???????????????
				                iwPosition = new kakao.maps.LatLng(parseFloat(data[i].ma), parseFloat(data[i].la)); //??????????????? ?????? ???????????????
								
					            var infowindow = new kakao.maps.InfoWindow({
					                position: iwPosition,
					                content: iwContent
					            });
				                
					            infowindosws[i] = infowindow;
				                
				                marker.setMap(map);
				                infowindow.open(map, marker); 
							}
			            }else
			            {
			            	var nearLocalAdd ="";
				            for(var i = nearIndex-8; i < nearIndex; i++) 
				            {
				                nearLocalAdd += '<li class="col-xs-6 col-sm-4 col-md-3 col-lg-3 lecture-ad">'
								nearLocalAdd += '<div class="recommand-lecture detailBtn">'
								nearLocalAdd += '<img src="${pageContext.request.contextPath }/resources/img/detailPageImg/'+data[i].bno+'/'+data[i].imgBoardList[0].img+'" alt="es6" style= width="167; height=167; >'
								nearLocalAdd += '<div class="lecture-content">'
								nearLocalAdd += '<p>'+data[i].title+'</p>'
								nearLocalAdd += '</div>'
								nearLocalAdd += '<div class="lecture-hover">'
								nearLocalAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'"></a>'
								nearLocalAdd += '</div>'
								nearLocalAdd += '</div>'
							    nearLocalAdd += '</li>'
							    
							    var markerPosition  = new kakao.maps.LatLng(parseFloat(data[i].ma), parseFloat(data[i].la)); 
				                var marker = new kakao.maps.Marker({
				                    position: markerPosition
				                });
				                
				                markers[i] = marker;
				                
				                var iwContent = '<div style="padding:5px;"> ???????????? : '+data[i].title+' <br> <a href="https://map.kakao.com/link/to/Hello World!,'+parseFloat(data[i].ma)+','+parseFloat(data[i].la)+'" style="color:blue" target="_blank">?????????</a></div>', // ?????????????????? ????????? ???????????? HTML ??????????????? document element??? ???????????????
				                iwPosition = new kakao.maps.LatLng(parseFloat(data[i].ma), parseFloat(data[i].la)); //??????????????? ?????? ???????????????

					            var infowindow = new kakao.maps.InfoWindow({
					                position: iwPosition,
					                content: iwContent
					            });
				                
					            infowindosws[i] = infowindow;
				                
				                marker.setMap(map);
				                infowindow.open(map, marker);
			            	}
			            }
			            $(".nearLocalAdd").html(nearLocalAdd);
					},
					error : function(status,error)
					{
						//alert("?????????????????? ??????");
						console.log("????????????");
					}
				});
			}
			
		
			
			
			
			
            function getPopularPage()
            {
				$.ajax({
					type: "post",
					url : "getPopularPage",
					dataType: "json",
					contentType : "application/json; charset=UTF-8",
					success: function(data){
						
						
						var popluarIndex = sessionStorage.getItem("popluarIndex");
						sessionStorage.setItem("popluarData" , data.length);	
											
							/*??????????????? ????????? ?????????*/
							var popularAdd ="";
			                for(var i = popluarIndex-8; i < popluarIndex; i++) 
			                {
			                	popularAdd += '<li class="col-xs-6 col-sm-4 col-md-3 col-lg-3 lecture-ad">'
			                	popularAdd += '<div class="recommand-lecture">'
			                	popularAdd += '<img src="${pageContext.request.contextPath }/resources/img/mainPageImg/java.png" alt="java">'
			                	popularAdd += '<div class="lecture-content">'
			                	popularAdd += '<p>'+data[i].title+'</p>'
			                	popularAdd += '</div>'
			                	popularAdd += '<div class="lecture-hover">'
			                	popularAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'"></a>'
			                	popularAdd += '</div>'
			                	popularAdd += '</div>'
			                	popularAdd += '</li>'
			                }
			                $(".popularAdd").html(popularAdd);
	
					},
					error : function(status,error){
						console.log(error);
					}
				});
            }
			
            function getRecentBoard()
            {
            	
				$.ajax({
					type: "post",
					url : "getRecentBoard",
					dataType: "json",
					contentType : "application/json; charset=UTF-8",
					data : JSON.stringify({"bno":"1"}),
					success: function(data){
						

							
						var recentIndex = sessionStorage.getItem("recentIndex");
						sessionStorage.setItem("recentData" , data.length);	
						
						
						/* ?????? ?????????*/
						
						if(data.length < 8)
						{
							var newAdd ="";
			                for(var i = 0; i < data.length; i++) 
			                {
			                	newAdd += '<li class="col-xs-6 col-sm-4 col-md-3 col-lg-3 lecture-ad">'
			                	newAdd += '<div class="recommand-lecture">'
			                	newAdd += '<img src="${pageContext.request.contextPath }/resources/img/detailPageImg/'+data[i].bno+'/'+data[i].imgBoardList[0].img+'" alt="spring" style= width="167; height=167;>'
			                	newAdd += '<div class="lecture-content">'
			                	newAdd += '<p>'+data[i].title+'</p>'
			                	newAdd += '</div>'
			                	newAdd += '<div class="lecture-hover">'
			                	newAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'"></a>'
			                	newAdd += '</div>'
			                	newAdd += '</li>'
			                }
			                $(".newAdd").html(newAdd)
						}else
						{
							var newAdd ="";
			                for(var i = recentIndex-8; i < recentIndex; i++) 
			                {
			                	newAdd += '<li class="col-xs-6 col-sm-4 col-md-3 col-lg-3 lecture-ad">'
			                	newAdd += '<div class="recommand-lecture">'
			                	newAdd += '<img src="${pageContext.request.contextPath }/resources/img/detailPageImg/'+data[i].bno+'/'+data[i].imgBoardList[0].img+'" alt="spring" style= width="167; height=167;>'
			                	newAdd += '<div class="lecture-content">'
			                	newAdd += '<p>'+data[i].title+'</p>'
			                	newAdd += '</div>'
			                	newAdd += '<div class="lecture-hover">'
			                	newAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'"></a>'
			                	newAdd += '</div>'
			                	newAdd += '</li>'
			                }
			                $(".newAdd").html(newAdd)
						}
		                
					},
					error : function(status,error){
						console.log(error);
					}
				});
				
            }
			
			
           	function getBestBoard()
           	{
           		
	        	$.ajax({
	        		type: "post",
	        		url : "getBestBoard",
	        		dataType: "json",
	        		contentType: "application/json; charset=UTF-8",
	        		success: function(data){
	        			
	        			var bestIndex = sessionStorage.getItem("bestIndex");
						sessionStorage.setItem("bestData" , data.length);	
	        			
	        			/* Best ????????? */
	        			if(data.length < 2)
	        			{
							var bestAdd ="";
				            for(var i = 0; i < data.length; i++) 
				            {
				                bestAdd += '<div class="board-recent">'
							    bestAdd += '<div class="content-recent">'
								bestAdd += '<a href="#" class="profile-board">'
								bestAdd += '<div class="profile-img">'
								bestAdd += '<img src="${pageContext.request.contextPath }/resources/img/mainPageImg/icon_profile.png">'
								bestAdd += '</div>'
								bestAdd += '<div class="profile-info">'
								bestAdd += '<span class="profile-name">'+data[i].user_ID+'</span> <span class="regist-time"></span>'
								bestAdd += '</div>'
								bestAdd += '</a>'
								bestAdd += '<div class="content-detail">'
								bestAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'" class="content-title"> <strong class="title-font">'+data[i].title+'</strong></a> '
								bestAdd += '<span class="content-text">'+data[i].text+'</span>'
								bestAdd += '</div>'
								bestAdd += '<div class="content-comment">'
								bestAdd += '<span class="select-count"> ????????? <em>10,000,000</em>'
								bestAdd += '</span> <span class="review-count"> ????????? <em>6,000,000</em>'
								bestAdd += '</span>'
								bestAdd += '</div>'
							    bestAdd += '</div>'
							    bestAdd += '<div class="thumbnail-recent">'
								bestAdd += '<div class="thumbnail-recent">'
								bestAdd += '<div class="thumbnail-area">'
								bestAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'" class="thumbnail-inner"> <img class="img-post" alt="postthumbnail" src="${pageContext.request.contextPath }/resources/img/detailPageImg/'+data[i].bno+'/'+data[i].imgBoardList[0].img+'" style= width="167; height=167;" >'
								bestAdd += '</a> <a href="detailBoard/detailPage?bno='+data[i].bno+'" class="button-more-img"> <i class="sp_common icon_more"><span class="blind">??? ????????? ?????????</span></i>'
								bestAdd += '</a>'
								bestAdd += '<div class="plus-thumbnail-list">'
								bestAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'" class="list-inner">'
								
								if(data[i].imgBoardList.length > 1)
								{
									for(var j=1; j<4; j++ )
									{
										bestAdd += '<div class="plus-list">'
										bestAdd += '<img class="plus-img" alt="???????????????" width="167" height="167" src="${pageContext.request.contextPath }/resources/img/detailPageImg/'+data[i].bno+'/'+data[i].imgBoardList[j].img+'" >'
										bestAdd += '</div>'
										if(data[i].imgBoardList.length-1 == j)	break;
									}
								}
								
								bestAdd += '</a>'
								bestAdd += '</div>'
								bestAdd += '</div>'
								bestAdd += '</div>'
							    bestAdd += '</div>'
						        bestAdd += '</div>'
				            }
				            $(".bestAdd").html(bestAdd);
	        			}else
	        			{
	        				var bestAdd ="";
				            for(var i = bestIndex-2; i < bestIndex; i++) 
				            {
				            	bestAdd += '<div class="board-recent">'
								    bestAdd += '<div class="content-recent">'
									bestAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'" class="profile-board">'
									bestAdd += '<div class="profile-img">'
									bestAdd += '<img src="${pageContext.request.contextPath }/resources/img/mainPageImg/icon_profile.png">'
									bestAdd += '</div>'
									bestAdd += '<div class="profile-info">'
									bestAdd += '<span class="profile-name">'+data[i].user_ID+'</span> <span class="regist-time"></span>'
									bestAdd += '</div>'
									bestAdd += '</a>'
									bestAdd += '<div class="content-detail">'
									bestAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'" class="content-title"> <strong class="title-font">'+data[i].title+'</strong>'
									bestAdd += '</a> <a href="detailBoard/detailPage?bno='+data[i].bno+'" class="content-text">'+data[i].text+'</a>'
									bestAdd += '</div>'
									bestAdd += '<div class="content-comment">'
									bestAdd += '<span class="select-count"> ????????? <em>10,000,000</em>'
									bestAdd += '</span> <span class="review-count"> ????????? <em>6,000,000</em>'
									bestAdd += '</span>'
									bestAdd += '</div>'
								    bestAdd += '</div>'
								    bestAdd += '<div class="thumbnail-recent">'
									bestAdd += '<div class="thumbnail-recent">'
									bestAdd += '<div class="thumbnail-area">'
									bestAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'" class="thumbnail-inner"> <img class="img-post" alt="postthumbnail" src="${pageContext.request.contextPath }/resources/img/detailPageImg/'+data[i].bno+'/'+data[i].imgBoardList[0].img+'" width="167" height="167">'
									bestAdd += '</a> <a href="detailBoard/detailPage?bno='+data[i].bno+'" class="button-more-img"> <i class="sp_common icon_more"><span class="blind">??? ????????? ?????????</span></i>'
									bestAdd += '</a>'
									bestAdd += '<div class="plus-thumbnail-list">'
									bestAdd += '<a href="detailBoard/detailPage?bno='+data[i].bno+'" class="list-inner">'
									
									if(data[i].imgBoardList.length > 1)
									{
										for(var j=1; j<4; j++ )
										{
											bestAdd += '<div class="plus-list">'
											bestAdd += '<img class="plus-img" alt="???????????????" width="167" height="167" src="${pageContext.request.contextPath }/resources/img/detailPageImg/'+data[i].bno+'/'+data[i].imgBoardList[j].img+'" class ="detailBtn">'
											bestAdd += '</div>'
											if(data[i].imgBoardList.length-1 == j)		break;
										}
									}
									
									bestAdd += '</a>'
									bestAdd += '</div>'
									bestAdd += '</div>'
									bestAdd += '</div>'
								    bestAdd += '</div>'
							        bestAdd += '</div>'
				            }
				
				            $(".bestAdd").html(bestAdd);
				            
				            
				            
	        			}
	        		},
	        		error : function(status,error){
						console.log("????????? ???????????? ??????");
						console.log(error);
					}
	        		
	        	});
           	}
           	
    		categoryBtn.onclick = function(){
    			if(bigCategory.value=="????????? ??????" || middleCategory.value =="????????? ??????" || smallCategory.value =="????????? ??????")
    			{
    				categoryBtnText.innerHTML = "??????????????? ?????? ???????????? ?????????";
    			}else
    			{
    				categoryBtnText.innerHTML = "";
    				
    				for(var i=0; i<markers.length; i++)
    				{
    					console.log(markers[i]);
    					markers[i].setMap(null);
    					infowindosws[i].close();
    				}
    				
    				getNearBoard();
    			}
    			
    		}

           	//????????? ?????????
            getBestBoard();
            getRecentBoard();
            //getPopularPage();.
            getNearBoard();
            
            //???????????? ?????????
            nearCategory();
		})
		
		 

	
	</script>