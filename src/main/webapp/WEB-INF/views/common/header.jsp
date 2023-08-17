<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css" />
    <title>KH소통할까?</title>
    <meta charset="utf-8">
    <meta name="referrer" content="origin">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link type="text/css" href="/css/common.css" rel="stylesheet">
    <link type="text/css" href="/css/common.partial.css" rel="stylesheet">
    <link type="text/css" href="/css/container.community.css" rel="stylesheet">
    <link href="/favicon.ico" rel="shortcut icon">

</head>
 <script type="text/javascript">
        var _serverTime = 1691975017995;
        var _clientTime = new Date().getTime();
        var _diffTime = _clientTime - _serverTime;
        var _apiServerUrl = 'https://api.everytime.kr';
    </script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-85ZNEFVRGL"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', 'G-85ZNEFVRGL', { 'send_page_view': false });
        gtag('config', 'UA-22022140-4');
        _gfn.logPageView();
    </script>
    <body>
    <nav>
        <div class="wrap">
            <div id="logo">
               <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/로고.png"
                        style="width: 160px; height: 100px; z-index: 1; margin-top: -74%; margin-left: 27%;"></a>
            </div>
            <div id="account">
            	<a href="${pageContext.request.contextPath}/admin/adminMain.do">
            		<span>관리자페이지</span>
            	</a>
               <a href="${pageContext.request.contextPath}/member/memberLogin.do" title="쪽지함" class="icon message">로그인</a>
               <a href="${pageContext.request.contextPath}/member/memberCreate.do" title="내 정보" class="icon my">회원가입</a>
            </div>
            <ul id="menu">
                <li><a href="${pageContext.request.contextPath}" style="text-decoration: none;">게시판</a></li>
                <li><a href="${pageContext.request.contextPath}/board/notificationBoardList.do">공지사항</a></li>
                <li><a href="${pageContext.request.contextPath}/board/myClassBoardList.do">우리반</a></li>
                <li><a href="${pageContext.request.contextPath}/board/jobSearchBoardList.do">취업</a></li>
                <li><a href="${pageContext.request.contextPath}/ticket/ticketList.do">식권</a></li>
                <li><a href="${pageContext.request.contextPath}/board/promotionBoardList.do">홍보</a></li>
                <li><a href="${pageContext.request.contextPath}/schedule/scheduleList.do">스케쥴</a></li>
            </ul>
        </div>
    </nav>
    <div id="submenu">
		<div class="wrap">
			<div class="divider"></div>
			<div class="group">
				<ul>
				<li><a href="${pageContext.request.contextPath}/board/freeBoardList.do" class="new">자유게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/board/marketBoardList.do" class="new">장터게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/board/todayFoodBoardList.do" class="new">오늘 뭐 먹지?</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				<li><a href="${pageContext.request.contextPath}/board/sharingInformationBoardList.do" class="new">정보공유</a></li>
				<li><a href="${pageContext.request.contextPath}/board/askCodeBoardList.do" class="new">코드질문</a></li>
				<li><a href="${pageContext.request.contextPath}/board/studyBoardList.do" class="new">스터디</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<div class="group">
				<ul>
				<li><a href="${pageContext.request.contextPath}/board/graduateBoardList.do" class="new">수료생게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/board/preStudentBoardList.do" class="new">예비생게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/board/employeeBoardList.do" class="new">직원 게시판</a></li>
				</ul>
			</div>
			<div class="divider"></div>
			<hr>
		</div>
	</div>
	<div id="jangjun">