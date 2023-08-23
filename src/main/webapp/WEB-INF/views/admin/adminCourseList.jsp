<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp" %>

<section>
	<!-- 과정 등록 -->
	<div style="margin: 30px 0 0 330px;" class="flex">
		<button style="width:100px;" class="addCourse btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#addCourse">
			과정 등록
		</button>
	</div>
	<!-- 과정 등록 모달 -->
	<div class="modal fade" id="addCourse" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	        	<div class="modal-header">
	        	<h1 class="modal-title fs-5" id="exampleModalLabel">과정 등록</h1>
	        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      	</div>
	      	<form:form name="addCourseFrm">
		    	<div class="modal-body">
					<div class="mb-3">
				  		<p>과목 선택</p>
					  	<select class="form-select" name="subject" aria-label="Default select example">
							<option selected>과목</option>
						  	<option value="자바">자바</option>
						  	<option value="정보보안">정보보안</option>
						</select>
					</div>
				  	<div class="mb-3">
					    <label for="exampleInputEmail1" class="form-label">과정명</label>
					    <input type="email" class="form-control" id="curriculumName" aria-describedby="emailHelp">
				    <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
				  	</div>
				  	<div class="mb-3">
				  		<p>반 선택</p>
					  	<select class="form-select" name="classId" aria-label="Default select example">
							<option selected>반</option>
						  	<c:forEach items="${khClasses}" var="khClass">
						  		<option value="${khClass.classId}">${khClass.classId}</option>
						  	</c:forEach>
						</select>
				  	</div>
				  	<div class="mb-3">
					    <p>강사 선택</p>
					  	<select class="form-select" name="teacherId" aria-label="Default select example">
							<option selected>강사</option>
						  	<c:forEach items="${teachers}" var="teacher">
						  		<option value="${teacher.memberId}">${teacher.memberName}(${teacher.memberId})</option>
						  	</c:forEach>
						</select>
				  	</div>
				  	<div class="mb-3">
				  		<p>시작일</p>
				    	<input type="date" class="form-control" id="startDate">
				  	</div>
				  	<div class="mb-3">
					  	<p>수료일</p>
					    <input type="date" class="form-control" id="endDate">
					</div>
		       </div>
		       <div class="modal-footer">
		       		<button type="button" class="courseReg btn btn-primary">등록</button>
		      </div>
		  </form:form>
	    </div>
	  </div>
	</div>
	<!-- 과정 목록 검색 -->
    <div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
    	<div class="card-header flex" id="todayIssueHeader">
			<div class="d-flex justify-content-between align-items-center" >
				<span class="mb-0" style="font-weight: 900;">과정 목록 &nbsp;&nbsp;&nbsp;</span>
			    	<div id="search-container">
			        	<form action="">
			                <div class="d-flex align-items-center">
			                    <div class="flex" style="width:450px;">
								    <input type="checkbox" name="subjects" value='자바' id="student_type0" ${param.subjects eq '자바' ? 'checked' : ''}/>
								    <label for="student_type0">자바</label>&nbsp;&nbsp;
								    <input type="checkbox" name="subjects" value='정보보안' id="student_type1" ${param.subjects eq '정보보안' ? 'checked' : ''}/>
								    <label for="student_type1">정보보안</label>&nbsp;
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
			<!-- 과정 목록 -->
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
                          	<th scope="col">수정</th>
                      	</tr>
                  	</thead>
                  	<tbody>
	              		<c:if test="${curriculumList != null}">
		                  	<c:forEach items="${curriculumList}" var="curriculum" varStatus="vs">
		                    	<tr data-bs-toggle="modal" data-bs-target="#myModal" data-teachername="${curriculum.memberName}" data-classid="${curriculum.classId}" data-curriculumid="${curriculum.curriculumId}" data-handle="@mdo">
		                        	<td>${(currentPage-1) * 10 + vs.index + 1}</td>
		                          	<td>${curriculum.subject}</td>
		                          	<td>${curriculum.curriculumName}</td>
		                          	<td>${curriculum.classId}</td>
		                          	<td>${curriculum.memberName}</td>
		                          	<td>${curriculum.curriculumStartAt}</td>
		                          	<td>${curriculum.curriculumEndAt}</td>
		                          	<td>
		                          		<button id="updateButton" type="button" style="border: 0; background-color: transparent;" class="open-modal-button" 
		                          				data-bs-toggle="modal" data-bs-target="#updateCurriculumModal" 
		                          				data-button-subject="${curriculum.subject}" data-curriculumname="${curriculum.curriculumName}" 
		                          				data-button-classid="${curriculum.classId}" data-button-teachername="${curriculum.memberName}" data-button-teacherid="${curriculum.teacherId}"
		                          				data-button-startdate="${curriculum.curriculumStartAt}" data-button-enddate="${curriculum.curriculumEndAt}">
		                          			✏️
		                          		</button>
		                        	</td>
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
      <!-- 학생 정보 모달 -->
      <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      	  <div class="modal-dialog modal-lg modal-dialog-centered">
          	  <div class="modal-content">
              	  <div class="modal-header">
                  	  <h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
                      	  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                      <div style="width:600px; margin:auto;">
                   		  <div class="border rounded-4" style="padding:30px;">
                      		  <p id="teacherName">강사: </p>
                      		  <table class="table text-center">
		                      	  <thead>
		                      		  <tr>
		                      			  <th>#</th>
		                      			  <th>이름</th>
		                      			  <th>연락처</th>
		                      			  <th>이메일</th>
		                      		  </tr>
		                      	  </thead>
                      			  <tbody id="studentInfoTable">
                      		
                      			  </tbody>
                      		  </table>
                   	  	  </div>
                      </div>
                  </div>
                  <!-- 모달의 나머지 부분은 동일하게 유지 -->
              </div>
          </div>
      </div>
      <!-- 과정 수정 모달 -->
      <div class="modal fade" id="updateCurriculumModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  	  <div class="modal-dialog">
		      <div class="modal-content">
		          <div class="modal-header">
		              <h1 class="modal-title fs-5" id="exampleModalLabel">과정 수정</h1>
		        	      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      	  </div>
		      		  <form:form name="addCourseFrm">
		    			  <div class="modal-body">
							  <div class="mb-3">
				  				  <p>과목 선택</p>
					  			  <select class="form-select" name="subject" aria-label="Default select example">
									  <option selected>과목</option>
						  			  <option value="자바">자바</option>
						  			  <option value="정보보안">정보보안</option>
								  </select>
							  </div>
				  			  <div class="mb-3">
					    		  <label for="exampleInputEmail1" class="form-label">과정명</label>
					    		  <input type="email" class="form-control" id="curriculumName" aria-describedby="emailHelp">
				    		  <!-- <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div> -->
				  			  </div>
				  			  <div class="mb-3">
				  				  <p>반 선택</p>
					  			  <select class="form-select" name="classId" aria-label="Default select example">
									  <option selected>반</option>
						  			  <c:forEach items="${khClasses}" var="khClass">
						  				  <option value="${khClass.classId}">${khClass.classId}</option>
						  			  </c:forEach>
								  </select>
				  			  </div>
				  			  <div class="mb-3">
					    		  <p>강사 선택</p>
					  			  <select class="form-select" name="teacherId" aria-label="Default select example">
									  <option selected>강사</option>
						  			  <c:forEach items="${teachers}" var="teacher">
						  				  <option value="${teacher.memberId}">${teacher.memberName}(${teacher.memberId})</option>
						  			  </c:forEach>
								  </select>
				  			  </div>
				  			  <div class="mb-3">
				  				  <p>시작일</p>
				    			  <input type="date" class="form-control" id="startDate">
				  			  </div>
				  			  <div class="mb-3">
					  			  <p>수료일</p>
					    		  <input type="date" class="form-control" id="endDate">
							  </div>
		       					  </div>
		      	 			  <div class="modal-footer">
		       					  <button type="button" class="courseReg btn btn-primary">수정</button>
		      				  </div>
		  				  </form:form>
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
      
      $(document).ready(function() {
    	    $('.table tbody tr').click(function() {
    	        const classId = $(this).data('classid');
    	        console.log(classId);
    	        const curriculumId = $(this).data('curriculumid');
    	        console.log(curriculumId);
    	        const teacherName = $(this).data('teachername');
    	        document.querySelector("#teacherName").innerHTML = '강사 : ' + teacherName;
    	        
    	        // AJAX 요청
    	        $.ajax({
    	            type: 'GET',
    	            url: "${pageContext.request.contextPath}/admin/adminCourseList.do",
    	            data: {
    	            	classId,
    	            	curriculumId
    	            },
    	            dataType:"json",
    	            success:  function(data){
    	                // data에는 서버로부터 받아온 데이터가 들어있습니다.
    	                // 이를 이용하여 모달 창에 내용을 채우는 작업을 수행할 수 있습니다.
    	                // 예: 모달 띄우기 및 데이터 채우기 함수 호출
    	                console.log("success");
    	            	console.log(data);
    	                openModalWithData(data)
    	            },
    	            error : function(error){
    	            	console.log("error");
    	            	console.log(error);
    	            }
    	            
    	        });
    	    });
      
    	    
    	    function openModalWithData(data) {
    	        // 모달 띄우고 데이터를 채우는 작업을 수행하는 함수 구현
    	        // 예: 모달 내용에 데이터 채우기
    	    	// 모달을 열기 위한 JavaScript 코드
                
                // 모달 내용을 채우는 JavaScript 코드
                var studentInfoTable = $('#studentInfoTable');
                studentInfoTable.empty();  // 기존 내용 제거
                
                let i = 1;
                data.forEach(function(student) {
                    var row = $('<tr>');
                    var numCell = $('<td>').text(i++);
                    var nameCell = $('<td>').text(student.memberName);
                    var phoneCell = $('<td>').text(student.memberPhone);
                    var emailCell = $('<td>').text(student.memberEmail);
                    row.append(numCell);
                    row.append(nameCell);
                    row.append(phoneCell);
                    row.append(emailCell);
                    studentInfoTable.append(row);
                });
                
             	// 만약 데이터가 없을 경우 메시지를 표시
                if (data.length === 0) {
                    var row = $('<tr>');
                    var noDataCell = $('<td colspan="4">').text('해당 과정의 학생이 없습니다.');
                    row.append(noDataCell);
                    studentInfoTable.append(row);
                }
    	    }
    	    
    	    $('.courseReg').click(function() {
    	        // Form 데이터 수집
    	        const addCourseFrm = document.addCourseFrm;
    	        const subject = $('select[name=subject]').val();
    	        const curriculumName = $('#curriculumName').val();
    	        const classId = $('select[name=classId]').val();
    	        const teacherId = $('select[name=teacherId]').val();
    	        const startDateAsString = $('#startDate').val(); // 날짜 문자열로 저장
    	        const endDateAsString = $('#endDate').val(); // 날짜 문자열로 저장
    	        
    	        const token = document.addCourseFrm._csrf.value;
    	        
    	        if (confirm("등록 하시겠습니까?")) {
    	        	
	    	        // AJAX를 사용하여 서버에 데이터 전송
	    	        $.ajax({
	    	            type: 'POST', // 전송 방식 (POST)
	    	            url: "${pageContext.request.contextPath}/admin/adminAddCourse.do", // 실제 서버 엔드포인트 URL
	    	            data: {
	    	            	subject,
	    	            	curriculumName,
	    	            	classId,
	    	            	teacherId,
	    	            	startDateAsString,
	    	            	endDateAsString
	    	            }, // 전송할 데이터
	    	            headers: {
	    	                "X-CSRF-TOKEN": token
	    	            },
	    	            success: function(response) {
	    	                // 성공적으로 응답을 받았을 때 실행되는 부분
	    	                alert('새 과정이 등록되었습니다.'); // 서버의 응답 내용을 출력 (개발자 도구에서 확인 가능)
	    	                location.href="${pageContext.request.contextPath}/admin/adminCourseList.do";
	    	            },
	    	            error: function(error) {
	    	                // 오류 발생 시 실행되는 부분
	    	                console.error("error"); // 오류 내용을 출력
	    	            }
	    	        });
    	        }
    	    });
    	    
    	    // 모달이 열릴 때마다 실행되는 이벤트 리스너
    	    $('#updateCurriculumModal').on('show.bs.modal', function (event) {
    	        const button = $(event.relatedTarget); // 클릭한 버튼
    	        const subject = button.data('button-subject'); // 과목 정보 가져오기
    	        const curriculumName = button.data('curriculumname'); // 과정명 정보 가져오기
    	        const classId = button.data('button-classid'); // 반 정보 가져오기
    	        const teacherName = button.data('button-teachername'); // 강사 정보 가져오기
    	        const startDate = button.data('button-startdate'); // 시작일 정보 가져오기
    	        const endDate = button.data('button-enddate'); // 수료일 정보 가져오기
    	        const teacherId = button.data('button-teacherid');
    	        
    	        console.log(button);
    	        console.log('subject='+subject);
    	        console.log('curriculumName='+curriculumName);
    	        console.log('classId='+classId);
    	        console.log('teacherName='+teacherName);
    	        console.log('startDate='+startDate);
    	        console.log('endDate='+endDate);
    	        console.log('teacherId='+teacherId);
    	        
    	        // 모달 내부의 필드에 가져온 정보 입력하기
    	        const modal = $(this);
    	        modal.find('select[name="subject"]').val(subject);
    	        modal.find('#curriculumName').val(curriculumName);
    	        modal.find('select[name="classId"]').val(classId);
    	        modal.find('select[name="teacherId"]').val(teacherId);
    	        modal.find('#startDate').val(startDate);
    	        modal.find('#endDate').val(endDate);
    	    });
    	    
    	    /* // 수정 버튼 클릭 시에 실행되는 이벤트 리스너
    	    $('.courseReg').click(function() {
    	        // 수정된 정보 수집 및 AJAX 요청 등 처리
    	        // ...
    	    }); */
    	    
    	});
      
      
      $(document).ready(function() {
    	   
    	});
</script>