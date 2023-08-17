<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
    <nav>
        <div class="wrap">
            <div id="logo">
                <a href="/"><img src="${pageContext.request.contextPath}/resources/images/로고.png"
                        style="width: 160px; height: 100px; z-index: 1; margin-top: -74%; margin-left: 27%;"></a>
            </div>
            <div id="account">
            	<a href="${pageContext.request.contextPath}/admin/adminMain.do">
            		<span>관리자페이지</span>
            	</a>
                <a href="/message" title="쪽지함" class="icon message">로그인</a>
                <a href="/my" title="내 정보" class="icon my">회원가입</a>
            </div>
            <ul id="menu">
                <li id="dropdown">
                    <a href="/">게시판</a>
                    <div class="dropdown-content">
                        <a href="/category/preparatory">예비생</a>
                        <a href="/category/graduate">수료생</a>
                        <a href="/category/free">자유</a>
                        <a href="/category/free">우리반 게시판</a>
                    </div>
                </li>
                <li id="dropdown">
                    <a href="/timetable">공유</a>
                    <div class="dropdown-content">
                        <a href="/category/preparatory">취업정보</a>
                        <a href="/category/graduate">정보</a>
                        <a href="/category/free">질문</a>
                    </div>
                </li>
                <li><a href="/lecture">장터</a></li>
                <li><a href="/calculator">스터디</a></li>
                <li><a href="/friend">공지사항</a></li>
                <li><a href="/friend">오늘 뭐먹지?</a></li>
                <li><a href="${pageContext.request.contextPath}/board/ticket.do">식권</a></li>
            </ul>
        </div>
    </nav>

    <div id="container" class="community" style="margin-top: 150px;">
        <aside class="none">
            <form class="search">
                <input type="search" name="keyword" class="text" placeholder="전체 게시판의 글을 검색하세요!">
            </form>
            <div class="title">
                <a class="hamburger"></a>
                <h1>KH 소통할까?</h1>
                <ol class="buttons">
                    <li><a id="searchArticle">글 검색</a></li>
                </ol>
            </div>
        </aside>
        <div class="banners">
            <a href=""><img src="img/로고이미지-removebg-preview.png"
                    style="width: 600px; height: 200px; outline: auto;"></a>
        </div>
        <div class="leftside">
            <div class="card pconly">
                <form class="logged">
                    <img src="https://cf-fpi.everytime.kr/0.png" class="picture">
                    <p class="nickname">disney1026</p>
                    <p class="school">이태현</p>
                    <p class="school">disney1026</p>
                    <ul class="buttons">
                        <li><a href="/my">내 정보</a></li>
                        <li><a href="/user/logout">로그아웃</a></li>
                    </ul>
                    <hr>
                </form>
            </div>
            <div class="card">
                <div class="menus">
                    <a href="/myarticle" class="myarticle">내가 쓴 글</a>
                    <a href="/mycommentarticle" class="mycommentarticle">댓글 단 글</a>
                    <a href="/myscrap" class="myscrap">내 스크랩</a>
                    <hr>
                </div>
            </div>
            <div class="card">
                <div class="banner">
                    <a
                        href="https://ad.everytime.kr/adClick?adToken=FliIhtpw3f8JmbRowBfcPh0KpgmNqJcp4b7UDWOYOooQuvfBn74UvRuoOY2r7xMSamYmSKZ5rDDFYdGOZdfcuX07KqEVgbK273vbzrBAjfrpIvgLcDhistd4cGZIlHn9nY1gLid%2BAq36%2BYcisNTFyM20G75T9iJiCG0aRzH%2Fokf1Yoc1gLxBvMo4X5fS48EJvbUmecLLfYoFMIXnhcKcal3C9crHUt4N631%2FcUbtEPaatv0aQ2kTkOIchtu0HqRo"><img
                            src="https://cf-eba.everytime.kr/20230814_samsung_galaxybook_card.jpg"></a>
                </div>
            </div>
            <div class="card">
                <div class="banner">
                    <a
                        href="https://ad.everytime.kr/adClick?adToken=FliIhtpw3f8JmbRowBfcPh0KpgmNqJcp4b7UDWOYOooQuvfBn74UvRuoOY2r7xMSamYmSKZ5rDDFYdGOZdfcuX07KqEVgbK273vbzrBAjfrpIvgLcDhistd4cGZIlHn9nY1gLid%2BAq36%2BYcisNTFyM20G75T9iJiCG0aRzH%2FokfJhGi%2F5URPrbSoHi%2F3%2BZ%2BLM0WNHChFQuagk6jm%2BQ3%2FIcJNlsCmWYGdI7Z4E0Z%2FLNu8J26GAFgPwK%2BuYOyQ3flm"><img
                            src="https://cf-eba.everytime.kr/20230804_mafia42_card.png"></a>
                </div>
            </div>
            <div class="card">
                <div class="banner">
                    <a
                        href="https://ad.everytime.kr/adClick?adToken=FliIhtpw3f8JmbRowBfcPh0KpgmNqJcp4b7UDWOYOooQuvfBn74UvRuoOY2r7xMSamYmSKZ5rDDFYdGOZdfcuX07KqEVgbK273vbzrBAjfrpIvgLcDhistd4cGZIlHn9nY1gLid%2BAq36%2BYcisNTFyM20G75T9iJiCG0aRzH%2Fokfx%2BM3eup25j5%2BuQ0Py9JVf4EVOfRnTj3C2zW2usIX3EEXL5dvozjxJdGwJkOMEoWjzeqcOqqMtBaWh2%2FdSdzfQ"><img
                            src="https://cf-eba.everytime.kr/20230807_Santa_card.png"></a>
                </div>
            </div>
        </div>
        <div class="rightside">
            <form action="" class="search">
                <input type="text" name="keyword" placeholder="전체 게시판의 글을 검색하세요!" class="text" />
            </form>
            <div class="card">
                <div class="board">
                    <h3>
                        <a>실시간 인기 글</a>
                    </h3>
                    <a href="" class="article">
                        <p class="title">내일 4학년 수강신청 파이팅</p>
                        <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                        <h4>자유게시판</h4>
                        <ul class="status">
                            <li class="vote active">22</li>
                            <li class="comment active">7</li>
                        </ul>
                        <hr>
                    </a>
                    <a href="" class="article">
                        <p class="title">내일 4학년 수강신청 파이팅</p>
                        <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                        <h4>자유게시판</h4>
                        <ul class="status">
                            <li class="vote active">22</li>
                            <li class="comment active">7</li>
                        </ul>
                        <hr>
                    </a>
                    <a href="" class="article">
                        <p class="title">내일 4학년 수강신청 파이팅</p>
                        <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                        <h4>자유게시판</h4>
                        <ul class="status">
                            <li class="vote active">22</li>
                            <li class="comment active">7</li>
                        </ul>
                        <hr>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h3>
                        <a>공지사항</a>
                    </h3>
                    <a href="" class="article">
                        <p class="title">내일 4학년 수강신청 파이팅</p>
                        <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                        <h4>자유게시판</h4>
                        <ul class="status">
                            <li class="vote active">22</li>
                            <li class="comment active">7</li>
                        </ul>
                        <hr>
                    </a>
                    <a href="" class="article">
                        <p class="title">내일 4학년 수강신청 파이팅</p>
                        <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                        <h4>자유게시판</h4>
                        <ul class="status">
                            <li class="vote active">22</li>
                            <li class="comment active">7</li>
                        </ul>
                        <hr>
                    </a>
                    <a href="" class="article">
                        <p class="title">내일 4학년 수강신청 파이팅</p>
                        <p class="small">하나도 빼놓지 말고 다 잡으세용</p>
                        <h4>자유게시판</h4>
                        <ul class="status">
                            <li class="vote active">22</li>
                            <li class="comment active">7</li>
                        </ul>
                        <hr>
                    </a>
                </div>
            </div>

        </div>
        <div class="main">
            <div class="card">
                <div class="board">
                    <h3>
                        <a href="">자유게시판</a>
                    </h3>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h3>
                        <a href="">예비생게시판</a>
                    </h3>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h3>
                        <a href="">수료생게시판</a>
                    </h3>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h3>
                        <a href="">우리반게시판</a>
                    </h3>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h3>
                        <a href="">취업정보게시판</a>
                    </h3>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h3>
                        <a href="">정보게시판</a>
                    </h3>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h3>
                        <a href="">질문게시판</a>
                    </h3>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                </div>
            </div>
            <div class="card">
                <div class="board">
                    <h3>
                        <a href="">오늘 뭐먹지?</a>
                    </h3>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                    <a href="" class="list">
                        <time>방금</time>
                        <p>필수교양 하나 2학년대 들어두 괜찮아여??</p>
                    </a>
                </div>
            </div>
        </div>

        <%@ include file="/WEB-INF/views/common/footer.jsp" %>