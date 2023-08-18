<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
.large-text {
	font-size: 24px; /* 원하는 큰 텍스트 크기로 조정 */
}

.centered-button {
	display: flex;
	justify-content: center;
}

.center-map-btn {
	display: flex;
	justify-content: center;
	margin-top: 10px; /* 상단 여백 조정 */
}
</style>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<div class="container mt-5">
	<div class="row">
		<div class="col-md-8">
			<div class="card">
				<div class="card-header">
					<h1>${store.storeName}</h1>
				</div>
				<div class="card-body">
					<dl class="row">
						<dt class="col-sm-3 large-text">분류</dt>
						<dd class="col-sm-9">${store.storeType}</dd>
						<dt class="col-sm-3 large-text">식권 가격</dt>
						<dd class="col-sm-9 large-text">3000</dd>
						<dt class="col-sm-3">사진</dt>
						<dd class="col-sm-9">
							<img
								src="${pageContext.request.contextPath}/resources/images/store/${store.storeName}.jpg"
								class="img-fluid rounded" alt="식당사진" style="max-width: 300px;">
						</dd>
						<div id="payHidden" style="display: none;">
							<dt class="col-sm-3 large-text">수량</dt>
							<dd class="col-sm-9">
								<input type="number" id="ticketQuantity" value="0" />
							</dd>
						</div>

					</dl>
				</div>
			</div>

			<div class="mt-4 centered-button">
				<button type="button" class="btn btn-primary"
					onclick="checkAndRequestPay()">식권 구매하기</button>

			</div>
			<div class="card-footer text-muted">식권결제는 카카오페이 결제를 지원하고 있습니다.
			</div>
		</div>

		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
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
</div>
</div>
</div>
	<form:form name="paymentFrm"></form:form>
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
            function checkAndRequestPay() {
            	document.querySelector('#payHidden').style.display = 'block';
            	
                const quantity = parseInt(document.getElementById('ticketQuantity').value);
                
                if (quantity > 0) {
                	if(confirm('선택하신 식권의 수량은 ' +quantity+ ' 장 입니다. 결제하시겠습니까?')){
                		
                    requestPay(quantity);
                	}
                } else {
                    alert('수량을 선택 후 눌러주세요.');
                }
            }
        
            function requestPay(quantity) {
                var IMP = window.IMP; 
                IMP.init("imp32361472"); 
              
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
                    amount : quantity * 3000, // 식권 가격 * 수량
                    buyer_name : '아임포트 기술지원팀',
                    quantity : quantity
                }, function (rsp) { // callback
                    if (rsp.success) {
                        console.log(rsp);
                        const {name} = rsp;
                        const userId = 'alfn';
                        const totalAmount = quantity * 3000; // 총 결제 금액을 계산
                      	
                        sendPaymentDataToServer(rsp.merchant_uid, userId, name, quantity, totalAmount);
                    } else {
                        console.log(rsp);
                    }
                });
            }
      
            function sendPaymentDataToServer(merchantUid, userId, name, quantity,totalAmount) {
                const token = document.paymentFrm._csrf.value;
                console.log(token);
                
                const requestData = {
                	orderId: merchantUid,
                	memberId: userId,
                    storename: name,
                    amount: quantity,
                    totalPrice : totalAmount
                    
                };
                console.log(requestData);
                jQuery.ajax({
                    url: '${pageContext.request.contextPath}/ticket/buyTicket.do',
                    type: 'POST',
                    contentType: 'application/json', // Content-Type 설정
                    headers: {
                        "X-CSRF-TOKEN": token
                    },
                    data: JSON.stringify(requestData) // 데이터를 JSON 형식으로 변환
                }).done(function(data) {
                	console.log("Payment successful:", data);
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("AJAX Request Failed:", textStatus, errorThrown);
                });
            }
            
        </script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
