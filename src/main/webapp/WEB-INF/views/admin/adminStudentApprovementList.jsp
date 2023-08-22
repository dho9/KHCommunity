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
			        <span class="mb-0" style="font-weight: 900;">수강생 미승인 목록 &nbsp;&nbsp;&nbsp;</span>
			    </div>
		  </div>
          <div class="card-body" id="todayIssueBody">
              <table class="table table-hover text-center">
                  <thead>
                      <tr>
                          <th scope="col">#</th>
                          <th scope="col">ID</th>
                          <th scope="col">이름</th>
                          <th scope="col">승인 신청일</th>
                          <th scope="col">학생타입</th>
                      </tr>
                  </thead>
                  <tbody>
                  <c:if test="${students != null}">
                  	<c:forEach items="${students}" var="student" varStatus="vs">
                      <tr data-bs-toggle="modal" data-bs-target="#myModal" data-row-id="${vs.count}" data-first-id="${student.studentId}" data-second-name="${student.memberName}" data-studentType="${student.studentType eq 'c' ? '예비생' : student.studentType eq 's'? '수강생' : '수료생'}" data-handle="@mdo">
                          <td>${vs.count}</td>
                          <td>${student.studentId}</td>
                          <td>${student.memberName}</td>
                          <td>${student.approveRequestDate}</td>
                          <td>${student.studentType eq 'c' ? '예비생' : student.studentType eq 's'? '수강생' : '수료생'}</td>
                      </tr>
                  	</c:forEach>
                  </c:if>
                  <c:if test="${students == null }">
                  	<tr>
                  		<td colspan="5">조회된 수강생이 없습니다.</td>
                  	</tr>
                  </c:if>
                  </tbody>
              </table>
              <br>
		    <!-- 페이지 이동 및 페이지 번호 표시 -->
				<div class="d-flex justify-content-center">
				    <nav aria-label="Page navigation">
				        <ul class="pagination">
				            <c:if test="${currentPage > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/admin/adminStudentApprovementList.do?page=${currentPage - 1}" aria-label="Previous">
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
				                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/adminStudentApprovementList.do?page=${pageNum}">${pageNum}</a></li>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				            
				            <c:if test="${currentPage < totalPages}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/admin/adminStudenApprovementtList.do?page=${currentPage + 1}" aria-label="Next">
				                        <span aria-hidden="true">&raquo;</span>
				                    </a>
				                </li>
				            </c:if>
				        </ul>
				    </nav>
				</div>
			</div>
      </div>
      <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl" style="width: 1200px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-md-6">
                        <iframe class="border rounded-4" src="${pageContext.request.contextPath}/resources/pdf/쓰리고근로계약서.pdf" style="width: 100%; height: 500px;"></iframe>
                    </div>
                    <div class="col-md-6">
                   	  <div class="border rounded-4" style="padding:30px;">
                      <form:form id="dataForm" method="POST" name="modalFrm" action="${pageContext.request.contextPath}/admin/adminStudentUpdate.do" style="font-size: 20px;">
                          <input type="hidden" name="rowId" id="modalRowId">
                          ID : <input type="text" name="firstId" id="modalFirstId" readonly> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
                          이름 : <input type="text" name="secondName" id="modalSecondName" readonly> <br>
                          <input type="hidden" id="modalCurriculumId">
                          커리큘럼
                          <br>
                          <select name="khCurriculum" id="khCurriculum">
						      <c:forEach items="${curriculums}" var="curriculum">
						          <option value="${curriculum.curriculumId}" ${khCurriculum eq curriculum.curriculumId ? 'selected' : '' }>
						              ${curriculum.curriculumId} : ${curriculum.curriculumName}(${curriculum.classId}, ${curriculum.teacherId}) 수료일: ${curriculum.curriculumEndAt}
						          </option>
						      </c:forEach>
						  </select>
                          <hr>
                          <button class="btn btn-primary" type="button" id="btnOk">승인</button> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                          <button class="btn btn-danger" type="button" id="btnNo">반려</button> 
                      </form:form>
                   	  </div>
                    </div>
                  </div>
                </div>
                <!-- 모달의 나머지 부분은 동일하게 유지 -->
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
      
      // 테이블 row 클릭시 모달 창에 나오는 데이터 처리
      document.addEventListener("DOMContentLoaded", function () {
        const tableRows = document.querySelectorAll("tr[data-bs-toggle='modal']");
    
        tableRows.forEach((row) => {
          row.addEventListener("click", function () {
            const rowId = row.getAttribute("data-row-id");
            const firstId = row.getAttribute("data-first-id");
            const secondName = row.getAttribute("data-second-name");
            const studentCurriculumId = row.getAttribute("data-curriculum-id");
    
            // 모달 내의 입력 필드에 데이터 설정
            document.getElementById("modalRowId").value = rowId;
            document.getElementById("modalFirstId").value = firstId;
            document.getElementById("modalSecondName").value = secondName;
            document.getElementById("modalCurriculumId").value = studentCurriculumId;
          });
        });
      
        // 승인 버튼 클릭 이벤트 처리
        $("#btnOk").on("click", function () {
          showConfirmation("${pageContext.request.contextPath}/admin/adminStudentApprovementOk.do");
        });
    
        // 반려 버튼 클릭 이벤트 처리
        $("#btnNo").on("click", function () {
          showConfirmation("${pageContext.request.contextPath}/admin/adminStudentApprovementNo.do");
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
          const studentId = modalFrm.firstId.value;
          const khCurriculum = document.getElementById("khCurriculum");
          const curriculumId = khCurriculum.options[khCurriculum.selectedIndex].value;
    	  console.log(studentId);
          const token = document.modalFrm._csrf.value;
          console.log(url);
          $.ajax({
            type: "POST",
            url: url, // 수정 또는 강퇴에 따라 다른 URL 지정
            data: {
            	studentId,
            	curriculumId
            },
            headers: {
                "X-CSRF-TOKEN": token
            },
            success(responseData) {
              // 서버 응답을 처리
              // 예: 성공 메시지를 표시하거나 다른 동작 수행
              
              alert('성공적으로 처리되었습니다.')
              location.href="${pageContext.request.contextPath}/admin/adminStudentApprovementList.do";
            }
          });
        }
      });
</script>