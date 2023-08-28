<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
a.article{
color: black;
}
.anonymous{
	float: right;
	background-color: white;
	margin-right: 13px;
}
.anonymousImg{
	width: 59px;
}
iframe {
	height: 279px;
    margin-top: 2%;
    width: 1100px;
    margin-left: 25.8%;
}
</style>
	<iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/week" scrolling="auto"></iframe>
	
	<c:if test="${not empty jobKoreaList}">
		<c:forEach items="${jobKoreaList}" var="board">
			<div>
			  	<h2 class="medium bold">${board.company}</h2> <br>
			  	<p class="medium">${board.title}</p> <br>
			  	<p class="medium">${board.option}</p> <br>
			  	<p class="medium">${board.etc}</p> <br>
			</div>
		</c:forEach>
	</c:if>

	<!-- 페이지 이동 및 페이지 번호 표시 -->
	<div class="d-flex justify-content-center">
        <ul class="pagination">
            <c:if test="${currentPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/board/jobKorea.do?page=${currentPage - 1}" aria-label="Previous">
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
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/board/jobKorea.do?page=${pageNum}">${pageNum}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            
            <c:if test="${currentPage < totalPages}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/board/jobKorea.do?page=${currentPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
	</div>
	
<%@ include file="/WEB-INF/views/common/footer.jsp" %>