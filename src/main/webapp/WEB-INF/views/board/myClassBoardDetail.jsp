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
a {
  text-decoration: none;
}
* {
	margin: 0;
	padding: 0;
	-webkit-touch-callout: none;
}
@font-face {font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');font-weight: normal;font-style: normal;}
body {
	font-family: 'GmarketSansMedium';
}
#myClassBoard-div2 {
	border: 4px solid #fff;
    border-radius: 63px;
    height: 180%;
    width: 1365px;
    margin-left: 14%;
    margin-top: 5%;
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
.list-group.list-group-flush {
	background-color: #fff;
}
#updateAndDeleteBtn-div {
	margin-left: 78%;
}
#updateAndDeleteBtn-div button {
    width: 100px;
    height: 44px;
}
#prevBtn {
	margin-left: 7%;
    width: 105px;
    height: 50px;
}
#post-div {
	margin-top: -3%;
}
</style>

	<div id="myClassBoard-div2">
	<sec:authentication property="principal" var="loginMember"/>
		<div class="myClassBoard-title">
			<h2 class="title">우리반 게시판</h2>
			<p>${loginMember.name}님, 반갑습니다. 'KH소통할까?'에 오신 걸 환영합니다.</p>
		</div>
		<div class="myClassBoard-subTitle">
			<ul>
				<li style="margin-left: 4%;">${studentInfo.curriculumName}반</li>
				<li style="margin-left: 3.5%;">[${studentInfo.classId}] ${studentInfo.memberName} 강사님</li>
			</ul>
		</div>
	
		<button id="prevBtn" type="button" class="btn btn-outline-primary" value="${postDetail.boardId}"><i class="bi bi-list"></i>글목록</button>
	
		<c:if test="${loginMember.memberId eq postDetail.memberId}">
			<div id="updateAndDeleteBtn-div">
				<button id="updateBtn" type="button" class="btn btn-outline-primary">수정</button>
				<button id="deleteBtn" type="button" class="btn btn-outline-primary">삭제</button>
			</div>
		</c:if>

		<!-- 게시글 -->
		<div id="post-div" class="d-flex justify-content-center">
			<div class="card border-primary mb-3">
			  <div class="card-header">
			  	<h3 style="background-color: #4169e100;">${postDetail.title}</h3>
			  	<h5>${postDetail.memberName} | 
				  	<fmt:parseDate value="${postDetail.postCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
					<fmt:formatDate value="${createdAt}" pattern="yyyy.MM.dd" />
				</h5>
			  </div>
			  <div class="card-header">
				  <c:if test="${postAttach.postRenamedFilename ne null}">
			  		<a href = '${pageContext.request.contextPath}/board/fileDownload.do?id=${postDetail.postId}';>첨부파일 - ${postAttach.postRenamedFilename}</a>
				  </c:if>
				  <c:if test="${postAttach.postRenamedFilename eq null}">
			  		<a>첨부파일 - 없음</a>
				  </c:if>
	  	  	  </div>
			  <div class="card-body">
			  	<c:if test="${postAttach.postRenamedFilename ne null}">
				  	<img src="${pageContext.request.contextPath }/resources/images/upload/${postAttach.postRenamedFilename}" style="width: 55%; height: 75%">
			  	</c:if>
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
						  <c:if test="${postDetail.memberId eq comment.memberId}">
						  	<b>${comment.memberName} (작성자)</b>
						  </c:if>
						  <c:if test="${postDetail.memberId ne comment.memberId}">
						  	<b>${comment.memberName}</b>
						  </c:if>
						  	<span>
						  		<fmt:parseDate value="${comment.commentCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
							  	<fmt:formatDate value="${createdAt}" pattern="yyyy.MM.dd HH:mm" />
						  	</span>
						  	<c:if test="${loginMember.memberId eq comment.memberId}">
							  	<b id="deleteComment" data-value = "${comment.commentId}" style="float: right;">|&nbsp; 삭제</b>
						  	</c:if>
						  	<b id="childComment" style="float: right;">답글 &nbsp;</b>
						  	<input type="hidden" name=commentId value="${comment.commentId}"/>
						  	<div>${comment.commentContent}</div>
						  </li>
						  <c:forEach items="${comments}" var="childComment">
							<c:if test="${childComment.commentLevel eq 2 && childComment.commentRef eq comment.commentId}">
							  <li class="list-group-item ml-2">
							  	<i class="bi bi-arrow-return-right"></i>
							  	<c:if test="${postDetail.memberId eq childComment.memberId}">
							  	  <b>${childComment.memberName} (작성자)</b>
							    </c:if>
							    <c:if test="${postDetail.memberId ne childComment.memberId}">
							      <b>${childComment.memberName}</b>
							    </c:if>
							    <span>
							  		<fmt:parseDate value="${childComment.commentCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
								  	<fmt:formatDate value="${createdAt}" pattern="yyyy.MM.dd HH:mm" />
							  	</span>
							  	<c:if test="${loginMember.memberId eq childComment.memberId}">
								  	<b id="deleteComment" data-value = "${childComment.commentId}" style="float: right;">&nbsp; 삭제</b>
							  	</c:if>
							  	<div style="margin-left: 21px;">${childComment.commentContent}</div>
							  </li>
							</c:if>
						  </c:forEach>
						</c:if>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	
	<!-- 삭제 폼 -->
	<form:form action="${pageContext.request.contextPath}/board/deleteMyClassPost.do" name="boardDeleteFrm" method="POST">
		<input type="hidden" name="deletePostId" id="deletePostId" value="${postDetail.postId}"/>
		<input type="hidden" name="boardId" id="deleteBoardId" value="${postDetail.boardId}"/>
		<input type="hidden" name="postBoardLink" id="postBoardLink" value="myClassBoardList"/>
	</form:form>
	
	<!-- 댓글 등록폼 -->
	<form:form 
		name="commentFrm" id="commentFrm" method="POST"
		action="${pageContext.request.contextPath}/board/createMyClassBoardComment.do">
		<div class="d-flex justify-content-center"  style="width: 1200px;" >
			<input type="hidden" name="postId" value="${postDetail.postId}"/>
			<input type="hidden" name="boardId" value="${postDetail.boardId}"/>
			<input type="hidden" name="commentRef" />
		    <textarea id="commentContent" name="commentContent" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			<button id="commentBtn" type="submit" class="btn btn-warning">등록</button>
		</div>
	</form:form>
	<form:form name="tokenFrm"></form:form>
	<script>
	// 댓글 삭제
	document.querySelectorAll('#deleteComment').forEach((deleteComment) => {
		deleteComment.addEventListener('click', (e) => {
			if(confirm('정말 삭제하시겠습니까?')) {
				/* console.log(e.target.dataset.value); */
				const postId = document.querySelector('input[name=postId]').value;
				$.ajax({
					url : "${pageContext.request.contextPath}/board/deleteComment.do",
					data : {
						commentId : e.target.dataset.value					
					},
					success(responseData) {
						alert(responseData);
						window.location.href="${pageContext.request.contextPath}/board/myClassBoardDetail.do?id=" + postId;
					}
				});
			}
		});
	});
	
	// 글목록
	document.querySelector('#prevBtn').addEventListener('click', (e) => {
		/* console.log(e.target.getAttribute('value')); */
		const boardId = e.target.getAttribute('value');
		window.location.href="${pageContext.request.contextPath}/board/myClassBoardList.do?boardId=" + boardId;
	});
	
	// 게시글 삭제
	if(document.querySelector('#deleteBtn')) {
		document.querySelector('#deleteBtn').addEventListener('click', () => {
			if(confirm('게시글을 삭제하시겠습니까'))
				document.boardDeleteFrm.submit();
		});
	}
	
	// 게시글 수정
	if(document.querySelector('#updateBtn')){
		document.querySelector('#updateBtn').addEventListener('click', () => {
			const postDiv = document.querySelector('#post-div');
			postDiv.innerHTML = "";
			postDiv.innerHTML += `
				<form:form 
					name="updateFrm" method="POST"
					action="${pageContext.request.contextPath}/board/updateMyClassPost.do">
						<input type = "hidden" name="boardId" id="boardId" value="${postDetail.boardId}"/>
				      	<input type = "hidden" name="postId" id="postId" value="${postDetail.postId}"/>
				      	<input type = "hidden" name="_tags" id="tags" value="${postDetail.tag}"/>
						<div class="card border-primary mb-3">
						  <div class="card-header">
						  	<h3><input style="width: 80%;" name="title" value="${postDetail.title}"/></h3>
						  	<h5>${postDetail.memberName} | 
							  	<fmt:parseDate value="${postDetail.postCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
								<fmt:formatDate value="${createdAt}" pattern="yyyy.MM.dd" />
							</h5>
						  </div>
						  <div class="card-header">
						  	<input class="file" type="file" name="file" id="fileInput" multiple="multiple">
					 	    <label class="btn btn-primary" for="fileInput">파일 선택</label>
				      	  </div>
						  <div class="card-body">
						    <p class="card-text"><textarea style="width: 80%; height: 95%;" name="text">${postDetail.content}</textarea></p>
						  </div>
						  <button style="height: 10%;" id="updateBtn" type="submit" class="btn btn-outline-primary">작성</button>
						</div>
				</form:form>
			`;
		});
	}
	
	// 대댓글 등록
	document.querySelectorAll('#childComment').forEach((childComment) => {
		childComment.addEventListener('click', (e) => {
			const html = `
	            <textarea name="commentContent" class="form-control" id="exampleFormControlTextarea1" rows="3" style="background-color: #6495ed1c; height: 70px;"></textarea>
	            <button id="childCommentBtn" type="button" class="btn btn-warning">등록</button>
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
						commentRef : e.target.closest('li').querySelector('input[name=commentId]').value
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