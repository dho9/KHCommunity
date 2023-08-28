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
#messageBoxDiv,#messageDetail,#reportModal{font-family: 'Pretendard-Regular'; text-align: center; font-weight: 100;}
.truncate-text {max-width: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; cursor: pointer; display: inline-block;}
#messageDetail,#reportModal {background-color: rgba(0, 0, 0, 0.2);}
#messageTbl td,tr,th{text-align: center;}
#messageDetail .modal-dialog{margin: 8% auto; width: 40%;}
#reportModal .modal-dialog{margin: 8% auto; width: 40%; background-color: white;}
.modal-message-content{width: 100%; height: 200px;}
#certiSteps{width:90%; text-align: center; margin: 0px auto;}
.certiStep{display: inline-block; width: 24%; margin: 10px 2%; text-align: center; margin-top: 40px;}
#msgPagingDiv .pagination{text-align: center; margin: 0px auto; width: fit-content;}
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
#messageTbl td,tr,th{text-align: center;}

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
			<p class="classInfo">${studentInfo.curriculumName }반</p>
			<p class="classInfo">${studentInfo.memberName} 강사님 Class ${studentInfo.classId}</p>
			<h2 class="classInfo">&nbsp;&nbsp;
			<c:if test="${fn:contains(Ddays, '-')}">수료생</c:if>
			<c:if test="${not fn:contains(Ddays, '-')}">D - ${Ddays}</c:if>
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
					<ul class="pagination">
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
	
	</div> 
	<!-- 메인컨테이너 div끝 -->
		
		
	<!-- 쪽지모달 -->
	<div id="messageDetail" class="modal fade" role="dialog">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body">
	            <button type="button" class="close" data-dismiss="modal">&times;</button></br>
	                <h3>쪽지내용 상세보기</h3></br></br>
	                <textarea class="modal-message-content" readonly></textarea></br></br>
	                 <button type="button" class="btn btn-primary" id="editButton">삭제</button>&nbsp;&nbsp;&nbsp;
	                 <button type="button" class="btn btn-outline-primary" id="reportButton">신고</button>
	            </div>
	        </div>
	    </div>
	</div>		
	
	
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
	};
	document.getElementById("logoutBtn").addEventListener("click", function(event) {
		memberLogoutFrm.submit();
	});
	
	// 성근 - 학생이 상담신청 누르면 구독신청 및 상담페이지 이동 
	document.querySelector("#consultRequest").onclick = () => {
		const ws = new SockJS(`http://localhost:8080/kh/ws`); // endpoint
		const stompClient = Stomp.over(ws);

		stompClient.connect({}, (frame) => {
			console.log('open : ', frame);
			
			// 구독신청 
			stompClient.subscribe('/topic/chat', (message) => {
				console.log('/topic/notice : ', message);
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
				console.log("성공")
				/* location.href="${pageContext.request.contextPath}/chat/chatConsultingRequest.do"; */
				
			},
			error(error) {
	            // 오류 발생 시 실행되는 부분
	            console.error("error"); // 오류 내용을 출력
	        }
		});
	};
	
	// MH - 쪽지함 관련 기능 시작
	const msgList = (page) => {
		msgPage();
		const size = 5;
	    $.ajax({
	        url: `${pageContext.request.contextPath}/message/messageList.do`,
	        method: "GET",
	        data : {
	        	page : page,
	        	size : 5
	        	},
	        success: function(responseData) {
	            const messageBoxTbl = document.querySelector("#messageBoxTbl");
	            if (responseData.length !== 0) {
	            	
	                let html = ""; 
	                responseData.forEach(function(message) {
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
	                
	                let msgId = "";
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
					    $("#editButton").click(function() {
					    	deleteMsg(msgId, page);
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
	        }
	    });
	};
	
	const msgAllList =() =>{
		let listSize= 0;
		$.ajax({
			url: "${pageContext.request.contextPath}/message/messageAllList.do",
			method : "GET",
			dataType : "json",
			success(responseData){
				listSize = responseData.listNum
			}
		});
		return listSize;
	};
	
	const msgPage =() =>{
		$.ajax({
			url: "${pageContext.request.contextPath}/message/messageAllList.do",
			method : "GET",
			dataType : "json",
			success(responseData){
				let listSize = responseData.listNum
				let pages = 0;
				pages = Math.ceil(listSize / 5);
				
				const paginationContainer = document.querySelector(".pagination");
	            paginationContainer.innerHTML = "";

	            let paginationHTML = `
	                <li class="page-item disabled" id="prevButton">
	                    <span class="page-link">Previous</span>
	                </li>
	            `;
	            
	            if(listSize ==0){
	            	paginationHTML += `
                        <li class="page-item active" aria-current="page">
                            <span class="page-link" onclick="changePage(1)">1</span>
                        </li>
                    `;
	            }

	            for (let i = 1; i <= pages; i++) {
	                if (i === 1) {
	                    paginationHTML += `
	                        <li class="page-item" aria-current="page">
	                            <span class="page-link" onclick="changePage(\${i})">\${i}</span>
	                        </li>
	                    `;
	                } else {
	                    paginationHTML += `
	                        <li class="page-item" onclick="changePage(\${i})">
	                            <span class="page-link">\${i}</span>
	                        </li>
	                    `;
	                }
	            }

	            paginationHTML += `
	                <li class="page-item disabled" id="nextButton">
	                    <a class="page-link" href="#" onclick="nextPage()">Next</a>
	                </li>
	            `;

	            paginationContainer.innerHTML = paginationHTML;

	           
			}
		});
	};
	
	function changePage(page) {
	    currentPage = page;
	    updatePageButtons();
	    msgList(currentPage);
	}

	function updatePageButtons() {
	    const pageItems = document.querySelectorAll(".page-item");
	    
	    pageItems.forEach(item => {
	        item.classList.remove("active");
	    });

	    const currentPageItem = document.querySelector(`.page-item:nth-child(\${currentPage + 1})`);
	    currentPageItem.classList.add("active");
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
	
	// 쪽지삭제
	const deleteMsg = (msgId, page) =>{
		$.ajax({
			url: "${pageContext.request.contextPath}/message/messageDelete.do",
			data :{
				messageId : msgId
			},
			method : "GET",
			dataType : "json",
			success(responseData){
				msgList(page);
				$('#messageDetail').modal('hide');
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

	const deleteMember = () => {
		
		const result = confirm('정말 탈퇴하시겠습니까?');
		if (result === true) {
			document.memberDeleteFrm.submit();
		}
	};
	
	// 회원 관련 기능 끝


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
	
</script>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
