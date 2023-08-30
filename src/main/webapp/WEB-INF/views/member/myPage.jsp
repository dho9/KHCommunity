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
.mypageBtn{text-decoration: none; font-family: 'GmarketSansMedium';font-weight: 100; font-size: 21px; width: 60%; margin: 15px auto; color: #4d4d4d;}
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
  color: #bcbdc0;
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
		<div id="mypageBtns">
			<p class="mypageBtn" id="memberInfo"><i class="bi bi-person-circle"></i> &nbsp;&nbsp; 회원정보</p>
			<hr class="myPageHr"/>
			<p class="mypageBtn" id="infoUdate"><i class="bi bi-pencil-fill"></i> &nbsp;&nbsp; 정보수정</p>
			<hr class="myPageHr"/>
			<p class="mypageBtn" id="memberDel"><i class="bi bi-eraser-fill"></i> &nbsp;&nbsp; 회원탈퇴</p>
			<hr class="myPageHr"/>
			<p class="mypageBtn" id="vacationBtn"><i class="bi bi-calendar3"></i> &nbsp;&nbsp; 휴가신청</p>
			<hr class="myPageHr"/>
			
			<!-- 성근님 코드 -->
			<form:form name="consultReqFrm">
				<input type="hidden" name="loginMemberId" id="loginMemberId" value="${loginMember.username}">
				<p class="mypageBtn" id="consultRequest"><i class="bi bi-chat-right-dots"></i> &nbsp;&nbsp; 상담신청</p>
			</form:form>
			
			<hr class="myPageHr"/>
		</div>
		<form:form name ="memberLogoutFrm" 
        	action="${pageContext.request.contextPath}/member/memberLogout.do" 
        	method="POST">
		</form:form>
	</div>
 
 	<!-- 메인 div 시작 -->
	<div id= "main-container">
		<!-- 나의 수강정보 div -->
		<div class="mypageContent">
			<span class="classInfo">나의 수강정보 &nbsp;&nbsp;&nbsp;</span>
			<c:if test="${not empty studentInfo.curriculumName}">
				<p class="classInfo">${studentInfo.curriculumName}반</p>
				<p class="classInfo">${studentInfo.memberName} 강사님 Class ${studentInfo.classId} &nbsp;</p>
				<h2 class="classInfo">
				<c:if test="${fn:contains(Ddays, '-')}">수료생</c:if>
				<c:if test="${not fn:contains(Ddays, '-')}">D - ${Ddays}</c:if>
				</h2>
			</c:if>
			<c:if test="${empty studentInfo.curriculumName}">
				<span class="classInfo">배정된 반이 없습니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<h2 class="classInfo">
					&nbsp;예비생
				</h2>							
			</c:if>
			</h2>
		</div>
		
		<!-- 나의 인증현황 div -->
		<div class="mypageContent">
			<p class="infoTitles"><i class="bi bi-person-check"></i> &nbsp;인증 현황</p>
			<hr class="myPageHr"/>
			<div class="certiSteps">
				<div class="certiStep">
					<p class="stepName" id="stepName1">인증요청 전</p>
				</div>
				<span>></span>
				<div class="certiStep">
					<p class="stepName" id="stepName2">인증요청 처리중</p>
				</div>
				<span>></span>
				<div class="certiStep">
					<p class="stepName" id="stepName3">인증요청 처리완료</p>
				</div>
				<div class="input-group" style="padding:0px;">
	 				<form:form name="certificaitonFrm" action="${pageContext.request.contextPath}/member/certification.do" enctype = "multipart/form-data" method="post" id="certificaitonFrm">
					<div class="input-group" style="padding:0px;">
						<input type="hidden" class="frmStyles" name="memberId" id="memberId" value="${loginMember.username}" readonly>
	    				<input type="file" class="form-control" name="upFile" id="upFile" multiple>&nbsp;&nbsp;
						<input type="submit" class="btn btn-primary" value="저장" >
					</div>
				</form:form>	  				
			</div>
			</div>
		</div>
		
		<!-- 쪽지함 div-->
		<div class="mypageContent" id="messageBoxList">
			<p class="infoTitles"><i class="bi bi-envelope"></i> &nbsp;쪽지함</p>
			<div class="myPageDivs" id="messageBoxDiv" >	
				<table class="table table-hover" id="messageTbl">
					<thead>
						<tr>
						<th>No</th>
						<th>보낸사람</th>
						<th>내용</th>
						<th>받은날짜</th>
						<th>읽음여부</th>
						</tr>
					</thead>
					<tbody id= "messageBoxTbl">
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
		
			
		
		<!-- 쪽지모달 -->
		<div id="messageDetail" class="modal fade" role="dialog">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-body">
		            <button type="button" class="close msg-close" data-dismiss="modal">&times;</button></br>
		                <h3>쪽지내용 상세보기</h3></br></br>
		                <textarea class="modal-message-content" readonly></textarea></br></br>
		                 <button type="button" class="btn btn-primary" id="editButton">삭제</button>&nbsp;&nbsp;&nbsp;
		                 <button type="button" class="btn btn-outline-primary" id="reportButton">신고</button>
		            </div>
		        </div>
		    </div>
		</div>		
		
		
		<!-- 구매내역 div-->
		<div class="mypageContent">
			<p class="infoTitles"><i class="bi bi-coin"></i> &nbsp;구매내역</p>
			<div class="myPageDivs" id="mealCouponList" >	
				<table class="table table-hover" id="mealCouponTbl">
					<thead>
						<th>주문번호</th>
						<th>가게이름</th>
						<th>식권매수</th>
						<th>총가격</th>
					</thead>
					<tbody id= "messageBoxTbl">
						<c:if test="${empty studentTicketInfo }">
							<tr>
								<td colspan="5" class="text-center">조회된 구매식권이 없습니다.</td>
							
							</tr>
						</c:if>
					 	<c:if test="${not empty studentTicketInfo}">
							<c:forEach items="${studentTicketInfo}" var="studentTicketInfo" varStatus="vs">
								<tr>
									<td>${studentTicketInfo.orderId}</td>
									<td>${studentTicketInfo.storename}</td>
									<td>${studentTicketInfo.amount}</td>
									<td>${studentTicketInfo.totalPrice}</td>
								</tr>
							</c:forEach>
					 	</c:if>
					</tbody>
				</table>
			</div>
		</div>	
		
		
		<!-- 상담내역 div -->
		<div class="mypageContent">
			<p class="infoTitles"><i class="bi bi-chat-right-text"></i> &nbsp;상담내역</p>
			<div class="myPageDivs" id="chatQnAList" >	
				<table class="table table-hover" id="chatTbl">
					<thead>
						<th scope="col">No</th>
                        <th scope="col">상담자</th>
                        <th scope="col">상담유형</th>
                        <th scope="col">상담일자</th>
                        <th scope="col">상담내역</th>
					</thead>
					<tbody id= "chatTblBody">
						
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
			<!-- 버튼 클릭시 채팅 조회 모달 -->
			<div class="modal fade" id="chatModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
				    	<div class="modal-header">
				            <h1 class="modal-title fs-5" id="exampleModalLabel">상담내역</h1>
				            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				        </div>
				        <div class="modal-body">
				            <div class="chat_window">
				              	<div class="top_menu">
				               		<div class="title">KH TIME</div>
				               	</div>
				               	<ul class="messages" id="modalMessages">
						            
				               	</ul>
				                	
				            </div>
				                
				        </div>
				        <div class="modal-footer">
				           	<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
				        </div>
				    </div>
				</div>
			</div>

		
		
		<!-- 휴가신청 -->
		<div id="vacationModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
	        	<div class="modal-content">
	            	<div class="modal-body">
	            		<button type="button" class="close vacation-close" data-dismiss="vacationModal">&times;</button></br>
						<p class="infoTitles"><i class="bi bi-pencil-square"></i> &nbsp;휴가신청</p>
							<div class="myPageDivs" id="vacationDiv" >		
								<form:form name="vacationSubmitFrm" action="${pageContext.request.contextPath}/member/vacationSubmit.do" 
									enctype = "multipart/form-data" method="post" id="vacationSubmitFrm">
									<br/>
									<label class="frmStyles" for="memberId">아이디 &nbsp;: &nbsp;</label>
									<input type="text" class="frmStyles" name="memberId" id="memberId" value="${loginMember.username}" readonly>
										 <br/>
										 <br/>
										 <tr>
											<th> 휴가시작날짜 : </th>
											<td>
												<input type="date" class="form-control" placeholder="휴가시작날짜" name="vacationStartDate" id="vacationStartDate"/>
											</td>
										</tr>
										<br/>
										<br/>
									
										<tr>
											<th>휴가끝나는날짜 : </th>
											<td>
												<input type="date" class="form-control" placeholder="휴가끝날짜" name="vacationEndDate" id="vacationEndDate" />
											</td>
										</tr>
										
										<br/>
										<br/>
										<label class="frmStyles" for="teacherId">담당강사님 &nbsp;: &nbsp;</label>
									<input type="text" class="frmStyles" name="teacherId" id="memberId" value="${studentInfo.teacherId}" readonly>
									
									<div class="input-group" style="padding:0px;">
						  				<div class="custom-file">
						    				<input type="file" class="form-control" name="upFile" id="vcUpFile" multiple>
						  				</div>		  				
									</div>
									<br/>
									<br/>
									<input type="submit"  class="btn btn-primary" id="vcSubmit" value="&nbsp;&nbsp;저장&nbsp;&nbsp;" >
									<br/>
									<br/>
								</form:form>
							</div>	
						</div>
					</div> 
				</div>	
			</div>
		</div> 
	
	<!-- 메인컨테이너 div끝 -->

	
		<!-- 회원관리 모달 -->
		<div class="modal fade" id="InfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="memberModalLabel"></h1>
			        <button type="button" class="btn-close infoClose" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <div id="update-container" class="myPageDivs">
						<%-- principal을 변수 loginMember 저장 --%>
						<form:form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post" id="memberUpdateFrm">
						<tr>
							<th>아이디 : </th>
							<td>
								<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId" value='${loginMember.username}' readonly required/>
							</td>
						</tr>
						<br/>
						<div class="forHide">
						<tr>
							<th>패스워드 : </th>
							<td>
								<input type="password" class="form-control" name="memberPwd" placeholder="비밀번호" id="memberPwd" value='<sec:authentication property="principal.memberPwd"/>' required>
							</td>
						</tr>
						<br/>
						<tr>
							<th>패스워드 확인 : </th>
							<td>
								<input type="password" class="form-control" id="passwordConfirmation" value='<sec:authentication property="principal.memberPwd"/>' required>
							</td>
						</tr>
						<br/>
						</div>
						<tr>
							<th>이름 : </th>
							<td>
								<input type="text" class="form-control" placeholder="이름" name="name" id="name" value='${loginMember.name}' readonly required/>
							</td>
						</tr>
						<br/>
						<tr>
							<th>생일 : </th>
							<td>
								<input type="date" class="form-control readChange" placeholder="생일" name="birthday" id="birthday" value='<sec:authentication property="principal.birthday"/>'/>
							</td>
						</tr>
						<br/>
						<tr>
							<th>전화번호 : </th>
							<td>
								<input type="tel" class="form-control readChange" placeholder="010-1234-5678" name=memberPhone id="phone" maxlength="13" value='<sec:authentication property="principal.memberPhone"/>' required>
							</td>
						</tr>
						<br/>
						<tr>
							<th>이메일 : </th>
							<td>
								<input type="email" class="form-control readChange" placeholder="이메일" name="memberEmail" id="email" value='<sec:authentication property="principal.memberEmail"/>'readonly required/>
							</td>
						</tr>
						<br/>
						<hr class="myPageHr"/>
						<div id="modalBtns" class="forHide">
							<input type="submit" class="btn btn-primary" value="수정" >&nbsp;
							<input type="reset" class="btn btn-outline-primary" value="초기화">
						</div>
						</form:form>
						
						<!-- 탈퇴폼 -->
						<form:form name="memberDeleteFrm" action="${pageContext.request.contextPath}/member/memberDelete.do" id="memberDeleteFrm" method="post">
						<tr>
							<th>아이디 : </th>
							<td>
								<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId" value='${loginMember.username}' readonly required/>
							</td>
						</tr>
						<br/>
						
						<tr>
							<th>패스워드 : </th>
							<td>
								<input type="password" class="form-control" name="memberPwd" placeholder="비밀번호" id="memberPwd" value='<sec:authentication property="principal.memberPwd"/>' required>
							</td>
						</tr>
						<br/>
						
						<tr>
							<th>패스워드 확인 : </th>
							<td>
								<input type="password" class="form-control" id="passwordConfirmation" value='<sec:authentication property="principal.memberPwd"/>' required>
							</td>
						</tr>
						<br/>
						<tr>
							<th>이름 : </th>
							<td>
								<input type="text" class="form-control" placeholder="이름" name="name" id="name" value='${loginMember.name}' readonly required/>
							</td>
						</tr>
						<br/>
						<tr>
							<th>생일 : </th>
							<td>
								<input type="date" class="form-control" placeholder="생일" name="birthday" id="birthday" value='<sec:authentication property="principal.birthday"/>'/>
							</td>
						</tr>
						<br/>
						<tr>
							<th>전화번호 : </th>
							<td>
								<input type="tel" class="form-control" placeholder="010-1234-5678" name=memberPhone id="phone" maxlength="13" value='<sec:authentication property="principal.memberPhone"/>' required>
							</td>
						</tr>
						<br/>
						<tr>
							<th>이메일 : </th>
							<td>
								<input type="email" class="form-control" placeholder="이메일" name="memberEmail" id="email" value='<sec:authentication property="principal.memberEmail"/>'readonly required/>
							</td>
						</tr>
						<br/>
						<hr class="myPageHr"/>
							<input type="button" id="memberDelBtn" class="btn btn-outline-primary" value="탈퇴하기" onclick="console.log('버튼 클릭 확인'); deleteMember();" />
					</form:form>
					</div>
			      </div>
			    </div>
			  </div>
		</div>
		
		<!-- 신고하기 모달 -->
		<div id="reportModal" class="modal fade" role="dialog">
		    <div class="modal-dialog">
		    	<div class="modal-content">
		    	<div class="modal-header">
			        <h1 class="modal-title fs-5">신고하기</h1>
			        <button type="button" class="btn-close reportClose" data-bs-dismiss="modal" aria-label="Close"></button>
			    </div>
		    	<div class="modal-body">
				    <form:form 
				    	id="reportForm"
				    	name="reportForm"
				    	action="${pageContext.request.contextPath}/message/messageReport.do"
				    	method="post"
				    >
				      <input type="hidden" name="reportMessageId" id="reportMessageId" value=""> 
				      <input type="hidden" name="reporterId" id="reporterId" value="${loginMember.username}">
				      <input type="hidden" name="attackerId" id="attackerId" value="">
				      <input type="hidden" id="reportType" name="reportType" value="">
				      <br/>
				      <label for="reportType">신고유형</label>
				      <br/>
				      <select name="reportType_" id="reportType_" >
								<option value="선택없음">신고 유형을 선택해주세요</option>	      			
								<option value="욕설/비하">욕설/비하</option>	      			
								<option value="음란물/불건전한 만남 및 대화">음란물/불건전한 만남 및 대화</option>	      			
								<option value="상업적 광고 및 판매">상업적 광고 및 판매</option>	      			
								<option value="유출/사칭/사기">유출/사칭/사기</option>	      			
								<option value="낚시/놀람/도배">낚시/놀람/도배</option>	      			
								<option value="정당/정치인 비하 및 선거운동">정당/정치인 비하 및 선거운동</option>	      			
			     	  </select><br/>
			     	  <br/>
				      <label for="reportContent">신고내용</label><br/>
				      <textarea id="reportContent" name="reportContent" rows="4" required></textarea>
				      <br/><br/><br/>
				      <hr class="myPageHr"/>
				      <button class="btn btn-outline-primary" type="submit" id="reportSubmit">&nbsp;&nbsp;&nbsp;제출&nbsp;&nbsp;&nbsp;</button>
				    </form:form>
				    </div>
			    </div>
			</div>
		</div>	
		
</selction>
<script>

	window.onload=()=>{
		msgList(1);
		certification();
		chatPageChange(1);
	};

	document.getElementById("logoutBtn").addEventListener("click", function(event) {
		memberLogoutFrm.submit();
	});
	
	
	
	// MH - 쪽지함 관련 기능 시작
	let msgId = ""; // 전역 변수로 선언
	
	const msgList = (page) => {
		
		
	    $.ajax({
	        url: `${pageContext.request.contextPath}/message/messageList.do`,
	        method: "GET",
	        data : {
	        	page : page,
	        	size : 5
	        	},
	        success: function(responseData) {
	            const messageBoxTbl = document.querySelector("#messageBoxTbl");
	            
	            const messageList =responseData.messageList;
	            if (messageList.length !== 0) {
	                let html = ""; 
	                messageList.forEach(function(message) {
	                    let readCk = ""
						if(message.readCheck == 'y'){
							readCk = `<i class="bi bi-envelope-paper-heart"></i>`;
						}else{
							readCk = `<i class="bi bi-envelope-heart"></i>`;
						}
	                    html += `
					        <tr>
					            <td class="msgId">\${message.messageId}</td>
					            <td class="sender">\${message.sendId}</td>
					            <td><span class="truncate-text">\${message.messageContent}</span></td>
					            <td>\${message.sendAt}</td>
					            <td class="readCheckColumn">\${readCk}</td>
					        </tr>
					    `;
	                });
	                
	                messageBoxTbl.innerHTML = html; 
	                
					let readCheckValue ="";
					let sender = "";
					$(document).ready(function() {
					    $(".truncate-text").click(function() {
							let messageContent = $(this).text();
							sender = $(this).closest("tr").find(".sender").html();
					        $(".modal-message-content").text(messageContent);
					        readCheckValue = $(this).closest("tr").find(".readCheckColumn").html();
					        if(readCheckValue == `<i class="bi bi-envelope-heart"></i>`){
					        	readCheckValue = 'n';
					        } else {
					        	readCheckValue = 'y';
					        }
					        msgId = $(this).closest("tr").find(".msgId").html();
					        $("#messageDetail").modal("show");
					        updateReadCheck(readCheckValue, msgId, page);
					        
					    });
					    
					    
					    const totalPage = responseData.totalPages;
					    
					    
					    $("#editButton").click(function() {
					    	console.log("112121dddddd");
					    	deleteMsg(msgId, page, totalPage);
					    });
					    $("#reportButton").click(function() {
					    	reportMsg(msgId, sender);
					    });
					});
					
	            } else {
	                messageBoxTbl.innerHTML = `
	                    <tr>
	                        <td colspan="5" class="text-center">받은 쪽지가 없습니다.</td>
	                    </tr>	
	                `;
	            }
	            let totalPages = responseData.totalPages;
	            messagePagination(page, totalPages);
	        }
	    });
	};

	
	function loadMsgPage(pageNumber) {
		msgList(pageNumber);
        currentPage = pageNumber;
    }
	
	
	function messagePagination(currentPage, pages) {
	    const paginationElement = document.querySelector('.msgPagination');
	    paginationElement.innerHTML = ""; // 기존 페이지 바 내용 초기화

	    // 이전 페이지 링크
	    const prevButton = document.createElement('li');
	    prevButton.classList.add('page-item');
	    if (currentPage === 1) {
	        prevButton.classList.add('disabled');
	    }
	    const prevLink = document.createElement('a');
	    prevLink.classList.add('page-link');
	    prevLink.textContent = '이전';
	    prevLink.setAttribute('href', '#');
	    prevLink.addEventListener('click', () => {
	    	event.preventDefault();
	    	loadMsgPage(currentPage - 1);
	    });
	    prevButton.appendChild(prevLink);
	    paginationElement.appendChild(prevButton);

	    // 페이지 번호 링크
	    for (let i = 1; i <= pages; i++) {
	        const pageButton = document.createElement('li');
	        pageButton.classList.add('page-item');
	        if (i === currentPage) {
	            pageButton.classList.add('active');
	        }
	        const pageLink = document.createElement('a');
	        pageLink.classList.add('page-link');
	        pageLink.textContent = i;
	        pageLink.setAttribute('href', '#');
	        pageLink.setAttribute('data-page', i);
	        pageLink.addEventListener('click', (event) => {
	        	event.preventDefault();
	            const clickedPage = event.target.getAttribute('data-page');
	            if (clickedPage) {
	            	loadMsgPage(parseInt(clickedPage));
	            }
	        });
	        pageButton.appendChild(pageLink);
	        paginationElement.appendChild(pageButton);
	    }

	    // 다음 페이지 링크
	    const nextButton = document.createElement('li');
	    nextButton.classList.add('page-item');
	    if (currentPage === pages) {
	        nextButton.classList.add('disabled');
	    }
	    const nextLink = document.createElement('a');
	    nextLink.classList.add('page-link');
	    nextLink.textContent = '다음';
	    nextLink.setAttribute('href', '#');
	    nextLink.addEventListener('click', () => {
	    	loadMsgPage(currentPage + 1);
	    });
	    nextButton.appendChild(nextLink);
	    paginationElement.appendChild(nextButton);
	}
	


	// 쪽지 읽음 여부 업데이트
	const updateReadCheck = (checked, msgId, page) =>{
		console.log(checked, msgId);

		if(checked == 'n'){
			$.ajax({
				url: "${pageContext.request.contextPath}/message/messageUpdate.do",
				data :{
					checked :checked,
					messageId: msgId
				},
				method : "GET",
				dataType : "json",
				success(responseData){
					msgList(page);
				}
			});
		}
	};
	
	let deletingMsg = false;
	// 쪽지삭제
	const deleteMsg = (msgId, page) => {
	    if (deletingMsg) {
	        console.log("Deletion in progress. Please wait.");
			console.log("no.0");
	        return; // 이미 삭제 처리 중이면 함수 종료
	    }
	
	    console.log("delpage", page);
	    $.ajax({
	        url: "${pageContext.request.contextPath}/message/messageDelete.do",
	        data: {
	            messageId: msgId
	        },
	        method: "GET",
	        dataType: "json",
	        beforeSend: function() {
	            deletingMsg = true; // 삭제 처리 시작 전에 상태 업데이트
	            console.log("no.1");
	        },
	        success(responseData) {
	            msgList(page);
	            $('#messageDetail').modal('hide');
	        	console.log("처리완료");
	        	 console.log("no.2");
	        },
	        error(responseData) {
	            alert("신고된 메세지는 처리 전에 삭제할 수 없습니다.");
	            $('#messageDetail').modal('hide');
	            console.log("no.3");
	        },
	        complete: function() {

	            deletingMsg = false; // 삭제 처리 완료 후 상태 업데이
	            console.log("no.4");
	        }
	    });
	};
	
	// 쪽지신고 
	const reportMsg = (msgId, sender) =>{
		$('#messageDetail').modal('hide');
		      
	    const reportMessageId = document.querySelector("#reportMessageId");   
	    const attackerId = document.querySelector("#attackerId");   
	    reportMessageId.value = msgId;
	    attackerId.value = sender;
	    
	    console.log(reportMessageId.value);
		$('#reportModal').modal('show');
		
		const reportType_ = document.querySelector("#reportType_");
		const reportType = document.querySelector("#reportType");
		if(reportType_ !== null && reportType !== null){
			reportType_.addEventListener('change', (e) => {
				reportType.value = reportType_.value;
				console.log(reportType.value);
			});
		}
		

	};
	
	// MH - 쪽지함 관련 기능 끝!	
	
	
	// MH - 회원인증 관련 기능 시작
	const certification = () =>{
		const value = document.querySelector("#memberId").value;
		let selectedStep = "";
		console.log(value);
		 $.ajax({
			url: "${pageContext.request.contextPath}/member/certificate.do",
			data :{
				memberId :value
			},
			method : "GET",
			dataType : "json",
			success(responseData){
				const {student} = responseData;
				const {approveCompleteDate, approveRequestDate} = student;
				const state = document.querySelector("#state");
				const upFile = document.querySelector("#upFile");
				if(approveCompleteDate ==null && approveRequestDate==null){
					selectedStep = document.querySelector("#stepName1");
				}
				if(approveCompleteDate ==null && approveRequestDate!=null){
					selectedStep = document.querySelector("#stepName2");
					document.querySelector(".input-group").style.display="none";
				}
				if(approveCompleteDate !=null && approveRequestDate !=null){
					selectedStep = document.querySelector("#stepName2");
					document.querySelector(".input-group").style.display="none";
				}
				selectedStep.style.borderRadius="20px";	
				selectedStep.style.color="white";
				selectedStep.style.backgroundColor="royalblue";	
			}
			
		}); 
	};
	// MH - 회원인증 관련 기능 끝
	
	
	// 회원관련 기능 시작
	
	// 1. 조회
	document.querySelector("#memberInfo").onclick=()=>{
		document.querySelector("#memberDeleteFrm").style.display="none";
		document .querySelector("#memberUpdateFrm").style.display="block";
		const forHide = document.querySelectorAll(".forHide");
		const modalTitle = document.querySelector("#memberModalLabel");
		modalTitle.innerHTML="회원정보";
		forHide.forEach((hideItem)=>{
			hideItem.style.display="none";
		});
		$('.readChange').attr('readonly',true);
		$("#InfoModal").modal("show");
		
	};

	// 2. 수정
	document.querySelector("#infoUdate").onclick=()=>{
		document.querySelector("#memberDeleteFrm").style.display="none";
		document .querySelector("#memberUpdateFrm").style.display="block";
		const forHide= document.querySelectorAll(".forHide");
		const modalTitle = document.querySelector("#memberModalLabel");
		modalTitle.innerHTML="회원정보 수정";
		forHide.forEach((hideItem)=>{
			hideItem.style.display="block";
		});
		$('.readChange').attr('readonly',false);
		$("#InfoModal").modal("show");
		
	};
	
	document.memberUpdateFrm.onsubmit = (e) => {
		const password = document.querySelector("#memberPwd");
		const passwordConfirmation = document.querySelector("#passwordConfirmation");
		if(password.value !== passwordConfirmation.value) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}else{
			alert("회원정보가 정상적으로 수정되었습니다.");
		}
	};
	
	// 3. 삭제
	document.querySelector("#memberDel").onclick=()=>{
		const modalTitle = document.querySelector("#memberModalLabel");
		modalTitle.innerHTML="회원탈퇴";
		document.querySelector("#memberDeleteFrm").style.display="block";
		document.querySelector("#memberUpdateFrm").style.display="none";
		$("#InfoModal").modal("show");
	};
	
	document.querySelector(".infoClose").onclick=()=>{		
		$("#InfoModal").modal("hide");
	};
	document.querySelector(".reportClose").onclick=()=>{		
		$("#reportModal").modal("hide");
	};
	document.querySelector(".vacation-close").onclick=()=>{		
		$("#vacationModal").modal("hide");
	};
	document.querySelector(".msg-close").onclick=()=>{		
		$("#messageDetail").modal("hide");
	};

	const deleteMember = () => {
		
		const result = confirm('정말 탈퇴하시겠습니까?');
		if (result === true) {
			document.memberDeleteFrm.submit();
		}
	};
	
	// 회원 관련 기능 끝
	
	document.querySelector("#vacationBtn").onclick=()=>{
		$("#vacationModal").modal("show");
		
		
	};


</script>	

<script>

	// 성근 - 학생이 상담신청 누르면 구독신청 및 상담페이지 이동 
	document.querySelector("#consultRequest").onclick = () => {
		const ws = new SockJS(`http://localhost:8080/kh/ws`); // endpoint
		const stompClient = Stomp.over(ws);
	
		stompClient.connect({}, (frame) => {
			console.log('open : ', frame);
			
			// 구독신청 
			stompClient.subscribe('/topic/chat', (message) => {
				console.log('/topic/chat : ', message);
				renderMessage(message);
			});
		});

		const consultReqFrm = document.consultReqFrm; 
		const loginMemberId = document.querySelector("#loginMemberId").value;
		const token = consultReqFrm._csrf.value;
		
		console.log(consultReqFrm);
		console.log(loginMemberId);
		
		$.ajax({
			type : "POST",
			url: "${pageContext.request.contextPath}/chat/chatConsultingRequest.do",
			data :{
				memberId: loginMemberId
			},
			headers: {
	            "X-CSRF-TOKEN": token
	        },
			success(responseData){
				console.log("ChatId: ", responseData)
				const newWindow = window.open("${pageContext.request.contextPath}/chat/chatConsultingRequest.do?chatId=" + responseData, '_blank');
				if (newWindow) {
	                newWindow.focus();
	            }
			}
		});
	};
	
	
	$(function(){
		var accordionButton = $('.list .items > .a_title');
	    accordionButton.on('click', function(e){
	    	e.preventDefault();
	        var $this = $(this);
	        var target = $this.parent();
	        var description = $this.siblings('.a_content');
	        var other = target.siblings('.items');
	        var otherDescription = other.find('.a_content');
	        accordionToggle(target, description, other, otherDescription);
	    });
	        
	    function accordionToggle(target, description, other, otherDescription){
	    	if (target.hasClass('active')) {
	          target.removeClass('active');
	          description.stop().slideUp(300);
	        } else {
	          target.addClass('active');
	          description.stop().slideDown(300);
	        }
	        if (other && otherDescription) {
	          other.removeClass('active');
	          otherDescription.stop().slideUp(300);
	        }
	    };
	});
	
	function chatlogBtn() {
		const chatViewButtons = document.querySelectorAll("#chatView");
		chatViewButtons.forEach(button => {
		    button.addEventListener("click", function () {
		        const chatId = this.getAttribute("data-chatid");
		        console.log(chatId);
		        // 채팅 메시지를 가져오기 위한 AJAX 요청 수행
		        $.ajax({
		            type: "GET",
		            url: "${pageContext.request.contextPath}/member/chatView.do",
		            data: {
		                chatId: chatId
		            },
		            success: function (responseData) {
		                // responseData에 채팅 메시지가 포함되어 있다고 가정합니다.
		                console.log(responseData)
		                
		                modalSend(responseData);
		                
		            },
		            error: function () {
		                console.log("실패");
		            }
		        });
		    });
		});
	};
	
	function modalSend(responseData) {
		
		
		   const modalMessages = document.getElementById("modalMessages");
		    
		   modalMessages.innerHTML = '';
		   
		    responseData.forEach(chat => {
		    	
		    	const chatSendAt = new Date(chat.chatSendAt);
		    	console.log(chatSendAt);
		    	const formattedSendAt = `\${chatSendAt.getFullYear()}/\${chatSendAt.getMonth() + 1}/\${chatSendAt.getDate()}/\${chatSendAt.getHours()}:\${chatSendAt.getMinutes()}:\${chatSendAt.getSeconds()}`;
		    	console.log(formattedSendAt);
		        const messageItem = document.createElement("li");
		        messageItem.classList.add("message", chat.employeeId === null ? "right" : "left", "appeared");
		        
		        const studentImgUrl = "/kh/resources/images/usericon.png";
		        const adminImgUrl = "/kh/resources/images/admin.png";
		        
		        const avatarBox = document.createElement("div");
		        avatarBox.classList.add("avatarBox");
		        const avatarImage = document.createElement("img");
		        avatarImage.src = chat.employeeId === null ? studentImgUrl : adminImgUrl; // 대화 상대의 아바타 이미지 URL 설정
		        avatarImage.style.marginTop = chat.employeeId === null ? '' : '20px';
		        avatarBox.appendChild(avatarImage);
		        
		        const textWrapper = document.createElement("div");
		        textWrapper.classList.add("text_wrapper");
		        textWrapper.style.marginTop = chat.employeeId === null ? '10px' : '';
		        const textDiv = document.createElement("div");
		        textDiv.classList.add("text");
		        
		        if(chat.memberId === null){
		            textDiv.innerHTML = `
		                <span style="font-size:13px; color:black; font-weight:600;">
		                    관리자
		                </span> <br>
		                <span>\${chat.chatContent}</span> <br>
		                <span style="font-size:12px; color:black; font-weight:500;">
		                	\${formattedSendAt}
		                </span>`;
		        }
		        else {
		           textDiv.innerHTML = `
		                <span style="font-size:13px; color:black; font-weight:600;">
		                    \${chat.memberId}
		                </span> <br>
		                <span>\${chat.chatContent}</span> <br>
		                <span style="font-size:12px; color:black; font-weight:500;">
		                	\${formattedSendAt}
		                </span>`;
		        }
		        textWrapper.appendChild(textDiv);
		        
		        messageItem.appendChild(avatarBox);
		        messageItem.appendChild(textWrapper);

		        modalMessages.appendChild(messageItem);
		   })
		}
	
	
	 function chatPageChange(pageNum) {
			
			$.ajax({
	            type: "GET",
	            url: "${pageContext.request.contextPath}/member/studentChatList.do",
	            data: {
	            	page: pageNum
	            },
	            success: function (responseData) {
	                console.log(responseData);
	                const studentChatList = responseData.studentChatList;
	                const totalPages = responseData.totalPages;
	                const currentPage = responseData.currentPage;
	                
	                let html ="";
	                let index = 0;
	                const chatTblBody = document.querySelector("#chatTblBody");
	                
	                
	                if(studentChatList.length == 0) {
	                	chatTblBody.innerHTML = `
							<tr>
					  			<th colspan="5">조회된 게시글이 존재하지 않습니다.</th>
					  		</tr>
						`;
					} else {
		                for(let i = 0; i < studentChatList.length; i++){
		                	
		                	console.log(pageNum, pageNum-1, (pageNum-1) * 5, (pageNum-1) * 5 + i, (pageNum-1) * 5 + i +1)
		                	html+=`
		                	<tr>
				            <td>\${(pageNum-1) * 5 + i + 1}</td>
				            <td>\${studentChatList[i].studentName}(\${studentChatList[i].studentId})</td>
				            <td>\${studentChatList[i].chatType}</td>
				            <td>\${studentChatList[i].chatDate}</td>
				            <td>
				                <button type="button" class="btn btn-outline-primary" id="chatView"
				                        style="--bs-btn-padding-y: .0rem; --bs-btn-padding-x: .4rem; --bs-btn-font-size: .6rem;"
				                        data-bs-toggle="modal" data-bs-target="#chatModal"
				                        data-chatid="\${studentChatList[i].chatId}">
				                    보기
				                </button>
				            </td>
			            	<tr>` 
			            	
		                }
	                	chatTblBody.innerHTML = html;
		                renderPagination(currentPage, totalPages);
		                chatlogBtn();
					}
	                
	                
	            },
	            error: function () {
	                console.log("실패");
	            }
	        });
			
		};
		
		function loadPage(pageNumber) {
			chatPageChange(pageNumber);
	        currentPage = pageNumber;
	    }
		
		
		function renderPagination(currentPage, totalPages) {
		    const paginationElement = document.querySelector('.chatPagination');
		    paginationElement.innerHTML = ""; // 기존 페이지 바 내용 초기화

		    // 이전 페이지 링크
		    const prevButton = document.createElement('li');
		    prevButton.classList.add('page-item');
		    if (currentPage === 1) {
		        prevButton.classList.add('disabled');
		    }
		    const prevLink = document.createElement('a');
		    prevLink.classList.add('page-link');
		    prevLink.textContent = '이전';
		    prevLink.setAttribute('href', '#');
		    prevLink.addEventListener('click', () => {
		    	loadPage(currentPage - 1);
		    });
		    prevButton.appendChild(prevLink);
		    paginationElement.appendChild(prevButton);

		    // 페이지 번호 링크
		    for (let i = 1; i <= totalPages; i++) {
		        const pageButton = document.createElement('li');
		        pageButton.classList.add('page-item');
		        if (i === currentPage) {
		            pageButton.classList.add('active');
		        }
		        const pageLink = document.createElement('a');
		        pageLink.classList.add('page-link');
		        pageLink.textContent = i;
		        pageLink.setAttribute('href', '#');
		        pageLink.setAttribute('data-page', i);
		        pageLink.addEventListener('click', (event) => {
		            const clickedPage = event.target.getAttribute('data-page');
		            if (clickedPage) {
		            	loadPage(parseInt(clickedPage));
		            }
		        });
		        pageButton.appendChild(pageLink);
		        paginationElement.appendChild(pageButton);
		    }

		    // 다음 페이지 링크
		    const nextButton = document.createElement('li');
		    nextButton.classList.add('page-item');
		    if (currentPage === totalPages) {
		        nextButton.classList.add('disabled');
		    }
		    const nextLink = document.createElement('a');
		    nextLink.classList.add('page-link');
		    nextLink.textContent = '다음';
		    nextLink.setAttribute('href', '#');
		    nextLink.addEventListener('click', () => {
		        loadPage(currentPage + 1);
		    });
		    nextButton.appendChild(nextLink);
		    paginationElement.appendChild(nextButton);
		}
	
</script>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
