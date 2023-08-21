<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.new{
text-decoration: none;
}
</style>
<!-- bootstrap icon css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
.new {
	text-decoration: none;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/resources/css/style.css" />
<title>KH소통할까?</title>
<meta charset="utf-8">
<meta name="referrer" content="origin">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link type="text/css" href="/css/common.css" rel="stylesheet">
<link type="text/css" href="/css/common.partial.css" rel="stylesheet">
<link type="text/css" href="/css/container.community.css"
	rel="stylesheet">
<link href="/favicon.ico" rel="shortcut icon">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css" />
    <title>KH소통할까?</title>
    <meta charset="utf-8">
    <meta name="referrer" content="origin">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%-- 
    <link type="text/css" href="/css/common.css" rel="stylesheet">
    <link type="text/css" href="/css/common.partial.css" rel="stylesheet">
    <link type="text/css" href="/css/container.community.css" rel="stylesheet"> 
    --%>
    <link href="/favicon.ico" rel="shortcut icon">

</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/showForm.js"></script>
    <body>
    <nav>
        <div class="wrap">
            <div id="logo">
               <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/로고.png"
                        style="width: 160px; height: 100px; z-index: 1; margin-top: -74%; margin-left: 27%;"></a>
            </div>
            <div id="account">
            	<a href="${pageContext.request.contextPath}/admin/adminMain.do" style="text-decoration: none;">
            		<span>관리자페이지</span>
            	</a>
               <a href="${pageContext.request.contextPath}/member/memberLogin.do" title="로그인" class="icon message">로그인</a>
               <a href="${pageContext.request.contextPath}/member/memberCreate.do" title="회원가입" class="icon my">회원가입</a>

            </div>
            <ul id="menu">
                <li><a href="${pageContext.request.contextPath}" style="text-decoration: none;" style="text-decoration: none;">게시판</a></li>
                <li><a href="${pageContext.request.contextPath}/board/notificationBoardList.do" style="text-decoration: none;">공지사항</a></li>
                <li><a href="${pageContext.request.contextPath}/board/myClassBoardList.do" style="text-decoration: none;">우리반</a></li>
                <li><a href="${pageContext.request.contextPath}/board/jobSearchBoardList.do" style="text-decoration: none;">취업</a></li>
                <li><a href="${pageContext.request.contextPath}/store/storeList.do" style="text-decoration: none;">식권</a></li>
                <li><a href="${pageContext.request.contextPath}/board/promotionBoardList.do" style="text-decoration: none;">홍보</a></li>
                <li><a href="${pageContext.request.contextPath}/schedule/scheduleList.do" style="text-decoration: none;">스케쥴</a></li>
            </ul>
        </div>
    </nav>
    <div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/board/freeBoardList.do"
						class="new" style="text-decoration: none;">자유게시판</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/marketBoardList.do"
						class="new"style="text-decoration: none;"> 장터게시판</a></li>
					<li><a
						href="${pageContext.request.contextPath}/board/todayFoodBoardList.do"
						class="new" style="text-decoration: none;">오늘 뭐 먹지?</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				<li><a href="${pageContext.request.contextPath}/board/sharingInformationBoardList.do" class="new" style="text-decoration: none;">정보공유</a></li>
				<li><a href="${pageContext.request.contextPath}/board/askCodeBoardList.do" class="new" style="text-decoration: none;">코드질문</a></li>
				<li><a href="${pageContext.request.contextPath}/board/studyBoardList.do" class="new" style="text-decoration: none;">스터디</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				<li><a href="${pageContext.request.contextPath}/board/graduateBoardList.do" class="new" style="text-decoration: none;">수료생게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/board/preStudentBoardList.do" class="new" style="text-decoration: none;">예비생게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/board/employeeBoardList.do" class="new" style="text-decoration: none;">직원 게시판</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<hr>
		</div>
	</div>
