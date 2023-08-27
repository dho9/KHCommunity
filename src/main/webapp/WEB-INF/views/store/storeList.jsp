<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
@font-face {
	font-family: 'HakgyoansimWoojuR';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}
*{
font-family: 'HakgyoansimWoojuR';
}
.img-wrapper {
    width: 100%; /* 이미지를 부모 요소에 맞게 확장 */
    max-height: 200px; /* 이미지의 최대 높이를 지정 (조절 가능) */
    overflow: hidden; /* 이미지의 내용을 넘치지 않도록 숨김 */
}
.list-group{ margin-top : 3%;}
</style>
<div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
  <ul class="list-group" style="max-width: 800px;"> <!-- 리스트로 감싸기 -->
    <c:forEach items="${stores}" var="store">
      <li class="list-group-item"> <!-- 각 항목을 리스트 아이템으로 만들기 -->
        <a href="${pageContext.request.contextPath}/store/storeDetail.do?id=${store.storeId}" style="text-decoration: none;">
          <div class="card" style="max-width: 800px;">
            <div class="row g-0">
              <div class="col-md-4">
              	<div class="img-wrapper">
                <img src="${pageContext.request.contextPath}/resources/images/store/${store.storeName}.jpg" class="img-fluid rounded-start" alt="식당사진">
              	 </div>
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title" style="font-size: 30px;">${store.storeName}</h5>
                  <p class="card-text" style="font-size: 26px;">${store.storeType}</p>
                  <p class="card-text" style="font-size: 15px;"><small class="text-body-secondary">${store.address}</small></p>
                </div>
              </div>
            </div>
          </div>
        </a>
      </li>
    </c:forEach>
  </ul>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
