<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
    <link rel="stylesheet" href="https://naver.github.io/billboard.js/release/latest/dist/theme/datalab.min.css">
    <title>KH Time AdminPage</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.0.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://naver.github.io/billboard.js/release/latest/dist/billboard.pkgd.min.js"></script>
  </head>
  <body>
    <section class="mainSection">
      <div class="leftBar">
        <div class="logo">
          <img src="${pageContext.request.contextPath}/resources/images/kh admin logo.png">
        </div>
        <hr />
        <di class="goToMainSite">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up-right-square" viewBox="0 0 16 16">
              <path
                fill-rule="evenodd"
                d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.854 8.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707l-4.096 4.096z"
              />
            </svg>
          </span>
          <a href="${pageContext.request.contextPath}" >사이트 바로가기</a>
        </di>
        <hr />
        <h5 style="padding-left: 20px; padding-top: 10px; font-weight: 800;">사이트 관리</h5>
        <div class="dashboard">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-grid" viewBox="0 0 16 16">
              <path
                d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"
              />
            </svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/adminMain.do">대시보드</a>
        </div>
        <div class="memberManagement">
          <div class="wrap">
            <ul class="list">
              <li class="items">
                <div class="a_title">
                  <span style="color:white;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                      <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z" />
                      <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"                      />
                    </svg>
                  </span>
                  <a href="">사용자 관리</a>
                  <span style="color:white;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
                      <path
                        d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"
                      />
                    </svg>
                  </span>
                </div>
                <div class="a_content">
                  <div class="userManagement">
                    <span style="color:white;" width="16" height="16">
                      👨‍🎓 수강생 관리
                    </span>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;" width="16" height="16">
                      - ✔
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/adminStudentList.do">수강생 관리</a>
                  </div>
                  <div class="userManagement">
                    &nbsp;&nbsp;&nbsp;
                    <span style="color:white;">
                      - 🗓
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/vacationApprovementList.do">수강생 휴가 관리</a>
                  </div>
                  <div class="userManagement">
                    <span style="color:white;" width="16" height="16">
                      👩‍🏫
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/teacherList.do">강사 관리</a>
                  </div>
                  <div class="riderManagement">
                    <span style="color:white;">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
                      </svg>
                    </span>
                    <a href="${pageContext.request.contextPath}/admin/employeeList.do">직원 관리</a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="reportManagement">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bar-chart-steps" viewBox="0 0 16 16">
  				<path d="M.5 0a.5.5 0 0 1 .5.5v15a.5.5 0 0 1-1 0V.5A.5.5 0 0 1 .5 0zM2 1.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-4a.5.5 0 0 1-.5-.5v-1zm2 4a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1zm2 4a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-6a.5.5 0 0 1-.5-.5v-1zm2 4a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1z"/>
			</svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/chatList.do">과정 등록/조회</a>
        </div>
        <div class="reportManagement">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-left-dots" viewBox="0 0 16 16">
              <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
              <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
            </svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/chatList.do">채팅 조회</a>
        </div>
        <div class="reportManagement">
          <span style="color:white;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-circle-fill" viewBox="0 0 16 16">
              <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8 4a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 4zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
            </svg>
          </span>
          <a href="${pageContext.request.contextPath}/admin/reportList.do">신고 관리</a>
        </div>
        <hr>
        
        <div class="reportManagement">
          <span>
            🍜
          </span>
          <a href="${pageContext.request.contextPath}/admin/restaurantList.do">식권 관리</a>
        </div>
      </div>
      <section style="width: 1630px">
        <nav class="navbar bg-light" style="margin-left: 330px">
          <div class="container-fluid">
            <span class="navbar-brand" style="font-weight: 700;">KH 타임</span>
          </div>
        </nav>
      </section>
    </section>
    <section>
      <div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: fit-content">
          <div class="card-header" id="todayIssueHeader">
              수강생 목록
          </div>
          <div class="card-body" id="todayIssueBody">
              <table class="table table-hover text-center">
                  <thead>
                      <tr>
                          <th scope="col">#</th>
                          <th scope="col">ID</th>
                          <th scope="col">이름</th>
                          <th scope="col">과목</th>
                          <th scope="col">반</th>
                          <th scope="col">학생 타입</th>
                          <th scope="col">쪽지보내기</th>
                      </tr>
                  </thead>
                  <tbody>
                      <tr data-bs-toggle="modal" data-bs-target="#myModal" data-row-id="1" data-first-id="khendev23" data-second-name="유성근" data-phone="01011112222" data-birthday="1996-03-31" data-subject="JAVA" data-class="352" data-email="khendev23@gmail.com" data-lastDay="2023-09-06" data-handle="@mdo">
                          <td>1</td>
                          <td>khendev23</td>
                          <td>유성근</td>
                          <td>JAVA</td>
                          <td>352</td>
                          <td>수강생</td>
                          <td>
                            <button style="border: 0; background-color: transparent;">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                                <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                              </svg>
                            </button>
                          </td>
                      </tr>
                      <tr data-bs-toggle="modal" data-bs-target="#myModal" data-row-id="2" data-first-id="sukey0331" data-second-name="김성근" data-phone="01011112223" data-birthday="1996-03-31" data-subject="정보보안" data-class="231" data-email="sukey0331@daum.net"data-lastDay="2023-09-06" data-handle="@fat">
                          <td>2</td>
                          <td>sukey0331</td>
                          <td>김성근</td>
                          <td>정보보안</td>
                          <td>231</td>
                          <td>예비생</td>
                          <td>
                            <button style="border: 0; background-color: transparent;">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                                <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                              </svg>
                            </button>
                          </td>
                      </tr>
                      <tr data-bs-toggle="modal" data-bs-target="#myModal" data-row-id="3" data-first-id="choco0331" data-second-name="최성근" data-phone="01011112224" data-birthday="1996-03-31" data-subject="JAVA" data-class="351" data-email="choco0331@nate.com" data-lastDay="2023-09-06" data-handle="@twitter">
                          <td>3</td>
                          <td>choco0331</td>
                          <td>최성근</td>
                          <td>JAVA</td>
                          <td>351</td>
                          <td>수료생</td>
                          <td>
                            <button style="border: 0; background-color: transparent;">
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                                <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z"/>
                              </svg>
                            </button>
                          </td>
                      </tr>
                  </tbody>
              </table>
              <br>
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
                        <iframe src="${pageContext.request.contextPath}/resources/pdf/쓰리고근로계약서.pdf" style="width: 100%; height: 500px;"></iframe>
                    </div>
                    <div class="col-md-6">
                      <form id="dataForm" method="post" action="process_form.jsp" style="font-size: 20px;">
                          <input type="hidden" name="rowId" id="modalRowId">
                          ID : <input type="text" name="firstId" id="modalFirstId" readonly> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
                          이름 : <input type="text" name="secondName" id="modalSecondName" readonly> <br>
                          연락처 : <input type="text" name="phone" id="modalPhone" readonly> <br>
                          생년월일 : <input type="date" name="birthday" id="modalBirthday" readonly> <br>
                          이메일 : <input type="text" name="email" id="modalEmail" readonly> <br>
                          과목 : <input type="text" name="subject" id="modalSubject" readonly> <br>
                          반 : <input type="text" name="className" id="modalClass" readonly> <br>
                          수료일 : <input type="date" name="lastDay" id="modalLastDay"><br>
                          <hr>
                          <button type="button" id="btnEdit">수정</button> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                          <button type="button" id="btnBan">강퇴</button> 
                      </form>
                    </div>
                  </div>
                </div>
                <!-- 모달의 나머지 부분은 동일하게 유지 -->
            </div>
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
            const subject = row.getAttribute("data-subject");
            const className = row.getAttribute("data-class");
            const lastDay = row.getAttribute("data-lastDay");
            const handle = row.getAttribute("data-handle");
    
            // 모달 내의 입력 필드에 데이터 설정
            document.getElementById("modalRowId").value = rowId;
            document.getElementById("modalFirstId").value = firstId;
            document.getElementById("modalSecondName").value = secondName;
            document.getElementById("modalPhone").value = phone;
            document.getElementById("modalBirthday").value = birthday;
            document.getElementById("modalEmail").value = email;
            document.getElementById("modalSubject").value = subject;
            document.getElementById("modalClass").value = className;
            document.getElementById("modalLastDay").value = lastDay;
            document.getElementById("modalHandle").value = handle;
          });
        });
    
        // 수정 버튼 클릭 이벤트 처리
        $("#btnEdit").on("click", function () {
          showConfirmation("edit", "edit_process.jsp");
        });
    
        // 강퇴 버튼 클릭 이벤트 처리
        $("#btnBan").on("click", function () {
          showConfirmation("ban", "ban_process.jsp");
        });
    
        // 확인 메시지 표시 후 데이터 전송 함수 호출
        function showConfirmation(action, url) {
          if (confirm("정말로 진행하시겠습니까?")) {
            sendDataToServer(action, url);
          }
        }
    
        // 서버로 데이터를 전송하는 함수
        function sendDataToServer(action, url) {
          const formData = new FormData($("#dataForm")[0]);
          formData.append("action", action);
    
          $.ajax({
            type: "POST",
            url: url, // 수정 또는 강퇴에 따라 다른 URL 지정
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
              // 서버 응답을 처리
              // 예: 성공 메시지를 표시하거나 다른 동작 수행
            }
          });
        }
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
