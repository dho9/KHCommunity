<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myClassBoard.css" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<style>
#myClassBoard-div {
	border: 4px solid #fff;
    border-radius: 63px;
    height: 800%;
    width: 1365px;
    margin-left: 15%;
    background-color: #e9ecef;
}
.myClassBoard-title .title {
    font-weight: bold;
    font-size: 49px;
    margin-top: 7%;
}
.card.border-primary.mb-3 {
	width: 1200px;
    margin-top: 4%;
    height: 500px;
}
.card-header h5 {
    float: right;
    margin-top: -3%;
}
.list-group.list-group-flush {
	width: 1200px;
}
</style>
	<div id="myClassBoard-div">
	<sec:authentication property="principal" var="loginMember"/>
	<div class="myClassBoard-title">
		<h2 class="title">우리반 게시판</h2>
		<p>${loginMember.name}님, 반갑습니다. 'KH소통할까?'에 오신 걸 환영합니다.</p>
	</div>
	<div class="myClassBoard-subTitle">
		<ul>
			<li>${studentInfo.curriculumName}반</li>
			<li>[${studentInfo.classId}] ${studentInfo.memberName} 강사님</li>
		</ul>
	</div>

	<div class="d-flex justify-content-center">
	<div class="card border-primary mb-3">
	  <div class="card-header">
	  	<h3>${postDetail.title}</h3>
	  	<h5>${postDetail.memberName}</h5>
	  </div>
	  <div class="card-header"><a href = '${pageContext.request.contextPath}/board/fileDownload.do?id=${postDetail.postId}';>첨부파일 - ${postAttach.postRenamedFilename != null ? postAttach.postRenamedFilename : '없음'}</a></div>
	  <div class="card-body">
	    <p class="card-text">${postDetail.content}</p>
	  </div>
	</div>
	</div>

	<div class="d-flex justify-content-center">
	<c:if test="${comments ne null}">
		<c:forEach items="${comments}" var="comment">
			<ul class="list-group list-group-flush">
			  <li class="list-group-item">
			  	${comment.getMemberName}
			  	${comment.getCommentCreatedAt}
			  	${comment.getCommentContent}
			  </li>
			</ul>
		</c:forEach>
	</c:if>
	</div>
	


<%@ include file="/WEB-INF/views/common/footer.jsp"%>