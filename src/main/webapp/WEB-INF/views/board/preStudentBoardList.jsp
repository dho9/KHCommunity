<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div id="container" class="community" style="margin-top: 25px;">
	<div class="wrap title">
		<h1>
			<a>예비생게시판</a>
		</h1>
	</div>
	<div class="wrap articles">
		<c:if test="${empty preStudentBoardList}">
			<article class="dialog">
				조회된 게시글이 존재하지 않습니다.
			</article>
		</c:if>
		<c:if test="${not empty preStudentBoardList}">
			<article>
				<c:forEach items="${preStudentBoardList}" var="board">
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
    <div class="rightside">
        <form action="${pageContext.request.contextPath}/board/boardSearch.do" class="search">
            <input type="text" name="keyword" placeholder="전체 게시판의 글을 검색하세요!" class="text" />
        </form>
        <div class="card">
            <div class="board">
                <h3>
                    <a>실시간 인기 글</a>
                </h3>
                <a href="" class="article">
                    <p class="title">내일 4학년 수강신청 파이팅</p>
                    <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                    <h4>자유게시판</h4>
                    <ul class="status">
                    	<li><img src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
                        <li class="vote active">22</li>
                    	<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
                        <li class="comment active">7</li>
                    </ul>
                    <hr>
                </a>
                <a href="" class="article">
                    <p class="title">내일 4학년 수강신청 파이팅</p>
                    <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                    <h4>자유게시판</h4>
                    <ul class="status">
                       	<li><img src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
                        <li class="vote active">22</li>
                    	<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
                        <li class="comment active">7</li>
                    </ul>
                    <hr>
                </a>
                <a href="" class="article">
                    <p class="title">내일 4학년 수강신청 파이팅</p>
                    <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                    <h4>자유게시판</h4>
                    <ul class="status">
                        <li><img src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
                        <li class="vote active">22</li>
                    	<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
                        <li class="comment active">7</li>
                    </ul>
                    <hr>
                </a>
            </div>
        </div>
        <div class="card">
            <div class="board">
                <h3>
                    <a>공지사항</a>
                </h3>
                <a href="" class="article">
                    <p class="title">내일 4학년 수강신청 파이팅</p>
                    <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                    <h4>자유게시판</h4>
                    <ul class="status">
	                    <li><img src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
                        <li class="vote active">22</li>
                    	<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
                        <li class="comment active">7</li>
                    </ul>
                    <hr>
                </a>
                <a href="" class="article">
                    <p class="title">내일 4학년 수강신청 파이팅</p>
                    <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                    <h4>자유게시판</h4>
                    <ul class="status">
	                    <li><img src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
                        <li class="vote active">22</li>
                    	<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
                        <li class="comment active">7</li>
                    </ul>
                    <hr>
                </a>
                <a href="" class="article">
                    <p class="title">내일 4학년 수강신청 파이팅</p>
                    <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                    <h4>자유게시판</h4>
                    <ul class="status">
                    	<li><img src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
                        <li class="vote active">22</li>
                    	<li><img src="${pageContext.request.contextPath}/resources/images/comment.png"/></li>
                        <li class="comment active">7</li>
                    </ul>
                    <hr>
                </a>
            </div>
        </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>