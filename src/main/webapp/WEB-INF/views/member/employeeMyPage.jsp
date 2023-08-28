<%@page import="com.kh.app.member.dto.EmployeeInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
	<!-- bootstrap css -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<style>
@font-face {
    font-family: 'HakgyoansimWoojuR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.myPageIcon {width:34%; display:inline-block; padding:10px 0 0 0; font-family: 'HakgyoansimWoojuR'; font-size: 60px; text-align: center; margin: 5%;}
.myPageIcon p {font-family: 'HakgyoansimWoojuR'; font-size: 30px; margin: 7% 0;}
.myPageIcon:hover {border-radius: 10px; background-color: #e3f5fc; cursor: pointer;}
.container-md{display:table-cell; margin-top:2%; border-radius: 30px;}
section {width: 1200px; text-align: center; margin: 2% auto;}
#memberInfo{width: 80%;  height:200px; text-align: left; background-color: #4870ef; display:inline-block; border-radius: 30px; margin-bottom: 60px;}
#memberInfo h2{ font-family: 'HakgyoansimWoojuR'; font-size: 63px; color:white; margin:3%;}
#memberInfo p{ font-family: 'HakgyoansimWoojuR'; font-size: 30px; color:white; margin:2%;}
#memberInfo div{display:inline-block;}
#info-container {width:67%;} 
#dDay {width:30%; height:100%; vertical-align: middle; text-align: center;}
#memberInfo h1{ font-family: 'HakgyoansimWoojuR'; font-size: 80px; color:white;}
.container{display: initial; }


/* 정보수정 폼 */
#update-container {display: flex; justify-content: center; align-items: center; min-height: 57vh; font-family: 'HakgyoansimWoojuR'; }
#delete-container form {font-family: 'HakgyoansimWoojuR'; width: 500px; padding: 78px; background-color: #fff; border-radius: 8px; text-align: left;}
#update-container form {width: 500px; background-color: #fff; border-radius: 8px; text-align: left;}
form tr {margin-bottom: 16px;}
form th {padding-right: 16px;}
input[type="text"], input[type="password"], input[type="date"], input[type="tel"], input[type="email"] {font-size: 16px;padding: 8px; border: 1px solid #ccc; border-radius: 4px; width: 100%;}
input[type="submit"], input[type="reset"] {font-size: 16px;padding: 8px 16px; margin-top: 16px; border: none; border-radius: 4px; background-color: #28a745; color: #fff; cursor: pointer;}
input[type="submit"]:hover, input[type="reset"]:hover { background-color: #218838;}
div#update-container{width: 483px; margin:0 auto; text-align:center;}
div#update-container input, div#update-container select {margin-bottom:10px;}

/*  추가된 css */
#certificationDiv{display:none;} 
#vacationDiv{display:none;} 
#delete-container{display:none;}
#certificationDiv label{ font-size: 50px; color: blue; width:90%}
#certificationDiv h1{font-family: 'HakgyoansimWoojuR'; font-size: 50px; font-weight:bold;}
#certificaitonFrm{width: 90%; font-family: 'HakgyoansimWoojuR'; font-size: 22px; margin:5%;}
#certificaitonFrm div input{font-family: 'HakgyoansimWoojuR'; font-size: 22px; width:68%; display: inline-block;}
.frmStyles{font-family: 'HakgyoansimWoojuR'; font-size: 22px; width:45%; display: inline-block;}
#certificaitonFrm label{font-family: 'HakgyoansimWoojuR'; font-size: 22px; width:18%; display: inline-block;}
#certificaitonFrm div{margin: 5% 0; padding: 3%}
.certiBtn {border-radius: 10px; border: 2px solid #4870ef; background-color: white; color: #4870ef; width:100px; height:40px;}
.fileInput{border: 1px solid black; border-radius: 5px; width: 500px}
.certiBtn:hover{background-color: #4870ef; color: white;} 
/*  추가된 css */

.myPageDivs{width: 90%}

/* 내정보 css시작 */
#myInfo-container h1{font-family: 'HakgyoansimWoojuR'; font-size: 57px; font-weight:bold; padding:65px;}
#myInfo-container p {font-size: 20px; } 
/* 내정보 css끝 */

/*식권구매 css시작*/
#ticketInfo-container {text-align: center; }
#ticketInfo-container h1{padding-left: 95px; font-family: 'HakgyoansimWoojuR'; font-size: 57px; font-weight:bold; padding:65px;}
#ticketInfo-container table {display: table; margin: auto; font-family: 'HakgyoansimWoojuR'; border-collapse: collapse; width: 111%; margin-bottom: 30px;}
#ticketInfo-container th, td {border: 1px solid #e3f5fc; text-align: left; padding: 8px;}
#ticketInfo-container th {background-color: #e3f5fc;}
#ticketInfo-container tr:nth-child(even) {background-color: #e3f5fc;}
#ticketInfo-container tbody .text-center {text-align: center;}
/*식권구매 css끝*/

#messageBoxDiv{ display: none;}

</style>
	<section>
<%-- 	<div id="memberInfo">
	
		<sec:authentication property="principal" var="loginMember"/>
		<div id="info-container">
			<c:if test="${employeeInfo.auth == 'TEACHER'} ">
			<c:forEach items="${employeeInfo}" var="employeeInfo" varStatus="vs">
				<h2><i class="bi bi-bookmark-heart-fill">
				</i>&nbsp;${employeeInfo.employeeId}${employeeInfo.memberName }[${employeeInfo.auth}]</h2>
				
				<p>${employeeInfo.subject}/${employeeInfo.curriculumName} Class${employeeInfo.classId}  권한 :${employeeInfo.auth}</p>
			</c:forEach>
			</c:if>
			
			<c:if test="${employeeInfo.auth == 'ADMIN'}">
				<h2><i class="bi bi-bookmark-heart-fill">
				</i>&nbsp;${employeeInfo.memberName }[${employeeInfo.jobCode}] ${currentDate }</h2>
				<p>${employeeInfo.employeeId} 권한 :${employeeInfo.auth}</p>
				<p></p>
			</c:if>
			
			<a href="${pageContext.request.contextPath}/message/messageSend.do" style="text-decoration: none;">테스트용</a>
		
		</div>
	</div> --%>
	
	<br/>
	<div class="container">

<!-- 	<div class="container-md" style="border: 5px solid #c5d6dc; width: 470px; height:515px; font-size:50px">
		<div id="icons" class="container-fluid">
		<div class="myPageIcon" id="myPageIcon1">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
			<p>내 정보</p>
		</div>	
		<div class="myPageIcon" id="certification">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-fill-check" viewBox="0 0 16 16">
  				<path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.708l.547.548 1.17-1.951a.5.5 0 1 1 .858.514ZM11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
  				<path d="M2 13c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Z"/>
			</svg>
			<p>학생인증</p>
		</div>	
		
		<div class="myPageIcon" id="myPageIcon3">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
 				<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
			</svg>
			<p>정보수정</p>
		</div>	
		
		<div class="myPageIcon"  id="myPageIcon4">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16">
  				<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  				<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
			</svg>
			<p>회원탈퇴</p>
		</div>	
		<div class="myPageIcon" id="myPageIcon5">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-airplane" viewBox="0 0 16 16">
  				<path d="M6.428 1.151C6.708.591 7.213 0 8 0s1.292.592 1.572 1.151C9.861 1.73 10 2.431 10 3v3.691l5.17 2.585a1.5 1.5 0 0 1 .83 1.342V12a.5.5 0 0 1-.582.493l-5.507-.918-.375 2.253 1.318 1.318A.5.5 0 0 1 10.5 16h-5a.5.5 0 0 1-.354-.854l1.319-1.318-.376-2.253-5.507.918A.5.5 0 0 1 0 12v-1.382a1.5 1.5 0 0 1 .83-1.342L6 6.691V3c0-.568.14-1.271.428-1.849Zm.894.448C7.111 2.02 7 2.569 7 3v4a.5.5 0 0 1-.276.447l-5.448 2.724a.5.5 0 0 0-.276.447v.792l5.418-.903a.5.5 0 0 1 .575.41l.5 3a.5.5 0 0 1-.14.437L6.708 15h2.586l-.647-.646a.5.5 0 0 1-.14-.436l.5-3a.5.5 0 0 1 .576-.411L15 11.41v-.792a.5.5 0 0 0-.276-.447L9.276 7.447A.5.5 0 0 1 9 7V3c0-.432-.11-.979-.322-1.401C8.458 1.159 8.213 1 8 1c-.213 0-.458.158-.678.599Z"/>
			</svg>
			<p>휴가신청</p>
		</div>	
		<div class="myPageIcon" id="messageBoxList">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
  				<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
			</svg>
			<p>쪽지함</p>
		</div>	
		
		<div class="myPageIcon" id="myPageIcon7">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
 				<path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
			</svg>
			<p>구매내역</p>
		</div>	

		<div class="myPageIcon">
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-headset" viewBox="0 0 16 16">
				<path d="M8 1a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V6a6 6 0 1 1 12 0v6a2.5 2.5 0 0 1-2.5 2.5H9.366a1 1 0 0 1-.866.5h-1a1 1 0 1 1 0-2h1a1 1 0 0 1 .866.5H11.5A1.5 1.5 0 0 0 13 12h-1a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h1V6a5 5 0 0 0-5-5z"/>
			</svg>
			<p>상담내역</p>
		</div>

		</div>
		</div>	 -->
		
		<div class="container-md" style="width:655px; height:500px; border: 1px solid black;" >
		<!-- 리스트시작 -->
		 <div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
          <div class="card-header flex" id="todayIssueHeader">
			    <div class="d-flex justify-content-between align-items-center" >
			        <span class="mb-0" style="font-weight: 900;">수강생 휴가승인 목록 &nbsp;&nbsp;&nbsp;</span>
			    </div>
		  </div>
          <div class="card-body" id="todayIssueBody">
              <table class="table table-hover text-center">
                  <thead>
                      <tr>
                         
                          <th scope="col">NO</th>
                          <th scope="col">ID</th>
                          <th scope="col">이름</th>
                          <th scope="col">신청일</th>
                      </tr>
                  </thead>
                  <tbody>
                 <c:if test="${studentVacationApprove != null}">
                  	<c:forEach items="${studentVacationApprove}" var="studentVacationApprove" varStatus="vs">
                     <tr>
                          <td>${vs.count}</td>
                          <td>${studentVacationApprove.studentId}</td>
                          <td>${studentVacationApprove.memberName}</td>
                          <td>${studentVacationApprove.vacationSendDate}</td>
                          
                      </tr>
                  	</c:forEach>
                  </c:if>
                  <c:if test="${studentVacationApprove == null }">
                  	<tr>
                  		<td colspan="5">조회된 신청목록이 없습니다.</td>
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
		<!-- 리스트끝 -->
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
                        <iframe id="vacationPdf" class="border rounded-4" src="${pageContext.request.contextPath}/resources/images/approveUpload/" style="width: 100%; height: 500px;"></iframe>
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
            const studentRenamedFilename = row.getAttribute("data-student-file");
            
            const iframe = document.getElementById("studentPdf"); // "iframeElement"을 실제 iframe의 ID로 변경해주세요
            const currentSrc = iframe.src; // 이미 있는 URL 가져오기
            const updatedSrc = currentSrc + studentRenamedFilename; // 기존 URL 뒤에 studentRenamedFilename 추가

            iframe.src = updatedSrc;
            
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