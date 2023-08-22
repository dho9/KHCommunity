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
			        <span class="mb-0" style="font-weight: 900;">과정 목록 &nbsp;&nbsp;&nbsp;</span>
			        <div id="search-container">
			            <form action="">
			                <div class="d-flex align-items-center">
			                    <div class="flex" style="width:600px;">
								    <input type="checkbox" name="subjects" value='자바' id="student_type0" ${param.subjects eq '자바' ? 'checked' : ''}/>
								    <label for="student_type0">자바</label>&nbsp;&nbsp;
								    <input type="checkbox" name="subjects" value='정보보안' id="student_type1" ${param.subjects eq '정보보안' ? 'checked' : ''}/>
								    <label for="student_type1">정보보안</label>&nbsp;&nbsp;
								</div>
			                    <select class="form-select" aria-label="Default select example" name="searchType" required>
			                        <option value="" disabled selected>검색타입</option>
			                        <option value="class_id" ${param.searchType eq 'class_id' ? 'selected' : '' }>반 이름</option>
			                        <option value="member_name" ${param.searchType eq 'member_name' ? 'selected' : '' }>강사 이름</option>
			                        <option value="curriculum_end_at" ${param.searchType eq 'curriculum_end_at' ? 'selected' : '' }>수료일</option>
			                    </select>
			                    <div class="input-group">
			                    	&nbsp;
			                        <input type="search" class="form-control" name="searchKeyword" aria-describedby="button-addon2" value="${param.searchKeyword}">
			                        <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
			                    </div>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
          <div class="card-body" id="todayIssueBody">
              <table class="table table-hover text-center">
                  <thead>
                      <tr>
                          <th scope="col">#</th>
                          <th scope="col">과목</th>
                          <th scope="col">과정명</th>
                          <th scope="col">반</th>
                          <th scope="col">강사</th>
                          <th scope="col">시작일</th>
                          <th scope="col">수료일</th>
                      </tr>
                  </thead>
                  <tbody>
	                  <c:if test="${curriculumList != null}">
	                  	<c:forEach items="${curriculumList}" var="curriculum" varStatus="vs">
	                      <tr data-bs-toggle="modal" data-bs-target="#myModal" data-row-id="${vs.count}" data-first-id="${student.studentId}" data-second-name="${student.memberName}" data-studentType="${student.studentType eq 'c' ? '예비생' : student.studentType eq 's'? '수강생' : '수료생'}" data-handle="@mdo">
	                          <td>${(currentPage-1) * 10 + vs.index + 1}</td>
	                          <td>${curriculum.subject}</td>
	                          <td>${curriculum.curriculumName}</td>
	                          <td>${curriculum.classId}</td>
	                          <td>${curriculum.memberName}</td>
	                          <td>${curriculum.curriculumStartAt}</td>
	                          <td>${curriculum.curriculumEndAt}</td>
	                      </tr>
	                  	</c:forEach>
	                  </c:if>
	                  <c:if test="${curriculumList == null }">
	                  	<tr>
	                  		<td colspan="5">조회된 과정이 없습니다.</td>
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
				                    <a class="page-link" href="${pageContext.request.contextPath}/admin/adminCourseList.do?page=${currentPage - 1}" aria-label="Previous">
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
				                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/adminCourseList.do?page=${pageNum}">${pageNum}</a></li>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				            
				            <c:if test="${currentPage < totalPages}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/admin/adminCourseList.do?page=${currentPage + 1}" aria-label="Next">
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
</script>