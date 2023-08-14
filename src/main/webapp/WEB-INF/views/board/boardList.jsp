<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판" name="title"/>
</jsp:include>

<section>
	<h1>게시판입니당</h1>
	<ul class="list-group">
		<c:if test="${empty boards}">
			<li>조회된 게시글이 없습니다.</li>
		</c:if>
		<c:if test="${not empty boards}">
			<c:forEach items="${boards}" var="board">
				<li class="list-group-item">
				${board.title}<br>
				${board.postCreatedAt} 익명
				</li>
			</c:forEach>
		</c:if>
	</ul>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>