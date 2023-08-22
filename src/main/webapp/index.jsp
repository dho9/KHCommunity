
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
.accordion {
	display: none;
    padding: 10px 0 10px 37px;
    border-bottom: 1px solid #e3e3e3;
    line-height: 20px;
    box-sizing: border-box;
    color: #444444;
    font-size: 14px;
    background-repeat: no-repeat;
    background-size: 12px auto;
    background-position: 15px center;
}
.active {
	display: block;
}
</style>
    <div id="container" class="community" style="margin-top: 25px;">
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
        <sec:authentication property="principal" var="loginMember"/>
        <form:form name ="memberLogoutFrm" 
        	action="${pageContext.request.contextPath}/member/memberLogout.do" 
        	method="POST">
		</form:form>
        <div class="leftside">
            <div class="card pconly">
                <form class="logged">
                    <img src="https://cf-fpi.everytime.kr/0.png" class="picture">
                    <sec:authorize access="isAuthenticated()">
                    <p class="nickname">${loginMember.username}</p>
                    <p class="school">${loginMember.name}</p>
                    <p class="school">${loginMember.username}</p>
                    </sec:authorize>
                    <ul class="buttons">
                        <li><a href="${pageContext.request.contextPath}/member/myPage.do">내 정보</a></li>
                         <li><a href="#" id="logoutLink">로그아웃</a></li>                       
                    </ul>
                    <hr>
                </form>
            </div>
            <div class="card">
                <div class="menus">
                    <a href="/myarticle" class="myarticle">내가 쓴 글</a>
                    <a href="/mycommentarticle" class="mycommentarticle">댓글 단 글</a>
                    <a class="myBoard" id="myBoard">즐겨찾기</a>
                    <div class="favorite"></div>
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
		<%@ include file="/WEB-INF/views/common/rightSide.jsp" %>
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
<script>
// 즐겨찾기
document.querySelector('#myBoard').addEventListener('mouseover', () => {
    $.ajax({
        url: "${pageContext.request.contextPath}/board/myBoards.do",
        method: "GET",
        dataType: "json",
        success(responseData) {
            const favorite = document.querySelector(".favorite");

            let html = "";
            for (const board of responseData.boards) {
                const {boardName, boardId, boardLink} = board;
                html += `
                    <a class="accordion" href="${pageContext.request.contextPath}/board/\${boardLink}.do">\${boardName}</a>
                `;
            }

            favorite.innerHTML = html;

			const accordions = document.querySelectorAll('.accordion');
            for (const accordion of accordions) {
				accordion.classList.toggle('active');
				favorite.style.display = "block";
            }
        }
    });
});
document.querySelector('.card').addEventListener('mouseout', (e) => {
	console.log(e);
    const favorite = document.querySelector(".favorite");
    favorite.style.display = "none";
});


document.getElementById("logoutLink").addEventListener("click", function(event) {
	memberLogoutFrm.submit();
});
</script>
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>