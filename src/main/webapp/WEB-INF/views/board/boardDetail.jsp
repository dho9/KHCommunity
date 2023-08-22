<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
.tag {
	cursor: pointer;
}
</style>

	<div id="container" class="community" style="margin-top: 25px;">
	<div class="wrap title">
		<h1>
			<a>${board.boardName}</a>
		</h1>
	</div>
	<div class="wrap articles">
		<c:if test="${empty postDetail}">
			<article class="dialog">
				조회된 게시글이 존재하지 않습니다.
			</article>
		</c:if>
		<c:if test="${not empty postDetail}">
			<article>
					<a class="article" >
				  		<img class="picture large" src="${pageContext.request.contextPath}/resources/images/usericon.png"/>
				  		<div class="profile">
					  		<h3 class="large" style="font-size : 15px;">익명</h3>
						  	<time class="large">
							  	<fmt:parseDate value="${postDetail.postCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
							  	<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd HH:mm"/>
						  	</time>
				  		</div>
				  		<ul class="status">
				  			<li class="messagesend">쪽지</li>
				  			<li class="abuse">신고</li>
				  		</ul>
					  	<hr>
					  	<h1 class="large" style="font-size : 20px;">${postDetail.title}</h2> <br>
					  	<p class="large">${postDetail.content}</p> <br>
					  	<c:forEach items="${postDetail.tag}" var="tag">
					  		<span class="tag">${tag}</span>
					  	</c:forEach>
					  	<ul class="status">
					  		<%-- 좋아요 버튼 --%>
					  		<li><img class="like" data-value="${postDetail.postId}" style="cursor: pointer;" src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
					  		<li class="vote" style="margin-top: 5px;">${postDetail.postLike}</li>
					  		<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
					  		<li class="comment" style="margin-top: 5px;">${postDetail.commentCount}</li> 
					  	</ul>
					  	<hr>
					</a>
			</article>
		</c:if>
	</div>
	<!-- 해시태그를 클릭했을 때의 폼 -->
	<form name="tagFrm" action="${pageContext.request.contextPath}/board/boardSearch.do">
	    <input type="hidden" name="keyword" class="keyword" />
	</form>
	<form:form name="tokenFrm"></form:form>
	<script>
	// load됐을때 공감(좋아요) 했는지 확인
	window.onload = () => {
		console.log(document.querySelector('.like').dataset.value);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/board/postLike.do",
			data : {
				_postId : document.querySelector('.like').dataset.value
			},
			method : "GET",
            dataType : "json",
            success(responseData) {
            	console.log(responseData);
    			const {available, likeCount} = responseData;
    			const {postLikeCount} = likeCount;
    			
    			const like = document.querySelector('.like');
    			const vote = document.querySelector('.vote');
    			if(available) {
                	like.src = "${pageContext.request.contextPath}/resources/images/fullLike.png";
                	vote.innerHTML = `\${postLikeCount}`;
                }
                else {
                	like.src = "${pageContext.request.contextPath}/resources/images/like.png";
                	vote.innerHTML = `\${postLikeCount}`;
                }
            }
		});
	};
	
	// 공감(좋아요) 누르기
	document.querySelector('.like').onclick = (e) => {
		console.log(e.target.dataset.value);
		
		const token = document.tokenFrm._csrf.value;
		
		$.ajax({
			url : "${pageContext.request.contextPath}/board/postLike.do",
			data : {
				_postId : e.target.dataset.value
			},
			headers: {
                "X-CSRF-TOKEN": token
            },
            method : "POST",
            dataType : "json",
            success(responseData) {
            	console.log(responseData);
				const {available, likeCount} = responseData;
				const {postLikeCount} = likeCount;
    			
    			const like = document.querySelector('.like');
    			const vote = document.querySelector('.vote');
    			if(available) {
                	like.src = "${pageContext.request.contextPath}/resources/images/like.png";
                	vote.innerHTML = `\${postLikeCount}`;
                }
                else {
                	like.src = "${pageContext.request.contextPath}/resources/images/fullLike.png";
                	vote.innerHTML = `\${postLikeCount}`;
                }
            }
		});
	};
	
	// 해시태그 검색
	document.querySelectorAll('.tag').forEach((tag) => {
	    tag.addEventListener('click', (e) => {
	        const keyword = e.target.innerHTML.replace(/#/g, '');
			document.querySelector('.keyword').value = keyword;
			
			document.tagFrm.submit();
	    });
	});
	</script>
<%@ include file="/WEB-INF/views/common/rightSide.jsp" %>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>