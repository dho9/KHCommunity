<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- bootstrap icon css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<%-- 글작성 아이콘 --%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<style>
.new {
	text-decoration: none;
}
#alarmTextBox{
	font-size:15px;
	display: inherit;
    padding-top: 27px;
    width: 150px;
    justify-content: center;
    align-items: center;
}

#alarmContentBox {
	font-size:10px;
	border:2px solid black;
	border-radius:15px;
	padding:10px;
	margin-top:5px;
	width:fit-content;
	margin-right:30px;
	opacity:0;
	transition: opacity 0.5s ease;
}

#alarmImgBox {
	cursor:pointer;
}

#alarmBox.show-content #alarmContentBox{
	
	opacity:1;
}

#alarmImg {
  transform-origin: top;
}

@keyframes bell{
  0%, 50%{
	transform: rotate(0deg);
	}
  5%, 15%, 25%, 35%, 45% {
	transform: rotate(13deg);
  }
  10%, 20%, 30%, 40% {
	transform: rotate(-13deg);
  }
}
</style>



<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style.css" />
<title>KH소통할까?</title>
<meta charset="utf-8">
<meta name="referrer" content="origin">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%-- 
<link type="text/css" href="/css/common.css" rel="stylesheet">
<link type="text/css" href="/css/common.partial.css" rel="stylesheet">
<link type="text/css" href="/css/container.community.css" 
--%>
	
<link href="/favicon.ico" rel="shortcut icon">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>KH소통할까?</title>
    <meta charset="utf-8">
    <meta name="referrer" content="origin">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%-- 
    <link type="text/css" href="/css/common.css" rel="stylesheet">
    <link type="text/css" href="/css/common.partial.css" rel="stylesheet">
    <link type="text/css" href="/css/container.community.css" rel="stylesheet"> 
    --%>
    <link href="/favicon.ico" rel="shortcut icon">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<c:if test="${not empty msg }">
	<script>
		alert('${msg}'); 
	</script>
</c:if>

<%-- codemirror js --%>
<script src="${ pageContext.request.contextPath }/resources/js/codemirror-5.65.14/lib/codemirror.js"></script>
<%-- codemirror sql.js addon --%>
<script src="${ pageContext.request.contextPath }/resources/js/codemirror-5.65.14/mode/sql/sql.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/codemirror-5.65.14/mode/clike/clike.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/codemirror-5.65.14/mode/javascript/javascript.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/codemirror-5.65.14/mode/htmlmixed/htmlmixed.js"></script>
<%-- codemirror css --%>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/js/codemirror-5.65.14/lib/codemirror.css">
<%-- codemirror theme --%>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/js/codemirror-5.65.14/theme/eclipse.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/js/codemirror-5.65.14/theme/dracula.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/showForm.js"></script>
    <body>
    <nav>
        <div class="wrap">
            <div id="logo">
               <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/로고.png"
                        style="width: 160px; height: 100px; z-index: 1; margin-top: -74%; margin-left: 27%;"></a>
            </div>
            <div id="account" style="display:flex;">
            	<sec:authorize access="hasAuthority('ADMIN')">
	            	<a href="${pageContext.request.contextPath}/admin/adminMain.do" target="_blank" style="text-decoration: none; width:60px; font-size: 1px;">
	            		관리자페이지
	            	</a>
            	</sec:authorize>
            	<sec:authorize access="isAuthenticated()">
            		<div style="width:65px;" id="alarmBox">
            			<div id="alarmImgBox" style="display:flex; padding-top:10px;">
            				<img id="alarmImg" style="width:30px;" alt="" src="${pageContext.request.contextPath}/resources/images/alarmicon.png">
							
            			</div>
            			<div id="alarmContentBox" style="background-color:white;">
            				
            			</div>
            		</div>
            	</sec:authorize>
            	<sec:authorize access="!isAuthenticated()">
	               <a href="${pageContext.request.contextPath}/member/memberLogin.do" title="로그인" class="icon message">로그인</a>
    	           <a href="${pageContext.request.contextPath}/member/memberCreate.do" title="회원가입" class="icon my">회원가입</a>
            	</sec:authorize>

            </div>
            <ul id="menu">
                <li id="BoardHeaderBtn"><a href="#" style="text-decoration: none;">게시판</a></li>
                <li><a href="${pageContext.request.contextPath}/board/noticeBoardList.do" style="text-decoration: none;">공지사항</a></li>
                <li id="myClass" style="cursor: pointer;"><a>우리반</a></li>
                <li><a href="${pageContext.request.contextPath}/board/jobSearchBoardList.do" style="text-decoration: none;">취업</a></li>
                <li><a href="${pageContext.request.contextPath}/store/storeList.do" style="text-decoration: none;">식권</a></li>
                <li><a href="${pageContext.request.contextPath}/board/studyBoardList.do" style="text-decoration: none;">스터디</a></li>
                <li><a href="${pageContext.request.contextPath}/calendar/calendar.do?method=list" style="text-decoration: none;">스케쥴</a></li>
            </ul>
        </div>
    </nav>
    <div id="submenu">
    <!-- style="display: none;" -->
		<div class="wrap" id="boardSubmenu">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/board/freeBoardList.do"
						class="new" style="text-decoration: none;">자유게시판</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/marketBoardList.do"
						class="new"style="text-decoration: none;"> 장터게시판</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/todayFoodBoardList.do"
						class="new" style="text-decoration: none;">오늘 뭐 먹지?</a></li>
				</ul>

			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				<li><a href="${pageContext.request.contextPath}/board/sharingInformationBoardList.do" class="new" style="text-decoration: none;">정보공유</a></li>
				<li><a href="${pageContext.request.contextPath}/board/askCodeBoardList.do" class="new" style="text-decoration: none;">코드질문</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				<li><a href="${pageContext.request.contextPath}/board/graduateBoardList.do" class="new" style="text-decoration: none;">수료생게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/board/preStudentBoardList.do" class="new" style="text-decoration: none;">예비생게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/board/employeeBoardList.do" class="new" style="text-decoration: none;">직원 게시판</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<hr>
		</div>
	</div>
	<div id="jangjun">
	<sec:authentication property="principal" var="loginMember" />
	<script>
	document.querySelector('#myClass').addEventListener('click', () => {
		const _memberId = '<sec:authentication property="name"/>';
		const _authority = '<sec:authentication property="authorities"/>';
 	    const memberId = _memberId.replace(/&#64;/g, '@');
 	    const authority = _authority.replace(/&#91;/g, '').replace(/&#93;/g, '');
		console.log('!!!!!!!!', authority);
	    if(_memberId === 'anonymousUser') {
	        alert('로그인이 필요합니다.');
	    }
        else {
        	if(authority === 'STUDENT') {
        		console.log('학생입니다.');
		        $.ajax({
		           url : "${pageContext.request.contextPath}/member/findStudentType.do",
		           data : {
		               memberId : memberId
		           },
		           success(responseData) {
		               const {student} = responseData;
		               const {curriculumId, studentType, boardId} = student;
		               if(studentType != 's' || boardId == 0) {
		                   alert('수강중인 학생만 이용가능합니다.');
		               }
		               else {
		                   window.location.href = "${pageContext.request.contextPath}/board/myClassBoardList.do?boardId=" + boardId;
		               }
		           }
		        });
        	}
        	else {
        		console.log('직원입니다.');
        		$.ajax({
 		           url : "${pageContext.request.contextPath}/member/findTeacher.do",
 		           data : {
 		               memberId : memberId
 		           },
 		           success(responseData) {
 		               const {teacher} = responseData;
 		               console.log(teacher);
 		               const {boardId} = teacher;
	        		   window.location.href = "${pageContext.request.contextPath}/board/myClassBoardList.do?boardId=" + boardId;
 		           }
 		        });
        	}
        }
   });
	
	document.querySelector('#BoardHeaderBtn').onclick = () => {
        const boardSubmenu = document.getElementById('boardSubmenu');
          boardSubmenu.classList.toggle('show');
     };
     document.querySelector('#boardSubmenu').mouseleave =() => {
        const boardSubmenu = document.getElementById('boardSubmenu');
        boardSubmenu.style.display = 'none';
        boardSubmenu.style.animation = '';
          
     };

	
	</script>
	<sec:authorize access="isAuthenticated()">
		<script>
			const memberId = '<sec:authentication property="principal.username"/>';
			
			$(document).ready(function() {
			    // 알림 데이터를 가져와서 헤더에 표시
			    fetchNotifications();
			    
			    const alamText = document.querySelector("#alarmContent");
			    
			});
			
			function fetchNotifications() {
				$.ajax({
					type:"GET",
					url: "${pageContext.request.contextPath}/common/header.do",
					data: {
						memberId
					},
					success: function(data) {
						console.log("성공")
						renderNotifications(data);
					},
					error: function() {
						console.log("실패")
					}
				});
			 }
			
			function renderNotifications(notifications) {
				
				const alarmImgBox = document.querySelector("#alarmImgBox");
				let hasUnreadNotification = false; // 읽지 않은 알림이 있는지 확인하는 플래그

				  
				notifications.forEach(notification => {
					const { alarmId, content, readCheck, alarmType } = notification;
					
					const alarmContentBox = document.querySelector("#alarmContentBox");
					const alarmContent = document.createElement('div');
					const contentBr = document.createElement('br');
					alarmContent.style.borderRadius = "10px";
				    
					const uniqueId = Math.random().toString(36).substring(2, 15);
					
				    if (readCheck === 'n') {
				    	hasUnreadNotification = true;
				    	
				    	if(alarmType === 'm'){
				    		alarmContent.innerHTML = `
					    		<form:form name="readCheckFrm">
							    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
							        	✉️ 쪽지 <br>
							        	\${content}
							      	</div>
							        <button type="button" id="isChecked-\${uniqueId}">확인</button>
					    		</form:form>
						    `;
				    	} else if(alarmType === 'r') {
				    		alarmContent.innerHTML = `
				    			<form:form name="readCheckFrm">
							    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
							        	⛔ 신고 <br>
							        	\${content}
							      	</div>
							      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
					    		</form:form>
						    `;
				    	} else if(alarmType === 'c') {
				    		alarmContent.innerHTML = `
				    			<form:form name="readCheckFrm">
							    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
							        	🌐 댓글 <br>
							        	\${content}
							      	</div>
							      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
					    		</form:form>
						    `;
				    	} else if(alarmType === 'a') {
				    		alarmContent.innerHTML = `
				    			<form:form name="readCheckFrm">
							    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
							        	✔️ 승인관련 <br>
							        	\${content}
							      	</div>
							      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
					    		</form:form>
						    `;
				    	} else if(alarmType === 'v') {
				    		alarmContent.innerHTML = `
				    			<form:form name="readCheckFrm">
							    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
							        	🗓️ 휴가관련 <br>
							        	\${content}
							      	</div>
							      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
					    		</form:form>
						    `;
				    	}else if(alarmType ==='s'){
				    		alarmContent.innerHTML = `
				    			<form:form name="readCheckFrm">
							    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
							        	✏ 스터디 <br>
							        	\${content}
							      	</div>
							      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
					    		</form:form>
						    `;
				    	}
				    	
				    } else {
				    	
				    	if(alarmType === 'm') {
				    		alarmContent.innerHTML = `
						    	<div id="alarmContent" style="border:2px solid grey; color:grey; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
						        	✉️ 쪽지 <br>
						        	\${content}
						      	</div>
						    `;
				    	} else if(alarmType === 'r') {
				    		alarmContent.innerHTML = `
						    	<div id="alarmContent" style="border:2px solid grey; color:grey; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
						        	⛔ 신고 <br>
						        	\${content}
						      	</div>
						    `;			    		
			    		} else if(alarmType === 'c') {
			    			alarmContent.innerHTML = `
						    	<div id="alarmContent" style="border:2px solid grey; color:grey; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
						        	🌐 댓글 <br>
						        	\${content}
						      	</div>
						    `;
			    		} else if(alarmType === 'a') {
			    			alarmContent.innerHTML = `
						    	<div id="alarmContent" style="border:2px solid grey; color:grey; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
						        	✔️ 승인관련 <br>
						        	\${content}
						      	</div>
						    `;
			    		} else if(alarmType === 'v') {
			    			alarmContent.innerHTML = `
						    	<div id="alarmContent" style="border:2px solid grey; color:grey; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
						        	🗓️ 휴가관련 <br>
						        	\${content}
						      	</div>
						    `;
			    		} else if(alarmType === 's') {
			    			alarmContent.innerHTML = `
						    	<div id="alarmContent" style="border:2px solid grey; color:grey; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
						    		✏ 스터디 <br>
						        	\${content}
						      	</div>
						    `;
			    		} 
				    }
				    
				    alarmContentBox.appendChild(alarmContent);
				    alarmContentBox.appendChild(contentBr);
				    
					const checkBtn = document.querySelector(`#isChecked-\${uniqueId}`);
					const readCheckFrm = document.readCheckFrm;
					
					if(checkBtn){
						checkBtn.addEventListener("click", function(){
					        	
					        const token = '${_csrf.token}';
					        	
					        $.ajax({
					            type: "POST",
					            url: "${pageContext.request.contextPath}/common/updateAlarmReadCheck.do",
					            data: {
					                alarmId
					            },
					            headers: {
					                "X-CSRF-TOKEN": token
					            },
					            success: function(data) {
					           		alarmContent.style.color="grey";
					                alarmContent.style.borderColor = "grey";
					                checkBtn.style.display="none";
					                alarmImg.style.animation = "";
					                if(alarmType=='s'){
						          		 window.location.href = '/kh/board/studyBoardList.do';
						          	}
					                window.location.href = "/kh/member/myPage.do"; // 원하는 URL로 변경
					            },
					            error: function() {
					                console.log("실패")
					            }
					        });
					    });
					}
					
				});
				
			    
				
				// 읽지 않은 알림이 있는 경우 빨간 동그라미와 애니메이션 효과 표시
				  const alarmImg = document.querySelector("#alarmImg");
				  if (hasUnreadNotification) {
				    const redDiv = document.createElement('div');
				    redDiv.innerHTML = `
				      <div class="red-circle" style="border: 1px solid red; border-radius: 50%; width: 18px; height: 18px; background-color: red; position: absolute; top: 25px; margin-left: -15px; color: white; font-size: 10px; font-weight: 800; text-align: center;">N</div>
				    `;
				    alarmImgBox.appendChild(redDiv);
				    alarmImg.style.animation = "bell 2s infinite linear";
				  } else {
				    alarmImg.style.animation = "none";
				  }
			}
			
			let isContentVisible = false;

			alarmBox.addEventListener("click", function() {
			    if (isContentVisible) {
			        alarmBox.classList.remove("show-content");
			    } else {
			        alarmBox.classList.add("show-content");
			    }
			    
			    isContentVisible = !isContentVisible;
			});
		    
		   
		   
			// 웹소켓 연결
			
			const ws = new SockJS(`http://localhost:8080/kh/ws`); // endpoint
			const stompClient = Stomp.over(ws);
		
			// 만약 연결되면
			stompClient.connect({}, (frame) => {
				console.log('open : ', frame);
				
				// 메세지 알림 받는 구독신청 
				stompClient.subscribe(`/topic/msgnotice/\${memberId}`, (message) => {
					console.log(`/topic/msgnotice/${memberId} : `, message);
					renderMessage(message);
				});
				
				// 댓글, 대댓글 알림 받는 구독신청
				stompClient.subscribe(`/topic/commentNotice/\${memberId}`, (message) => {
					console.log(`/topic/commentNotice/${memberId} : `, message);
					renderMessage(message);
				});
				
				// 수강생 승인 여부 알림 받는 구독신청
				stompClient.subscribe(`/topic/stdAppCheck/\${memberId}`, (message) => {
					console.log(`/topic/commentNotice/${memberId} : `, message);
					renderMessage(message);
				});
				
				// 휴가 처리 관련 알림 받는 구독신청
				stompClient.subscribe(`/topic/vacCheck/\${memberId}`, (message) => {
					console.log(`/topic/commentNotice/${memberId} : `, message);
					renderMessage(message);
				});
			});
			
			const renderMessage = (message) => {
				const {alarmId, sendId, recieveId, content, createdAt, alarmType, postId} = JSON.parse(message.body);
				console.log(sendId, recieveId, content, createdAt, alarmType);
				
				const alarmImgBox = document.querySelector("#alarmImgBox");
				
				const existingRedCircle = alarmImgBox.querySelector(".red-circle");
				
				if (!existingRedCircle) {
				    const redDiv = document.createElement('div');
				    redDiv.innerHTML = `
				        <div class="red-circle" style="border:1px solid red; border-radius:50%; width:18px; height:18px; background-color:red; position:absolute; top:25px; margin-left:-15px; color:white; font-size:10px; font-weight:800; text-align:center;">N</div>
				    `;
				    alarmImgBox.appendChild(redDiv);
				}
				
				const alarmImg = document.querySelector("#alarmImg");

				// 이미 애니메이션이 적용된 상태인지 확인
			    /* const currentAnimation = alarmImg.style.animation;
			    if (!currentAnimation || currentAnimation === 'none') {
			        // 애니메이션이 적용되지 않은 상태라면 애니메이션 추가 */
			        alarmImg.style.animation = "bell 2s infinite linear";
			    /* } */
				
				const alarmContentBox = document.querySelector("#alarmContentBox");
				const alarmContent = document.createElement('div');
				alarmContent.classList.add="alarmContainer"
				const alarmBr = document.createElement('br');
				
				const uniqueId = Math.random().toString(36).substring(2, 15);
				
				if(alarmType === 'm'){
					alarmContent.innerHTML = `
						<form:form name="readCheckFrm">
					    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
					        	✉️ 쪽지 <br>
					        	\${content}
					      	</div>
					        <button type="button" id="isChecked-\${uniqueId}">확인</button>
		    			</form:form>
				    `;
				} else if(alarmType === 'r') {
		    		alarmContent.innerHTML = `
		    			<form:form name="readCheckFrm">	
			    			<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
					        	⛔ 신고 <br>
					        	\${content}
					      	</div>
					      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
				      	</form:form>
				    `;
		    	} else if(alarmType === 'c') {
		    		alarmContent.innerHTML = `
		    			<form:form name="readCheckFrm">	
					    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
					        	🌐 댓글 <br>
					        	\${content}
					      	</div>
					      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
				      	</form:form>
				    `;
		    	} else if(alarmType === 'a') {
		    		alarmContent.innerHTML = `
		    			<form:form name="readCheckFrm">	
					    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
					        	✔️ 승인관련 <br>
					        	\${content}
					      	</div>
					      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
				      	</form:form>
				    `;
		    	} else if(alarmType === 'v') {
		    		alarmContent.innerHTML = `
		    			<form:form name="readCheckFrm">	
					    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
					        	🗓️ 휴가관련 <br>
					        	\${content}
					      	</div>
					      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
				      	</form:form>
				    `;
		    	}else if(alarmType === 's') {
		    		alarmContent.innerHTML = `
		    			<form:form name="readCheckFrm">	
					    	<div id="alarmContent" style="border:2px solid black; border-radius:10px; background-color:white; line-height: 1.6; width: 250px; cursor: pointer; padding: 7px; font-size: 13px; font-weight: 600;">
					        	✏스터디 <br>
					        	\${content}
					      	</div>
					      	<button type="button" id="isChecked-\${uniqueId}">확인</button>
				      	</form:form>
				    `;
		    	}
				
				alarmContentBox.prepend(alarmBr);
				alarmContentBox.prepend(alarmContent);
				
				const checkBtn = document.querySelector(`#isChecked-\${uniqueId}`);
				const readCheckFrm = document.readCheckFrm;
				
				if(checkBtn){
					checkBtn.addEventListener("click", function(){
				      
				    	const token = '${_csrf.token}';
				        	
				        $.ajax({
				            type: "POST",
				            url: "${pageContext.request.contextPath}/common/updateAlarmReadCheck.do",
				            data: {
				                alarmId
				            },
				            headers: {
				                "X-CSRF-TOKEN": token
				            },
				            success: function(data) {
				            	console.log(data+"asdsadsadsadsad");
					           	alarmContent.style.color="grey";
					           	alarmContent.style.borderColor = "grey";
					           	checkBtn.style.display="none";
					           	alarmImg.style.animation = "";
					          	if(alarmType=='s'){
					          		 window.location.href = '/kh/board/studyBoardList.do';
					          	}
				            	
				            },
				            error: function() {
				                console.log("실패")
				            }
				         });
				        
				    });
				}
				
				/* alarmContent.addEventListener('click', () => {
			        // 클릭 시 "마이 페이지"로 이동
			        window.location.href = '/kh/member/myPage.do'; // 실제 주소로 대체해주세요
			    }); */
			    
			}
			
		</script>
	</sec:authorize>
	