<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<div class="d-flex justify-content-center align-items-center" style="min-height: 100vh;">
  <ul class="list-group" style="max-width: 800px;"> <!-- 리스트로 감싸기 -->
    <c:forEach items="${stores}" var="store">
      <li class="list-group-item"> <!-- 각 항목을 리스트 아이템으로 만들기 -->
        <a href="/your-link-here" style="text-decoration: none;">
          <div class="card" style="max-width: 800px;">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="${pageContext.request.contextPath}/resources/images/${store.storeName}.jpg" class="img-fluid rounded-start" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title" style="font-size: 26px;">${store.storeName}</h5>
                  <p class="card-text" style="font-size: 16px;">${store.storeType}</p>
                  <p class="card-text" style="font-size: 10px;"><small class="text-body-secondary">${store.address}</small></p>
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
