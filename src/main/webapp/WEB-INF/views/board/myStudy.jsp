<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	
<!-- bootstrap css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<style>
@font-face {font-family: 'GmarketSansMedium'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');font-weight: normal;font-style: normal;}
#top-container{width: 100%; height: 180px; background-color: royalblue; z-index: -10;}
#side-container{background-color: white; width:250px;  margin: -6% 1% 0 20%; display: inline-block; border-radius: 20px; float: left;}
#main-container{background-color: white; width:830px;  margin: -6% 20% 0 0%; display: inline-block; border-radius: 20px; float: right; box-shadow: 1px 1px 3px #cecece;}
#profile-container{border-bottom: 1.5px solid #606060; width: 150px; height:150px; background-color: #e2e2e2; margin:10% auto; border: 0.5px solid #cecece; text-align: center; border-radius: 50%;}
#profile{width: 70%; vertical-align: middle; display: inline-block; margin-top: 15%; opacity: 0.47;}
#profileName{font-family: 'GmarketSansMedium'; font-size: 30px; font-weight: 500; margin-top: 10px; margin-bottom:10px; color: #4d4d4d;}
#logoutBtn{font-family: 'GmarketSansMedium'; width: 80%; height: 40px; border-radius:30px; color: #606060; background-color: white; border: 1.5px solid #606060; display: inline-block; margin-bottom: 17px;}
#logoutBtn:hover {background-color: #606060; color: white;}
#underProfile-container{width:90%; text-align: center; margin: 5% auto; border-bottom: 1px solid #cecece;}
.myPageHr{color: #cecece; margin-top: -0.5rem; margin-bottom: 0.5rem; border: 0; border-top: 1px solid rgba(0,0,0,.8);}
.mypageContent{width:90%; font-family: 'GmarketSansMedium'; margin: 40px 40px; color: #3c3c3c; padding: 20px 30px;; border: 0.5px solid #cecece; border-radius: 25px;}
#myId{color:#606060; font-family: 'GmarketSansMedium';}

/* 수강정보 css */
p.classInfo{color:#606060;}
span.classInfo{font-size: 1.3rem; border-right: 2px solid #cecece}
h2.classInfo{font-weight: bold; color:royalblue;}
p.infoTitles{color:#3c3c3c; font-size: 1.4rem;}
.classInfo{display: inline-block; margin:0px 10px;}

/*  메세지 css */
@font-face { font-family: 'Pretendard-Regular'; src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff'); font-weight: 400; font-style: normal;}
#messageBoxDiv,#messageDetail,#reportModal,#vacationModal{font-family: 'Pretendard-Regular'; text-align: center; font-weight: 100;}
.truncate-text {max-width: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; cursor: pointer; display: inline-block;}
#messageDetail,#reportModal,#vacationModal {background-color: rgba(0, 0, 0, 0.2);}
#messageTbl td,tr,th{text-align: center;}
#messageDetail .modal-dialog{margin: 8% auto; width: 40%;}
#reportModal .modal-dialog{margin: 8% auto; width: 40%; background-color: white;}
.modal-message-content{width: 100%; height: 200px;}
#certiSteps{width:90%; text-align: center; margin: 0px auto;}
.certiStep{display: inline-block; width: 24%; margin: 10px 2%; text-align: center; margin-top: 40px;}
#msgPagingDiv .msgPagination{ margin: 0px auto; width: fit-content;}
#reportModal label{margin-left: -80%;}
#reportModal textarea,select{width:92%;}
/* 회원인증 css */
.input-group {margin: 1% 9%; text-align: center;}
#upfile{width: 80%;}

/* 사이드 버튼 css */
#mypageBtns{width:90%; margin: 0 auto;}
.mypageBtn{text-decoration: none; font-family: 'GmarketSansMedium';font-weight: 100; font-size: 15px; width: 60%; color: #4d4d4d;}
.mypageBtn a{text-decoration: none;}
.mypageBtn:hover{cursor: pointer; color: royalblue;}

/* 회원 관련 css */
#InfoModal{background-color: rgba(0,0,0,0.2);}
#modalBtns{text-align: right;}
#memberDeleteFrm {display :none;}
#memberDelBtn{display: inline-block; margin: 3px 40%;}

/* 구매내역 css */
#messageTbl td,tr,th{text-align: center; font-family: 'Pretendard-Regular';}


/* 휴가신청 css */
/* #vacationDiv .btn btn-primary {display: inline-block;} */
#vacationModal{text-align: left;}
#vcUpFile{width:100%; margin-left: -45px;}

.chat_window {
  width: 100%;
  max-width: 800px;
  height: 500px;
  border-radius: 10px;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
  background-color: #f8f8f8;
  overflow: hidden;
}

.top_menu {
  background-color: #fff;
  width: 100%;
  padding: 20px 0 15px;
  box-shadow: 0 1px 30px rgba(0, 0, 0, 0.1);
}
.top_menu .buttons {
  margin: 3px 0 0 20px;
  position: absolute;
}
.top_menu .buttons .button {
  width: 16px;
  height: 16px;
  border-radius: 50%;
  display: inline-block;
  margin-right: 10px;
  position: relative;
}
.top_menu .buttons .button.close {
  background-color: #f5886e;
}
.top_menu .buttons .button.minimize {
  background-color: #fdbf68;
}
.top_menu .buttons .button.maximize {
  background-color: #a3d063;
}
.top_menu .title {
  text-align: center;
  font-size: 20px;
}

.messages {
  position: relative;
  list-style: none;
  padding: 20px 10px 0 10px;
  margin: 0;
  height: 87%;
  overflow-y: scroll;
}
.messages .message {
  clear: both;
  overflow: hidden;
  margin-bottom: 20px;
  transition: all 0.5s linear;
  opacity: 0;
}
.messages .message.left .avatarBox {
  float: left;
}
.messages .message.left .text_wrapper {
  background-color: #ffe6cb;
  margin-left: 20px;
}
.messages .message.left .text_wrapper::after, .messages .message.left .text_wrapper::before {
  right: 100%;
  border-right-color: #ffe6cb;
}
.messages .message.left .text {
  color: #c48843;
}
.messages .message.right .avatarBox {
  float: right;
}
.messages .message.right .text_wrapper {
  background-color: #c7eafc;
  margin-right: 20px;
  float: right;
}
.messages .message.right .text_wrapper::after, .messages .message.right .text_wrapper::before {
  left: 100%;
  border-left-color: #c7eafc;
}
.messages .message.right .text {
  color: #45829b;
}
.messages .message.appeared {
  opacity: 1;
}
.messages .message .avatarBox img {
  width: 60px;
  /* height: 60px; */
  border-radius: 50%;
  display: inline-block;
}
.messages .message .text_wrapper {
  display: inline-block;
  padding: 15px;
  border-radius: 6px;
  width: calc(100% - 85px);
  min-width: 100px;
  position: relative;
}
.messages .message .text_wrapper::after, .messages .message .text_wrapper:before {
  top: 18px;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}
.messages .message .text_wrapper::after {
  border-width: 13px;
  margin-top: 0px;
}
.messages .message .text_wrapper::before {
  border-width: 15px;
  margin-top: -2px;
}
.messages .message .text_wrapper .text {
  font-size: 14px;
  font-weight: 600;
}

.avatarBox {
	float: right;
	display: inline-block;
	width:60px;
	height:60px;
}
.avatarBox img{
	width:60px;
}

.bottom_wrapper {
  position: relative;
  width: 100%;
  background-color: #fff;
  padding: 20px 20px;
}
.bottom_wrapper .message_input_wrapper {
  display: inline-block;
  height: 50px;
  border-radius: 25px;
  border: 1px solid #bcbdc0;
  width: calc(100% - 160px);
  position: relative;
  padding: 0 20px;
}
.bottom_wrapper .message_input_wrapper .message_input {
  border: none;
  height: 100%;
  box-sizing: border-box;
  width: calc(100% - 40px);
  position: absolute;
  outline-width: 0;
  color: gray;
}
.bottom_wrapper .send_message {
  width: 140px;
  height: 50px;
  display: inline-block;
  border-radius: 50px;
  background-color: #a3d063;
  border: 2px solid #a3d063;
  color: #fff;
  cursor: pointer;
  transition: all 0.2s linear;
  text-align: center;
  float: right;
}
.bottom_wrapper .send_message:hover {
  color: #a3d063;
  background-color: #fff;
}
.bottom_wrapper .send_message .text {
  font-size: 18px;
  font-weight: 300;
  display: inline-block;
  line-height: 48px;
}

.message_template {
  display: none;
}

#chatTbl td,th{
 	padding: 5px;
 	vertical-align: baseline;
 	font-family: 'Pretendard-Regular';
}
#chatView{
	padding: 3px 12px;
}
#vcSubmit{
	margin-left: 40%;
}
#writeArticleButton{
	background-color: #c62917;
    width: 7%;
    height: 3%;
    border: none;
    border-radius: 10px;
    color: white;
}

</style>

<section>

	<!-- 상단 파란부분 div  -->
	<div id= "top-container">
	</div>
	
	<!-- 회원정보 및 버튼 div  -->
	<div id= "side-container">
		<div id="profile-container">	
			<sec:authentication property="principal" var="loginMember"/>
	  		<img id="profile" alt="profile" src="${pageContext.request.contextPath}/resources/images/student.png">
		</div>
		
		<div id="underProfile-container">
			<h2 id="profileName">${loginMember.name}님</h2>
			<p id="myId">(${loginMember.username})<p/>
			<button type="button" id="logoutBtn">로그아웃</button>
		</div>
			
			<!-- 회원목록 추가할것.  리더는 강퇴버튼도 있게..-->
			<div id="mypageBtns">
				<c:forEach items="${studyMembers}" var="studyMember">
					<c:if test="${studyMember.readerId eq studyMember.memberId}">
					<div style="display: flex;flex-direction: row;align-items: center;">
						<p class="mypageBtn" id="memberInfo">🤴&nbsp; ${studyMember.readerId}</p>
					</div>
						<hr class="myPageHr"/>
					</c:if>
					<c:if test="${studyMember.readerId ne studyMember.memberId}">
						<div style="display: flex;flex-direction: row;align-items: center;">
							<p class="mypageBtn" id="memberInfo">
							👨‍🦲&nbsp; ${studyMember.memberId}
							</p>
							<c:if test="${loginMember.username eq studyMember.readerId}">
								<button type="button" onclick="console.log('추방')" style="border-radius: 8px;background-color: #c62917;border: none; width: 18%;color: white;font-weight: bold;">추방</button>
							</c:if>
						</div>
						<hr class="myPageHr"/>
					</c:if>
				</c:forEach>
				<hr class="myPageHr"/>
			</div>
			<hr class="myPageHr"/>
		</div>
		<form:form name ="memberLogoutFrm" 
        	action="${pageContext.request.contextPath}/member/memberLogout.do" 
        	method="POST">
		</form:form>
	</div>
 
 	<!-- 메인 div 시작 -->
	<div id= "main-container" >
		<!-- 나의 수강정보 div -->
		<div class="mypageContent">
			<span class="classInfo">스터디 이름 &nbsp;&nbsp;</span> ${myStudy.studyName}
		</div>
		
		<%-- 팀장만 보이게 --%>
		<c:if test="${loginMember.username eq myStudy.memberId}">
			<div class="mypageContent" id="studyPostFrom" style="text-align: center;">
				<span id="sub">공지사항 작성</span>
				<button type="button" class="article" id="writeArticleButton" style="float: right;" onclick="showInputForm()" ><span class="material-symbols-outlined" >edit</span></button>
			</div>
		</c:if>
		
		
		
		<!-- 스터디 공지사항 리더만작성하게.. 리스트처럼 나오고 클릭시 세부 내용 나오게. div-->
		<div class="mypageContent" id="messageBoxList">
			<p class="infoTitles"><i class="bi bi-envelope"></i> &nbsp;공지사항</p>
			<div class="myPageDivs" id="messageBoxDiv" >	
				<table class="table table-hover" id="messageTbl">
    <thead>
        <tr>
            <th>제목</th>
            <th>내용</th>
            <th>작성날짜</th>
        </tr>
    </thead>
    <tbody id="messageBoxTbl">
        <c:forEach items="${myStudyNotice}" var="studyNotice" varStatus="loop">
            <tr>
                <td class="studyNoticeTitle">${studyNotice.title}</td>
                <td><span class="truncate-text">${studyNotice.content}</span></td>
                <td>${studyNotice.postCreatedAt}</td>
            </tr>
            <tr>
                <td colspan="3">
                    <div id="detailModal${loop.index}" class="modal">
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <div>
                                <div>제목: ${studyNotice.title}</div>
                                <div>내용: ${studyNotice.content}</div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
				<div id="msgPagingDiv">
					<ul class="pagination msgPagination">
						<li class="page-item disabled" id="prevButton">
						  <span class="page-link">Previous</span>
						</li>
						<li class="page-item" aria-current="page" onclick="changePage(1)">
	                            <span class="page-link">1</span>
	                        </li>
						<li class="page-item" id="nextButton">
						  <a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</div>
			</div>
			
		</div>	
		
		
		<!-- 신청현황 div -->
		<c:if test="${myStudy.memberId eq loginMember.username}">
		<div class="mypageContent">
			<p class="infoTitles"><i class="bi bi-chat-right-text"></i> &nbsp;신청현황</p>
			<div class="myPageDivs" id="chatQnAList" >	
				<table class="table table-hover" id="chatTbl">
					<thead>
						<th scope="col">No</th>
                        <th scope="col">신청자</th>
                        <th scope="col">신청일자</th>
                       <th scope="col"> 처리</th>
					</thead>
					<tbody id= "chatTblBody">
						<c:forEach var="info" items="${info}">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${info.memberId}</td>
                        <td>${info.studyApplicationAt}</td> <!-- 실제 프로퍼티 이름 사용 -->
                        <td> <button class="modal-button" data-bs-toggle="modal" data-bs-target="#chatModal" data-info-id="${info.memberId}">
                    보기
                </button></td>
                    </tr>
                </c:forEach>
					</tbody>
				</table>
				<br/>
				<div class="d-flex justify-content-center">
					<ul class="pagination chatPagination">
					    <li class="page-item disabled">
					      <a id="prev" class="page-link" href="#">이전</a>
					    </li>
					    
					    <li class="page-item">
					      <a id="next" class="page-link" href="#">다음</a>
					    </li>
				    </ul>
			    </div>
			</div>
		
		</div>
		</c:if>
			<!-- 리더만보이게 ! 버튼 클릭시 가입정보 조회 모달 -->
		<c:forEach var="info" items="${info}">
		<script >
		 const studyId = "${info.studyId}";
		</script>
			<div class="modal fade" id="chatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
				    	<div class="modal-header">
				            <h1 class="modal-title fs-5" id="exampleModalLabel">신청내역</h1>
				            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				        </div>
				        <div class="modal-body">
				            <div class="chat_window">
				              	<div class="top_menu">
				               		<div class="title"> 신청자 : ${info.memberId}</div>
				               	</div>
				               	<ul class="messages" id="modalMessages">
						            ${info.introduce}
				               	</ul>
				                	
				            </div>
				                
				        </div>
				        <div class="modal-footer">
				           	<button type="button" class="btn btn-primary" id="approveButton" data-bs-dismiss="modal" data-info-id="${info.memberId}">승인</button>
				           	<button type="button" class="btn btn-danger" id="rejectButton" data-bs-dismiss="modal" data-info-id="${info.memberId}">반려</button>
				        </div>
				    </div>
				</div>
			</div>
			</c:forEach>
			<c:forEach items="${myStudyNotice}" var="studyNotice">
				
			</c:forEach>

	<!-- 메인컨테이너 div끝 -->		
		</div>	
		<form:form name="hiddenForm"></form:form>
		
</selction>
<script>

<%-- 글작성 폼 --%>
function showInputForm() {
	 
    const writeButton = document.getElementById("writeArticleButton");
    const articlesContainer = document.querySelector("#studyPostFrom");
    const sub = document.querySelector("#sub");

    const formHtml = `
      <form:form 
      	name="createFrm" 
      	class="hidden" 
      	action="${pageContext.request.contextPath}/board/createPost.do" 
      	id="createForm" 
      	method="post" 
  		enctype="multipart/form-data">
      	<input type = "hidden" name="boardId" id="boardId" value="${myStudy.boardId}">
      	<p>
      		<input name="title" autocomplete="off" placeholder="공지사항 제목" class="title" id="title" style="width: 100%; border-radius: 10px;">
      	</p>
        <p>
        	<textarea name="text" placeholder="KH소통할까?는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. 위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 

아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다. 

※ 정치·사회 관련 행위 금지 

※ 홍보 및 판매 관련 행위 금지 

※ 불법촬영물 유통 금지

※ 그 밖의 규칙 위반 
- 타인의 권리를 침해하거나 불쾌감을 주는 행위 
- 범죄, 불법 행위 등 법령을 위반하는 행위 
- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위 
- 음란물, 성적 수치심을 유발하는 행위 
- 스포일러, 공포, 속임, 놀라게 하는 행위" class="smallplaceholder" id="text" style="width: 100%; height: 50%; border-radius: 10px; resize: none;"></textarea>
        </p>
        <p style="display: flex;flex-direction: row;justify-content: center;">
	    	<button class="createPostBtn" style="border: solid 2px #000000;background-color: #c62917;border-radius: 10px;width: 50px;height: 35px;margin-right: 20px;"><span class="material-symbols-outlined" >edit</span></button>
	        <button type="button" class="cancel" onclick="hideInputForm()" style="border: solid 2px #000000; background-color: #0ca5af;border-radius: 10px;width: 50px;height: 35px;">취소</button>
        </p>
        
      </form:form>
    `;
    
   
    articlesContainer.insertAdjacentHTML("afterbegin", formHtml);
    const createForm = document.getElementById("createForm");
    const titleInput = document.getElementById("title");
    const contentTextarea = document.getElementById("text");

    writeButton.style.display = "none";
    sub.style.display = "none"
    createForm.classList.remove("hidden");
    
    
 }
//폼 숨기기
function hideInputForm() {
  const writeButton = document.getElementById("writeArticleButton");
  const createForm = document.getElementById("createForm");
  const sub = document.getElementById("sub");

  writeButton.style.display = "block";
  sub.style.display = "";
  createForm.remove();
}
 
const modal = new bootstrap.Modal(document.getElementById('chatModal'));
let currentInfoId = null; // 현재 클릭한 정보의 ID


const modalButtons = document.querySelectorAll('.modal-button');
modalButtons.forEach(button => {
    button.addEventListener('click', (event) => {
        currentInfoId = button.getAttribute('data-info-id');
        modal.show();
    });
});

const approve =document.querySelector("#approveButton");
const reject =document.querySelector("#rejectButton");
if(approve && reject){
	approve.addEventListener('click', (event) => {
          currentInfoId = approve.getAttribute('data-info-id');
          const check="approve";
          sendActionToServer(currentInfoId,check);
          //modal.hide();
      });
	reject.addEventListener('click', (event) => {
        currentInfoId = reject.getAttribute('data-info-id');
        const check="reject";
        sendActionToServer(currentInfoId,check);
        //modal.hide();
    });
}
function sendActionToServer(memberId,check) {
	const token = document.hiddenForm._csrf.value;
	
    $.ajax({
        url: "${pageContext.request.contextPath}/board/appliCheck.do",
        method: "POST",
        data: { memberId: memberId, check: check ,studyId:studyId},
        success: function (response) {
            // 서버 응답에 따른 동작 수행
        },
        headers: {
            "X-CSRF-TOKEN": token
        },
        error: function (error) {
            // 오류 처리
        }
    });
}




	
</script>	
   

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
