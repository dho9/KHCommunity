<%@page import="java.time.LocalDate"%>
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
p.adminInfo{color:#606060; font-size: 20px; display: inline-block; margin:0px 10px;}
span.classInfo{font-size: 1.3rem; border-right: 2px solid #cecece}
h2.classInfo{font-weight: bold; color:royalblue;}
p.infoTitles{color:#3c3c3c; font-size: 1.4rem;}
.classInfo{display: inline-block; margin:0px 10px;}

/*  메세지 css */
@font-face { font-family: 'Pretendard-Regular'; src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff'); font-weight: 400; font-style: normal;}
#messageBoxDiv,#messageDetail,#reportModal{font-family: 'Pretendard-Regular'; text-align: center; font-weight: 100;}
.truncate-text,#fileName {max-width: 80px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; cursor: pointer; display: inline-block;}
#messageDetail,#reportModal,#vacationModal,#studentsModal {background-color: rgba(0, 0, 0, 0.2);}
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

/* 휴가 css */
#vacationModal label{font-family: 'GmarketSansMedium'; font-size: 20px; font-weight: bold; color: #26426e; display:inline-block; width: 28%; border-right: 2px solid #cecece; margin-right: 40px;}
.vcContent{font-family: 'GmarketSansMedium'; font-size: 20px; display:inline-block; color:#606060;}
#studentsModal .modal-content{font-family: 'Pretendard-Regular'; width: 150%; margin-left: -20%;}
#vacationModal .modal-dialog{width: 700px; height: 500px;}
/* #studentsModalContent{width: 1000px;} */
</style>

<section>

	<!-- 상단 파란부분 div  -->
	<div id= "top-container">
	</div>
	

	<!-- 회원정보 및 버튼 div  -->
	<div id= "side-container">
		<div id="profile-container">	
			<sec:authentication property="principal" var="loginMember"/>
			<c:if test="${not empty adminInfo}">
	  			<img id="profile" alt="profile" src="${pageContext.request.contextPath}/resources/images/emp.png">
			</c:if>
			<c:if test="${fn:contains(loginMember.authorities, 'TEACHER')}">
				<img id="profile" alt="profile" src="${pageContext.request.contextPath}/resources/images/teacher.png">
			</c:if>
		</div>
		
		<div id="underProfile-container">
			<h2 id="profileName">${loginMember.name}님 </h2>
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
			<c:if test="${fn:contains(loginMember.authorities, 'TEACHER')}">
				<p class="mypageBtn" id="studentsList"><i class="bi bi-people-fill"></i> &nbsp;&nbsp; 학생조회</p>
				<hr class="myPageHr"/>
			</c:if>
	
		</div>
		<form:form name ="memberLogoutFrm" 
        	action="${pageContext.request.contextPath}/member/memberLogout.do" 
        	method="POST">
		</form:form>
	</div>


 	<!-- 메인 div 시작 -->
	<div id= "main-container">
	
		<!-- 관리자 div -->
		<c:if test="${not empty adminInfo}">
		<div class="mypageContent">
			<span class="classInfo">나의 정보 &nbsp;&nbsp;&nbsp;</span>
			<span class="classInfo">${adminInfo.jobCode}팀 &nbsp;&nbsp;&nbsp;</span>
			<p class="adminInfo">입사일 : ${adminInfo.employeeEnrollDate} </p>
			<p class="adminInfo" id="daysFromEnrollDate"></p>
		</div>
		</c:if>
		<!-- 선생님 정보 -->
		<c:if test="${fn:contains(loginMember.authorities, 'TEACHER')}">
			<div class="mypageContent">
				<span class="classInfo">진행중인 수업 정보 &nbsp;&nbsp;&nbsp;</span>
				<p class="classInfo" id="teacherClassInfoContainer">
					<c:forEach items="${employeeInfo}" var="info">
			      		<c:set var="now" value="<%= LocalDate.now() %>" />
				      		<c:if test="${info.curriculumStartAt.compareTo(now) <= 0 && info.curriculumEndAt.compareTo(now) >= 0}">
								<span id="teacherClassInfo"> ${info.subject} ${info.curriculumName} Class ${info.classId}</span>				      			
				      			<c:set var="culId" value="${info.curriculumId}" />
				      		</c:if>
			   		 </c:forEach>
		   		 </p>
			</div>
		</c:if>
		
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
				
			<!--식권페이징  -->
			<div class="d-flex justify-content-center">
				   
				        <ul class="pagination">
				            <c:if test="${currentPage > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/member/myPage.do?page=${currentPage - 1}" aria-label="Previous">
				                        <span aria-hidden="true">&laquo;</span>
				                    </a>
				                </li>
				            </c:if>
				            
				            <c:forEach var="pageNum" begin="1" end="${totalPages}">
				                <c:choose>
				                    <c:when test="${pageNum eq currentPage}">
				                        <li class="page-item active"><a class="page-link" href="#">${pageNum}</a></li>
				                    </c:when>
				                    <c:otherwise>
				                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/member/myPage.do?page=${pageNum}">${pageNum}</a></li>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				            
				            <c:if test="${currentPage < totalPages}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/member/myPage.do?page=${currentPage + 1}" aria-label="Next">
				                        <span aria-hidden="true">&raquo;</span>
				                    </a>
				                </li>
				            </c:if>
				        </ul>
				</div>
			</div>
		</div>	
		
		<c:if test="${fn:contains(loginMember.authorities, 'TEACHER')}">
			<div class="mypageContent">
			
				<p class="infoTitles"><i class="bi bi-list-task"></i> &nbsp;휴가신청 목록</p>
				<div class="myPageDivs" id="vacationList" >	
					<table class="table table-hover" id="vacationTbl">
						<thead>
						<tr>
							<th>신청번호</th>
							<th>학생 아이디</th>
							<th>이름</th>
							<th>휴가 시작일</th>
							<th>휴가 종료일</th>
							<th>첨부파일명</th>
						</tr>	
						</thead>
	 					<tbody id= "messageBoxTbl">
							<c:if test="${empty vacationApprove }">
								<tr>
									<td colspan="5" class="text-center">조회된 휴가신청 내역이 없습니다.</td>
								
								</tr>
								</c:if>
						 	<c:if test="${not empty vacationApprove}">
								<c:forEach items="${vacationApprove}" var="vacationApprove" varStatus="vs">
									<tr class="vacationRow">
										<td>${vacationApprove.vacationId}</td>
										<td>${vacationApprove.studentId}</td>
										<td>${vacationApprove.memberName}</td>
										<td>${vacationApprove.vacationStartDate}</td>
										<td>${vacationApprove.vacationEndDate}</td>
										<td id="fileName">${vacationApprove.vacationRenamedFilename}</td>
									</tr>
								</c:forEach>
						 	</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
			
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
	
	<!-- 학생 휴가 모달 -->
	<div id="vacationModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-xl" style="width: 1200px;">
	    	<div class="modal-content">
	    	<div class="modal-header">
		        <h1 class="modal-title fs-5">휴가신청 상세보기</h1>
		        <button type="button" class="btn-close vacationClose" data-bs-dismiss="modal" aria-label="Close"></button>
		    </div>
	    	<div class="modal-body">
			    <form:form 
			    	id="vacationForm"
			    	name="vacationForm"
			    	action="${pageContext.request.contextPath}/member/vacationApprove.do"
			    	method="post"
			    >
				  <div class="row">
				  	  <div class="col-md-6">
				  	  	  <br/><br/>
					      <input type="hidden" name="vacationId" id="vacationId" value=""> 
					      <input type="hidden" name="approveResult" id="approveResult" value="">
					      <br/>
					      <label for="vcId">휴가신청 번호  </label>
					      <span id="vcId" class="vcContent" ></span>
					      <br/><br/>
					      <label for="vcStudentId">신청자 아이디  </label>
					      <span id="vcStudentId" class="vcContent" ></span>
				     	  <br/><br/>
				     	  <label for="vcStudentName">신청자 이름 </label>
					      <span id="vcStudentName" class="vcContent" ></span>
				     	  <br/><br/>
				     	  <label for="vcStart" >휴가 시작일 </label>
					      <span id="vcStart" class="vcContent" ></span>
				     	  <br/><br/>
				     	  <label for="vcEnd">휴가 종료일 </label>
					      <span id="vcEnd" class="vcContent" ></span>
					      <br/><br/>
				     	  <label for="studentRenamedFilename">첨부파일명 </label>
					      <span id="studentRenamedFilename" class="vcContent"></span>
				     	  <br/><br/>
				      </div>
				      <div class="col-md-6"> 
			     	  	  <iframe id="studentPdf" class="border rounded-4" src="${pageContext.request.contextPath}/resources/images/vacationSubmitUpload/" style="width: 100%; height: 500px;"></iframe>
				  	  	  <br/><br/>
				  	  </div>
				  </div>
			      <hr class="myPageHr"/>
			      <div id="modalBtns">
			      	<button class="btn btn-outline-primary" type="submit" id="vcApprove">&nbsp;&nbsp;&nbsp;승인&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;
					<button class="btn btn-primary" type="submit" id="vcReturn">&nbsp;&nbsp;&nbsp;반려&nbsp;&nbsp;&nbsp;</button>
				  </div>
			      
			    </form:form>
			    </div>
		    </div>
		</div>
	</div>	
	
	
	
	<!-- 학생 목록 모달 -->
	<div id="studentsModal" class="modal fade" role="dialog">
		<div class="modal-dialog" id="studentsModalContent">
		    	<div class="modal-content">
			    	<div class="modal-header">
				        <h1 class="modal-title fs-5">학생목록</h1>
				        <button type="button" class="btn-close studentsClose" data-bs-dismiss="modal" aria-label="Close"></button>
				    </div>
			    	<div class="modal-body">
					    <table class="table table-hover" id="vacationTbl">
							<thead>
							<tr>
								<th>No</th>
								<th>이름</th>
								<th>전화</th>
								<th>이메일</th>
								<th>과목</th>
								<th>과정명</th>
							</tr>	
							</thead>
	 	 					<tbody id= "messageBoxTbl">
	 							<c:if test="${empty studentList}">
									<tr>
										<td colspan="5" class="text-center">조회된 학생 목록이 없습니다.</td>
									</tr>
								</c:if>
							 	<c:if test="${not empty studentList}">
							 	
									<c:forEach items="${studentList}" var="studentList" varStatus="vs">
										<c:if test="${studentList.curriculumId eq culId}">
											<tr class="studentRow">
												<td>${vs.index + 1}</td>
												<td>${studentList.memberName}</td>
												<td>${studentList.memberPhone}</td>
												<td>${studentList.memberEmail}</td>
												<td>${studentList.subject}</td>
												<td>${studentList.curriculumName}</td>
											</tr>
										</c:if>
									</c:forEach>
							 	</c:if>
							</tbody> 
						</table>
					</div>
			    </div>
	
		</div>
	</div>
		
</selction>
<script>

	window.onload=()=>{
		msgList(1);
		enrollDate();
		teacherInfo();

	};
	
	document.getElementById("logoutBtn").addEventListener("click", function(event) {
		memberLogoutFrm.submit();
	});
	
	const enrollDate = () =>{
		const enrollDateStr = "${adminInfo.employeeEnrollDate}";
		const enrollDate = new Date(enrollDateStr.replace(/-/g, "/"));

		const currentDate = new Date();

		const timeDiff = currentDate.getTime() - enrollDate.getTime();
		const daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
		
	    const daysFromEnrollDate = document.getElementById("daysFromEnrollDate");
		if(daysFromEnrollDate) {
			daysFromEnrollDate.innerHTML ="총 근무일수 ( " + daysDiff + "일 )";
			
		}
		
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
	document.querySelector(".vacationClose").onclick=()=>{		
		$("#vacationModal").modal("hide");
	};
	
	document.querySelector(".studentsClose").onclick=()=>{		
		$("#studentsModal").modal("hide");
	};

	const deleteMember = () => {
		
		const result = confirm('정말 탈퇴하시겠습니까?');
		if (result === true) {
			document.memberDeleteFrm.submit();
		}
	};
	

	const teacherInfo = () => {
		
		const teacherClassInfo = document.querySelector("#teacherClassInfo");
		const teacherClassInfoContainer = document.querySelector("#teacherClassInfoContainer");
		if(teacherClassInfoContainer !=null && teacherClassInfo==null){
			teacherClassInfoContainer.innerHTML = `<span id="teacherClassInfo"> 현재 진행중인 수업이 없습니다.</span>`
		}

	}	
	// 회원 관련 기능 끝
	
	
	// 휴가기능
	document.querySelectorAll(".vacationRow").forEach(e => {
		e.addEventListener('click', () => {
			
			const tdElements = e.querySelectorAll('td');
			const vcContents = document.querySelectorAll(".vcContent");
			let studentRenamedFilename ="";
			for(let i = 0; i < tdElements.length; i++){
				console.log(i, tdElements[i]);
				console.log(i, vcContents[i]);
				vcContents[i].innerHTML = tdElements[i].innerHTML;
				studentRenamedFilename = tdElements[tdElements.length -1].innerHTML;
				console.log(tdElements[tdElements.length -1].innerHTML);
			}
			
            const iframe = document.getElementById("studentPdf"); // "iframeElement"을 실제 iframe의 ID로 변경해주세요
            const currentSrc = iframe.src; // 이미 있는 URL 가져오기
            const updatedSrc = currentSrc + studentRenamedFilename; // 기존 URL 뒤에 studentRenamedFilename 추가

            iframe.src = updatedSrc;
            
			vacationId.value = vcContents[0].innerHTML;   
			$("#vacationModal").modal("show");
			
			const result = document.querySelector("#approveResult");
			
			document.querySelector("#vcApprove").onclick=()=>{
				result.value = "2";
			};
			document.querySelector("#vcReturn").onclick=()=>{
				result.value = "0";
			};
			
		});
    });
	
	// 학생 목록 조회
	document.querySelector("#studentsList").onclick=()=>{
		$("#studentsModal").modal("show");
		
	};
	
	
	

</script>	


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
