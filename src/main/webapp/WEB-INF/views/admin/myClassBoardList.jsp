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
                          <th scope="col">반</th>
                          <th scope="col">담당 강사 ID</th>
                          <th scope="col">과목</th>
                          <th scope="col">과정명</th>
                          <th scope="col">개강일</th>
                          <th scope="col">수료일</th>
                      </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${boardLists}" var="boardList" varStatus="vs">
                      <tr
                      data-bs-toggle="modal" 
                      data-bs-target="#myModal" 
                      data-boardId="${boardList.boardId}" 
                      data-classId="${boardList.classId}" 
                      data-curriculumId="${boardList.curriculumId}" 
                      data-subject="${boardList.subject}" 
                      data-handle="@mdo">
                          <td>${boardList.classId}</td>
                          <td>${boardList.teacherId}</td>
                          <td>${boardList.subject}</td>
                          <td>${boardList.curriculumName}</td>
                          <td>${boardList.curriculumStartAt}</td>
                          <td>${boardList.curriculumEndAt}</td>
                      </tr>
                  	</c:forEach>
                  </tbody>
              </table>
              <br>
          </div>
      </div>
    </section>
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="width:750px;margin:auto;">
                   	  <div class="border rounded-4" style="padding:30px;">
                      <form:form id="dataForm" method="POST" name="modalFrm" action="${pageContext.request.contextPath}/admin/deleteMyClassBoard.do" style="font-size: 20px;">
                          반 : <input type="text" name="classId" id="modalClassId" readonly> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
                          과목 : <input type="text" name="subject" id="subject" readonly> <br>
                          <select class="form-select" name="selectedCurriculumId"  style="margin-top:10px;">
							  <option value="" selected disabled>개강 전 커리큘럼</option>
				  			  <c:forEach items="${curriculums}" var="curriculum">
				  				  <option value="${curriculum.curriculumId}">${curriculum.subject} (${curriculum.curriculumStartAt} ~ ${curriculum.curriculumEndAt})</option>
				  			  </c:forEach>
						  </select>
                          <input type="hidden" name="boardId" id="boardId">
                          <input type="hidden" name="curriculumId" id="curriculumId">
						  <br>
                          <hr>
                          <br>
                      </form:form>
					  <button type="button" style=""class="btn btn-primary" onclick="deleteMyClassBoardForm()">기존 게시판 초기화</button>
                   	  </div>
                    </div>
                </div>
                <!-- 모달의 나머지 부분은 동일하게 유지 -->
            </div>
        </div>
      </div>
    <script>
    
    function deleteMyClassBoardForm() {
        const form = document.getElementById('dataForm');
        
        const selectedCurriculumId = document.querySelector('select[name="selectedCurriculumId"]').value;
        if (!selectedCurriculumId) {
            alert("커리큘럼을 선택해주세요.");
            return;
        }
        
        const hiddenInput = form.querySelector('input[name="selectedCurriculumId"]');
        if (!hiddenInput) {
            // hidden input 설정
            const newHiddenInput = document.createElement("input");
            newHiddenInput.type = "hidden";
            newHiddenInput.name = "selectedCurriculumId";
            newHiddenInput.value = selectedCurriculumId;
        } else {
            hiddenInput.value = selectedCurriculumId;
        }
        
        const confirmed = confirm("게시판을 초기화 하시겠습니까?");
        if (confirmed) {
            form.submit();
        }
    }

    
      document.addEventListener("DOMContentLoaded", function () {
        const tableRows = document.querySelectorAll("tr[data-bs-toggle='modal']");
    
        tableRows.forEach((row) => {
          row.addEventListener("click", function () {
            const classId = row.getAttribute("data-classId");
            const curriculumId = row.getAttribute("data-curriculumId");
            const boardId = row.getAttribute("data-boardId");
            const subject = row.getAttribute("data-subject");
            const handle = row.getAttribute("data-handle");
            // 모달 내의 입력 필드에 데이터 설정
            document.getElementById("modalClassId").value = classId;
            document.getElementById("subject").value = subject;
            document.getElementById("boardId").value = boardId;
          });
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
