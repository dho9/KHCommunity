<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<div id="container" class="community" style="margin-top: 25px;">
	<div class="wrap title">
		<h1>
			<a>자유게시판</a>
		</h1>
	</div>
	<div class="wrap articles">
		<button type="button" class="article" id="writeArticleButton" onclick="showInputForm()">
			새 글을 작성해주세요!
			<span class="material-symbols-outlined" style="float: right;">edit</span>
		</button>
		
		<c:if test="${empty freeBoardLists}">
			<article class="dialog">
				조회된 게시글이 존재하지 않습니다.
			</article>
		</c:if>
		<c:if test="${not empty freeBoardLists}">
			<article>
				<c:forEach items="${freeBoardLists}" var="board">
					<a class="article" href="${pageContext.request.contextPath}/board/boardDetail.do?id=${board.postId}">
				  		<img class="picture medium" src="${pageContext.request.contextPath}/resources/images/usericon.png"/>
				  		<h3 class="medium">익명</h3>
					  	<time class="medium">
						  	<fmt:parseDate value="${board.postCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
						  	<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd HH:mm"/>
					  	</time>
					  	<hr>
					  	<h2 class="medium bold">${board.title}</h2> <br>
					  	<p class="medium">${board.content}</p> <br>
					  	<ul class="status">
					  		<li><img src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
					  		<li class="vote" style="margin-top: 5px;">${board.postLike}</li>
					  		<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
					  		<li class="comment" style="margin-top: 5px;">${board.commentCount}</li>
					  	</ul>
					  	<hr>
					</a>
				</c:forEach>
			</article>
		</c:if>
	</div>
	<script>
	 
	</script>
	
    
<%@ include file="/WEB-INF/views/common/rightSide.jsp" %>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>