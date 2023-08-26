<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>

li.vote commentvote{
padding-bottom:10px;}
div.child-comments{
    width: 95%;
    margin-left: 5%;
    margin-top: 1%;
}
article.child{
border: 1px solid #e2e2e3;
background-color: #e5e8eb66;

}
form.writecomment.child {
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
	marging-left: 0;
	font-size: 11px;
}

h3.medium {
	font-size: 15px;
}

time.medium {
	font-size: 12px;
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
	cursor: pointer;
	background-size: 11px 11px;
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

button.updateBtn, button.deleteBtn{
	border: none;
}

#openMessageBtn {
background-color: white; border: 0px;
color: black;
}

.message-content {
	border-radius: 20px;
}

#openMessageBtn:hover {
	cursor: pointer;
}

.anonymous{
	float: right;
	background-color: white;
	margin-right: 13px;
}
.anonymousImg{
	width: 59px;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
				  				<li style="margin-right: 5px;">
				  					<button type="button" class="updateBtn" onclick="showInputForm()"
				  						style="background: none;  color: black;  padding: 0;">
				  						수정 | 
				  					</button>
				  				<li class="deleteBtn" ><button type="button" class="deleteBtn"  
				  						style="background: none;  color: black;  padding: 0;">
				  						삭제
				  					</button></li>
				  			</c:if>
				  			
				  			<c:if test="${postDetail.memberId ne loginMember.username}">
					  			<li class="messagesend" style="margin-right: 5px;" id="openMessageBtn"  onclick="messageSend('${postDetail.memberId}', '${postDetail.anonymousCheck}')">쪽지 | </li>
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
	
	function showInputForm() {
		
		const updateBtn = document.querySelector(".updateBtn");
	    const articlesContainer = document.querySelector(".articles");
	    const detailArticle = document.querySelector(".article");
	    const commnetContainer = document.querySelector("#commnetContainer");
	    let formHtml = "";

	    if("${postDetail.boardId}" === "5"){
	    formHtml = `
	      <form:form 
	      	name="updateFrm" 
	      	class="hidden" 
	      	action="${pageContext.request.contextPath}/board/updatePost.do" 
	      	id="updateForm" 
	      	method="post" 
	      	style="height: 66%;"
      		enctype="multipart/form-data">
	      	<input type = "hidden" name="boardId" id="boardId" value="${postDetail.boardId}">
	      	<input type = "hidden" name="anonymousCheck" id="anonymousCheck" value="${postDetail.anonymousCheck}">
	      	<input type = "hidden" name="text" id="text" value="">
	      	<input type = "hidden" name="postId" id="postId" value="${postDetail.postId}">
	      	<input type = "hidden" name="grade" id="grade" >
	      	<p>
	      		<input name="title" autocomplete="off" placeholder="글 제목" class="title" id="title" value="${postDetail.title}">
	      	</p>
	      	<p>
	      		<select name="language" id="language">
					<option value="java">Java</option>	      			
					<option value="javascript">JavaScript</option>	      			
					<option value="html">Html</option>	      			
					<option value="sql">Sql</option>	      			
	      		</select>
	      	</p>
	        <p>
	        	<textarea id="batch_content" name="batch_content"></textarea>
	        </p>
	        <div>
	        	<label for="hashTag">해시태그</label><br>
	        	<input type="text" class="hashTag" placeholder="Enter로 해시태그를 등록해주세요"/>
	        	<div class="hashTag-container"></div>
	        </div>
	        <input class="file" type="file" name="file" multiple="multiple" style="margin-top: 2%;">
	        <button type="button" class="cancel" onclick="hideInputForm()" style="float: right;border-left: solid 3px white; background-color: #0ca5af; color: white;">취소</button>
        	<button type="submit" id="submitBtn" style="float: right; background-color: #c62917;" ><span class="material-symbols-outlined" style="color: white;" >edit</span></button>
        	<button type="button" class="anonymous">
        		<img class="anonymousImg" src="${pageContext.request.contextPath}/resources/images/anonymous.png">
        	</button>
	      </form:form>
	    `;
	    } else if("${postDetail.boardId}" === "2"){
	    	formHtml = `
		  	      <form:form 
		  	      	name="updateFrm" 
		  	      	class="hidden" 
		  	      	action="${pageContext.request.contextPath}/board/updatePost.do" 
		  	      	id="updateForm" 
		  	      	method="post" 
		  	      	style="height: 66%;"
		        		enctype="multipart/form-data">
		  	      	<input type = "hidden" name="boardId" id="boardId" value="${postDetail.boardId}">
		  	      	<input type = "hidden" name="anonymousCheck" id="anonymousCheck" value="${postDetail.anonymousCheck}">
		  	      	<input type = "hidden" name="postId" id="postId" value="${postDetail.postId}">
		  	      	<input type = "hidden" name="grade" id="grade" >
		  	      	<p>
		  	      		<input name="title" autocomplete="off" placeholder="글 제목" class="title" id="title" value="${postDetail.title}">
		  	      	</p>
		  	        <p>
		  	        	<textarea name="text" placeholder="KH소통할까?는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. 위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 

		  	        		아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다. 

		  	        		※ 정치·사회 관련 행위 금지 
		  	        		- 국가기관, 정치 관련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련한 행위 
		  	        		- 정책·외교 또는 정치·정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위 
		  	        		- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위 
		  	        		- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위 
		  	        		* 해당 게시물은 시사·이슈 게시판에만 작성 가능합니다. 

		  	        		※ 홍보 및 판매 관련 행위 금지 
		  	        		- 영리 여부와 관계 없이 사업체·기관·단체·개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위 
		  	        		- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭·단어 언급 행위 
		  	        		* 해당 게시물은 홍보게시판에만 작성 가능합니다. 

		  	        		※ 불법촬영물 유통 금지
		  	        		불법촬영물등을 게재할 경우 전기통신사업법에 따라 삭제 조치 및 서비스 이용이 영구적으로 제한될 수 있으며 관련 법률에 따라 처벌받을 수 있습니다. 

		  	        		※ 그 밖의 규칙 위반 
		  	        		- 타인의 권리를 침해하거나 불쾌감을 주는 행위 
		  	        		- 범죄, 불법 행위 등 법령을 위반하는 행위 
		  	        		- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위 
		  	        		- 음란물, 성적 수치심을 유발하는 행위 
		  	        		- 스포일러, 공포, 속임, 놀라게 하는 행위" class="smallplaceholder" id="text">${postDetail.content}</textarea>
		  	        </p>
		  	        	
		  	        <div>
		  	        	<label for="hashTag">해시태그</label><br>
		  	        	<input type="text" class="hashTag" placeholder="Enter로 해시태그를 등록해주세요"/>
		  	        	<div class="hashTag-container"></div>
		  	        </div>
		  	         
		  	        <button type="button" class="cancel" onclick="hideInputForm()" style="float: right;border-left: solid 3px white; background-color: #0ca5af; color: white;">취소</button>
		          	<button style="float: right; background-color: #c62917;" ><span class="material-symbols-outlined" style="color: white;">edit</span></button>
		          	<button type="button" class="buy" style="float: right; color: #0ca5af; font-size: 18px; font-weight: bold; background: none;">삽니다</button>
		        	<button type="button" class="sell" style="float: right; color: #c62917; font-size: 18px; font-weight: bold; background: none;">팝니다</button>
		          	<button type="button" class="anonymous">
		          		<img class="anonymousImg" src="${pageContext.request.contextPath}/resources/images/anonymous.png">
		          	</button>
		          	
		  	      </form:form>
		  	    `;
	    } else if("${postDetail.boardId}" === "3") {
	    	let _titleValue = "${postDetail.title}";
	    	let titleValue = _titleValue.replace(/\[.*?\]/g, "");
	    	formHtml = `
	  	      <form:form 
	  	      	name="updateFrm" 
	  	      	class="hidden" 
	  	      	action="${pageContext.request.contextPath}/board/updatePost.do" 
	  	      	id="updateForm" 
	  	      	method="post" 
	  	      	style="height: 71.2%;"
	        		enctype="multipart/form-data">
	  	      	<input type = "hidden" name="boardId" id="boardId" value="${postDetail.boardId}">
	  	      	<input type = "hidden" name="anonymousCheck" id="anonymousCheck" value="${postDetail.anonymousCheck}">
	  	      	<input type = "hidden" name="postId" id="postId" value="${postDetail.postId}">
	  	      	<input type = "hidden" name="grade" id="grade" value="★">
	  	      	<p>
	  	      		<input name="title" autocomplete="off" placeholder="글 제목" class="title" id="title" value="\${titleValue}">
	  	      	</p>
	  	        <p>
		      		<select name="grade_" id="grade_" style="height: 37px; font-size: 30px; color: #dddd3c;;">
						<option value="★">★</option>	      			
						<option value="★ ★">★ ★</option>	      			
						<option value="★ ★ ★">★ ★ ★</option>	      			
						<option value="★ ★ ★ ★">★ ★ ★ ★</option>	      			
						<option value="★ ★ ★ ★ ★">★ ★ ★ ★ ★</option>	      			
		      		</select>
	    		</p>
	  	        <p>
	  	        	<textarea name="text" placeholder="KH소통할까?는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. 위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 

	  	        		아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다. 

	  	        		※ 정치·사회 관련 행위 금지 
	  	        		- 국가기관, 정치 관련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련한 행위 
	  	        		- 정책·외교 또는 정치·정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위 
	  	        		- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위 
	  	        		- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위 
	  	        		* 해당 게시물은 시사·이슈 게시판에만 작성 가능합니다. 

	  	        		※ 홍보 및 판매 관련 행위 금지 
	  	        		- 영리 여부와 관계 없이 사업체·기관·단체·개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위 
	  	        		- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭·단어 언급 행위 
	  	        		* 해당 게시물은 홍보게시판에만 작성 가능합니다. 

	  	        		※ 불법촬영물 유통 금지
	  	        		불법촬영물등을 게재할 경우 전기통신사업법에 따라 삭제 조치 및 서비스 이용이 영구적으로 제한될 수 있으며 관련 법률에 따라 처벌받을 수 있습니다. 

	  	        		※ 그 밖의 규칙 위반 
	  	        		- 타인의 권리를 침해하거나 불쾌감을 주는 행위 
	  	        		- 범죄, 불법 행위 등 법령을 위반하는 행위 
	  	        		- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위 
	  	        		- 음란물, 성적 수치심을 유발하는 행위 
	  	        		- 스포일러, 공포, 속임, 놀라게 하는 행위" class="smallplaceholder" id="text">${postDetail.content}</textarea>
	  	        </p>
	  	        	
	  	        <div>
	  	        	<label for="hashTag">해시태그</label><br>
	  	        	<input type="text" class="hashTag" placeholder="Enter로 해시태그를 등록해주세요"/>
	  	        	<div class="hashTag-container"></div>
	  	        </div>
	  	        <input class="file" type="file" name="file" multiple="multiple" style="margin-top: 2%;" >
	  	        <button type="button" class="cancel" onclick="hideInputForm()" style="float: right;border-left: solid 3px white; background-color: #0ca5af; color: white;">취소</button>
	  	      	<button type="submit" id="submitBtn" style="float: right; background-color: #c62917;" ><span class="material-symbols-outlined" style="color: white;" >edit</span></button>
	          	<button type="button" class="anonymous">
	          		<img class="anonymousImg" src="${pageContext.request.contextPath}/resources/images/anonymous.png">
	          	</button>
	          	
	  	      </form:form>
	  	    `;
	    } else {
	    	formHtml = `
		  	      <form:form 
		  	      	name="updateFrm" 
		  	      	class="hidden" 
		  	      	action="${pageContext.request.contextPath}/board/updatePost.do" 
		  	      	id="updateForm" 
		  	      	method="post" 
		  	      	style="height: 66%;"
		        		enctype="multipart/form-data">
		  	      	<input type = "hidden" name="boardId" id="boardId" value="${postDetail.boardId}">
		  	      	<input type = "hidden" name="anonymousCheck" id="anonymousCheck" value="${postDetail.anonymousCheck}">
		  	      	<input type = "hidden" name="postId" id="postId" value="${postDetail.postId}">
		  	      	<input type = "hidden" name="grade" id="grade" >
		  	      	<p>
		  	      		<input name="title" autocomplete="off" placeholder="글 제목" class="title" id="title" value="${postDetail.title}">
		  	      	</p>
		  	        <p>
		  	        	<textarea name="text" placeholder="KH소통할까?는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. 위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 

		  	        		아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다. 

		  	        		※ 정치·사회 관련 행위 금지 
		  	        		- 국가기관, 정치 관련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련한 행위 
		  	        		- 정책·외교 또는 정치·정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위 
		  	        		- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위 
		  	        		- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위 
		  	        		* 해당 게시물은 시사·이슈 게시판에만 작성 가능합니다. 

		  	        		※ 홍보 및 판매 관련 행위 금지 
		  	        		- 영리 여부와 관계 없이 사업체·기관·단체·개인에게 직간접적으로 영향을 줄 수 있는 게시물 작성 행위 
		  	        		- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭·단어 언급 행위 
		  	        		* 해당 게시물은 홍보게시판에만 작성 가능합니다. 

		  	        		※ 불법촬영물 유통 금지
		  	        		불법촬영물등을 게재할 경우 전기통신사업법에 따라 삭제 조치 및 서비스 이용이 영구적으로 제한될 수 있으며 관련 법률에 따라 처벌받을 수 있습니다. 

		  	        		※ 그 밖의 규칙 위반 
		  	        		- 타인의 권리를 침해하거나 불쾌감을 주는 행위 
		  	        		- 범죄, 불법 행위 등 법령을 위반하는 행위 
		  	        		- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위 
		  	        		- 음란물, 성적 수치심을 유발하는 행위 
		  	        		- 스포일러, 공포, 속임, 놀라게 하는 행위" class="smallplaceholder" id="text">${postDetail.content}</textarea>
		  	        </p>
		  	        	
		  	        <div>
		  	        	<label for="hashTag">해시태그</label><br>
		  	        	<input type="text" class="hashTag" placeholder="Enter로 해시태그를 등록해주세요"/>
		  	        	<div class="hashTag-container"></div>
		  	        </div>
		  	        <input class="file" type="file" name="file" multiple="multiple" style="margin-top: 2%;" >
		  	        
		  	      	
		  	        <button type="button" class="cancel" onclick="hideInputForm()" style="float: right;border-left: solid 3px white; background-color: #0ca5af; color: white;">취소</button>
		          	<button style="float: right; background-color: #c62917;" ><span class="material-symbols-outlined" style="color: white;">edit</span></button>
		          	<button type="button" class="anonymous">
		          		<img class="anonymousImg" src="${pageContext.request.contextPath}/resources/images/anonymous.png">
		          	</button>
		          	
		  	      </form:form>
		  	    `;
	    }
	    
	   
	    articlesContainer.insertAdjacentHTML("afterbegin", formHtml);
	    const updateForm = document.getElementById("updateForm");
	    const titleInput = document.getElementById("title");
	    const contentTextarea = document.getElementById("text");
	    

	    detailArticle.style.display = "none";
	    commnetContainer.style.display = "none";
	    updateForm.classList.remove("hidden");
	    
		// 에디터 설정 
	    var textarea = document.querySelector('#batch_content');
	    var language = document.querySelector('#language');
	    
	    
	    if(textarea !== null && language !== null ){
	    	var editor = CodeMirror.fromTextArea(textarea, {
		        lineNumbers: true,  //왼쪽 라인넘버 표기
		        lineWrapping: true, //줄바꿈. 음.. break-word;
		        mode: 'text/x-java', //모드는 java 모드
		        theme: "dracula",   //테마는 맘에드는 걸로.
		        val: textarea.value
		    });
		    
	    editor.setValue("${postDetail.content}");
		    language.addEventListener('change', (e) => {
		        var lang = e.target.value;
		        if(lang === "javascript" || lang === "html"){
		        	editor.setOption('mode', `text/\${lang}`);
		        }else {
		        	editor.setOption('mode', `text/x-\${lang}`);
		        }
		    });
	    }
	    
	 	// 평점
	    const grade_ = document.querySelector("#grade_");
	    const grade = document.querySelector("#grade");
	    
	    if(grade_ !== null && grade !== null){
	    	grade_.addEventListener('change', (e) => {
	 	       grade.value = grade_.value;
	 	       console.log(grade);
	 	    });
	    }
	    
	 	// 익명체크
		let anonymousButton = document.querySelector(".anonymous");  
		let anonymousImg = document.querySelector(".anonymousImg");
		let anonymousCheck = document.querySelector("#anonymousCheck");
		
		if(${postDetail.anonymousCheck}){
			anonymousImg.src = '${pageContext.request.contextPath}/resources/images/anonymouscheck.png';
		} else {
			anonymousImg.src = '${pageContext.request.contextPath}/resources/images/anonymous.png';
		}
		
		anonymousButton.onclick = (()=>{
		    if (anonymousImg.src.endsWith('/anonymous.png')) {
		    	anonymousImg.src = '${pageContext.request.contextPath}/resources/images/anonymouscheck.png';
		    	anonymousCheck.value = "true";
		    	console.log("anonymousCheck", anonymousCheck.value);
		        
		    } else {
		    	anonymousImg.src = '${pageContext.request.contextPath}/resources/images/anonymous.png';
		    	anonymousCheck.value = "false";
		    	console.log("anonymousCheck", anonymousCheck.value);
		    }
		});
		
		
		
	    
	 	// 해시태그
   		const hashTag = document.querySelector('.hashTag');
	    const hashTagContainer = document.querySelector('.hashTag-container');
	    
	    let hashTags = [];
	    
	    hashTag.addEventListener('keydown', (e) => {
	    	if(e.key === 'Enter') {
	    		e.preventDefault();
	    		const tag = hashTag.value.trim();
	    		
	    		if (tag.length > 5) {
	    			alert('다섯글자까지만 가능합니다');
	    			return; 
	    		}
	    		if(hashTags.length >= 7) {
	    			alert('해시태그는 최대 7개까지 가능합니다.');
	    			return;
	    		}
	    		addHashTag(tag);
	    		hashTag.value = "";
	    	}
	    });
	    
	    function addHashTag(tag) {
	        tag = tag.replace(/[\s]/g, '').trim();
	        console.log(tag);
	        if (!hashTags.includes(tag)) {
	            const tagContainer = document.createElement("div");
	            tagContainer.className = "tag-container";

	            const tagElement = document.createElement("input");
	            tagElement.value = " #" + tag + " ";
	            tagElement.setAttribute("readonly", true);
	            tagContainer.appendChild(tagElement);

	            const removeButton = document.createElement("i");
	            removeButton.style.cursor = "pointer";
	            removeButton.innerHTML = "x";
	            removeButton.addEventListener('click', () => {
	                hashTagContainer.removeChild(tagContainer);
	                hashTags = hashTags.filter((hashTags) => hashTags !== tag);
	            });
	            tagContainer.appendChild(removeButton);

	            hashTags.push(tag);
	            hashTagContainer.appendChild(tagContainer);

	            tagElement.setAttribute("name", "_tags");
	            tagElement.setAttribute("value", "#" + tag);
	        }
	    }
	    
	 	// 삽니다, 팝니다 태그추가
	    const buyButton = document.querySelector(".buy");
	    const sellButton = document.querySelector(".sell");
	    const title = document.querySelector("#title");
	    
	    if(buyButton !== null && sellButton !== null){
	    	buyButton.onclick = (() => {
		    	title.value = "[삽니다!]"
		    	const tagContainer = document.createElement("div");
	            tagContainer.className = "tag-container";

	            const tagElement = document.createElement("input");
	            tagElement.value = " #삽니다 ";
	            tagElement.setAttribute("readonly", true);
	            tagContainer.appendChild(tagElement);

	            const removeButton = document.createElement("i");
	            removeButton.style.cursor = "pointer";
	            removeButton.innerHTML = "x";
	            removeButton.addEventListener('click', () => {
	                hashTagContainer.removeChild(tagContainer);
	                hashTags = hashTags.filter((hashTags) => hashTags !== "#삽니다");
		    	});
	            
	            tagContainer.appendChild(removeButton);

	            hashTags.push("삽니다");
	            hashTagContainer.appendChild(tagContainer);

	            tagElement.setAttribute("name", "_tags");
	            tagElement.setAttribute("value", "#삽니다");
		    });
		    
		    sellButton.onclick = (() => {
		    	title.value = "[팝니다!]"
		    	const tagContainer = document.createElement("div");
	            tagContainer.className = "tag-container";

	            const tagElement = document.createElement("input");
	            tagElement.value = " #팝니다 ";
	            tagElement.setAttribute("readonly", true);
	            tagContainer.appendChild(tagElement);

	            const removeButton = document.createElement("i");
	            removeButton.style.cursor = "pointer";
	            removeButton.innerHTML = "x";
	            removeButton.addEventListener('click', () => {
	                hashTagContainer.removeChild(tagContainer);
	                hashTags = hashTags.filter((hashTags) => hashTags !== "#팝니다");
		    	});
	            
	            tagContainer.appendChild(removeButton);

	            hashTags.push("팝니다");
	            hashTagContainer.appendChild(tagContainer);

	            tagElement.setAttribute("name", "_tags");
	            tagElement.setAttribute("value", "#팝니다");
		    });
	    }
	    
	    
	    
	    const submitBtn = document.querySelector("#submitBtn");
	    const text = document.querySelector("#text");
	    
	    if(submitBtn !== null && text !== null){
	    	submitBtn.addEventListener('click', (e) => {
			    var userInput = editor.getValue();
			    text.value = userInput;
		    });
	    }
	    
	    
	 }
	
	// 폼 숨기기
	function hideInputForm() {
	  const detailArticle = document.querySelector(".article");
	  const commnetContainer = document.querySelector("#commnetContainer");
	  const updateForm = document.getElementById("updateForm");
	
	  detailArticle.style.display = "block";
	  commnetContainer.style.display = "block";
	  updateForm.remove();
	}
	
	
	// onload 됐을때 즐겨찾기/공감 했는지
	document.addEventListener('DOMContentLoaded', () => {
		isFovorite(); // 즐겨찾기했는지
		isLike(); // 공감했는지
	});
	  
    // 내가 즐겨찾기한 게시판인지 확인
	function isFovorite() {
    	console.log(document.querySelector('.bi').dataset.value);
    	$.ajax({
    		url : "${pageContext.request.contextPath}/board/favorite.do",
    		data : {
                _boardId : document.querySelector('.bi').dataset.value
            },
    		method : "GET",
    		dataType : "json",
    		success(responseData) {
    			const {available} = responseData;
    			
    			const star = document.querySelector('.bi');
    			if(available) {
                	star.classList.remove('bi-star');
                	star.classList.add('bi-star-fill');
                }
                else {
                	star.classList.add('bi-star');
                	star.classList.remove('bi-star-fill');
                }
    		}
    	});
	}
    
   	// 공감(좋아요) 했는지 확인
    function isLike() {
    	document.querySelectorAll('.like').forEach((e) => {
	    	console.log(e.dataset.value);
	   		$.ajax({
	   			url : "${pageContext.request.contextPath}/board/postLike.do",
	   			data : {
	   				_postId : e.dataset.value
	   			},
	   			method : "GET",
	               dataType : "json",
	               success(responseData) {
	       			const {available, likeCount} = responseData;
	       			const {postLikeCount} = likeCount;
	       			
	       			const like = document.querySelectorAll('.like');
	       			const vote = document.querySelectorAll('.vote');
	       			for(let i=0; i<like.length; i++) {
	       				if(like[i].dataset.value == e.dataset.value) {
			       			if(available) {
			                   	like[i].src = "${pageContext.request.contextPath}/resources/images/fullLike.png";
			                   	vote[i].innerHTML = `\${postLikeCount}`;
			                   }
			                   else {
			                   	like[i].src = "${pageContext.request.contextPath}/resources/images/like.png";
			                   	vote[i].innerHTML = `\${postLikeCount}`;
			                   }
	       				}
	       			}
	               }
	   		});
    	});
    }
   	
    // 즐겨찾기 누르기
    document.querySelector('.bi').onclick = (e) => {
    	console.log(e.target.dataset.value);
    	
    	const token = document.tokenFrm._csrf.value;
    	
        $.ajax({
            url : "${pageContext.request.contextPath}/board/favorite.do",
            data : {
                _boardId : e.target.dataset.value
            },
            headers: {
                "X-CSRF-TOKEN": token
            },
            method : "POST",
            dataType : "json",
            success(responseData) {
                console.log(responseData);
                const {available} = responseData;
                
                const star = document.querySelector('.bi');
                if(available) {
                	star.classList.add('bi-star');
                	star.classList.remove('bi-star-fill');
                }
                else {
                	star.classList.remove('bi-star');
                	star.classList.add('bi-star-fill');
                }
            }
        });
    };
	
	
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
		likeComment()
		$('.comments').on('keypress', '.text', function(e) {
		    if (e.keyCode === 13) {
		        e.preventDefault();
		        // 대댓글 전송 버튼 클릭 이벤트 호출
		        $(this).siblings('.option').find('.submit').click(); // 적절한 선택자로 수정
		    }
		});
		
		
	});
	
	//공감(좋아요) 했는지 확인
	function isLike() {
		//console.log(document.querySelector('.like').dataset.value);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/board/postLike.do",
			data : {
				_postId : document.querySelector('.like').dataset.value
			},
			method : "GET",
	        dataType : "json",
	        success(responseData) {
	        	
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
	            		//console.log(responseData);
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
	    		renderComments(data);
	    		loadCommentLike();
	    		
	    		
	    	}
	    });
	}	
	//댓글불러온걸토대로 댓글랜더.
	function renderComments(comments) {
		  const commentList = document.querySelector('#commentList');
		    commentList.innerHTML = '';

		    // Loop through each comment and create a DOM element for it
		    comments.forEach(comment => {
		    	const commentCreatedAt = comment.commentCreatedAt;
		    	const formattedDate = commentCreatedAt.replace("T", " ");
		    	const commentCreateds = formattedDate.slice(0, -3);
		    	const commentCreated = commentCreateds.substring(2);
		    	if(comment.commentLevel ===1){
		    		const commentElement = document.createElement('article');
		 	        commentElement.className = 'parent';
		 	        commentElement.setAttribute('data-commentid', comment.commentId);
		 	       

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
		             <time class="medium">\${commentCreated}</time>	
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
		            
		 	        `;
		 	const separator = document.createElement('hr');
	        separator.className = 'comment-separator';
		 	        
	        const childComments = comments.filter(childComment => childComment.commentRef === comment.commentId);
	        renderChildComments(childComments, commentElement);
	        commentElement.appendChild(separator);
	        commentList.appendChild(commentElement);
		    };
		})
	}	

	function renderChildComments(childComments, parentCommentElement) {
	    const childCommentsContainer = document.createElement('div');
	    childCommentsContainer.className = 'child-comments';
	    
	    childComments.forEach(childComment => {
	    	const commentCreatedAt = childComment.commentCreatedAt;
	    	const formattedDate = commentCreatedAt.replace("T", " ");
	    	const commentCreateds = formattedDate.slice(0, -3);
	    	const commentCreated = commentCreateds.substring(2);
	    	
	        const childCommentElement = document.createElement('article');
	        childCommentElement.className = 'child';
	        childCommentElement.setAttribute('data-commentid', childComment.commentId);
	        
	        childCommentElement.innerHTML = `
	 	        <h3 class="medium" style="display: flex; align-items: center; justify-content: space-between;">
	 	            <div style="display: flex; align-items: center;">
	 	                <img src="https://cf-fpi.everytime.kr/0.png" class="picturesmall">
	 	                <span>\${childComment.anonymousCheck ? '익명' : childComment.memberId}</span>
	 	            </div>
	 	        	<ul class="commentMenu">
	                 	<li class="commentvote" data-commentid="\${childComment.commentId}">공감</li>
	                 	<li class="messagesend">쪽지</li>
	                 	<li class="abuse">신고</li>
	             	</ul>
	             </h3>
	             <hr>
	             <p class="large" style="padding-left: 10px;padding-bottom: 5px;">\${childComment.commentContent}</p>
	             <ul class="sstatus commentvotestatus">
	             <li class="vote commentvote" >
	                 <time class="medium">\${commentCreated}</time>
	                 <img class="commentLike" data-commentid="\${childComment.commentId}" src="${pageContext.request.contextPath}/resources/images/like.png">
	                 <span class="likeCount" data-commentid="\${childComment.commentId}">\${childComment.likeCount}</span>
	             </li>
	            
	         </ul>
	            
	 	        `;
	       

	        childCommentsContainer.appendChild(childCommentElement);
	    });

	    parentCommentElement.appendChild(childCommentsContainer);
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
        	//console.log(responseData);
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


//익명 , 댓글제출버튼에 관한 기능
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

function likeComment(){
    document.querySelector('#commentList').addEventListener('click', (event) => {
        const clickedElement = event.target;
        const token = document.commentLikeFrm._csrf.value;
        if (clickedElement.classList.contains('commentvote')) {
            const commentId = clickedElement.getAttribute('data-commentid');
          
            $.ajax({
                url : "${pageContext.request.contextPath}/board/commentLike.do",
                data : {
                    commentId : commentId
                },
                headers: {
                    "X-CSRF-TOKEN": token
                },
                method : "POST",
                dataType : "json",
                success(responseData) {
                    const {available, likeCount} = responseData;
                    console.log(responseData);
                    console.log(likeCount);
                    const {commentLikeCount} = likeCount;
                    console.log(commentId);
                    const commentlikeCountElements = document.querySelectorAll(`.likeCount[data-commentid="\${commentId}"]`);
                    const likeElements = document.querySelectorAll(`.commentLike[data-commentid="\${commentId}"]`);
                    if (available) {
                        likeElements.forEach(like => {
                            like.src = '${pageContext.request.contextPath}/resources/images/like.png';
                        });
                    } else {
                        likeElements.forEach(like => {
                            like.src = '${pageContext.request.contextPath}/resources/images/fullLike.png';
                        });
                    }
                    commentlikeCountElements.forEach(element => {
                        element.innerHTML = commentLikeCount;
                    });
                }
            });
        }
    });
}

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
	
	

	// 쪽지 보내기
	document.querySelector("#sendMessageBtn").addEventListener("click", function(event) {
		
		event.preventDefault();
		const sendId = document.getElementById("fromInput").value;
		const receiveId =document.getElementById("receiveMember").value;
		const messageContent =document.getElementById("messageContent").value;
		const toInput = document.getElementById("toInput").value;
		const token = document.tokenFrm._csrf.value;
		const closeMessageBtn = document.getElementById("closeMessageBtn");
		let anonymousCheck = 'n';
		
		if(toInput == "익명"){
			anonymousCheck = 'y'
		}
		
		
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
            	messageContainer.style.display = "none";
            }
		});
		
		
	});
	
	const messageSend =(messageReceiveId, anonymousCheck) => {
		 const messageContainer = document.getElementById("messageContainer");
		 messageContainer.style.display = "block";
		 const closeMessageBtn = document.getElementById("closeMessageBtn");
		 const receiveId =document.getElementById("receiveMember");
		 const toInput = document.getElementById("toInput");
		 receiveId.value = messageReceiveId;  
		 
		 console.log(messageReceiveId, anonymousCheck);
		 
		 if(anonymousCheck != '1' || anonymousCheck == 'false'){
		 	toInput.value = messageReceiveId;  
		 }
		 if(anonymousCheck == '1' || anonymousCheck == 'true'){
		 	toInput.value = "익명";   
		 }
		 closeMessageBtn.addEventListener("click", function() {
		     messageContainer.style.display = "none";
		 });
		
	};
	
	</script>
	<%@ include file="/WEB-INF/views/common/rightSide.jsp"%>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>