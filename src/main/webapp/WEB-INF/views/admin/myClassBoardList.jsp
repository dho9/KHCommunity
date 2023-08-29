<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp" %>
    <section>
      <div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
          <div class="card-header flex" id="todayIssueHeader">
			    <div class="d-flex justify-content-between align-items-center" >
			        <span class="mb-0" style="font-weight: 900;">게시판 목록 &nbsp;&nbsp;&nbsp;</span>
			        <div id="search-container">
			        </div>
			    </div>
			</div>
          <div class="card-body" id="todayIssueBody">
              <table class="table table-hover text-center">
                  <thead>
                      <tr>
                          <th scope="col">#</th>
                          <th scope="col">반</th>
                          <th scope="col">담당 강사</th>
                          <th scope="col">과목</th>
                          <th scope="col">과정명</th>
                          <th scope="col">개강일</th>
                          <th scope="col">수료일</th>
                      </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${teachers}" var="teacher" varStatus="vs">
                      <tr>
                          <td>${(currentPage-1) * 10 + vs.index + 1}</td>
                          <td>${teacher.memberId}</td>
                          <td>${teacher.memberName}</td>
                          <td>${teacher.memberPhone}</td>
                          <td>${teacher.memberEmail}</td>
                          <td>
                            <button id="messageButton" type="button" style="border: 0; background-color: transparent;" class="open-modal-button" data-bs-toggle="modal" data-bs-target="#sendMessageModal"
				                    data-teacher-id="${teacher.memberId}" data-teacher-name="${teacher.memberName}">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                                <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                              </svg>
                            </button>
                          </td>
                      </tr>
                  	</c:forEach>
                  </tbody>
              </table>
              <br>
          </div>
      </div>
    </section>
    
    <script>
    
      document.addEventListener("DOMContentLoaded", function () {
        const tableRows = document.querySelectorAll("tr[data-bs-toggle='modal']");
    
        tableRows.forEach((row) => {
          row.addEventListener("click", function () {
            const rowId = row.getAttribute("data-row-id");
            const firstId = row.getAttribute("data-first-id");
            const secondName = row.getAttribute("data-second-name");
            const phone = row.getAttribute("data-phone");
            const birthday = row.getAttribute("data-birthday");
            const email = row.getAttribute("data-email");
            const lastDay = row.getAttribute("data-lastDay");
            const subject = row.getAttribute("data-subject");
            const handle = row.getAttribute("data-handle");
            // 모달 내의 입력 필드에 데이터 설정
            document.getElementById("modalRowId").value = rowId;
            document.getElementById("modalFirstId").value = firstId;
            document.getElementById("modalSecondName").value = secondName;
            document.getElementById("modalPhone").value = phone;
            document.getElementById("modalBirthday").value = birthday;
            document.getElementById("modalEmail").value = email;
            document.getElementById("modalLastDay").value = lastDay;
            document.getElementById("subject1").checked = (subject === "자바");
            document.getElementById("subject2").checked = (subject === "정보보안");
          });
        });
    
        // 수정 버튼 클릭 이벤트 처리
        $("#btnEdit").on("click", function () {
          showConfirmation("${pageContext.request.contextPath}/admin/adminTeacherUpdate.do");
        });
    
        // 강퇴 버튼 클릭 이벤트 처리
        $("#btnBan").on("click", function () {
          showConfirmation("${pageContext.request.contextPath}/admin/adminTeacherDelete.do");
        });
    
        // 확인 메시지 표시 후 데이터 전송 함수 호출
        function showConfirmation(url) {
          if (confirm("정말로 진행하시겠습니까?")) {
            sendDataToServer(url);
          }
        }
    
        // 서버로 데이터를 전송하는 함수
        function sendDataToServer(url) {
          const modalFrm = document.modalFrm;
          const memberId = modalFrm.firstId.value;
          const subject = modalFrm.subject.value;
          const token = document.modalFrm._csrf.value;
          console.log(subject);
          $.ajax({
            type: "POST",
            url: url, // 수정 또는 강퇴에 따라 다른 URL 지정
            data: {
            	memberId,
            	subject
            },
            headers: {
                "X-CSRF-TOKEN": token
            },
            success(responseData) {
              // 서버 응답을 처리
              // 예: 성공 메시지를 표시하거나 다른 동작 수행
              
              alert('요청된 작업이 완료되었습니다.')
              location.href="${pageContext.request.contextPath}/admin/teacherList.do";
            }
          });
        }
        
		const sendButton = document.querySelectorAll("#messageButton");
        sendButton.forEach((e) => {
           e.addEventListener("click", function () {
                const receiveId = e.getAttribute("data-teacher-id");
                
                document.getElementById("receiveTeacher").value = receiveId;                  
           })
        });
        
      });
    </script>
    <footer></footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
    </script>
  </body>
</html>
