<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<sec:authentication property="principal" var="loginMember"/>
	<div class="myClassBoard-title">
		<h2 class="title">우리 반게시판</h2>
		<p>${loginMember.name}님, 반갑습니다. 'KH소통할까?'에 오신 걸 환영합니다.</p>
	</div>
	<div class="myClassBoard-subTitle">
		<ul>
			<li>${studentInfo.curriculumName}반</li>
			<li>${studentInfo.memberName} 강사님 [${studentInfo.classId}]</li>
		</ul>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>