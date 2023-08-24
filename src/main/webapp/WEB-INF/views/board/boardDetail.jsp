<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
form.writecomment.child{
    margin: 0 4px 4px 35px;
    border: 1px solid #e3e3e3;
        position: relative;
    /* border-top: 1px solid #e3e3e3; */
    background-color: #f8f8f8;
}


.writecomment.child input.text {
       margin: 0;
    padding: 10px 85px 10px 10px;
    border: 0;
    width: 100%;
    height: 45px;
    line-height: 20px;
    box-sizing: border-box;
    color: #262626;
    font-size: 13px;
    overflow: hidden;
    resize: none;
    background-color: transparent;
}

.writecomment.child ul.option {
    display: flex;
    align-items: center;
    list-style: none;
}

.writecomment.child ul.option li {
     display: inline-block;
    width: 40px;
    height: 40px;
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 40px 40px;
    cursor: pointer;
}

.writecomment.child ul.option li.anonym {
    background-image: url('../resources/images/anonymous.png');
    
    margin-right: 5px;
}

.writecomment.child ul.option li.anonym.active {
    background-image: url('../resources/images/anonymouscheck.png');
}

.writecomment.child ul.option li.submit {
    background-image: url('../resources/images/댓글제출.png');
    background-color: #c62917;
}


/*--*/
.writecomment.child.active {
    display: block; /* 혹은 필요한 스타일로 설정 */
}
.writecomment.child {
        display: none;
        /* 스타일을 추가하여 입력폼을 원하는 형태로 꾸밀 수 있습니다. */
    }
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
		url('${pageContext.request.contextPath}/resources/images/anonymous.png');
}

#commnetContainer>div.articles>article form.writecomment ul.option li.anonym.active
	{
	background-image:
		url('${pageContext.request.contextPath}/resources/images/anonymouscheck.png');
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


#messageContainer {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.7);
}

.message-content {
    background-color: #fff;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 450px;
}

#closeMessageBtn {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

#closeMessageBtn:hover,
#closeMessageBtn:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

button {
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

input[type="text"],
input[type="email"],
textarea {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
}

#openMessageBtn {
background-color: white; border: 0px;
color: black;
}

</style>

<div id="container" class="community" style="margin-top: 25px;">
	<%-- principal을 변수 loginMember 저장 --%>
	<sec:authentication property="principal" var="loginMember"/>
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
					  			<h3 class="large" style="font-size: 13px" id="postAnonymous">익명</h3>
					  		</c:if>
					  		<c:if test="${postDetail.anonymousCheck ne '1'}">
						  		<h3 class="large" style="font-size: 13px" id="postCreateId">${postDetail.memberId}</h3>
					  		</c:if>
						  	<time class="large" style="font-size: 12px">
							  	<fmt:parseDate value="${postDetail.postCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createdAt"/>
							  	<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd HH:mm" />
						  	</time>
				  		</div>
				  		<ul class="status">
				  			<c:if test="${postDetail.memberId eq loginMember.username}">
				  				<li class="updateBtn" style="margin-right: 5px;">수정 | </li>
				  				<li class="deleteBtn" >삭제</li>
				  			</c:if>
				  			
				  			<c:if test="${postDetail.memberId ne loginMember.username}">
					  			<li class="messagesend" style="margin-right: 5px;" id="openMessageBtn">쪽지 | </li>
					  			<li class="abuse">신고</li>
				  			</c:if>
				  		</ul>
					  	<hr>
					  	<h1 class="large" style="font-size : 20px;">${postDetail.title}</h2> <br>
					  	<input type="hidden" name="content" id="content" value="${postDetail.content}">
					  	<c:if test="${postAttach != null }">
					  		<c:if test="${postDetail.boardId eq '5'}">
					  			<img 
						  		src="${pageContext.request.contextPath }/resources/images/upload/${postAttach.postRenamedFilename}"
						  		style="width: 747px;">
							  	<p class="large">
							  		<textarea id="batch_content" name="batch_content"></textarea>
							  		
							  	</p> <br>
					  		</c:if>
					  		<c:if test="${postDetail.boardId ne '5'}">
						  		<img 
							  		src="${pageContext.request.contextPath }/resources/images/upload/${postAttach.postRenamedFilename}"
							  		style="width: 747px;">
					  			<p class="large">${postDetail.content}</p> <br>
					  		</c:if>
						  	
					  	</c:if>
					  	<c:if test="${postAttach == null }">
					  		<c:if test="${postDetail.boardId eq '5'}">
							  	<p class="large">
							  		<textarea id="batch_content" name="batch_content"></textarea>
							  	</p> <br>
					  		</c:if>
					  		<c:if test="${postDetail.boardId ne '5'}">
					  			<p class="large">${postDetail.content}</p> <br>
					  		</c:if>
					  	
					  	</c:if>
					  	
					  	
					  	<c:forEach items="${postDetail.tag}" var="tag">
					  		<span class="tag">${tag}</span>
					  	</c:forEach>
					  	<ul class="status">
					  		<%-- 좋아요 버튼 --%>
					  		<li><img class="like" data-value="${postDetail.postId}" style="cursor: pointer;" src="${pageContext.request.contextPath}/resources/images/like.png"/></li>
					  		<li class="vote" data-value="${postDetail.postId}" style="margin-top: 5px; cursor: pointer;">${postDetail.postLike}</li>
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
									<li title="완료" class="submit" data-value="1"></li>
								</ul>
							</div>
						</form:form>
					</article>
				</div>
			</div>

		</div>

	</div>

	<%-- 해시태그를 클릭했을 때의 폼 --%>
	<form name="tagFrm"
		action="${pageContext.request.contextPath}/board/boardSearch.do">
		<input type="hidden" name="keyword" class="keyword" />
	</form>
	<form:form name="tokenFrm"></form:form>
	<form:form name="loadCommentFrm"></form:form>
	<form:form name="commentLikeFrm"></form:form>
	
	<%-- 삭제 폼 --%>
	<form:form action="${pageContext.request.contextPath}/board/boardDelete.do" name="boardDeleteFrm" method="post">
		<input type="hidden" name="deletePostId" id="deletePostId" value="${postDetail.postId}"/>
		<input type="hidden" name="postBoardLink" id="postBoardLink" value="${board.boardLink}"/>
	</form:form>
	
	<%-- 수정 폼 --%>
	<%-- update post set title = ?, content = ?  --%>
	<form:form action="${pageContext.request.contextPath}/board/boardUpdate.do" name="boardUpdateFrm" method="post">
		<input type="hidden" name="updatePostId" id="updatePostId" value="${postDetail.postId}"/>
		<input type="hidden" name="postBoardLink" id="postBoardLink" value="${board.boardLink}"/>
	</form:form>
	
	
	<!-- 쪽지 모달 -->

	<div id="messageContainer" class="modal">
		<div class="message-content">
			<form:form id="messageFrm" action="${pageContext.request.contextPath}/message/messageSend.do">
	        	<div>
	        		<span><i class="bi bi-send"></i>&nbsp;쪽지 보내기</span>
	        		<span class="close" id="closeMessageBtn">&times;</span>         
	        	</div>
	        	</br>
	        	<sec:authentication property="principal" var="loginMember"/>
	        	<div class="mb-3">
	        		<label for="toInput" class="form-label">To</label>
	        		<input type="text" id="toInput" value="" readonly>
	        		<input type="hidden" id="receiveMember" value="" readonly>
	        	</div>
	        	</br></br>
	        	<div class="mb-3">
	                <label for="fromInput" class="form-label">From</label></br>
	                 <input type="text" class="form-control" id="fromInput" value="${loginMember.memberId}" readonly>
	        	</div>
	        	</br></br>
	        	<div class="mb-3">
	                <label for="contentInput" class="form-label">Content</label>
	                <textarea id="messageContent" rows="3" placeholder="메시지 내용 입력"></textarea>
	        	</div>
	            <button id="sendMessageBtn">메시지 전송</button>
	        </form:form>
		</div>
	</div>
	
	<script>
	
	// 글 수정
	const updateBtn = document.querySelector(".updateBtn");
	
	
	// 글 삭제
	const deleteBtn = document.querySelector(".deleteBtn");
	const boardDeleteFrm = document.querySelector("form[name='boardDeleteFrm']");
	
	if(deleteBtn !== null){
		deleteBtn.onclick = (()=>{
			if(confirm("정말 삭제하시겠습니까?")){
				boardDeleteFrm.submit();
			}else{
				alert("돌아가겠습니다.");
			}
		});	
	}
	 
	
	// 코드편집기
	var textarea = document.querySelector('#batch_content');
	var content = document.querySelector('#content').value;    
	console.log ("textarea = ", textarea);
	console.log("content = ", content);
	if(textarea !== null){
		var editor = CodeMirror.fromTextArea(textarea, {
	    	lineNumbers: true,  //왼쪽 라인넘버 표기
	        lineWrapping: true, //줄바꿈
	        mode: 'text/x-java', //모드는 java 모드
	        theme: "dracula",   //테마는 맘에드는 걸로.
	       	readOnly: true,
	       	cursorBlinkRate: 0  
	    });
	    
	    editor.setValue(content);
	}
    
    
	document.addEventListener('DOMContentLoaded', () => {
		isLike(); // 공감했는지
		like(); // 공감누르기
		//댓글호출함수
		loadComment();
		//엔터키로 폼제출방지
		document.querySelector('.writecomment').addEventListener('keydown', (e) => {
	        if (e.key === 'Enter') {
	            e.preventDefault();}
	        
		});
		
	});
	
	//공감(좋아요) 했는지 확인
	function isLike() {
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
	}
	
	// 공감(좋아요) 누르기
	function like() {
		document.querySelector('.vote').onclick = (e) => {
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
	}

//내가 누른 댓글 좋아요 불러오기
function loadCommentLike() {
    $.ajax({
        url: "${pageContext.request.contextPath}/board/commentLike.do",
        data: {
            _postId: document.querySelector('.like').dataset.value
        },
        method: "GET",
        dataType: "json",
        success(responseData) {
            const { commentLike } = responseData;
            const commentIds = commentLike.map(item => item.commentId);
            
            commentIds.forEach(commentId => {
                const likeElements = document.querySelectorAll(`.commentLike[data-commentid="\${commentId}"]`);
                likeElements.forEach(likeElement => {
                    if (commentIds.includes(commentId)) {
                        likeElement.src = "${pageContext.request.contextPath}/resources/images/fullLike.png";
                    }
                });
            });
        }
    });
}


//댓글불러오기
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
    		loadCommentLike();
    		renderComments(data);
    		
    	}
    });
}

function submitComment(adata){
	const token = document.commentFrm._csrf.value;
	    $.ajax({
        	url : "${pageContext.request.contextPath}/board/createComment.do",
        	headers: {
                "X-CSRF-TOKEN": token
            },
        	data :adata,
        	method : "POST",
        	success(data){
        		loadComment();
        		document.querySelector("#commentText").value = "";
        	     const anonymLi = document.querySelector('.option li.anonym');
        	        if (anonyCk) {
        	            anonymLi.classList.remove('active');
        	            anonymLi.style.backgroundImage = `url('${pageContext.request.contextPath}/resources/images/anonymous.png')`;
        	            anonyCk = false;
        	        }
        		
        	}
        })
	
	
}
//댓글불러온걸토대로 댓글랜더.
function renderComments(comments) {
	//console.log(comments);
    const commentList = document.querySelector('#commentList'); // Select the comment list container
  
    commentList.innerHTML = '';

    // Loop through each comment and create a DOM element for it
    comments.forEach(comment => {
    	//console.log("장준"+comment.commentRef);
    	if(comment.commentLevel ==1){
    		const commentElement = document.createElement('article');
            commentElement.className = 'parent';
            commentElement.setAttribute('data-commentid', comment.commentId);
            //console.log("sdsadsadsadsadsad"+commentElement);
            commentElement.innerHTML = `
                
            	<h3 class="medium" style="display: flex; align-items: center; justify-content: space-between;">
                <div style="display: flex; align-items: center;">
                    <img src="https://cf-fpi.everytime.kr/0.png" class="picturesmall">
                    <span>\${comment.anonymousCheck ? '익명' : comment.memberId}</span>
                </div>
                <ul class="commentMenu">
                    <li class="childcomment" data-commentid="\${comment.commentId}">대댓글</li>
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
                    <img class="commentLike" data-commentid="\${comment.commentId}" src="${pageContext.request.contextPath}/resources/images/like.png">
                    <span class="likeCount" data-commentid="\${comment.commentId}">\${comment.likeCount}</span>
                </li>
               
            </ul>
            <form class="writecomment child">
            <div class="writecommentWrap" style="display: flex; align-items: center;">
            <input type="text" name="text" maxlength="300" autocomplete="off" placeholder="대댓글을 입력하세요." class="text" data-listener-added_ce8d996c="true">
            <ul class="option">
                <li title="익명" class="anonym"></li>
                <li title="완료" class="submit" data-parentcommentid="\${comment.commentId}" data-value="2"></li>
            </ul>
           </div>
        </form>
                <hr class="comment-separator"/>
            `;

            // Append the comment element to the comment list container
            commentList.appendChild(commentElement);
    	}
    
    	
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
            	//console.log(responseData);
				const {available, likeCount} = responseData;
				const {commentLikeCount} = likeCount;
    			
            	 const commentlikeCount = document.querySelector(`.likeCount[data-commentid="\${commentId}"]`);
            	 const like = document.querySelector(`.commentLike[data-commentid="\${commentId}"]`);
				if(available) {
	            	like.src = "${pageContext.request.contextPath}/resources/images/like.png";
	            	commentlikeCount.innerHTML = `\${commentLikeCount}`;
	            }
	            else {
	            	like.src = "${pageContext.request.contextPath}/resources/images/fullLike.png";
	            	commentlikeCount.innerHTML = `\${commentLikeCount}`;
	            }
            }
		});
        
        
        
    }
});


//대댓글 입력창 추가
//document.querySelectorAll('.commentMenu li.childcomment').forEach((li) => {
//	li.addEventListener('click', (e)=>{   
	//	 const commentId = li.getAttribute('data-commentid');
	//        const commentElement = document.querySelector(`.parent[data-commentid="\${commentId}"]`); // 이 부분을 수정
	//        console.log(commentElement);
	//        if (commentElement) { // 존재하는 경우에만 작업 수행
	 //           const childCommentForm = commentElement.querySelectorAll('.writecomment');
	 //           console.log(childCommentForm);
	 //           childCommentForm.forEach(form => {
	  //              form.classList.toggle('active');
	 //           });
	  //      }
//});
//});

//익명 , 제출버튼에 관한 기능
let anonyCk = false;
document.querySelector('#commnetContainer').addEventListener('click', (event) => {
    const clickedElement = event.target;
    const value = clickedElement.getAttribute('data-value');
    
    const urlParams = new URLSearchParams(new URL(window.location.href).search);
    const postId = urlParams.get('id');
   // console.log("Event handler activated!"+value);
    if (clickedElement.classList.contains('anonym')) {
        clickedElement.classList.toggle('active');
        
        if (clickedElement.classList.contains('active')) {// 익명체크시 바뀌게
            clickedElement.style.backgroundImage = `url('${pageContext.request.contextPath}/resources/images/anonymouscheck.png')`;
            anonyCk= true;
        } else {
            clickedElement.style.backgroundImage = `url('${pageContext.request.contextPath}/resources/images/anonymous.png')`;
            anonyCk= false;
        }
    }
    if (clickedElement.classList.contains('submit')){// 제출버튼시
    	const parentCommentId = clickedElement.getAttribute('data-parentcommentid'); // 대댓글의 부모 댓글 ID
    	const commentContentInput = clickedElement.closest('.writecomment').querySelector('input[name="text"]');
    	if(value==1){//댓글
    		 
    		 const postData = {
    	                postId: postId,
    	                boardId: ${board.boardId},
    	                commentContent : document.querySelector("#commentText").value,
    	                anonymousCheck: anonyCk,
    	                commentRef: null
    	            };
    		 submitComment(postData);
    	 }else{
    		 //대댓글
    		 const reply = {
 	                postId: postId,
 	                boardId: ${board.boardId},
 	                commentContent : commentContentInput.value,
 	                anonymousCheck: anonyCk,
 	                commentRef: parentCommentId
 	            };
    		 submitComment(reply);
    	 }
    }
    if (clickedElement.classList.contains('childcomment')){
    	 const commentId = clickedElement.getAttribute('data-commentid');
	        const commentElement = document.querySelector(`.parent[data-commentid="\${commentId}"]`); // 이 부분을 수정
	        //console.log(commentElement);
	        if (commentElement) { // 존재하는 경우에만 작업 수행
	            const childCommentForm = commentElement.querySelectorAll('.writecomment');
	            //console.log(childCommentForm);
	            childCommentForm.forEach(form => {
	                form.classList.toggle('active');
	            });
	        }
    }
     
    
});

	// 댓글제출 
	//document.querySelectorAll('.option li.submit').forEach((li) => {
	//	li.addEventListener('click', (e)=>{
		
			
	
		//})
	//});
	
	
	
	</script>
	<script>
	
	// 해시태그 검색
	document.querySelectorAll('.tag').forEach((tag) => {
	    tag.addEventListener('click', (e) => {
	        const keyword = e.target.innerHTML.replace(/#/g, '');
			document.querySelector('.keyword').value = keyword;
			
			document.tagFrm.submit();
	    });
	});
	
	
	// 게시글 작성자 쪽지 보내기
	document.querySelector("#openMessageBtn").addEventListener("click", function(event) {
	
		 const openMessageBtn = document.getElementById("openMessageBtn");
		 const messageContainer = document.getElementById("messageContainer");
		 const closeMessageBtn = document.getElementById("closeMessageBtn");
		 const receiveId =document.getElementById("receiveMember");
		 const toInput = document.getElementById("toInput");
		 if(${postDetail.anonymousCheck ne '1'}){
		 	toInput.value = "${postDetail.memberId}";  
		 	receiveId.value = "${postDetail.memberId}";  
		 }
		 if(${postDetail.anonymousCheck eq '1'}){
		 	toInput.value = "익명";   
			receiveId.value = "${postDetail.memberId}";  
			 
		 }
		 openMessageBtn.addEventListener("click", function() {
		    messageContainer.style.display = "block";
		 });

		 closeMessageBtn.addEventListener("click", function() {
		     messageContainer.style.display = "none";
		 });
	});
	
	document.querySelector("#sendMessageBtn").addEventListener("click", function(event) {
		
		event.preventDefault();
		const sendId = document.getElementById("fromInput").value;
		const receiveId =document.getElementById("receiveMember").value;
		const messageContent =document.getElementById("messageContent").value;
		const toInput = document.getElementById("toInput").value;
		const token = document.tokenFrm._csrf.value;
		let anonymousCheck = 'n';
		
		console.log(receiveId);
		
		if(toInput == "익명"){
			anonymousCheck = 'y'
		}
		console.log(sendId, receiveId, messageContent);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/message/messageSend.do",
			data : {	sendId: sendId,
	            		receiveId: receiveId,
	            		messageContent: messageContent,
	            		anonymousCheck : anonymousCheck},
			headers: {
                "X-CSRF-TOKEN": token
            },
            method : "POST",
            dataType : "json",
            success(responseData) {
            	alert("쪽지전송이 완료되었습니다.");
            }
		});
		
		
	});
	</script>
	<%@ include file="/WEB-INF/views/common/rightSide.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>