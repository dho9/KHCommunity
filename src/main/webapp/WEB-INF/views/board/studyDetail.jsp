<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%-- 글목록 아이콘 --%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 24
}
.listCallBack{
    display: block;
    margin-top: 5px;
    height: 35px;
    padding-right: 7px;
    line-height: 35px;
    border: 1px solid #c62917;
    border-radius: 3px;
    color: #c62917;
    font-size: 14px;
    font-weight: bold;
    background-repeat: no-repeat;
    background-position: 10px center;
    background-size: 10px 10px;
    cursor: pointer;
    background-color: white;
}
.author{
font-size:10px;}
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
	text-align: center;
	position: relative;
}

.close {
	position: absolute;
	top: 0;
	right: 10px;
	font-size: 20px;
	font-weight: bold;
	cursor: pointer;
}

textarea {
	width: 100%;
}

li.vote commentvote {
	padding-bottom: 10px;
}

div.child-comments {
	width: 95%;
	margin-left: 5%;
	margin-top: 1%;
}

article.child {
    border: 1px solid #e2e2e3;
    background-color: #e5e8eb66;
    border-radius: 10px;
    margin-top: 5px;
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
	background-image:
		url('${pageContext.request.contextPath}/resources/images/댓글제출.png');
	background-color: #c62917;
	border-radius: 10px;
}

#commnetContainer {
    margin-top: 7px;
    display: block;
    padding: 2px;
    border: solid 0.7px #001fff47;
    border-radius: 10px;
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
    background-color: rgba(0, 0, 0, 0.5);
}
#sendMessageBtn {
    padding: 10px 20px;
    background-color: #007BFF;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    display: inline-block;
    margin: 7% 40% 6% 35.3%;
}
#messageContainer button:hover {
    background-color: #0056b3;
}

.msgModalInput,
#messageContent{
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
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
    font-size: 50px;
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

.message-content {
   border-radius: 20px;
}

#openMessageBtn:hover {
   cursor: pointer;
}
.anonymous {
	float: right;
	background-color: white;
	margin-right: 13px;
}

.anonymousImg {
	width: 59px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<div id="container" class="community" style="margin-top: 25px;">
	<sec:authentication property="principal" var="loginMember" />
	<div class="wrap title">
		<h1><a>${board.boardName}</a></h1>

	</div>
	<div class="wrap articles">
		<c:if test="${empty postDetail}">
			<article class="dialog">조회된 게시글이 존재하지 않습니다.</article>
		</c:if>
		<c:if test="${not empty postDetail}">
			<article>

				<a class="article"> <img class="picture large"
					src="${pageContext.request.contextPath}/resources/images/usericon.png" />
					<div class="profile">
							<h3 class="large" style="font-size: 13px" id="postCreateId">${postDetail.memberId}</h3>
						<time class="large" style="font-size: 12px">
							<fmt:parseDate value="${postDetail.postCreatedAt}"
								pattern="yyyy-MM-dd'T'HH:mm" var="createdAt" />
							<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd HH:mm" />
						</time>
					</div>
					<ul class="status">
						<c:if test="${postDetail.memberId eq loginMember.username}">
							<li style="margin-right: 5px;">
								<button type="button" class="updateBtn"
									onclick="showInputForm()"
									style="background: none; color: black; padding: 0;">
									수정 |</button>
							<li class="deleteBtn"><button type="button"
									class="deleteBtn"
									style="background: none; color: black; padding: 0;">
									삭제</button></li>
						</c:if>

						<c:if test="${postDetail.memberId ne loginMember.username}">
							<li class="messagesend" style="margin-right: 5px;"
								id="openMessageBtn"
								onclick="messageSend('${postDetail.memberId}', '${postDetail.anonymousCheck}')">쪽지
								|</li>
							<li class="abuse">신고</li>
						</c:if>
					</ul>
					<hr>
					<h1 class="large" style="font-size: 20px;">${postDetail.title}</h2>
						<br> 
						<%--
						<input type="hidden" name="content" id="content"
							value="${postDetail.content}">
						 --%>
						<c:if test="${postAttach != null }">
							<c:if test="${postDetail.boardId eq '5'}">
								<img
									src="${pageContext.request.contextPath }/resources/images/upload/${postAttach.postRenamedFilename}"
									style="width: 50%;">
								<p class="large">
									<textarea id="batch_content" name="batch_content"></textarea>

								</p>
								<br>
							</c:if>
							<c:if test="${postDetail.boardId ne '5'}">
								<img
									src="${pageContext.request.contextPath }/resources/images/upload/${postAttach.postRenamedFilename}"
									style="width: 50%;">
								<p class="large">${postDetail.content}</p>
								<br>
							</c:if>

						</c:if>
						<c:if test="${postAttach == null }">
							<c:if test="${postDetail.boardId eq '5'}">
								<p class="large">
									<textarea id="batch_content" name="batch_content"></textarea>
								</p>
								<br>
							</c:if>
							<c:if test="${postDetail.boardId ne '5'}">
								<p class="large">${postDetail.content}</p>
								<br>
							</c:if>

						</c:if>


						<c:forEach items="${postDetail.tag}" var="tag">
							<span class="tag">${tag}</span>
						</c:forEach>
						<ul class="status">
							<%-- 좋아요 버튼 --%>
							<li><img class="like" data-value="${postDetail.postId}"
								style="cursor: pointer;"
								src="${pageContext.request.contextPath}/resources/images/like.png" /></li>
							<li class="vote" data-value="${postDetail.postId}"
								style="margin-top: 5px; cursor: pointer;">${postDetail.postLike}</li>
							<li><img
								src="${pageContext.request.contextPath}/resources/images/comment.png" /></li>
							<li class="comment" style="margin-top: 5px;">${postDetail.commentCount}</li>
						</ul>
						<hr></a>
			</article>
		</c:if>
		<button class="listCallBack"  onClick="location.href='${pageContext.request.contextPath}/board/${board.boardLink}.do'">
			<span class="material-symbols-outlined" style="float: left; display: inline-block; margin-top: 5px; margin-right: 7px; margin-left: 4px;">list</span>글 목록
		</button>
		
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
	<form:form
		action="${pageContext.request.contextPath}/board/boardDelete.do"
		name="boardDeleteFrm" method="post">
		<input type="hidden" name="deletePostId" id="deletePostId"
			value="${postDetail.postId}" />
		<input type="hidden" name="postBoardLink" id="postBoardLink"
			value="${board.boardLink}" />
	</form:form>




	<!-- 쪽지 모달 -->

	<div id="messageContainer" class="modal">
		<div class="message-content">
			<form:form id="messageFrm"
				action="${pageContext.request.contextPath}/message/messageSend.do">
				<div>
					<span class="close-class" id="closeMessageBtn">&times;</span> <br/>
					<span><i class="bi bi-send"></i>&nbsp;쪽지 보내기</span> 
				</div>
				<br/>
				<sec:authentication property="principal" var="loginMember" />

				<script>
				 const memberId = '<sec:authentication property="principal.username"/>';
				  console.log(memberId);
				</script>
				<div class="mb-3">
                 <label for="toInput" class="form-label">To</label>
                 <input type="text" id="toInput" value="" class="msgModalInput" readonly>
                 <input type="hidden" id="receiveMember" value="" readonly>
              </div>
              <br/><br/>
              <div class="mb-3">
                   <label for="fromInput" class="form-label">From</label></br>
                    <input type="text" class="form-control msgModalInput" id="fromInput" value="${loginMember.memberId}" readonly>
              </div>
              <br/><br/>
              <div class="mb-3">
                   <label for="contentInput" class="form-label">Content</label>
                   <textarea id="messageContent" rows="3" placeholder="메시지 내용 입력"></textarea>
              </div>
               <button id="sendMessageBtn">메시지 전송</button>
           </form:form>

		</div>
	</div>

	<%-- 신고 모달 --%>
	<div id="reportModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2 style="margin-bottom: 10px">신고하기</h2>
			<form:form id="reportForm" name="reportForm"
				action="${pageContext.request.contextPath}/board/postReport.do"
				method="post">
				
				<input type="hidden" name="reportPostId" id="reportPostId"
					value="${postDetail.postId}">
					
				<input type="hidden" name="reportCommentId" id="reportCommentId">
				
				<input type="hidden" name="reporterId" id="reporterId"
					value="${loginMember.username}">
					
				<input type="hidden" name="attackerId" id="attackerId"
					value="${postDetail.memberId}">
					
				<input type="hidden" id="reportType" name="reportType" value="">
				
				<label for="reportType">신고유형:</label>
				<select name="reportType_" id="reportType_">
					<option value="게시판 성격에 부적절함">게시판 성격에 부적절함</option>
					<option value="욕설/비하">욕설/비하</option>
					<option value="음란물/불건전한 만남 및 대화">음란물/불건전한 만남 및 대화</option>
					<option value="상업적 광고 및 판매">상업적 광고 및 판매</option>
					<option value="유출/사칭/사기">유출/사칭/사기</option>
					<option value="낚시/놀람/도배">낚시/놀람/도배</option>
					<option value="정당/정치인 비하 및 선거운동">정당/정치인 비하 및 선거운동</option>
				</select>
				<textarea id="reportContent" name="reportContent" rows="4" style = "height: 30%; width: 100%; margin-top: 15px; resize:none" placeholder="신고사유를 입력하세요~" required></textarea>
				<button type="submit" style = "margin-top: 19px; width: 75px; height: 40px; background: none; border: solid 1px red; border-radius: 10px; font-weight: bold; color: red;">신고 제출</button>
			</form:form>
		</div>
	</div>

	<script>
    
	// 모달 요소와 모달을 트리거하는 버튼을 가져옵니다.
	const modal = document.getElementById("reportModal");
	const abuseButton = document.querySelector(".abuse");

	// 모달 내부의 닫기 버튼 요소를 가져옵니다.
	const closeBtn = modal.querySelector(".close");

	// "신고" 버튼 클릭 시 모달을 보이도록 설정합니다.
	if(abuseButton !== null){
		abuseButton.addEventListener("click", () => {
			  modal.style.display = "block";
			});
	}

	// 닫기 버튼 클릭 시 모달을 닫습니다.
	closeBtn.addEventListener("click", () => {
	  modal.style.display = "none";
	});

	// 모달 외부를 클릭하면 모달을 닫습니다.
	window.addEventListener("click", (event) => {
	  if (event.target === modal) {
	    modal.style.display = "none";
	  }
	});
	
	const reportType_ = document.querySelector("#reportType_");
	const reportType = document.querySelector("#reportType");
	if(reportType_ !== null && reportType !== null){
		reportType_.addEventListener('change', (e) => {
			reportType.value = reportType_.value;
		});
	}
    // 신고 제출 후 모달을 닫습니다.
    modal.style.display = "none";
	
	
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
		  	        <input class=".custom-file-button" type="file" name="file" multiple="multiple" style="margin-top: 2%;" >
		  	        
		  	      	
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
		// isFovorite(); // 즐겨찾기했는지
		isLike(); // 공감했는지
	});
	  
    
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
			console.log('!!!!!!!!!!!!!');
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
	    		console.log(data);
	    		renderComments(data);
	    		loadCommentLike();
	    		
	    		
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