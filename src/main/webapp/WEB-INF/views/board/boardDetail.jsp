<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
	.sstatus img {
    width: 13px;
}
  ul.sstatus li.vote span.likeCount {
    color: #c62917;
 	marging-left:0;
 	font-size: 11px;
}

h3.medium {
	font-size: 15px;
}

time.medium {
	font-size: 11px;
	margin-left: 9px;
	padding-top: 2px;
}

ul.commentMenu li {
	float: right;
	margin-left: 8px;
	padding: 0 2px;
	height: 20px;
	line-height: 20px;
	color: #a6a6a6;
	font-size: 12px;
	background-repeat: no-repeat;
	background-position: left center;
	background-size: 11px 11px;
	cursor: pointer;
}

.tag {
	cursor: pointer;
}

.picturesmall {
	margin: 5px 5px 5px 5px;
	width: 20px;
	height: 20px;
	border-radius: 4px;
}

#container hr.comment-separator {
	clear: both;
	width: 100%;
	height: 0;
	border: 0;
	border: 0;
	border-top: 1px solid lightgray;
	margin: 5px 0;
}

#commnetContainer>div.articles>article form.writecomment input.text {
	margin: 0;
	padding: 10px 85px 10px 10px;
	border: 0;
	width: 89.02%;
	height: 40px;
	line-height: 20px;
	box-sizing: border-box;
	color: #262626;
	font-size: 13px;
	overflow: hidden;
	resize: none;
	background-color: transparent;
}

#commnetContainer>div.articles>article form.writecomment ul.option li {
	display: inline-block;
	width: 40px;
	height: 40px;
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 40px 40px;
	cursor: pointer;
}

#commnetContainer>div.articles>article form.writecomment ul.option li.anonym
	{
	margin-right: 5px;
	background-image:
		url('${pageContext.request.contextPath}/resources/images/익명.png');
}

#commnetContainer>div.articles>article form.writecomment ul.option li.anonym.active
	{
	background-image:
		url('${pageContext.request.contextPath}/resources/images/익명체크.png');
}

#commnetContainer>div.articles>article form.writecomment ul.option li.submit
	{
	float: right;
	background-color: #c62917;
	background-image:
		url('${pageContext.request.contextPath}/resources/images/댓글제출.png');
	background-color: #c62917;
}

#commnetContainer {
	display: block;
	padding: 2px;
	border: solid 0.7px lightgray;
	background-color: #f2eded75;
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
			<article class="dialog">조회된 게시글이 존재하지 않습니다.</article>
		</c:if>
		<c:if test="${not empty postDetail}">
			<article>
					<a class="article" >
				  		<img class="picture large" src="${pageContext.request.contextPath}/resources/images/usericon.png"/>
				  		<div class="profile">
				  			<c:if test="${postDetail.anonymousCheck eq '1'}">
					  			<h3 class="large" style="font-size: 13px">익명</h3>
					  		</c:if>
					  		<c:if test="${postDetail.anonymousCheck ne '1'}">
						  		<h3 class="large" style="font-size: 13px">${postDetail.memberId}</h3>
					  		</c:if>
						  	<time class="large" style="font-size: 12px">
							  	<fmt:parseDate value="${postDetail.postCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
							  	<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd HH:mm" />
						  	</time>
				  		</div>
				  		<ul class="status">
				  			<li class="messagesend">쪽지</li>
				  			<li class="abuse">신고</li>
				  		</ul>
					  	<hr>
					  	<h1 class="large" style="font-size : 20px;">${postDetail.title}</h2> <br>
					  	<c:if test="${postAttach != null }">
						  	<img 
						  		src="${pageContext.request.contextPath }/resources/images/upload/${postAttach.postRenamedFilename}"
						  		style="width: 747px;">
						  	<p class="large">${postDetail.content}</p> <br>
					  	</c:if>
					  	<c:if test="${postAttach == null }">
						  	<p class="large">${postDetail.content}</p> <br>
					  	</c:if>
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
		<div class="comments" style="display: block">
			<div id="commnetContainer">
				<div id="commentList"></div>
				<div class="articles">
					<article>
						<form:form name="commentFrm" class="writecomment">
							<div style="display: flex; align-items: center;">
								<input type="text" name="commentText" id="commentText"
									maxlength="300" autocomplete="off" placeholder="댓글을 입력하세요."
									class="text" data-listener-added_4fb6911b="true">
								<ul class="option">
									<li title="익명" class="anonym"></li>
									<li title="완료" class="submit"></li>
								</ul>
							</div>
						</form:form>
					</article>
				</div>
			</div>

		</div>

	</div>

	<!-- 해시태그를 클릭했을 때의 폼 -->
	<form name="tagFrm"
		action="${pageContext.request.contextPath}/board/boardSearch.do">
		<input type="hidden" name="keyword" class="keyword" />
	</form>
	<form:form name="tokenFrm"></form:form>
	<form:form name="loadCommentFrm"></form:form>
	<form:form name="commentLikeFrm"></form:form>
	<script>
document.addEventListener('DOMContentLoaded', () => {
	
	loadComment();
	document.querySelector('.writecomment').addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
            e.preventDefault();}
        
	});
	
});

function loadCommentLike(){
	$.ajax({
		url : "${pageContext.request.contextPath}/board/commentLike.do",
		data : {
			_postId : document.querySelector('.like').dataset.value
		},
		method : "GET",
        dataType : "json",
        success(responseData) {
        	console.log(responseData);
			const {available, likeCount} = responseData;
			const {postLikeCount} = likeCount;
			
			const like = document.querySelector('.commentLike');
			if(available) {
            	like.src = "${pageContext.request.contextPath}/resources/images/fullLike.png";
            }
            else {
            	like.src = "${pageContext.request.contextPath}/resources/images/like.png";
            }
        }
	});
	
}


function loadComment(){
	const token = document.loadCommentFrm._csrf.value;
	const currentURL = window.location.href;
	const urlParams = new URLSearchParams(new URL(currentURL).search);
	const postId = urlParams.get('id');
	
    $.ajax({
    	url : "${pageContext.request.contextPath}/board/loadComment.do",
    	headers: {
            "X-CSRF-TOKEN": token
        },
    	data : {
    		postId : postId
    	},
    	method : "POST",
    	success(data){
    		//loadCommentLike();
    		renderComments(data);
    		
    	}
    });
}
function renderComments(comments) {
    const commentList = document.querySelector('#commentList'); // Select the comment list container
    // Clear existing comments
    commentList.innerHTML = '';

    // Loop through each comment and create a DOM element for it
    comments.forEach(comment => {
        const commentElement = document.createElement('article');
        commentElement.className = 'parent';
        commentElement.innerHTML = `
            
        	<h3 class="medium" style="display: flex; align-items: center; justify-content: space-between;">
            <div style="display: flex; align-items: center;">
                <img src="https://cf-fpi.everytime.kr/0.png" class="picturesmall">
                <span>\${comment.anonymousCheck ? '익명' : comment.memberId}</span>
            </div>
            <ul class="commentMenu">
                <li class="childcomment">대댓글</li>
                <li class="commentvote" data-commentid="\${comment.commentId}">공감</li>
                <li class="messagesend">쪽지</li>
                <li class="abuse">신고</li>
            </ul>
        </h3>
            <hr>
            <p class="large" style="padding-left: 10px;padding-bottom: 5px;">\${comment.commentContent}</p>
            <ul class="sstatus commentvotestatus">
            <li class="vote commentvote" >
                <time class="medium">\${comment.commentCreatedAt}</time>
                <img class="commentLike" src="${pageContext.request.contextPath}/resources/images/like.png">
                <span class="likeCount">0</span>
            </li>
           
        </ul>
            <hr class="comment-separator"/>
        `;

        // Append the comment element to the comment list container
        commentList.appendChild(commentElement);
    });
}
//댓글좋아요 기능 
document.querySelector('#commentList').addEventListener('click', (event) => {
    const clickedElement = event.target;
    const token = document.commentLikeFrm._csrf.value;
    if (clickedElement.classList.contains('commentvote')) {
        // data-commentid 속성을 가져와서 사용
        const commentId = clickedElement.getAttribute('data-commentid');
        
    	$.ajax({
			url : "${pageContext.request.contextPath}/board/commentLike.do",
			data : {
				commentId :commentId
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
    			
				const like = document.querySelector('.commentLike');
				if(available) {
	            	like.src = "${pageContext.request.contextPath}/resources/images/fullLike.png";
	            }
	            else {
	            	like.src = "${pageContext.request.contextPath}/resources/images/like.png";
	            }
            }
		});
        
        
        
    }
});


	let anonyCk = false;
	document.querySelectorAll('.option li.anonym').forEach((li) => {
		
	    li.addEventListener('click', () => {
	    
	        // 클릭한 li 요소에 active 클래스 추가 또는 제거
	        li.classList.toggle('active');

	        // 배경 이미지 변경
	        if (li.classList.contains('active')) {
	            li.style.backgroundImage = `url('${pageContext.request.contextPath}/resources/images/익명체크.png')`;
	            anonyCk= true;
	        } else {
	            li.style.backgroundImage = `url('${pageContext.request.contextPath}/resources/images/익명.png')`;
	            anonyCk= false;
	        }
	        
	     
	    });
	
	});
	document.querySelectorAll('.option li.submit').forEach((li) => {
		li.addEventListener('click', (e)=>{
		const currentURL = window.location.href;
		const urlParams = new URLSearchParams(new URL(currentURL).search);
		const postId = urlParams.get('id');
			    	console.log("id 파라미터 값:", postId);	
		console.log(anonyCk);
		console.log(${board.boardId});
		const token = document.commentFrm._csrf.value;
		    $.ajax({
	        	url : "${pageContext.request.contextPath}/board/createComment.do",
	        	headers: {
	                "X-CSRF-TOKEN": token
	            },
	        	data : {
	        		postId : postId,
	        		boardId : ${board.boardId},
	        		commentContent : document.querySelector("#commentText").value,
	        		anonymousCheck: anonyCk
	        	},
	        	method : "POST",
	        	success(data){
	        		loadComment();
	        		document.querySelector("#commentText").value = "";
	        	}
	        })
		})
	});
	</script>
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
	<%@ include file="/WEB-INF/views/common/rightSide.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>