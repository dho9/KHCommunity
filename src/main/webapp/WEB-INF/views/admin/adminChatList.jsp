<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp" %>

<section>
	<div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
   		<div class="card-header flex">
			<span class="mb-0" style="font-weight: 900;">상담 목록 &nbsp;&nbsp;&nbsp;</span>
		</div>
 			<div class="card-body" id="todayIssueBody">
				<table class="table table-hover text-center">
    	           	<thead>
        	           	<tr>
                        	<th scope="col">#</th>
                          	<th scope="col">상담자(ID)</th>
                          	<th scope="col">상담유형</th>
                          	<th scope="col">상담일자</th>
                        	<th scope="col">과정명</th>
                          	<th scope="col">반</th>
                          	<th scope="col">학생타입</th>
                          	<th scope="col">상담내역</th>
                      	</tr>
                  	</thead>
                  	<tbody>
					    <c:forEach items="${adminChatList}" var="chatList" varStatus="vs">
					        <tr>
					            <td>${(currentPage-1) * 10 + vs.index + 1}</td>
					            <td>${chatList.studentName}(${chatList.studentId})</td>
					            <td>${chatList.chatType}</td>
					            <td>${chatList.chatDate}</td>
					            <td>${chatList.curriculumName}</td>
					            <td>${chatList.classId}</td>
					            <td>${chatList.studentType eq 'c' ? '예비생' : chatList.studentType eq 's'? '수강생' : '수료생'}</td>
					            <td>
					                <button type="button" class="btn btn-outline-primary" id="chatView"
					                        style="--bs-btn-padding-y: .0rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;"
					                        data-bs-toggle="modal" data-bs-target="#chatModal"
					                        data-chatid="${chatList.chatId}">
					                    보기
					                </button>
					            </td>
					        </tr>
					    </c:forEach>
					</tbody>
            	</table>
            	<br>
            	<div class="d-flex justify-content-center">
				    <nav aria-label="Page navigation">
				        <ul class="pagination">
				            <c:if test="${currentPage > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/admin/adminChatList.do?page=${currentPage - 1}" aria-label="Previous">
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
				                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/adminChatList.do?page=${pageNum}">${pageNum}</a></li>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				            
				            <c:if test="${currentPage < totalPages}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/admin/adminChatList.do?page=${currentPage + 1}" aria-label="Next">
				                        <span aria-hidden="true">&raquo;</span>
				                    </a>
				                </li>
				            </c:if>
				        </ul>
				    </nav>
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
</section>
	
<script>
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
      
const chatViewButtons = document.querySelectorAll("#chatView");
chatViewButtons.forEach(button => {
    button.addEventListener("click", function () {
        const chatId = this.getAttribute("data-chatid");
        console.log(chatId);
        // 채팅 메시지를 가져오기 위한 AJAX 요청 수행
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/admin/chatView.do",
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
      
</script>
</body>
</html>