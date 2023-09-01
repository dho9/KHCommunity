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
		    <div class="d-flex justify-content-between align-items-center">
		        <span class="mb-0" style="font-weight: 900;">신고 목록 &nbsp;&nbsp;&nbsp;</span>
		        <div id="search-container" class="d-flex align-items-center">
		        <form action="">
				    <div class="flex" style="width:600px; display: flex; justify-content: flex-end; align-items: center;">
				        <div style="margin-right: 10px;">
				            <input type="radio" name="reportType" value="게시글" id="reportType1" ${param.reportType eq '게시글' ? 'checked' : ''}/>
				            <label for="reportType1">게시글 신고</label>
				        </div>
				        <div style="margin-right: 10px;">
				            <input type="radio" name="reportType" value="댓글" id="reportType2" ${param.reportType eq '댓글' ? 'checked' : ''}/>
				            <label for="reportType2">댓글 신고</label>
				        </div>
				        <div style="margin-right: 10px;">
				            <input type="radio" name="reportType" value="쪽지" id="reportType3" ${param.reportType eq '쪽지' ? 'checked' : ''}/>
				            <label for="reportType3">쪽지 신고</label>
				        </div>
				        <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
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
                          <th scope="col">신고자 ID</th>
                          <th scope="col">피신고자 ID</th>
                          <th scope="col">신고 유형</th>
                          <th scope="col">신고 일시</th>
                          <th scope="col">주의조치</th>
                      </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${reports}" var="report" varStatus="vs">
                      <tr data-bs-toggle="modal" data-bs-target="#myModal" 
                      data-row-id="${vs.count}" 
                      data-reportId="${report.reportId}"
                      data-reporterId="${report.reporterId}" 
                      data-reportContent="${report.reportContent}" 
                      data-attackerId="${report.attackerId}" 
                      data-handle="@mdo">
                          <td>${(currentPage-1) * 10 + vs.index + 1}</td>
                          <td>${report.reporterId}</td>
                          <td>${report.attackerId}</td>
                          <td>${report.reportType}</td>
                          <td>${report.reportSendDate}</td>
                          <td>
                            <button id="messageButton" type="button" style="border: 0; background-color: transparent;" class="open-modal-button" data-bs-toggle="modal" data-bs-target="#sendMessageModal"
				                    data-attackerId="${report.attackerId}">
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
              <!-- 페이지 이동 및 페이지 번호 표시 -->
				<div class="d-flex justify-content-center">
				    <nav aria-label="Page navigation">
				        <ul class="pagination">
				        	<li class="page-item">
        						<a class="page-link" href="${pageContext.request.contextPath}/admin/reportList.do">목록</a>
        					</li>
				            <c:if test="${currentPage > 1}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/admin/reportList.do?page=${currentPage - 1}" aria-label="Previous">
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
				                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/reportList.do?page=${pageNum}">${pageNum}</a></li>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				            <c:if test="${currentPage < totalPages}">
				                <li class="page-item">
				                    <a class="page-link" href="${pageContext.request.contextPath}/admin/reportList.do?page=${currentPage + 1}" aria-label="Next">
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
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">상세 정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div style="width:600px; margin:auto;">
					    <div class="border rounded-4" style="padding:20px;">
					        <input type="hidden" name="rowId" id="modalRowId">
					        신고자 ID : <input type="text" name="reporterId" id="modalReporterId" readonly style="border: none; outline: none;">
					         &nbsp;&nbsp;&nbsp;
					        <hr style="margin: 5px 0;">
					        신고 내용 : <input type="text" name="reportContent" id="modalReportContent" readonly style="border: none; outline: none; width:400px; height:600px; vertical-align: top;"> <br>
					        <br>
					    </div>
					</div>

                </div>
            </div>
        </div>
      </div>
      <div class="modal fade" id="sendMessageModal" tabindex="-1" aria-labelledby="sendMessageModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="sendMessageModalLabel">조치사항 전달</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <form:form method="POST" action="${pageContext.request.contextPath}/admin/sendReport.do">
	            	<div class="modal-body">
		            <!-- 모달 내용 -->
		            <!-- 여기에 쪽지 보내기 양식 등을 추가하세요 -->
		                <input name="attackerId" id="receiveAttackerId" readonly>
		                <input type="hidden" name="reportId" id="reportId"/>
		                <input type="hidden" name="reporterId" id="modalReporterId"/>
		                <textarea name="messageContent" id="messageContent" placeholder="내용을 입력해주세요." style="width:80%;"></textarea>
		            </div>
	            	<div class="modal-footer">
		                <button id="btnSend" class="btn btn-primary">전송</button>	            
	            	</div>
	            </form:form>
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
            const reporterId = row.getAttribute("data-reporterId");
            const reportContent = row.getAttribute("data-reportContent");
            const reportId = row.getAttribute("data-reportId");
            // 모달 내의 입력 필드에 데이터 설정
            document.getElementById("modalRowId").value = rowId;
            document.getElementById("modalReporterId").value = reporterId;
            document.getElementById("modalReportContent").value = reportContent;
            document.getElementById("reportId").value = reportId;  
          });
        });
		const sendButton = document.querySelectorAll("#messageButton");
        sendButton.forEach((e) => {
           e.addEventListener("click", function () {
        	   const receiveId = e.getAttribute("data-attackerId");
               document.getElementById("receiveAttackerId").value = receiveId;
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
