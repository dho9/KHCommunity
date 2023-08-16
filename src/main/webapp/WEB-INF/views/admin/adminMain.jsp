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
      <div class="card" style="margin: 30px 0 0 330px; width: 1300px; height: 150px">
        <div class="card-header" id="todayIssueHeader" style="font-weight: 700; font-size: 1.05em;">
          오늘의 이슈
          <span class="badge text-bg-secondary" style="background-color: tomato">
            7
          </span>
        </div>
        <div class="card-body" id="todayIssueBody">
          <span>신규 수강생</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600">2</span>
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <span>가입 승인</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600">2</span>
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <span>휴가 승인</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600">1</span>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <br />
          <br />
          <span>신규 게시글</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600">1</span>
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <span>신고내역</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600">0</span>
          &nbsp;&nbsp;&nbsp;&nbsp; 
          <span>상담내역</span>
          &nbsp;
          <span style="color: tomato; font-weight: 600">2</span>
        </div>
      </div>
    </section>
    <section>
      <div class="container text-center" style="margin: 30px 0 0 320px">
        <div class="row row-cols-2">
          <div class="col">
            <div class="card" style="width: 635px;">
              <div class="card-header" style="font-weight: 700; font-size: 1.05em;">게시판 현황</div>
              <div class="card-body">
                <div id="donutChart" style="width: 630px; height: 350px;"></div>
              </div>
            </div>

          </div>

          <div class="col">
            <div class="card" style="width: 635px;">
              <div class="card-header" style="font-weight: 700; font-size: 1.05em;">게시글 통계</div>
              <div class="card-body">
                <div id="barChart_1" style="width: 630px; height: 350px;"></div>
              </div>
            </div>
          </div>
          <div class="col" style="padding-top: 20px">
            <div class="card" style="width: 635px; height:540px;">
              <div class="card-header d-flex justify-content-between align-items-center">
			    <div class="text-center font-weight-bold" style="flex: 1; font-weight: 700; font-size: 1.05em;">
			      <div class="mx-auto">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;미승인 내역</div>
			    </div>
			    <div>
			      <button type="button" class="btn btn-warning btn-sm mr-2" onclick="location.href='${pageContext.request.contextPath}/admin/studentApprovement.do'">수강생 승인</button>
			      <button type="button" class="btn btn-success btn-sm" onclick="location.href='${pageContext.request.contextPath}/admin/vacationApprovementList.do'">휴가 승인</button>
			    </div>
			  </div>
              <div class="card-body">
                <div class="warning-box" style="display: flex; padding: 20px 0 0 20px;">
                  <div class="warning-img">
                    <img src="${pageContext.request.contextPath}/resources/images/kh admin logo.png" style="width: 90px;">
                  </div>
                  <div class="warning-content" style="float: left; text-align: left; line-height: 0.7; padding-top: 9px;">
                    <p style="font-weight: 600;">
                      <span style="background-color: burlywood; border-radius: 10px; padding: 4px;;">수강생 승인</span> JAVA반 수강생 KH타임 회원 신청합니다.
                    </p>
                    <p style="font-size: 13px;">&nbsp;hellojava | 2023.08.10</p>
                  </div>  
                </div>
                <div class="warning-box" style="display: flex; padding: 20px 0 0 20px;">
                  <div class="warning-img">
                    <img src="${pageContext.request.contextPath}/resources/images/kh admin logo.png" style="width: 90px;">
                  </div>
                  <div class="warning-content" style="float: left; text-align: left; line-height: 0.7; padding-top: 9px;">
                    <p style="font-weight: 600;">
                      <span style="background-color: burlywood; border-radius: 10px; padding: 4px;">수강생 승인</span> 정보보안반 수강생 KH타임 회원 신청합니다.
                    </p>
                    <p style="font-size: 13px;">&nbsp;byesecurity | 2023.08.12</p>
                  </div>  
                </div>
                <div class="warning-box" style="display: flex; padding: 20px 0 0 20px;">
                  <div class="warning-img">
                    <img src="${pageContext.request.contextPath}/resources/images/kh admin logo.png" style="width: 90px;">
                  </div>
                  <div class="warning-content" style="float: left; text-align: left; line-height: 0.7; padding-top: 9px;">
                    <p style="font-weight: 600;">
                      <span style="background-color: darkseagreen; border-radius: 10px; padding: 4px;">휴가 승인</span> 352 이장준 / 8월 7일 휴가 신청합니다.
                    </p>
                    <p style="font-size: 13px;">&nbsp;lotteworld | 2023.08.04</p>
                  </div>  
                </div>
              </div>
            </div>
          </div>
          <div class="col" style="padding-top: 20px">
            <div class="card" style="width: 635px; height:540px;">
              <div class="card-header" style="font-weight: 700; font-size: 1.05em;">신고현황</div>
              <div class="card-body">
                <div class="warning-box" style="display: flex; padding: 20px 0 0 20px;">
                  <div class="warning-img">
                    <img src="${pageContext.request.contextPath}/resources/images/kh admin logo.png" style="width: 90px;">
                  </div>
                  <div class="warning-content" style="float: left; text-align: left; line-height: 0.7; padding-top: 9px;">
                    <p style="font-weight: 600;">[게시글 신고] 스팸 광고입니다.</p>
                    <p style="font-size: 13px;">&nbsp;sukey0331 | 2023.07.10</p>
                  </div>
                </div>
                <div class="warning-box" style="display: flex; padding: 20px 0 0 20px;">
                  <div class="warning-img">
                    <img src="${pageContext.request.contextPath}/resources/images/kh admin logo.png" style="width: 90px;">
                  </div>
                  <div class="warning-content" style="float: left; text-align: left; line-height: 0.7; padding-top: 9px;">
                    <p style="font-weight: 600;">[댓글 신고] 롯데월드 갔다왔다고 욕합니다. 혼내주세요.</p>
                    <p style="font-size: 13px;">&nbsp;이장준 | 2023.07.10</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <br>
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

      var chart = bb.generate({
        data: {
          columns: [
            ["자유게시판", 230],
            ["취업/정보", 120],
            ["우리반게시판", 120],
            ["오늘 뭐먹지", 140],
          ],
          type: "donut", // for ESM specify as: donut()
        },
        donut: {
          title: "게시판 Top5\n(기준:게시글수)"
        },
        bindto: "#donutChart"
      });

      let today = new Date();
      let yesterday = new Date();
      yesterday.setDate(yesterday.getDate() - 1);
      let twoDayAgo = new Date();
      twoDayAgo.setDate(twoDayAgo.getDate() - 2);
      let threeDayAgo = new Date();
      threeDayAgo.setDate(threeDayAgo.getDate() - 3);

      let todMonth = today.getMonth() + 1;
      let todDay = today.getDate();
      let yesMonth = yesterday.getMonth() + 1;
      let yesDay = yesterday.getDate();
      let twoMonth = twoDayAgo.getMonth() + 1;
      let twoDay = twoDayAgo.getDate();
      let threeMonth = threeDayAgo.getMonth() + 1;
      let threeDay = threeDayAgo.getDate();

      var data = {
        x: "x",
        columns: [
          ["x", threeMonth + "/" + threeDay, twoMonth + "/" + twoDay, yesMonth + "/" + yesDay, todMonth + "/" + todDay],
          ["총 게시글수", 330, 200, 270, 300]
        ],
        type: "bar" // for ESM specify as: bar()
      };

      var chart = bb.generate({
        data: data,
        axis: {
          x: {
            type: "category" // x축 값을 카테고리로 설정
          }
        },
        bar: {
          width: {
            ratio: 0.5
          }
        },
        size: {
          width: 600,
          height: 350
        },
        padding: {
          top: 20
        },
        bindto: "#barChart_1"
      });

    </script>
  </body>
</html>
