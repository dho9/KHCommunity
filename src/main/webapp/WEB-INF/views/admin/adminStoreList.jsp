<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp"%>

<footer></footer>
<div class="card"
		style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
		<div class="card-header" id="todayIssueHeader">식당 목록
		    <button style="float:right; border: solid 2px blue;
		    background-color:transparent;
		    border-radius: 5px;"
		    class="open-modal-button" data-bs-toggle="modal" data-bs-target="#sendMessageModal">식당 추가</button>
		</div>
		<div class="card-body" id="todayIssueBody">
			<div class="card-body" id="todayIssueBody">
              <table class="table table-hover text-center">
                  <thead>
                      <tr>
                      	  <th scope="col">#</th>
                          <th scope="col">이름</th>
                          <th scope="col">우편번호</th>
                          <th scope="col">주소</th>
                      </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${stores}" var="store" varStatus="vs">
                      <tr 
                      data-bs-toggle="modal" 
                      data-bs-target="#myModal" 
                      data-row-id="${vs.count}" 
                      data-storeName="${store.storeName}" 
                      data-postNumber="${store.postNumber}" 
                      data-address="${store.address}" 
                      data-storeId="${store.storeId}" 
                      data-handle="@mdo">
                          <td>${vs.count}</td>
                          <td>${store.storeName}</td>
                          <td>${store.postNumber}</td>
                          <td>${store.address}</td>
                      </tr>
                  	</c:forEach>
                  </tbody>
              </table>
              <br>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="width:750px;margin:auto;">
                   	  <div class="border rounded-4" style="padding:30px;">
                      <form:form id="dataForm" method="POST" name="modalFrm" action="${pageContext.request.contextPath}/admin/adminStudentUpdate.do" style="font-size: 20px;">
                          <input type="hidden" name="rowId" id="modalRowId">
                          <input type="hidden" name="storeId" id="modalStoreId">
                          이름 : <input type="text" name="storeName" id="modalStoreName" readonly> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
                          우편번호 : <input type="text" name="postNumber" id="modalPostNumber" readonly> <br>
                          주소 : <input type="text" name="address" id="modalAddress" style="width:700px" readonly>
                          <hr>
                          <button class="btn btn-danger" type="button" id="btnBan" style="float:right;">식당 삭제</button> 
                          <br>
                      </form:form>
                   	  </div>
                    </div>
                </div>
                <!-- 모달의 나머지 부분은 동일하게 유지 -->
            </div>
        </div>
      </div>
   <div class="modal fade" id="sendMessageModal" tabindex="-1" aria-labelledby="sendMessageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width:1300px; height:700px; margin:auto;">
            <div class="modal-header">
                <h5 class="modal-title" id="sendMessageModalLabel">식당 추가</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

		    <div class="modal-body">
                <!-- 모달 내용 -->
                <form:form id="storeForm" modelAttribute="store" action="${pageContext.request.contextPath}/admin/insertStore.do" method="post" enctype="multipart/form-data">
				    <input type="text" id="storeName" name="storeName" placeholder="식당 이름을 작성해주세요" style="width:500px;">
				    <button type="button" id="searchAddressButton">주소 검색</button>
				    <div><input type="text" id="postNumber" name="postNumber" readonly style="width:100px; border:none;"></div>
				    <div><input type="text" id="address" name="address" readonly style="width:400px; border:none;"></div>
    				<div><input type="file" id="file" name="file" accept=".jpg"></div>
				</form:form>
				<div class="modal-footer">
				    <button type="button" class="btn btn-primary" onclick="submitStoreForm()">등록</button>
				</div>
			</div>
    	</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function submitStoreForm() {
    const form = document.getElementById('storeForm');
    form.submit();
}

//모달 창이 닫힐 때 주소 API 이벤트 해제
$('#sendMessageModal').on('hidden.bs.modal', function () {
    var searchButton = document.getElementById('searchAddressButton');
    searchButton.removeEventListener('click', openAddressApi);
});

// 모달 창이 열릴 때 주소 API 스크립트 실행 및 이벤트 바인딩
$('#sendMessageModal').on('shown.bs.modal', function () {
    var searchButton = document.getElementById('searchAddressButton');
    searchButton.addEventListener('click', openAddressApi);
});

//주소 API 객체를 전역으로 선언
var postcodeApi;

// 주소 검색 버튼 클릭 이벤트 핸들러
function openAddressApi() {
    var postcodeApi = new daum.Postcode({
        oncomplete: function(data) {
            var address = data.address;
            var postNumber = data.zonecode;
            
            // 우편번호와 주소 값을 각각의 input 요소에 설정
            document.getElementById('postNumber').value = postNumber;
            document.getElementById('address').value = address;
        }
    });
    postcodeApi.open();
}
</script>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>
<script>
      
      // 테이블 row 클릭시 모달 창에 나오는 데이터 처리
      document.addEventListener("DOMContentLoaded", function () {
        const tableRows = document.querySelectorAll("tr[data-bs-toggle='modal']");
    
        tableRows.forEach((row) => {
          row.addEventListener("click", function () {
        	const rowId = row.getAttribute("data-row-id");
            const storeName = row.getAttribute("data-storeName");
            const postNumber = row.getAttribute("data-postNumber");
            const address = row.getAttribute("data-address");
            const storeId = row.getAttribute("data-storeId");
            const handle = row.getAttribute("data-handle");
            // 모달 내의 입력 필드에 데이터 설정
            document.getElementById("modalRowId").value = rowId;
            document.getElementById("modalStoreName").value = storeName;
            document.getElementById("modalPostNumber").value = postNumber;
            document.getElementById("modalAddress").value = address;
            document.getElementById("modalStoreId").value = storeId;
          });
        });
        // 강퇴 버튼 클릭 이벤트 처리
        $("#btnBan").on("click", function () {
          showConfirmation("${pageContext.request.contextPath}/admin/adminDeleteStore.do");
        });
        
        // 확인 메시지 표시 후 데이터 전송 함수 호출
        function showConfirmation(url) {
          if (confirm("정말로 진행하시겠습니까?")) {
            sendDataToServer(url);
          }
        }
    
        // 서버로 데이터를 전송하는 함수
        function sendDataToServer(url) {
          const modalFrm = document.modalFrm;
          const storeName = modalFrm.storeName.value;
          const storeId = modalFrm.storeId.value;
          const token = document.modalFrm._csrf.value;
          $.ajax({
            type: "POST",
            url: url, // 수정 또는 강퇴에 따라 다른 URL 지정
            data: {
            	storeId
            },
            headers: {
                "X-CSRF-TOKEN": token
            },
            success(responseData) {
              // 서버 응답을 처리
              // 예: 성공 메시지를 표시하거나 다른 동작 수행
              
              alert('성공적으로 처리되었습니다.')
              location.href="${pageContext.request.contextPath}/admin/adminStoreList.do";
            }
          });
        }
      });
</script>
<script>
	$(function() {
		var accordionButton = $('.list .items > .a_title');
		accordionButton.on('click', function(e) {
			e.preventDefault();
			var $this = $(this);
			var target = $this.parent();
			var description = $this.siblings('.a_content');
			var other = target.siblings('.items');
			var otherDescription = other.find('.a_content');
			accordionToggle(target, description, other, otherDescription);
		});

		function accordionToggle(target, description, other, otherDescription) {
			if (target.hasClass('active')) {
				target.removeClass('active');
				description.stop().slideUp(300);
			} else {
				target.addClass('active');
				description.stop().slideDown(300);
			}
			if (other && otherDescription) {
				other.removeClass('active');
				otherDescription.stop().slideUp(300);
			}
		}
		;
	});
</script>
</body>
</html>
