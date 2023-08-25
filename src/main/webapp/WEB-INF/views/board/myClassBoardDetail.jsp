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
	margin-top: 1%;
	margin-bottom: 2%;
}
#commentFrm textarea {
	margin-left: 7%;
    padding: 2px;
}
#commentFrm button {
	margin-right: -6%;
    width: 105px;
}
.list-group.list-group-flush span {
	font-size: 13px;
}
.list-group.list-group-flush li {
	background-color: #fff;
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

	<!-- 게시글 -->
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
	
	<!-- 댓글 -->
	<div class="d-flex justify-content-center">
		<c:if test="${comments ne null}">
			<ul class="list-group list-group-flush">
				<c:forEach items="${comments}" var="comment">
					<c:if test="${comment.commentLevel eq 1}">
					  <li class="list-group-item">
					  	<b>${comment.memberName}</b>
					  	<span>
					  		<fmt:parseDate value="${comment.commentCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
						  	<fmt:formatDate value="${createdAt}" pattern="yyyy.MM.dd HH:mm" />
					  	</span>
					  	<c:if test="${loginMember.memberId eq comment.memberId}">
						  	<b id="deleteComment" style="float: right;">&nbsp; 삭제</b>
					  	</c:if>
					  	<b id="childComment" style="float: right;">답글 &nbsp;|</b>
					  	<input type="hidden" name=commentId value="${comment.commentId}"/>
					  	<div>${comment.commentContent}</div>
					  </li>
					</c:if>
					<c:if test="${comment.commentLevel eq 2}">
					  <li class="list-group-item">
					    <b>${comment.memberName}</b>
					    <span>
					  		<fmt:parseDate value="${comment.commentCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
						  	<fmt:formatDate value="${createdAt}" pattern="yyyy.MM.dd HH:mm" />
					  	</span>
					  	<c:if test="${loginMember.memberId eq comment.memberId}">
						  	<b id="deleteComment" style="float: right;">&nbsp; 삭제</b>
					  	</c:if>
					  	<input type="hidden" name=commentId value="${comment.commentId}"/>
					  	<div>${comment.commentContent}</div>
					  </li>
					</c:if>
				</c:forEach>
			</ul>
		</c:if>
	</div>
	
	<form:form 
		name="commentFrm" id="commentFrm" method="POST"
		action="${pageContext.request.contextPath}/board/createMyClassBoardComment.do">
		<div class="d-flex justify-content-center"  style="width: 1200px;" >
			<input type="hidden" name="postId" value="${postDetail.postId}"/>
			<input type="hidden" name="boardId" value="${postDetail.boardId}"/>
			<input type="hidden" name="commentRef" />
		    <textarea id="commentContent" name="commentContent" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			<button id="commentBtn" type="submit" class="btn btn-outline-warning">등록</button>
		</div>
	</form:form>
	<form:form name="tokenFrm"></form:form>
	<script>
	document.querySelectorAll('#childComment').forEach((childComment) => {
		childComment.addEventListener('click', (e) => {
			const html = `
	            <textarea name="commentContent" class="form-control" id="exampleFormControlTextarea1" rows="3" style="background-color: #6495ed1c; height: 70px;"></textarea>
	            <button id="childCommentBtn" type="button" class="btn btn-outline-warning">등록</button>
	        `;
	        e.target.closest('li').insertAdjacentHTML('afterend', html);
	        document.querySelector('#commentContent').style.display = 'none';
	        document.querySelector('#commentBtn').style.display = 'none';
	        
	        document.querySelector('#childCommentBtn').addEventListener('click', () => {
	        	const token = document.tokenFrm._csrf.value;
				const postId = document.querySelector('input[name=postId]').value;
				$.ajax({
					url : "${pageContext.request.contextPath}/board/createMyClassBoardComment.do",
					method : "POST",
					headers: {
		                "X-CSRF-TOKEN": token
		            },
					data : {
						postId : document.querySelector('input[name=postId]').value,
						boardId : document.querySelector('input[name=boardId]').value,
						commentContent : document.querySelector('textarea[name=commentContent]').value,
						commentRef : document.querySelector('input[name=commentId]').value
					},
					success(responseData) {
						console.log(responseData);
						window.location.href = "${pageContext.request.contextPath}/board/myClassBoardDetail.do?id=" + postId
					}
				})
	        });
		});
	});
	</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>