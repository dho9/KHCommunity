<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<style>
@font-face {
	font-family: 'HakgyoansimWoojuR';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

.card-body {
	font-size: 26px;
	font-weight: bold;
}

.centered-button {
	font-family: 'HakgyoansimWoojuR';
	display: flex;
	justify-content: center;
}

.center-map-btn {
	font-family: 'HakgyoansimWoojuR';
	display: flex;
	justify-content: center;
	margin-top: 10px; /* 상단 여백 조정 */
}

div.container {
	font-family: 'HakgyoansimWoojuR';
}
</style>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<sec:authorize access="isAuthenticated()">
	<script>
	const memberId = '<sec:authentication property="principal.username"/>';
	</script>
</sec:authorize>
<div class="container mt-5y" style="margin-top: 20px;">
	<div class="row">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">
					<h1>${store.storeName}</h1>
				</div>
				<div class="card-body">
					<dl class="row">
						<dt class="col-sm-3">분류</dt>
						<dd class="col-sm-9">${store.storeType}</dd>
						<dt class="col-sm-3 ">식권 가격</dt>
						<dd class="col-sm-9 ">${store.price }</dd>
						<dt class="col-sm-3">사진</dt>
						<dd class="col-sm-9">
							<img
								src="${pageContext.request.contextPath}/resources/images/store/${store.storeName}.jpg"
								class="img-fluid rounded" alt="식당사진" style="max-width: 300px;">
						</dd>
						<div id="payHidden" style="display: none;">
							<div class="row">
								<div class="col-sm-3"font-size: 36px; font-weight:bold; >수량</div>
								<div class="col-sm-9">
									<input type="number" id="ticketQuantity" value="0"
										style="width: 150px; font-size: 20px;" />
								</div>
							</div>
						</div>

						<a class="text-center" id="create-kakao-link-btn"
							href="javascript:;" style="display: none;"> <img
							src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
							결제 후 카카오톡 링크공유 창이 뜨지 않으면 눌러주세요.
						</a>
						<div class="card-footer text-muted text-center ">식권결제는 카카오페이
							결제를 지원하고 있습니다.</div>
						<sec:authorize access="isAnonymous()">
							<div class="mt-4 centered-button">
								<button type="button" class="btn btn-primary"
									onclick="loginPage()">식권 구매하기</button>
							</div>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<div class="mt-4 centered-button">
								<button type="button" class="btn btn-primary"
									onclick="checkAndRequestPay()">식권 구매하기</button>
							</div>
						</sec:authorize>
					</dl>
				</div>
			</div>


		</div>

		<div class="col-md-4">
			<div class="card">
				<div class="card-body" style="font-size: 20px;">
					<h2 class="large-text">위치</h2>
					<ul class="list-group">
						<li class="list-group-item">${store.address}</li>
					</ul>
					<p style="margin-top: -12px"></p>
					<div id="map" style="width: 100%; height: 350px;"></div>
					<input type="hidden" id="map-target" value="가게위치">
					<div class="center-map-btn">
						<button class="btn btn-primary" id="map-btn">길찾기</button>
					</div>
					<input type="hidden" id="map-target" value="가게위치">
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29e3b1a49b48d90cc80318415174bdca&libraries=services"></script>
	</div>
</div>

<form:form name="paymentFrm"></form:form>
<form:form name="checkPaymentValidity"></form:form>
<script>
var mapContainer = document.getElementById('map');
var mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),
    level: 3
};

var map = new kakao.maps.Map(mapContainer, mapOption);

var geocoder = new kakao.maps.services.Geocoder();

geocoder.addressSearch('${store.address}', function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        var lat = result[0].y; // 위도
        var lng = result[0].x; // 경도

        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;font-weight : bold; color : white; background-color : #303F9F;">가게위치</div>'
        });
        infowindow.open(map, marker);

        map.setCenter(coords);
        
        var mapbtn = document.getElementById('map-btn');
        mapbtn.addEventListener("click", function() {
            var popupUrl = "https://map.kakao.com/link/to/" + document.getElementById("map-target").value + "," + lat + "," + lng;
            var popupOption = "width=800, height=600, resizable=no, scrollbars=yes, status=no;";
            window.open(popupUrl, "카카오맵 길찾기", popupOption);
        });
    }
});
</script>
<script>
	function loginPage(){
		alert("로그인 후 이용 가능합니다..");
	}		



            function checkAndRequestPay() {
            	
            	if(memberId!== null ){
            		document.querySelector('#payHidden').style.display = 'block';
                    const quantity = parseInt(document.getElementById('ticketQuantity').value);
                    if (quantity > 0) {
                    	if(confirm('선택하신 식권의 수량은 ' +quantity+ ' 장 입니다. 결제하시겠습니까?')){
                    		
                        requestPay(quantity);
                    	}
                    } else {
                        alert('수량을 선택 후 눌러주세요.');
                        document.getElementById('ticketQuantity').focus();
                    }
            	
            	}else{
            		alert("로그인 후 이용 부탁드립니다.")
            	}
            	
            
            }
        
            function requestPay(quantity) {
                var IMP = window.IMP; 
                IMP.init("APIKEY"); 
              
                var today = new Date();   
                var hours = today.getHours(); // 시
                var minutes = today.getMinutes();  // 분
                var seconds = today.getSeconds();  // 초
                var milliseconds = today.getMilliseconds();
                var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        
                IMP.request_pay({
                    pg : 'kakaopay',
                    merchant_uid: "IMP" + makeMerchantUid, 
                    name : '${store.storeName}',
                    amount : quantity * '${store.price}', // 식권 가격 * 수량
                    buyer_name : '아임포트 기술지원팀',
                    quantity : quantity
                }, function (rsp) { // callback
                    if (rsp.success) {
                        /* console.log(rsp); */
                        const {name} = rsp;
                        const userId = memberId;
                        const totalAmount = quantity * '${store.price}'; // 총 결제 금액을 계산
                      	console.log(totalAmount+'asdsadsadasd');
                        sendPaymentDataToServer(rsp.merchant_uid, userId, name, quantity, totalAmount);
                    } else {
                        /* console.log(rsp) */;
                    }
                });
            }
      
            function sendPaymentDataToServer(merchantUid, userId, name, quantity,totalAmount) {
                const token = document.paymentFrm._csrf.value;
                const token1 = document.checkPaymentValidity._csrf.value;
                
                const requestData = {
                	orderId: merchantUid,
                	memberId: userId,
                    storename: name,
                    amount: quantity,
         
                    totalPrice : totalAmount
                    
                };
                const ckTotalPrice = totalAmount;
                /* console.log(requestData); */
                jQuery.ajax({
                    url: '${pageContext.request.contextPath}/ticket/buyTicket.do',
                    type: 'POST',
                    contentType: 'application/json', // Content-Type 설정
                    headers: {
                        "X-CSRF-TOKEN": token
                    },
                    data: JSON.stringify(requestData) // 데이터를 JSON 형식으로 변환
                }).done(function(data) {
                	$.ajax({
                		   url: '${pageContext.request.contextPath}/ticket/checkPaymentValidity.do',
                           type: 'POST',
                           data: JSON.stringify(requestData),
                           contentType: 'application/json',
                           headers: {
                               "X-CSRF-TOKEN": token1
                           },
                           success: function(validationData) {
                               /* console.log("Payment validity checked:", validationData); */
                               if (validationData.isValid) {
                            	  const {order} = validationData;
                            	  /* console.log(order.totalPrice); */
                            	   if(ckTotalPrice === order.totalPrice){
                            		   
                                   alert("결제가 성공했습니다..");
                                   document.getElementById('create-kakao-link-btn').click();
                                   document.getElementById('create-kakao-link-btn').style.display = 'block';
                            	   }
                               } else {
                                   alert("결제 유효성 검사에 실패했습니다.");
                               }
                           },
                           error: function(jqXHR, textStatus, errorThrown) {
                               console.error("Validation Request Failed:", textStatus, errorThrown);
                               alert("결제 유효성 검사 오류");
                           }
                       });
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("AJAX Request Failed:", textStatus, errorThrown);
                    alert(errorThrown);
                });
            }
            
        </script>


<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
    Kakao.init('APIKEY')
    Kakao.Link.createDefaultButton({
     
      container: '#create-kakao-link-btn',
      objectType: 'feed',
      content: {
        title: '${store.storeName} 식권',
        description: '주소 : ${store.address} ',
        imageUrl:
        	 '${pageContext.request.contextPath}/resources/images/store/맥주창고.jpg',

        link: {
          mobileWebUrl: 'http://localhost:8080/kh/resources/images/store/code.jpg',
          webUrl: 'http://localhost:8080/kh/resources/images/store/code.jpg',
        },
      },
     
      buttons: [
        {
          title: '식권사용하기',
          link: {
            mobileWebUrl: 'http://localhost:8080/kh/resources/images/store/code.jpg',
            webUrl: 'http://localhost:8080/kh/resources/images/store/code.jpg',
          }
        },
        
      ],
    })
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
