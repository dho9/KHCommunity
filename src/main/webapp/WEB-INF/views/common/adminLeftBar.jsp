<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
    <link rel="stylesheet" href="https://naver.github.io/billboard.js/release/latest/dist/theme/datalab.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css" />
    <title>KH Time AdminPage</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://naver.github.io/billboard.js/release/latest/dist/billboard.pkgd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <sec:authorize access="hasAuthority('ADMIN')">
		<script>
		const memberId = '<sec:authentication property="principal.username"/>';
		</script>
		<script>
			console.log('Hello stomp.js');
			const ws = new SockJS(`http://localhost:8080/kh/ws`); // endpoint
			const stompClient = Stomp.over(ws);
		
			stompClient.connect({}, (frame) => {
				console.log('open : ', frame);
				
				// 구독신청 
				stompClient.subscribe('/topic/admin', (message) => {
					console.log('/topic/admin : ', message);
					renderMessage(message);
				});
			});
			
			// /topic/admin으로 알림을 보내면 실행되는 함수
			const renderMessage = (message) => {
				const {chatId, content, createdAt} = JSON.parse(message.body);
				console.log(chatId, content, createdAt);
				
				const $liveToast = $("#liveToast");
				$liveToast.find(".toast-text").html(content);
				const acceptButton = $("<button>").attr({
			        type: "button",
			        class: "btn btn-primary btn-sm"
			    }).text("수락").click(() => {
			        const newWindow = window.open("${pageContext.request.contextPath}/chat/chatConsultingRequest.do?chatId=" + chatId, '_blank');
			        if (newWindow) {
			            newWindow.focus();
			        }
			    });
				$liveToast.find(".border-top").html(acceptButton);
				
				const toastBootstrap = bootstrap.Toast.getOrCreateInstance($liveToast);
				toastBootstrap.show()
			}
			
			
		</script>
</sec:authorize>
  </head>
  <body>
  <div class="toast-container position-fixed bottom-0 end-0 p-3">
  		<div id="liveToast" role="alert" aria-live="assertive" aria-atomic="true" class="toast" data-bs-autohide="false">
    		<div class="toast-header">
      		<img style="width:60px;" src="${pageContext.request.contextPath}/resources/images/kh admin logo.png" class="rounded me-2">
      			<strong class="me-auto">KH TIME 알림</strong>
      			<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
    		</div>
    		<div class="toast-body">
      			<div class="toast-text">
      			
      			</div>
      			<div class="mt-2 pt-2 border-top">
     				
    			</div>
    		</div>
  		</div>
	</div>
    <section class="mainSection">
      <div class="leftBar">
        <div class="logo">
          <img src="${pageContext.request.contextPath}/resources/images/kh admin logo.png">
        </div>
        <hr />
        <di class="goToMainSite">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-square" viewBox="0 0 16 16">
              <path
                fill-rule="evenodd"
                d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.854 8.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707l-4.096 4.096z"
              />
            </svg>
          </span>
          <a href="${pageContext.request.contextPath}" >사이트 바로가기</a>
        </di>
        <hr />
        <h5 style="padding-left: 20px; padding-top: 10px; font-weight: 800;">사이트 관리</h5>
        <div class="dashboard">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-grid" viewBox="0 0 16 16">
              <path
                d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"
              />
            </svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/adminMain.do">대시보드</a>
        </div>
        <div class="memberManagement">
          <div class="wrap">
            <ul class="list">
              <li class="items">
                <div class="a_title">
                  <span style="color:white;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                      <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z" />
                      <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"                      />
                    </svg>
                  </span>
                  <a href="">사용자 관리</a>
                  <span style="color:white;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                      <path
                        d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                      />
                    </svg>
                  </span>
                </div>
                <div class="a_content">
                  <div class="userManagement">
                    <span style="color:white;" width="16" height="16">
                      👨‍🎓 수강생 관리
                    </span>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;" width="16" height="16">
                      - ✔
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/adminStudentList.do">수강생 관리</a>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;" width="16" height="16">
                      - 📋                    </span>
                    <a href="${pageContext.request.contextPath}/admin/adminStudentApprovementList.do">수강생 승인</a>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;">
                      - 🗓
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/adminVacationApprovementList.do">수강생 휴가 관리</a>
                  </div>
                  <div class="userManagement">
                    <span style="color:white;" width="16" height="16">
                      👩‍🏫 강사 관리
                    </span>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;" width="16" height="16">
                      - ✔
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/teacherList.do">강사 관리</a>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;" width="16" height="16">
                      - ➕
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/insertTeacher.do">강사 등록</a>
                  </div>
                  <div class="riderManagement">
                    <span style="color:white;">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
                      </svg>
                      직원 관리
                    </span>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;" width="16" height="16">
                      - ✔
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/employeeList.do">직원 관리</a>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;" width="16" height="16">
                      - ➕
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/insertMember.do">직원 등록</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="reportManagement">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart-steps" viewBox="0 0 16 16">
  				<path d="M.5 0a.5.5 0 0 1 .5.5v15a.5.5 0 0 1-1 0V.5A.5.5 0 0 1 .5 0zM2 1.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5v-1zm2 4a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1zm2 4a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-6a.5.5 0 0 1-.5-.5v-1zm2 4a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1z"/>
			</svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/adminCourseList.do">과정 등록/조회</a>
        </div>
        <div class="reportManagement">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
			  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/writeNotice.do">공지사항 작성</a>
        </div>
        <div class="reportManagement">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-dots" viewBox="0 0 16 16">
              <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
              <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
            </svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/adminChatList.do">채팅 조회</a>
        </div>
        <div class="reportManagement">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
              <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
            </svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/reportList.do">신고 관리</a>
        </div>
        <div class="reportManagement">
          <span>
           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-text" viewBox="0 0 16 16">
			  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
			  <path d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
			</svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/myClassBoardList.do">우리반게시판 관리</a>
        </div>
        <hr>
        
        <div class="reportManagement">
          <span>
            🍜
          </span>
          <a href="${pageContext.request.contextPath}/admin/adminStoreList.do">식당 관리</a>
        </div>
      </div>
    </section>
    
      <section style="width: 1630px">
        <nav class="navbar bg-light" style="margin-left: 330px">
          <div class="container-fluid">
            <span class="navbar-brand" style="font-weight: 700;">KH 타임</span>
          </div>
        </nav>
      </section>
      
      