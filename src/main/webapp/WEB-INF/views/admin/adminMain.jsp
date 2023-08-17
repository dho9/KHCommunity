<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/adminLeftBar.jsp" %>
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
