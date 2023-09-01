<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style>
a.article{
color: black;
}
article ul.status{
margin-top: -1%;
}
span.tag{
color:#519cc9;}


.article{
color: black;}

.anonymous{
	float: right;
	background-color: white;
	margin-right: 13px;
}
.anonymousImg{
	width: 59px;
}
.pagination {
  text-align: center;
  margin-top: 20px;
}

.pagination ul {
  display: inline-block;
  padding: 0;
}

.pagination ul li {
  display: inline;
  margin: 0 5px;
}

.pagination ul li.active a {
  font-weight: bold;
}
</style>
<div id="container" class="community" style="margin-top: 25px;">
  <div class="wrap title">
    <h1>
      <a>내가 쓴 글</a>
    </h1>
  </div>
  <div class="wrap articles">

    <c:if test="${empty myarticle}">
      <article class="dialog">
        작성한 게시글이 존재하지 않습니다.
      </article>
    </c:if>
    <c:if test="${not empty myarticle}">
      <article>
        <c:forEach items="${myarticle}" var="board">
          <a class="article" href="${pageContext.request.contextPath}/board/boardDetail.do?id=${board.postId}">
            <img class="picture medium" src="${pageContext.request.contextPath}/resources/images/usericon.png"/>
            <c:if test="${board.anonymousCheck eq '1'}">
              <h3 class="medium">익명</h3>
            </c:if>
            <c:if test="${board.anonymousCheck ne '1'}">
              <h3 class="medium">${board.memberId}</h3>
            </c:if>
            <time class="medium">
              <fmt:parseDate value="${board.postCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
              <fmt:formatDate value="${createdAt}" pattern="yy/MM/dd HH:mm"/>
            </time>
            <hr>
            <h2 class="medium bold">${board.title}</h2>
            <p class="medium">${board.content}</p>

            <c:forEach items="${board.tag}" var="tag">
              <span class="tag">${tag}</span>
            </c:forEach>
            <ul class="status">
              <li><img class="like" data-value="${board.postId}" src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
              <li class="vote" style="margin-top: 5px;">${board.postLike}</li>
              <li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
              <li class="comment" style="margin-top: 5px;">${board.commentCount}</li>
            </ul>
            <hr>
          </a>
        </c:forEach>
      </article>
      <ul class="pagination justify-content-center">
	      	<c:if test="${currentPage > 1}">
			    <li class="page-item">
			        <li>
			        	<a class="page-link" href="${pageContext.request.contextPath}/board/myarticle.do?page=${currentPage - 1}" aria-label="Previous">
			        		&laquo;
			        	</a>
			        </li>
			        <span aria-hidden="true">&laquo;</span>
	        </c:if>
		    <li class="page-item">
		    	<c:forEach var="pageNum" begin="1" end="${totalPages}">
		            <c:choose>
		              <c:when test="${pageNum eq currentPage}">
		                <li class="active"><a class="page-link" href="#">${pageNum}</a></li>
		              </c:when>
		              <c:otherwise>
		                <li><a class="page-link" href="${pageContext.request.contextPath}/board/myarticle.do?page=${pageNum}">${pageNum}</a></li>
		              </c:otherwise>
		            </c:choose>
		        </c:forEach>
		    </li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		      	  <c:if test="${currentPage < totalPages}">
		            <li><a href="${pageContext.request.contextPath}/board/myarticle.do?page=${currentPage + 1}" ></a></li>
		          </c:if>
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
    </c:if>
  </div>
  <%@ include file="/WEB-INF/views/common/rightSide.jsp" %>
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>