<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp"%>
<section>
	<div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
    	<div class="card-header flex" id="todayIssueHeader">
			<span class="mb-0" style="font-weight: 900;">휴가 미승인 목록 &nbsp;&nbsp;&nbsp;</span>
		</div>
        <div class="card-body" id="todayIssueBody">
        	<table class="table table-hover text-center">
            	<thead>
                	<tr>
                    	<th scope="col">#</th>
                        <th scope="col">이름</th>
                        <th scope="col">생년월일</th>
                        <th scope="col">교육기간</th>
                        <th scope="col">과정명</th>
                        <th scope="col">반</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${students}" var="student" varStatus="vs">
	                	<fmt:parseDate value="${student.vacationStartDate}" var="startDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${startDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
						<fmt:parseDate value="${student.vacationEndDate }" var="endPlanDate" pattern="yyyy-MM-dd"/>
						<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
						
                    	<tr data-bs-toggle="modal" data-bs-target="#vacationDetailModal" data-row-id="${vs.count}" 
                    		data-vacationid="${student.vacationId}" data-teachername="${student.teacherName}" data-classid="${student.classId}"
                    		data-curriculumname="${student.curriculumName}" data-studentname="${student.memberName}" data-studentid="${student.studentId}"
                    		data-curriculum-startdate="${student.curriculumStartAt}" data-curriculum-enddate="${student.curriculumEndAt}"
                    		data-vacation-senddate="${student.vacationSendDate}" data-vacation-startdate="${student.vacationStartDate}"
                    		data-vacation-enddate="${student.vacationEndDate}" data-teacherid="${student.teacherId}" data-vacation-duration="${endDate - strDate + 1}" data-handle="@mdo">
                        	<td>${(currentPage-1) * 10 + vs.index + 1}</td>
                          	<td>${student.memberName}</td>
                          	<td>${student.birthday}</td>
                          	<td style="width:250px;" >${student.curriculumStartAt} ~ ${student.curriculumEndAt}</td>
                          	<td style="width:300px;">${student.curriculumName}</td>
                          	<td>${student.classId}</td>
                      	</tr>
                  	</c:forEach>
                </tbody>
            </table>
            <br>
		    <!-- 페이지 이동 및 페이지 번호 표시 -->
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
				    	<c:if test="${currentPage > 1}">
				        	<li class="page-item">
				            	<a class="page-link" href="${pageContext.request.contextPath}/admin/adminVacationApprovementList.do?page=${currentPage - 1}" aria-label="Previous">
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
				                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/adminStudentList.do?page=${pageNum}">${pageNum}</a></li>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				            
				        <c:if test="${currentPage < totalPages}">
				            <li class="page-item">
				                <a class="page-link" href="${pageContext.request.contextPath}/admin/adminStudentList.do?page=${currentPage + 1}" aria-label="Next">
				                    <span aria-hidden="true">&raquo;</span>
				                </a>
				            </li>
				        </c:if>
				    </ul>
				</nav>
			</div>
		</div>
    </div>
    <!-- 휴가 상세보기 모달창 -->
    <div class="modal fade" id="vacationDetailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h1 class="modal-title fs-5" id="exampleModalLabel">휴가 승인</h1>
        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<form:form name="modalFrm">
	      			<div class="modal-body">
	        			<div>
	        				<span id="modalCurriculumName" style="font-size:17px; font-weight:700;"></span> <br>
	        				<span id="modalClassId" style="font-size:12px; color:darkgrey;"></span>
	        				<span id="modalEducateDuration" style="font-size:13px; color:darkgrey;"></span>
	        			</div> <br>
	        			<div>
		        			<p>이름: <span id="modalStudentName"></span>(<span id="modalStudentId"></span>)</p>
		        			<p>1차 승인자(강사): <span id="modalTeacherName"></span></p>
		        			<p>휴가 신청일: <span id="modalVacationSendDate"></span></p>
		        			<p>휴가일: <span id="modalVacationDate"></span>&nbsp;
		        			(<span id="modalVacationDuration"></span>일)</p>
		        			<input type="hidden" id="modalVacationId" name="vacationId">
		        			<input type="hidden" id="modalVacationStartDate" name="vacationStartDate">
		        			<input type="hidden" id="modalVacationEndDate" name="vacationEndDate">
	        			</div>
	      			</div>
	      			<div class="modal-footer">
	        			<button type="button" id="btnOk" class="btn btn-primary">승인</button>
	        			<button type="button" id="btnNo" class="btn btn-danger">반려</button>
	      			</div>
      			</form:form>
    		</div>
  		</div>
  	</div>
</section>
<script>
	$(function() {
		var accordionButton = $('.list .items > .a_title');
		accordionButton.on('click', function(e) {
			e.preventDefault();
			var $this = $(this);
			var target = $this.parent();
			var description = $this.siblings('.a_content');
			var other = target.siblings('.items');
			var otherDescription = other.find('.a_content');
			accordionToggle(target, description, other, otherDescription);
		});

		function accordionToggle(target, description, other, otherDescription) {
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
		}
		;
	});
	
	// 테이블 row 클릭시 모달 창에 나오는 데이터 처리
    document.addEventListener("DOMContentLoaded", function () {
      const tableRows = document.querySelectorAll("tr[data-bs-toggle='modal']");
  
      tableRows.forEach((row) => {
        row.addEventListener("click", function () {
          const curriculumName = row.getAttribute("data-curriculumname");
          const curriculumStartAt = row.getAttribute("data-curriculum-startdate");
          const curriculumEndAt = row.getAttribute("data-curriculum-enddate");
          const classId = row.getAttribute("data-classid");
          const studentName = row.getAttribute("data-studentname");
          const teacherName = row.getAttribute("data-teachername");
          const teacherId = row.getAttribute("data-teacherid");
          const vacationSendDate = row.getAttribute("data-vacation-senddate");
          const vacationStartDate = row.getAttribute("data-vacation-startdate");
          const vacationEndDate = row.getAttribute("data-vacation-enddate");
          const vacationDuration = row.getAttribute("data-vacation-duration");
          const vacationId = row.getAttribute("data-vacationid");
          const studentId = row.getAttribute("data-studentid");
  
          // 모달 내의 입력 필드에 데이터 설정
          document.getElementById("modalCurriculumName").innerHTML = curriculumName;
          document.getElementById("modalClassId").innerHTML = classId  + " / ";
          document.getElementById("modalEducateDuration").innerHTML = curriculumStartAt + " ~ " + curriculumEndAt;
          document.getElementById("modalStudentName").innerHTML = studentName;
          document.getElementById("modalTeacherName").innerHTML = teacherName + "(" + teacherId + ")";
          document.getElementById("modalVacationSendDate").innerHTML = vacationSendDate;
          document.getElementById("modalVacationDate").innerHTML = vacationStartDate + " ~ " + vacationEndDate;
          document.getElementById("modalVacationDuration").innerHTML = vacationDuration;
          document.getElementById("modalVacationId").value = vacationId;
          document.getElementById("modalStudentId").innerHTML = studentId;
          document.getElementById("modalVacationStartDate").value = vacationStartDate;
          document.getElementById("modalVacationEndDate").value = vacationEndDate;
        });
      });
    
      // 승인 버튼 클릭 이벤트 처리
      $("#btnOk").on("click", function () {
        showConfirmation("${pageContext.request.contextPath}/admin/adminVacationOk.do");
      });
  
      // 반려 버튼 클릭 이벤트 처리
      $("#btnNo").on("click", function () {
        showConfirmation("${pageContext.request.contextPath}/admin/adminVacationNo.do");
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
        const studentId = document.getElementById("modalStudentId").innerHTML;
        const vacationId = modalFrm.vacationId.value;
        const vacationStartDate = modalFrm.vacationStartDate.value;
        const vacationEndDate = modalFrm.vacationEndDate.value;
        
        console.log(modalFrm);
        console.log(studentId);
        console.log(vacationId);
        
        const token = document.modalFrm._csrf.value;
        
        $.ajax({
          type: "POST",
          url: url, // 승인 또는 반려에 따라 다른 URL 지정
          data: {
          	studentId,
          	vacationId,
          	vacationStartDate,
          	vacationEndDate
          },
          headers: {
              "X-CSRF-TOKEN": token
          },
          success(responseData) {
            // 서버 응답을 처리
            // 예: 성공 메시지를 표시하거나 다른 동작 수행
            
            alert('성공적으로 처리되었습니다.')
            location.href="${pageContext.request.contextPath}/admin/adminVacationApprovementList.do";
          },
          error(error) {
        	  console.log("실패")
          }
        });
      }
      
    });
</script>
</body>
</html>