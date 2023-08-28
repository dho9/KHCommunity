<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chatReq.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>

	<section style="background-color: #eee;">
  		<div class="container py-5">

    		<div class="row d-flex justify-content-center">
      			<div class="col-md-10 col-lg-8 col-xl-6">

        			<div class="card" id="chat2">
         				<div class="card-header d-flex justify-content-between align-items-center p-3">
           					<h5 class="mb-0">Chat</h5>
           					<sec:authorize access="hasAuthority('ADMIN')">
	           					<form:form name="quitChatFrm">
					        		<button type="button" id="quitChat" class="btn btn-danger btn-sm" data-mdb-ripple-color="dark">채팅 마치기</button>
	           					</form:form>
           					</sec:authorize>
          				</div>
          				<div class="card-body" id="chatBody"data-mdb-perfect-scrollbar="true" style="position: relative; height: 600px; overflow-y:scroll;">

            				
          				</div>
            			<form:form id="chat-form" name="chatFrm">
	          				<input type="hidden" name="loginMemberId" id="loginMemberId" value="${loginMember.username}">
            			</form:form>
        			</div>

				</div>
    		</div>

  		</div>
</section>
<sec:authorize access="hasAuthority('ADMIN')">
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		
	    const chatId = getChatIdFromQueryString(); // URL 쿼리 파라미터로부터 chatId 가져오기
	
	    const chatForm = document.getElementById('chat-form');
	    const sendMsgElement = document.createElement('div');
	    sendMsgElement.innerHTML = '<div class="card-footer text-muted d-flex justify-content-start align-items-center p-3" id="sendImgBox"><img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp" alt="avatar 3" style="width: 40px; height: 100%;"><input type="text" class="form-control form-control-lg" id="message-input" placeholder="Type message"><button>전송</button></div>';
	    chatForm.appendChild(sendMsgElement);
	    
	    
	    // WebSocket 연결
	    const stompClient = Stomp.over(new SockJS('/kh/ws'));
	
	    stompClient.connect({}, (frame) => {
	        console.log('Connected: ' + frame);
	
	        // 특정 주제로 구독신청
	        const topic = '/topic/chat/chatId='+chatId;
	        stompClient.subscribe(topic, (message) => {
	        	const payload = JSON.parse(message.body);
	
	            // 수신한 메시지를 화면에 표시하는 함수 호출
	            displayReceivedMessage(payload.message, payload.createdAt, payload.sender);
	            displayReceivedQuitMsg(payload.quitMsg)
	        });
	        
		    // 저장된 종료 메시지를 가져와서 복원
	        const savedQuitMessage = localStorage.getItem('quitMessage');
	        if (savedQuitMessage) {
	            displayReceivedQuitMsg(savedQuitMessage);
	        }

	        // 저장된 `quitChat` 상태를 가져와서 복원
	        const isQuitChatVisible = localStorage.getItem('quitChatVisible');
	        if (isQuitChatVisible === 'false') {
	            const quitChat = document.getElementById('quitChat');
	            quitChat.style.display = 'none';
	        }
	        
			// 채팅 입력 폼 전송 이벤트 리스너
		    chatForm.addEventListener('submit', (e) => {
		        e.preventDefault();
		        const messageInput = document.getElementById('message-input');
		        const message = messageInput.value;
		        const createdAt =Date.now(); 
		        
		        // 메시지 전송 함수 호출
		        sendMessage(stompClient, message, createdAt);
		
		        // 입력 필드 초기화
		        messageInput.value = '';
		    });
			
			// 채팅 마치기 클릭시 이벤트 리스너
		    const quitChatBtn = document.getElementById('quitChat');
            quitChatBtn.addEventListener('click', () => {
                const inputText = prompt("채팅을 마칩니다. 상담 타입을 작성해주세요");
                if (inputText) {
                    // 사용자로부터 입력받은 텍스트를 서버로 전송하여 DB에 저장
                    sendInputToServer(inputText);
            		
                    const quitMsg = "채팅이 종료되었습니다.";
                    
                    sendQuitMessage(stompClient, quitMsg)
                    
                 }
                    
            });
			
	    });
	});
	
	function sendInputToServer(inputText) {
        const chatId = getChatIdFromQueryString();
        const quitChatFrm = document.forms.quitChatFrm;
        const token = quitChatFrm._csrf.value;

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/chat/updateChatTypeInChatRoom.do",
            data: {
                chatId,
                inputText
            },
            headers: {
                "X-CSRF-TOKEN": token
            },
            success: function(responseData) {
                console.log("성공");
                
            },
            error: function(error) {
                console.error("에러", error);
            }
        });
    }
	
	// 채팅 마치기 버튼을 눌렀을 때
	function sendQuitMessage(stompClient, quitMsg) {
		const chatId = getChatIdFromQueryString();
		const topic = '/topic/chat/chatId='+chatId;
	    const payload = {
	        quitMsg
	    };
	    
	    stompClient.send(topic, {}, JSON.stringify(payload));
	}
	
	//수신한 메시지를 화면에 표시하는 함수
	function displayReceivedQuitMsg(quitMsg) {
		const messageContainer = document.getElementById('chatBody');
    	const messageElement = document.createElement('div');
    	messageElement.innerHTML = '<div class="text-center" style="color:darkgrey;">'+quitMsg+'</div>';
    	messageContainer.appendChild(messageElement);
    	const chatForm = document.getElementById('chat-form');
    	chatForm.innerHTML = '<div class="card-footer text-muted d-flex justify-content-start align-items-center p-3" id="sendImgBox"><input type="text" class="form-control form-control-lg" id="message-input" placeholder="Type message" readonly></div>';
    	
    	const quitChat = document.getElementById('quitChat');
    	quitChat.style.display = 'none';
    	
    	// 종료 메시지를 저장하고 종료 상태를 `localStorage`에 표시
        localStorage.setItem('quitMessage', quitMsg);
        localStorage.setItem('quitChatVisible', 'false');
	}
	
	function sendMessage(stompClient, message, createdAt) {
	    const chatId = getChatIdFromQueryString();
	    const memberId = '<sec:authentication property="principal.username"/>';
	
	    const topic = '/topic/chat/chatId='+chatId;
	    const payload = {
	        messageType: "CHAT_MESSAGE",
	        chatroomId: chatId,
	        sender: 'ADMIN', // 사용자 식별자 가져오기
	        message: message,
	        createdAt: createdAt
	    };
	
	    stompClient.send(topic, {}, JSON.stringify(payload));
	        
	    const chatFrm = document.forms.chatFrm;
	    const token = chatFrm._csrf.value;
	        
	    $.ajax({
	    	type : "POST",
	    	url: "${pageContext.request.contextPath}/chat/insertAdminChatMsg.do",
	    	data :{
	    		chatId,
	    		message,
	    		createdAt
	    	},
	    	headers: {
	               "X-CSRF-TOKEN": token
	        },
	    	success(responseData){
	    		console.log("성공")
	    	}
	    });
	}
	
	//수신한 메시지를 화면에 표시하는 함수
	function displayReceivedMessage(message, createdAt, sender) {
	    const messageContainer = document.getElementById('chatBody');
	    const messageElement = document.createElement('div');

	    if(sender === 'ADMIN') {
	    	messageElement.innerHTML = '<div class="d-flex flex-row justify-content-end mb-4"><div><p style="width:fit-content;" class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">'+message+'</p><p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end">'+createdAt+'</p></div><img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp" alt="avatar 1" style="width: 40px; height: 100%;"></div>';
	    }
	    else if(sender === 'STUDENT'){
	    	messageElement.innerHTML = '<div class="d-flex flex-row justify-content-start mb-4"> <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp" alt="avatar 1" style="width: 40px; height: 100%;"><div><p class="small p-2 ms-3 mb-1 rounded-3" style="width:fit-content; background-color: #f5f6f7;">'+message+'</p><p class="small ms-3 mb-3 rounded-3 text-muted">'+createdAt+'</p></div></div>';
	    }
	    messageContainer.appendChild(messageElement);
	    
	}
	
	function getChatIdFromQueryString() {
	    const urlParams = new URLSearchParams(window.location.search);
	    return urlParams.get('chatId');
	}
	
	</script>
</sec:authorize>
<sec:authorize access="hasAuthority('STUDENT')">
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const chatId = getChatIdFromQueryString(); // URL 쿼리 파라미터로부터 chatId 가져오기
	
	    const chatForm = document.getElementById('chat-form');
	    const sendMsgElement = document.createElement('div');
	    sendMsgElement.innerHTML = '<div class="card-footer text-muted d-flex justify-content-start align-items-center p-3" id="sendImgBox"><img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp" alt="avatar 3" style="width: 40px; height: 100%;"><input type="text" class="form-control form-control-lg" id="message-input" placeholder="Type message"><button>전송</button></div>';
	    chatForm.appendChild(sendMsgElement);
	    
	    console.log(chatId);
	    // WebSocket 연결
	    const stompClient = Stomp.over(new SockJS('/kh/ws'));
	
	    stompClient.connect({}, (frame) => {
	        console.log('Connected: ' + frame);
	
	        // 특정 주제로 구독신청
	        const topic = '/topic/chat/chatId='+chatId;
	        stompClient.subscribe(topic, (message) => {
	        	const payload = JSON.parse(message.body);
	
	            // 수신한 메시지를 화면에 표시하는 함수 호출
	            displayReceivedMessage(payload.message, payload.createdAt, payload.sender);
	            
	            displayReceivedQuitMsg(payload.quitMsg)
	        });
	        
	     	// 저장된 종료 메시지를 가져와서 복원
	        const savedQuitMessage = localStorage.getItem('quitMessage');
	        if (savedQuitMessage) {
	            displayReceivedQuitMsg(savedQuitMessage);
	        }

	        // 저장된 `quitChat` 상태를 가져와서 복원
	        const isQuitChatVisible = localStorage.getItem('quitChatVisible');
	        /* if (isQuitChatVisible === 'false') {
	            const quitChat = document.getElementById('quitChat');
	            quitChat.style.display = 'none';
	        } */
	        
			// 채팅 입력 폼 전송 이벤트 리스너
		    chatForm.addEventListener('submit', (e) => {
		        e.preventDefault();
		        const messageInput = document.getElementById('message-input');
		        const message = messageInput.value;
				const createdAt =Date.now();			
				
		        // 메시지 전송 함수 호출
		        sendMessage(stompClient, message, createdAt);
		
		        // 입력 필드 초기화
		        messageInput.value = '';
		        
		    });
	    });
	    
	    
	});
	
	
	// 채팅 전송 함수
	function sendMessage(stompClient, message, createdAt) {
	    const chatId = getChatIdFromQueryString();
	    const memberId = '<sec:authentication property="principal.username"/>';
	
	   
	        const topic = '/topic/chat/chatId='+chatId;
	        const payload = {
	            messageType: "CHAT_MESSAGE",
	            chatroomId: chatId,
	            
	            sender: 'STUDENT', // 사용자 식별자 가져오기
	            message: message,
	            createdAt: createdAt
	        };
	
	        stompClient.send(topic, {}, JSON.stringify(payload));
	        
	        const chatFrm = document.forms.chatFrm;
	        const token = chatFrm._csrf.value;
	        
	        console.log(token);
	        
	        $.ajax({
	    		type : "POST",
	    		url: "${pageContext.request.contextPath}/chat/insertStudentChatMsg.do",
	    		data :{
	    			chatId,
	    			studentId: memberId,
	    			message,
	    			createdAt
	    		},
	    		headers: {
	                "X-CSRF-TOKEN": token
	            },
	    		success(responseData){
	    			console.log("성공")
	    		}
	    	});
	    
	}
	
	//수신한 메시지를 화면에 표시하는 함수
	function displayReceivedMessage(message, createdAt, sender) {
	    const messageContainer = document.getElementById('chatBody');
	    const messageElement = document.createElement('div');
		
	    if(sender === 'ADMIN') {
	    	messageElement.innerHTML = '<div class="d-flex flex-row justify-content-end mb-4"><div><p style="width:fit-content;" class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary">'+message+'</p><p class="small me-3 mb-3 rounded-3 text-muted d-flex justify-content-end">'+createdAt+'</p></div><img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp" alt="avatar 1" style="width: 40px; height: 100%;"></div>';
	    }
	    else if(sender === 'STUDENT'){
	    	messageElement.innerHTML = '<div class="d-flex flex-row justify-content-start mb-4"> <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp" alt="avatar 1" style="width: 40px; height: 100%;"><div><p class="small p-2 ms-3 mb-1 rounded-3" style="width:fit-content; background-color: #f5f6f7;">'+message+'</p><p class="small ms-3 mb-3 rounded-3 text-muted">'+createdAt+'</p></div></div>';
	    }
	    
	    messageContainer.appendChild(messageElement);
	}
	
	function getChatIdFromQueryString() {
	    const urlParams = new URLSearchParams(window.location.search);
	    return urlParams.get('chatId');
	}
	
	function displayReceivedQuitMsg(quitMsg) {
		const messageContainer = document.getElementById('chatBody');
    	const messageElement = document.createElement('div');
    	messageElement.innerHTML = '<div class="text-center" style="color:darkgrey;">'+quitMsg+'</div>';
    	messageContainer.appendChild(messageElement);
    	const chatForm = document.getElementById('chat-form');
    	chatForm.innerHTML = '<div class="card-footer text-muted d-flex justify-content-start align-items-center p-3" id="sendImgBox"><input type="text" class="form-control form-control-lg" id="message-input" placeholder="Type message" readonly></div>';
	    
    	// 종료 메시지를 저장하고 종료 상태를 `localStorage`에 표시
        localStorage.setItem('quitMessage', quitMsg);
        localStorage.setItem('quitChatVisible', 'false');
	}
	
	</script>
</sec:authorize>
</body>
</html>